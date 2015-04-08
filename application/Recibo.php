<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Recibo
 *
 * @author sam
 */

namespace application;

use application\Documento;
use mPDF;

class Recibo implements Documento {

    private $titulo;
    private $css;
    private $bi;
    private $nome;
    private $curso;
    private $data;
    private $modulo;

    function getModulo() {
        return $this->modulo;
    }

    function setModulo($modulo) {
        $this->modulo = $modulo;
    }

    public function getBi() {
        return $this->bi;
    }

    public function getNome() {
        return $this->nome;
    }

    public function getCurso() {
        return $this->curso;
    }

    public function getData() {
        return $this->data;
    }

    public function setBi($bi) {
        $this->bi = $bi;
    }

    public function setNome($nome) {
        $this->nome = $nome;
    }

    public function setCurso($curso) {
        $this->curso = $curso;
    }

    public function setData($data) {
        $this->data = $data;
    }

    public function __construct($css = null, $titulo) {
        $this->titulo = $titulo;
        $this->setarCSS($css);
    }

    public function getBody() {

        $nome = $this->getNome();
        $id = $this->getBi();
        $curso = $this->getCurso();
        $data = $this->getData();
        $modulo = $this->getModulo();


        $retorno = "
<div style=\"margin:0 auto; float:none;\">
<table class=\"table table-striped table-bordered\">
<caption class=\"text-center\"><h4> UNIVERSIDADE AGOSTINHO NETO REITORIA<br /> Curso de Agregação Pedagógica
</h4>
</caption>

<tbody>
<br /><br />
<tr>
<td>Nome</td>
<td>Identidade</td>
<td>Curso</td>
<td>Modúlo</td>
<td>Data de Inscrição</td>
</tr>
<tr>
<td>$nome</td>
<td>$id</td>
<td>$curso</td>
<td>$modulo</td>
<td>$data</td>


</tr>
</tbody>
</table>
</div>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<div class=\"span15\">
<div style=\"-webkit-border-radius: 14px 4px 4px 4px;
border-radius: 14px 4px 4px 4px; border-width: medium;
border-style: solid;
border-color: #0000;\">
<p class=\"text-center\">AUTORIZAÇÃO DA UNIDADE ORGANICA E DISPENSA PARA FREQUENTAR O CURSO</p><br />
<div style=\"margin-left:250px;\">
<p>NOME: ______________________________________________________________________________</p>
<p>FUNÇÃO:____________________________________________________________________________</p>
<p>ASSINATURA:________________________________________________________________________</p>
</div>
<p class=\"text-center\">NOTA: APRESENTAR A COPIA DO BI E DO DIPLOMA DO ENSINO SUPERIOR. </p>

</div>

</div>


";

        return $retorno;
    }

    public function getFooter() {
        $retorno = "Data: " . date('Y-m-d');
        return $retorno;
    }

    public function getHeader() {
        $retorno = "<img src='public/img/UAN2.png' class='img-responsive' style='margin-left:500px;' />";

        return $retorno;
    }

    public function setarCSS($file = FALSE) {
        if (file_exists($file)):
            $this->css = file_get_contents($file);
        else:
            echo 'Arquivo inexistente!';
        endif;
    }

    public function BuildPDF() {
        $this->pdf = new mPDF('utf-8', 'A4-L');
        $this->pdf->WriteHTML($this->css, 1);
        //$this->pdf->SetHTMLHeader($this->getHeader());
        $this->pdf->WriteHTML($this->getHeader());
        $this->pdf->WriteHTML($this->getBody());
        $this->pdf->SetHTMLFooter($this->getFooter());
    }

    public function Exibir($name = null) {
        $this->pdf->Output($name, "I");
    }

}
