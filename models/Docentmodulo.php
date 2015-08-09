<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * Docentmodulo
 *
 * @ORM\Table(name="docentmodulo", indexes={@ORM\Index(name="fk_docentmodulo_modulo1_idx", columns={"modulo_id"}), @ORM\Index(name="fk_docentmodulo_docente1_idx", columns={"docente_id"})})
 * @ORM\Entity
 */
class Docentmodulo
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \Docente
     *
     * @ORM\ManyToOne(targetEntity="Docente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="docente_id", referencedColumnName="id")
     * })
     */
    private $docente;

    /**
     * @var \Modulo
     *
     * @ORM\ManyToOne(targetEntity="Modulo")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="modulo_id", referencedColumnName="id")
     * })
     */
    private $modulo;


}
