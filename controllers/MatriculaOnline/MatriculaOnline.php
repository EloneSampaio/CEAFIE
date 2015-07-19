<?php

namespace controllers;

use application\Controller;
use application\Session;
use application\Hash;
use application\Dao;

//use vendor\paginador\Paginador;

/*
 * @sam
 */

class MatriculaOnline extends Controller implements Dao {

//put your code here
    private $usuario;
    private $pessoa;

    public function __construct() {
        parent::__construct();
        //$this->usuario = $this->LoadModelo("Usuario");
        //$this->pessoa = $this->LoadModelo("Pessoa");
        //$this->view->setCss(array());
        //$this->view->setJs(array("novo"));
      
    }

    /*
     * @funcão index
     */

    public function index() {

        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {
        $this->view->renderizar('novo');
    }

    public function editar($id = FALSE) {

        if ($this->filtraInt($id)) {
            $this->view->dados = $this->usuario->pesquisar($id);
        }
        if ($this->getInt('enviar') == 1) {
            $dados = $_POST;



            if (!$this->getSqlverifica('login')) {
                $this->view->erro = "Porfavor Introduza um login valido ";
                $this->view->renderizar("editarDados");
                exit;
            }
            if (!$this->getSqlverifica('nivel')) {
                $this->view->erro = "Porfavor Selecciona um nivel para o usuario ";
                $this->view->renderizar("editarDados");
                exit;
            }



            $this->usuario->setLogin($dados['login']);
            $this->usuario->setNivel($dados['nivel']);
            $this->usuario->setSenha(Hash:: getHash('md5', $dados ['senha'], HASH_KEY));
            $this->usuario->setId($dados['id']);

            if (!$this->usuario->editar($this->usuario)) {
                // $ret = Array("mensagem" => "Erro ao criar usuario");
                //echo json_encode($ret);
                $this->view->erro = "Erro ao alterar dados do usuario";
                $this->view->renderizar("editarDados");

                exit;
            } else {

                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados alterados com sucesso", "status" => "ok");
                //echo json_encode($ret);
                // $this->view->mensagem = "Dados alterados com sucesso";
                $this->redirecionar("usuario");
                exit;
            }
        }
        $this->view->renderizar("editarDados");
    }

    public function pesquisaPor($dados = FALSE) {
        $t = $this->pessoa->pesquisaPor();
        echo json_encode($t);
    }

    public function pesquisar($id = FALSE) {
        
    }

    public function remover($id = FALSE) {
        $r = $this->pessoa->remover($id);
        if ($r) {

            $this->view->dados = $this->usuario->pesquisar();
            $this->redirecionar('usuario/index/');
        }
    }

    public function editarDados($id = FALSE) {
        
    }

}
