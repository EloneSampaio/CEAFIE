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
 * Description of Modulo
 *
 * @author sam
 */
class Modulo extends Controller implements Dao {

    //put your code here


    private $modulo;
    private $curso;
      private $log;

    public function __construct() {

        $this->curso = $this->LoadModelo('Curso');
        $this->modulo = $this->LoadModelo('Modulo');
          $this->log = $this->LoadModelo('Log');
        parent::__construct();
        $this->view->setJs(array("novo"));
        $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie'));
        $this->view->menu = $this->getFooter('menu');
        $this->view->titulo = "Tabela de módulos cadastrados";
    }

    public function index() {
         Session::nivelRestrito(array("gestor","funcionario"));
        $this->view->dados = $this->modulo->pesquisa();
        $this->view->renderizar('index');
    }

    public function adicionar($dados = FALSE) {
         Session::nivelRestrito(array("gestor","funcionario"));
        if ($this->getInt('enviar') == 1) {
            $this->view->dados = $_POST;

            if (!$this->getSqlverifica('nome')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nome");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um nome";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('curso')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Selecciona um dos cursos");
                // echo json_encode($ret);
                $this->view->erro = "Porfavor Selecciona um dos cursos";
                $this->view->renderizar("novo");
                exit;
            }

            $this->modulo->setNome($this->view->dados['nome']);

            //verificar se já existe um modulo com esse nome
            $p = $this->modulo->pesquisarModulo($this->view->dados['nome']);
            if ($p) {
                $this->view->erro = "Modulo já Existe";
                $this->view->renderizar("novo");
                exit;
            }

            //adiconando modulo
            $id = $this->modulo->adiciona($this->modulo, $this->view->dados);
            if ($id) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados guardado com sucesso");
                //echo json_encode($ret);
                $this->view->mensagem = "Dados guardado com sucesso";
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Adicionado novo modúlo ' . $_POST['nome']);
                $this->log->setData(date('d-m-Y h:i:s'));

                $this->log->adicionar($this->log, Session::get('id'));
                $this->view->renderizar("novo");
                exit;
            } else {
                $this->view->erro = "Erro ao guardar dados";
                $this->view->renderizar("novo");
//$ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                //echo json_encode($ret);
                exit;
            }
        }

        $this->view->renderizar('novo');
    }

    public function editar($id = FALSE) {
         Session::nivelRestrito(array("gestor","funcionario"));
        if ($this->getInt('id')) {
            if (!$this->getSqlverifica('nome')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nome");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um nome";
                $this->view->renderizar("editarDados");
                exit;
            }

            $this->modulo->setNome($this->getSqlverifica('nome'));
            $this->modulo->setId($this->getInt('id'));
            $id = $this->modulo->editar($this->modulo);
            if (!$id) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao alterar dados");
                //echo json_encode($ret);
                $this->view->erro = "Erro ao guardar dados";
                $this->view->renderizar("editarDados");
                exit;
            } else {

                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados alterados com sucesso", "status" => "ok");
                // echo json_encode($ret);
                $this->view->mensagem = "Dados alterados com sucesso";
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Alterado o modúlo para ' . $_POST['nome']);
                $this->log->setData(date('d-m-Y h:i:s'));

                $this->log->adicionar($this->log, Session::get('id'));
                $this->redirecionar('modulo');
                exit;
               
            }
        }
        $this->view->dados = $this->modulo->pesquisar();
        $this->view->renderizar("index");
    }

    public function pesquisaPor($dados = FALSE) {
        $t = $this->modulo->pesquisar($_GET['id']);
        echo json_encode($t);
    }

    public function pesquisar($id = FALSE) {
        
    }

    public function remover($id = FALSE) {
         Session::nivelRestrito(array("gestor"));
        if ($this->filtraInt($id)) {
            if ($this->modulo->remover($id)) {
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Removido um modulo');
                $this->log->setData(date('d-m-Y h:i:s'));

                $this->log->adicionar($this->log, Session::get('id'));
                return TRUE;
            }
        }
        $this->redirecionar('modulo');
    }

    public function editarDados($id = FALSE) {
         Session::nivelRestrito(array("gestor","funcionario"));
        $this->view->dados = $this->modulo->pesquisa1($id);
        $this->view->renderizar('editarDados');
    }

}
