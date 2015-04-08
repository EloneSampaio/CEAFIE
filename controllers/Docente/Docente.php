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

class Docente extends Controller implements Dao {

    private $pessoa;
    private $docente;

    public function __construct() {
        parent::__construct();
        $this->pessoa = $this->LoadModelo('Pessoa');
        $this->docente = $this->LoadModelo('Docente');
    }

    public function index() {

        $this->view->dados = $this->docente->pesquisar();
        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {

        if ($this->getInt('enviar') == 1) {
            $this->view->dados = $_POST;


            if (!$this->getSqlverifica('nome')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nome");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('genero')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Escolha um genero");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('bi')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira o numero do BI");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('nacionalidade')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nacionalidade");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('telefone')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um numero de telefone");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('email')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um email");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('grau')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma gra");
                echo json_encode($ret);
                exit;
            }


            $this->pessoa->setNome($this->view->dados['nome']);
            $this->pessoa->setGenero($this->view->dados['genero']);
            $this->pessoa->setNacionalidade($this->view->dados['nacionalidade']);
            $this->pessoa->setTelefone($this->view->dados['telefone']);
            $this->pessoa->setImagem(NULL);
            $this->pessoa->setEmail($this->view->dados['email']);
            $this->pessoa->setBi($this->view->dados['bi']);
            $this->pessoa->setDocumento($this->view->dados['documento']);

            //Aluno//
            $this->docente->setGrau($this->view->dados['grau']);

            $id = $this->pessoa->adicionar($this->pessoa);
            if (!is_int($id)) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                echo json_encode($ret);
                exit;
            }
            $id1 = $this->docente->adiciona($this->docente, $id);
            if (!$id) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                echo json_encode($ret);
                exit;
            } else {

                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados guardados com sucesso", "status" => "ok");
                echo json_encode($ret);
                exit;
            }
        }

        $this->view->renderizar("novo");
    }

    public function editar($id = FALSE) {
        if ($this->filtraInt($id)) {
            $this->docente->setId($id);
            $this->docente->editar($this->docente);
        }
        $this->view->dados = $this->docente->pesquisar();
        $this->view->renderizar("editar");
    }

    public function editarDados($id = FALSE) {
        $this->view->dados = $this->docente->pesquisar($id);
        $this->view->renderizar('editarDados');
    }

    public function pesquisaPor($dados = FALSE) {
        
    }

    public function pesquisar($id = FALSE) {
        
        
    }

    public function remover($id = FALSE) {
        if ($this->filtraInt($id)) {
            if ($this->docente->remover($id)) {
                return TRUE;
            }
        }
        $this->view->dados = $this->docente->pesquisar();
        $this->view->renderizar("remover");
    }

}
