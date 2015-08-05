<?php

namespace controllers;

use application\Controller;
use application\Session;
use application\LogUso;

/**
 * Description of categoriaController
 *
 * @author sam
 */
class Generico extends Controller {

    private $log;
    private $generico;

    public function __construct() {

        $this->log = $this->LoadModelo('Log');
        $this->generico = $this->LoadModelo('Generico');
        parent::__construct();
        $this->view->setJs(array("novo"));
        $this->view->menu = $this->getFooter('menu');
        $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie'));
    }

    public function index() {
        
    }

    public function render($dados) {
        $this->view->dados = $this->generico->pesquisar($dados);
        $this->view->renderizar($dados . '/index');
    }

    public function adicionar($dados = FALSE) {
        if ($this->getInt('enviar') == 1) {
            $this->view->dados = $_POST;

            if (!$this->getSqlverifica('nome')) {
                $this->view->erro = "Porfavor Insira um nome";
                $this->view->renderizar($dados . "/novo");
                exit;
            }

//
//            $p = $this->generico->pesquisar($this->view->dados['nome'], $this->view->dados['opcao']);
//            if ($p) {
//                $this->view->erro = "Curso já Existe";
//                $this->view->renderizar("funcao/novo");
//                exit;
//            }


            $id = $this->generico->adicionar($this->view->dados['nome'], $this->view->dados['opcao']);


            if ($id) {
                $this->view->mensagem = "Dados guardado com sucesso";
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Adicionado novo modúlo ' . $_POST['nome']);
                $this->log->setData(date('d-m-Y h:i:s'));

                $this->log->adicionar($this->log, Session::get('id'));
                $this->view->renderizar($dados . "/novo");

                exit;
            } else {
                $this->view->erro = "Erro ao guardar dados";
                $this->view->renderizar($dados . "/novo");

                exit;
            }
        }

        $this->view->renderizar($dados . '/novo');
    }

    public function editar($id = FALSE, $entidade = FALSE) {
        if ($this->getInt('enviar')) {


            if (!$this->getSqlverifica('nome')) {
                $this->view->erro = "Porfavor Insira um nome";
                $this->view->renderizar($entidade.'/index');
                exit;
            }

            $id = $this->generico->editar($entidade,$id,$_POST);
            $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
            $this->log->setAcao('Alterado ' . $_POST['nome']);
            $this->log->setData(date('d-m-Y h:i:s'));

            $this->log->adicionar($this->log, Session::get('id'));

            if (!$id) {
                $this->view->erro = "Erro ao alterar dados";
                $this->view->renderizar("novo");
                exit;
            } else {

                $lo = new LogUso('log');
                $lo->verificarArquivo();
                $lo->gravar("Foi Editado uma ".$entidade);
                $this->view->mensagem = "Dados alterados com sucesso";
                $this->redirecionar('generico/render/'.$entidade);

                exit;
            }
        }
        $this->view->dados = $this->generico->pesquisar($entidade,$id);
        $this->view->renderizar($entidade.'/editarDados');
    }

    public function remover($id = FALSE, $entidade = FALSE) {

        if ($id) {
            $this->generico->remover($id, $entidade);
            $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
            $this->log->setAcao('Removido ' . $entidade);
            $this->log->setData(date('d-m-Y h:i:s'));


            $this->log->adicionar($this->log, Session::get('id'));

        }
        $this->view->dados = $this->generico->pesquisar($entidade);
        $this->view->renderizar($entidade . "/index");
    }

    public function pesquisar($entidade = FALSE) {
        
    }

    public function pesquisaPor($entidade = FALSE) {
        $t = $this->generico->listagem($entidade);
        echo json_encode($t);
    }

}
