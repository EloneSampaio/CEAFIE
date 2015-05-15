<?php

namespace controllers;

use application\Controller;
use application\Dao;
use application\Session;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Nota
 *
 * @author sam
 */
class Nota extends Controller implements Dao {

    //put your code here
    private $nota;
    private $curso;
    private $aluno;
    private $modulo;
    private $matricula;
    private $docente;

    public function __construct() {
        Session::nivelRestrito(array("administrador", "docente"));
        $this->nota = $this->LoadModelo('Nota');
        $this->curso = $this->LoadModelo('Curso');
        $this->aluno = $this->LoadModelo('Aluno');
        $this->modulo = $this->LoadModelo('Modulo');
        $this->matricula = $this->LoadModelo('Matricula');
        $this->docente = $this->LoadModelo('Docente');
        parent::__construct();
        $this->view->setJs(array("novo"));
         $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie'));
         $this->view->menu=  $this->getFooter('menu');
    }

    public function index() {
        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {
        if ($this->getInt('enviar') == 1) {

            if (!$this->getSqlverifica('nota')) {
                $this->view->erro = "Porfavor Selecciona uma nota";
                $this->view->renderizar('index');
                exit;
            }

            $dados = $_POST;
            $this->nota->setData(date('Y-m-d'));
            $aluno = $this->aluno->pesquisar($this->getInt('aluno'));
            $matricula = $this->matricula->pesquisar($aluno->getId());
            $modulo = $this->modulo->pesquisaPor($matricula->getModulo()->getId());
            $this->nota->setNota($this->getSqlverifica('nota'));
            $this->nota->setModulo($modulo);
            $this->nota->setAluno($aluno);

            $this->nota->adicionar($this->nota);
        }

        $this->view->renderizar('index');
    }

    public function editar($id = FALSE) {


        if ($this->getInt('enviar') == 1) {
            if (!$this->getSqlverifica('nota')) {
                $this->view->erro = "Porfavor Selecciona uma nota";
                $this->view->renderizar('index');
                exit;
            }

            $this->nota->setNota($this->getSqlverifica('nota'));
            $this->nota->setId($this->getInt('id'));
            $this->nota->editar($this->nota);
        }

        $this->view->dados = $this->nota->pesquisar();
        $this->view->renderizar('editar');
    }

    public function pesquisaPor($dados = FALSE) {
        if ($this->getInt('enviar') == 1) {

            if (!$this->getSqlverifica('curso')) {
                $this->view->erro = "Porfavor Selecciona um dos cursos";
                $this->view->renderizar('index');
                exit;
            }

            if (!$this->getSqlverifica('modulo')) {
                $this->view->erro = "Porfavor Selecciona um dos modulos";
                $this->view->renderizar('index');
                exit;
            }

            $dados[] = $this->getInt('curso');
            $dados[] = $this->getInt('modulo');
            $dados[] = "FECHADO";
            $this->view->dados = $this->nota->pesquisaPor($dados);
        }
        $this->view->renderizar('index');
    }

    public function pesquisar($id = FALSE) {

        if ($this->getInt('enviar') == 1) {

            if (!$this->getSqlverifica('curso')) {
                $this->view->erro = "Porfavor Selecciona um dos cursos";
                $this->view->renderizar('index');
                exit;
            }

            if (!$this->getSqlverifica('modulo')) {
                $this->view->erro = "Porfavor Selecciona um dos modulos";
                $this->view->renderizar('index');
                exit;
            }


            $this->view->dados = $this->nota->pesquisar($this->getInt('modulo'));
        }
        $this->view->renderizar('editar');
    }

    public function remover($id = FALSE) {
        if ($this->getInt('id')) {
            if ($this->nota->remover($this->getInt('id'))) {
                $this->view->mensagem = "Nota Apagada com sucesso";
                $this->view->dados = $this->nota->pesquisar();
            }
        }
        $this->view->dados = $this->nota->pesquisar();
        $this->view->renderizar("remover");
    }

    public function docente() {

        $id = $this->docente->pesquisar(Session::get('pessoa'));
        $dados = array("modulo" => $id->getModulo()->getId(), "estado" => "FECHADO");
        if ($this->view->dados = $this->matricula->pesquisaPor($dados)) {
            $this->view->renderizar("index1");
        }
    }

    public function listar() {
        $this->view->nota = $this->nota->verNota();
        $this->view->renderizar("notas");
    }

}
