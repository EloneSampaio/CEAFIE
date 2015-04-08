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
                ->orderBy('a.id', 'DESC')
                ->setParameter('curso', $dados['0'])
                ->setParameter('modulo', $dados['1']);

        return $qb->getQuery()->getResult(\Doctrine\ORM\Query::HYDRATE_ARRAY);
    }

    public function pesquisar($id = FALSE) {

        if ($id) {

            return $this->em->getRepository('models\Nota')->findBy(array('modulo' => $id));
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
        return $this->em->getRepository('models\Nota')->findBy(array('aluno' => $id), array('id' => "DESC"));
        $this->em->flush();
    }

}
