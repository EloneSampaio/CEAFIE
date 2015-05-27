<?php

namespace models;

use Doctrine\ORM\Mapping as ORM;
use application\Dao;
use config\Doctrine;
use \Doctrine\Common\Util\Debug;

/**
 * Matricula
 *
 * @ORM\Table(name="matricula", indexes={@ORM\Index(name="fk_matricula_aluno1_idx", columns={"aluno_id"}), @ORM\Index(name="fk_matricula_curso1_idx", columns={"curso_id"}), @ORM\Index(name="fk_matricula_modulo1_idx", columns={"modulo_id"})})
 * @ORM\Entity
 */
class Matricula extends Doctrine implements Dao {

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="data", type="string", length=45, nullable=false)
     */
    private $data;

    /**
     * @var string
     *
     * @ORM\Column(name="ano", type="string", length=45, nullable=false)
     */
    private $ano;

    /**
     * @var string
     *
     * @ORM\Column(name="estado", type="string", length=45, nullable=false)
     */
    private $estado;

    /**
     * @var \Aluno
     *
     * @ORM\ManyToOne(targetEntity="Aluno")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="aluno_id", referencedColumnName="id")
     * })
     */
    private $aluno;

    /**
     * @var \Curso
     *
     * @ORM\ManyToOne(targetEntity="Curso")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="curso_id", referencedColumnName="id")
     * })
     */
    private $curso;

    /**
     * @var \Modulo
     * @ORM\ManyToOne(targetEntity="Modulo")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="modulo_id", referencedColumnName="id")
     * })
     */
    private $modulo;

    function getAno() {
        return $this->ano;
    }

    function setAno($ano) {
        $this->ano = $ano;
    }

    function getId() {
        return $this->id;
    }

    function getData() {
        return $this->data;
    }

    function getEstado() {
        return $this->estado;
    }

    function getAluno() {
        return $this->aluno;
    }

    function getCurso() {
        return $this->curso;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setData($data) {
        $this->data = $data;
    }

    function setEstado($estado) {
        $this->estado = $estado;
    }

    function setAluno(Aluno $aluno) {
        $this->aluno = $aluno;
    }

    function setCurso(Curso $curso) {
        $this->curso = $curso;
    }

    function getModulo() {
        return $this->modulo;
    }

    function setModulo(Modulo $modulo) {
        $this->modulo = $modulo;
    }

    public function adicionar($dados = FALSE) {
        
    }

    public function adiciona($dados, $aluno, $curso, $modulo) {
        $this->em->getConnection()->beginTransaction();
        try {
            $aluno = $this->em->getRepository('models\Aluno')->findOneBy(array('id' => $aluno));
            $dados->setAluno($aluno);
            $modulo = $this->em->getRepository('models\Modulo')->findOneBy(array('id' => $modulo));
            $dados->setModulo($modulo);
            $curso = $this->em->getRepository('models\Curso')->findOneBy(array('id' => $curso));
            $dados->setCurso($curso);
            $this->em->persist($dados);
            $this->em->flush();
            $this->em->getConnection()->commit();
            return $dados->getId();
        } catch (\Doctrine\ORM\UnexpectedResultException $ex) {
            $this->em->getConnection()->rollBack();
            echo 'erro' . $ex;
        }
    }

    public function editar($id = FALSE) {
        $editar = $this->em->getRepository('models\Matricula')->findOneBy(array('aluno' => $id->getId()));
        $editar->setEstado($id->getEstado());
        $this->em->flush();
        return TRUE;
    }

    public function pesquisaPor($dados = FALSE) {
        $qb = $this->em->createQueryBuilder()
                ->select('n.nota', 'p.nome', 'a.id')
                ->from('models\Matricula', 'm')
                ->innerJoin('models\Aluno', 'a', 'WITH', 'm.aluno=a.id')
                ->innerJoin('models\Pessoa', 'p', 'WITH', 'a.pessoa=p.id')
                ->leftJoin('models\Nota', 'n', 'WITH', 'n.aluno=a.id')
                ->andWhere('m.modulo =:modulo')
                ->andWhere('m.estado =:estado')
                ->orderBy('a.id', 'DESC')
                ->setParameter('modulo', $dados['modulo'])
                ->setParameter('estado', $dados['estado']);
        return $qb->getQuery()->getResult(\Doctrine\ORM\Query::HYDRATE_ARRAY);
    }

    public function pesquisaPorData($dados = FALSE) {

        $qb = $this->em->createQueryBuilder()
                ->select('p.nome', 'p.bi', 'm.estado', 'c.nome', 'md.nome')
                ->from('models\Matricula', 'm')
                ->innerJoin('models\Aluno', 'a', 'WITH', 'm.aluno=a.id')
                ->innerJoin('models\Pessoa', 'p', 'WITH', 'a.pessoa=p.id')
                ->leftJoin('models\Modulo', 'md', 'WITH', 'm.modulo=md.id')
                ->leftJoin('models\Curso', 'c', 'WITH', 'md.curso=c.id')
                ->andWhere('m.ano =:ano')
                ->orderBy('m.id', 'DESC')
                ->setParameter('ano', $dados);
        return $qb->getQuery()->getResult(\Doctrine\ORM\Query::HYDRATE_ARRAY);
    }

    public function pesquisar($id = FALSE) {
        if ($id) {
            return $this->em->getRepository('models\Matricula')->findOneBy(array('aluno' => $id));
            $this->em->flush();
        } else {
            return $this->em->getRepository('models\Matricula')->findby(array(), array('id' => "DESC"));
            $this->em->flush();
        }
    }

    public function remover($id = FALSE) {
        $id = $this->em->getPartialReference('models\Pessoa', $id);
        $this->em->remove($id);
        $this->em->flush();
        return TRUE;
    }

}
