<?php

namespace controllers;

use application\Controller;
use application\Session;

/**
 * Description Dashboard
 *
 * @author sam
 */
class Dashboard extends Controller {

    private $nota;
    private $matricula;

    public function __construct() {
        $this->nota = $this->LoadModelo('Nota');
        $this->matricula = $this->LoadModelo('Matricula');
        parent::__construct();
        $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie'));
        $this->view->setJs(array("jquery.amaran.min", 'novo', 'hideshow', 'jquery.equalHeight', 'RGraph.bar', 'RGraph.common.core'));
    }

    public function index() {
        Session::nivelRestrito(array("administrador"));
        $this->view->titulo = "Pagina de Administracção";
        $this->view->mensage = "Seja BemVindo " . Session::get('nome');
        $this->view->saudacao = " O Seu Login foi feito com sucesso";

        $total = $this->nota->totalAlunos();
        $this->view->cap = $this->nota->pesquisaCurso("CAP")/($total ==0 ? 1 : $total);
        $this->view->cepac = $this->nota->pesquisaCurso("CEPAC")/($total ==0 ? 1 : $total);
        $this->view->cepid = $this->nota->pesquisaCurso("CEPID")/($total ==0 ? 1 : $total);
        $this->view->excelente = $this->nota->buscarNota(array("nota" => "Excelente"))/($total ==0 ? 1 : $total);
        $this->view->bom = $this->nota->buscarNota(array("nota" => "Bom"))/($total ==0 ? 1 : $total);
        $this->view->suficiente = $this->nota->buscarNota(array("nota" => "Suficiente"))/($total ==0 ? 1 : $total);
        $this->view->total = $this->view->cap + $this->view->cepac + $this->view->cepid;
        $this->view->total1 = $this->view->excelente + $this->view->bom;


        $this->view->renderizar('index');
    }

    public function docente() {
        Session::nivelRestrito(array("docente"));
        $this->view->titulo = "Pagina de Administracção";
        $this->view->renderizar('docente');
    }

    public function aluno() {
        Session::nivelRestrito(array("aluno"));
        $this->view->titulo = "Pagina de Administracção";
        $this->view->renderizar('aluno');
    }

    public function dados1() {
        //CAP
        $cap1 = $this->nota->buscarNota(array("nota" => "Excelente"));
        $cap2 = $this->nota->buscarNota(array("nota" => "Bom"));
        $cap3 = $this->nota->buscarNota(array("nota" => "Suficiente"));
        $cap = join(",", array($cap1, $cap2, $cap3));
        $dados = join(",", array("[[$cap]]"));

        echo json_encode($dados);
    }

    public function dados() {
        //CAP
        $cap1 = $this->nota->pesquisaCurso("CAP");
        $cap2 = $this->nota->pesquisaCurso("CEPAC");
        $cap3 = $this->nota->pesquisaCurso("CEPID");
        $cap = join(",", array($cap1, $cap2, $cap3));
        $dados = join(",", array("[[$cap]]"));

        echo json_encode($dados);
    }

    public function listarUsuario() {
        if (Session::get('id')) {
            $id = 1;
        }
        $ret = Array("nome" => Session::get('nome'), "mensagem" => "Seja bem vindo a pagina de Administração", "url" => URL);
        echo json_encode($ret);
    }

}
