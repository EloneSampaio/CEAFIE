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

    public function __construct() {
        parent::__construct();

        $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie'));
        $this->view->setJs(array("jquery.amaran.min", 'novo', 'hideshow', 'jquery.equalHeight'));
    }

    public function index() {
        Session::nivelRestrito(array("administrador"));

        $this->view->titulo = "Pagina de Administracção";

//        $paginador = new \vendor\paginador\Paginador();
//        //$this->view->destino = $paginador->paginar($this->destino->listaAll(), $pagina, 50);
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

    public function listarUsuario() {
        if (Session::get('id')) {
            $id = 1;
        }
        $ret = Array("nome" => Session::get('nome'), "mensagem" => "Seja bem vindo a pagina de Administração", "url" => URL);
        echo json_encode($ret);
    }

}
