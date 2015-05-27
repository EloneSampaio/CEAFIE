<?php

namespace models;

use Doctrine\ORM\Mapping as ORM;
use application\Dao;
use config\Doctrine;

/**
 * Nota
 *
 * @ORM\Table(name="nota", indexes={@ORM\Index(name="fk_nota_aluno1_idx", columns={"aluno_id"}), @ORM\Index(name="fk_nota_modulo1_idx", columns={"modulo_id"})})
 * @ORM\Entity
 */
class Nota extends Doctrine implements Dao {

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
     * @ORM\Column(name="nota", type="string", length=45, nullable=false)
     */
    private $nota;

    /**
     * @var string
     *
     * @ORM\Column(name="data", type="string", length=45, nullable=false)
     */
    private $data;

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
     * @var \Modulo
     *
     * @ORM\ManyToOne(targetEntity="Modulo")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="modulo_id", referencedColumnName="id")
     * })
     */
    private $modulo;

    function getId() {
        return $this->id;
    }

    function getNota() {
        return $this->nota;
    }

    function getData() {
        return $this->data;
    }

    function getAluno() {
        return $this->aluno;
    }

    function getModulo() {
        return $this->modulo;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setNota($nota) {
        $this->nota = $nota;
    }

    function setData($data) {
        $this->data = $data;
    }

    function setAluno(Aluno $aluno) {
        $this->aluno = $aluno;
    }

    function setModulo(Modulo $modulo) {
        $this->modulo = $modulo;
    }

    public function adicionar($dados = FALSE) {
        $this->em->merge($dados);
        $this->em->flush();
        return TRUE;
    }

    public function editar($id = FALSE) {
        $editar = $this->em->find('models\Nota', $id->getId());
        $editar->setId($id->getId());
        $editar->setNota($id->getNota());
        $this->em->merge($editar);
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
                ->where('m.curso =:curso')
                ->andWhere('m.modulo =:modulo')
                ->andWhere('m.estado =:estado')
                ->andWhere('m.ano =:ano')
                ->orderBy('a.id', 'DESC')
                ->setParameter('curso', $dados['0'])
                ->setParameter('modulo', $dados['1'])
                ->setParameter('estado', $dados['2'])
                ->setParameter('ano', $dados['3']);
        return $qb->getQuery()->getResult(\Doctrine\ORM\Query::HYDRATE_ARRAY);
    }

    public function pesquisar($id = FALSE) {
        if ($id) {
            return $this->em->getRepository('models\Nota')->findBy(array('modulo' => $id),array('id' => "DESC"));
            $this->em->flush();
        } else {
            return $this->em->getRepository('models\Nota')->findby(array(), array('id' => "DESC"));
            $this->em->flush();
        }
    }

    public function remover($id = FALSE) {
        $id = $this->em->getPartialReference('models\Nota', $id);
        $this->em->remove($id);
        $this->em->flush();
        return TRUE;
    }

    public function pesquisaNota($id) {
        return $this->em->getRepository('models\Nota')->findOneBy(array('aluno' => $id));
        $this->em->flush();
    }

    public function pesquisaNota1($id) {
        return $this->em->getRepository('models\Nota')->findBy(array('aluno' => $id));
        $this->em->flush();
    }

    public function pesquisarNotas($dados = FALSE) {
        $qb = $this->em->createQueryBuilder();
        $qb->select('count(n.id)');
        $qb->from('models\Nota', 'n')
                ->innerJoin('models\Aluno', 'a', 'WITH', 'n.aluno=a.id')
                ->innerJoin('models\Pessoa', 'p', 'WITH', 'a.pessoa=p.id')
                ->where("n.nota=:nota")
                ->andWhere("p.genero =:genero")
                ->setParameter("nota", $dados['nota'])
                ->setParameter('genero', $dados['genero']);
        $count = $qb->getQuery()->getSingleScalarResult();
        return $count;
    }

    public function pesquisarNotasCurso($dados = FALSE) {
        $qb = $this->em->createQueryBuilder();
        $qb->select('count(n.id)');
        $qb->from('models\Nota', 'n')
                ->innerJoin('models\Aluno', 'a', 'WITH', 'n.aluno=a.id')
                ->innerJoin('models\Matricula', 'm', 'WITH', 'm.aluno=a.id')
                ->innerJoin('models\Curso', 'c', 'WITH', 'c.id=m.curso')
                ->innerJoin('models\Pessoa', 'p', 'WITH', 'a.pessoa=p.id')
                ->where("n.nota=:nota")
                ->andWhere("p.genero =:genero")
                ->andWhere("c.nome =:nome")
                ->setParameter("nota", $dados['nota'])
                ->setParameter("genero", $dados['genero'])
                ->setParameter('nome', $dados['curso']);
        $count = $qb->getQuery()->getSingleScalarResult();
        return $count;
    }

    public function pesquisaGenero($dados = FALSE) {
        $qb = $this->em->createQueryBuilder()
                ->select('count(m.id)')
                ->from('models\Matricula', 'm')
                ->innerJoin('models\Curso', 'c', 'WITH', 'c.id=m.curso')
                ->innerJoin('models\Aluno', 'a', 'WITH', 'm.aluno=a.id')
                ->innerJoin('models\Pessoa', 'p', 'WITH', 'a.pessoa=p.id')
                ->where('p.genero =:genero')
                ->andWhere("c.nome =:nome")
                ->setParameter('nome', $dados['curso'])
                ->setParameter('genero', $dados['genero']);
        $count = $qb->getQuery()->getSingleScalarResult();
        return $count;
    }

    public function pesquisaCurso($dados = FALSE) {
        $qb = $this->em->createQueryBuilder()
                ->select('count(m.id)')
                ->from('models\Matricula', 'm')
                ->innerJoin('models\Curso', 'c', 'WITH', 'm.curso=c.id')
                ->where('c.nome =:curso')
                ->setParameter('curso', $dados);
        $count = $qb->getQuery()->getSingleScalarResult();
        return $count;
    }

    public function buscarNota($dados = FALSE) {
        $qb = $this->em->createQueryBuilder();
        $qb->select('count(n.id)');
        $qb->from('models\Nota', 'n')
                ->where("n.nota=:nota")
                ->setParameter('nota', $dados['nota']);
        $count = $qb->getQuery()->getSingleScalarResult();
        return $count;
    }

    public function totalAlunos() {
        $qb = $this->em->createQueryBuilder();
        $qb->select('count(m.id)');
        $qb->from('models\Matricula', 'm');
        $count = $qb->getQuery()->getSingleScalarResult();
        return $count;
    }

    public function verNota() {
        $qb = $this->em->createQueryBuilder()
                ->select('n.nota,n.data', 'p.nome', 'p.bi', 'm.nome as n1', 'c.nome as n2')
                ->from('models\Nota', 'n')
                ->innerJoin('models\Aluno', 'a', 'WITH', 'n.aluno=a.id')
                ->innerJoin('models\Pessoa', 'p', 'WITH', 'a.pessoa=p.id')
                ->innerJoin('models\Modulo', 'm', 'WITH', 'n.modulo=m.id')
                ->innerJoin('models\Curso', 'c', 'WITH', 'm.curso=c.id');
        return $qb->getQuery()->getResult(\Doctrine\ORM\Query::HYDRATE_ARRAY);
    }

}
