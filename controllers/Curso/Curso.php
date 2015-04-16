<?php

namespace controllers;

use application\Controller;
use application\Session;
use application\Dao;


/**
 * Description of categoriaController
 *
 * @author sam
 */
class Curso extends Controller implements Dao {

    private $curso;

    public function __construct() {
      
        $this->curso = $this->LoadModelo('Curso');
        parent::__construct();
        $this->view->setJs(array("novo"));
    }

    public function index() {
        $this->view->dados = $this->curso->pesquisar();
        $this->view->renderizar('index');
    }

    public function adicionar($dados = FALSE) {
        if ($this->getInt('enviar') == 1) {
            $this->view->dados = $_POST;


            if (!$this->getSqlverifica('nome')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nome");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('descricao')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma descrição");
                echo json_encode($ret);
                exit;
            }

            $this->curso->setNome($this->view->dados['nome']);
            $this->curso->setDescricao($this->view->dados['descricao']);
            $id = $this->curso->adicionar($this->curso);
            if ($id) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados guardado com sucesso");
                echo json_encode($ret);
                exit;
            } else {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                echo json_encode($ret);
                exit;
            }
        }

        $this->view->renderizar('novo');
    }

    public function editar($id = FALSE) {
        if ($this->filtraInt($id)) {
            $this->curso->setNome($this->getSqlverifica('nome'));
            $this->curso->setDescricao($this->getSqlverifica('descricao'));
            $this->curso->setId($id);
            $this->curso->editar($this->curso);
        }
        $this->view->dados = $this->curso->pesquisar();
        $this->view->renderizar("editar");
    }

    public function pesquisaPor($dados = FALSE) {
        $t = $this->curso->listagem();
        echo json_encode($t);
    }

    public function pesquisar($id = FALSE) {
        
    }

    public function remover($id = FALSE) {
        if($this->filtraInt($id)) {
            if ($this->curso->remover($id)) {
                return TRUE;
            }
        }
        $this->view->dados = $this->curso->pesquisar();
        $this->view->renderizar("remover");
    }

    public function editarDados($id = FALSE) {
        $this->view->dados = $this->curso->pesquisar($id);
        $this->view->renderizar('editarDados');
    }

}
