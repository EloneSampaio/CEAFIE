<?php

namespace models;

use Doctrine\ORM\Mapping as ORM;
use config\Doctrine;

/**
 * Log
 *
 * @ORM\Table(name="log", indexes={@ORM\Index(name="fk_log_usuario1_idx", columns={"usuario_id"})})
 * @ORM\Entity
 */
class Log extends Doctrine {

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
     * @ORM\Column(name="ip_maquina", type="string", length=45, nullable=true)
     */
    private $ipMaquina;

    /**
     * @var string
     *
     * @ORM\Column(name="acao", type="string", length=45, nullable=false)
     */
    private $acao;
    
        /**
     * @var integer
     *
     * @ORM\Column(name="status", type="integer", nullable=true)
     */
    private $status;

    /**
     * @var string
     *
     * @ORM\Column(name="data", type="string", length=45, nullable=false)
     */
    private $data;

    /**
     * @var Usuario
     *
     * @ORM\ManyToOne(targetEntity="Usuario")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="usuario_id", referencedColumnName="id")
     * })
     */
    private $usuario;
    
    function getStatus() {
        return $this->status;
    }

    function setStatus($status) {
        $this->status = $status;
    }

    
    function getId() {
        return $this->id;
    }

    function getIpMaquina() {
        return $this->ipMaquina;
    }

    function getAcao() {
        return $this->acao;
    }

    function getData() {
        return $this->data;
    }

    function getUsuario() {
        return $this->usuario;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setIpMaquina($ipMaquina) {
        $this->ipMaquina = $ipMaquina;
    }

    function setAcao($acao) {
        $this->acao = $acao;
    }

    function setData($data) {
        $this->data = $data;
    }

    function setUsuario(Usuario $usuario) {
        $this->usuario = $usuario;
    }

    public function adicionar($dados, $usuario) {
        $id = $this->em->getPartialReference('models\Usuario', $usuario);
        $this->setUsuario($id);
        $this->em->persist($dados);
        $this->em->flush();
        return TRUE;
    }

    public function remover($id = FALSE) {
        $id = $this->em->getPartialReference('models\Log', $id);
        $this->em->remove($id);
        $this->em->flush();
        return TRUE;
    }

    public function pesquisar($id = FALSE) {
        if ($id) {
            return $this->em->getRepository('models\Log')->findOneBy(array('id' => $id));
            $this->em->flush();
        } else {
            return $this->em->getRepository('models\Log')->findby(array(), array('id' => "DESC"));
            $this->em->flush();
        }
    }

}
