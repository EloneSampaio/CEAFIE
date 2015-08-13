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
    private $usuario;

    public function __construct() {
        parent::__construct();

        $this->nota = $this->LoadModelo('Nota');
        $this->matricula = $this->LoadModelo('Matricula');
        $this->usuario = $this->LoadModelo('Usuario');
        $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie'));
        $this->view->setJs(array("jquery.amaran.min", 'novo', 'hideshow', 'jquery.equalHeight'));
        $this->view->menu = $this->getFooter('menu');
        $this->view->menuVertical = $this->getFooter('menuVertical');
       
    }

    public function index() {

        if (Strcmp(Session::get('tema'), "default") == 0) {
            $this->view->titulo = "Painel de gestão";
            Session::nivelRestrito(array("gestor", "funcionario"));
            



            $this->view->renderizar('gestor');
        } else {
            $this->gestor();
        }
    }

    public function docente() {
        Session::nivelRestrito(array("docente"));
        if (Strcmp(Session::get('tema'), "default") == 0) {
            $this->view->titulo = "Dashboard";
            $this->view->titulo = "Pagina de Docente";
            $this->view->renderizar('docente');
        } else {
            $this->docentex();
        }
    }

    public function aluno() {
        Session::nivelRestrito(array("aluno"));
        if (Strcmp(Session::get('tema'), "default") == 0) {
            $this->view->titulo = "Pagina de Aluno";
            $this->view->renderizar('aluno');
        } else {
            $this->alunox();
        }
    }

    public function admin() {
        $this->view->titulo = "Pagina de Administração";
        Session::nivelRestrito(array("administrador"));
        if (Strcmp(Session::get('tema'), "default") == 0) {
            $this->view->renderizar('admin');
        } else {
            $this->adminx();
        }
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
        $ret = Array("nome" => Session::get('nome'), "mensagem" => "Seja bem vindo a pagina de Administração");
        echo json_encode($ret);
    }

    public function gestor() {
        Session::nivelRestrito(array("gestor", "funcionario"));
         $this->view->titulo = "Painel de gestão";
        $this->view->setCss1(array('bootmetro-responsive', 'bootmetro', 'bootmetro-icons', 'bootmetro-ui-light', 'demo'));
        // $this->view->setJs1(array("bootmetro-panorama", 'bootmetro-pivot', 'bootmetro-charms', 'jquery.mousewheel.min', 'jquery.touchSwipe.min', 'holder'));
        $this->view->renderizar("gestor");
    }

    //tema 2 docente
    public function docentex() {
        $this->view->titulo = "Painel do docente";
        Session::nivelRestrito(array("docente"));
        $this->view->setCss1(array('bootmetro-responsive', 'bootmetro', 'bootmetro-icons', 'bootmetro-ui-light', 'demo'));
        // $this->view->setJs1(array("bootmetro-panorama", 'bootmetro-pivot', 'bootmetro-charms', 'jquery.mousewheel.min', 'jquery.touchSwipe.min', 'holder'));
        $this->view->renderizar("docente");
    }

    //tema 2 aluno
    public function alunox() {
        Session::nivelRestrito(array("aluno"));
         $this->view->titulo = "Painel do aluno";
        $this->view->setCss1(array('bootmetro-responsive', 'bootmetro', 'bootmetro-icons', 'bootmetro-ui-light', 'demo'));
        // $this->view->setJs1(array("bootmetro-panorama", 'bootmetro-pivot', 'bootmetro-charms', 'jquery.mousewheel.min', 'jquery.touchSwipe.min', 'holder'));
        $this->view->renderizar("aluno");
    }

    //tema 2 admin
    public function adminx() {
        Session::nivelRestrito(array("administrador"));
        $this->view->setCss1(array('bootmetro-responsive', 'bootmetro', 'bootmetro-icons', 'bootmetro-ui-light', 'demo'));
        // $this->view->setJs1(array("bootmetro-panorama", 'bootmetro-pivot', 'bootmetro-charms', 'jquery.mousewheel.min', 'jquery.touchSwipe.min', 'holder'));
        $this->view->renderizar("admin");
    }

    public function alteraTema() {

        $this->usuario->setId(Session::get('id'));
        $this->usuario->setTema($_POST['tema']);
        if ($this->usuario->editarTema($this->usuario)) {

            echo json_encode(array("mensagem" => "Tema alterado. Reiniciando..."));
            Session::destruir();
        } else {
            echo json_encode(array("mensagem" => "Erro ao alterar Tema"));
        }
    }

}
