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

class Usuario extends Controller implements Dao {

//put your code here
    private $usuario;
    private $pessoa;

    public function __construct() {
         Session::nivelRestrito(array("administrador"));
        parent::__construct();
        $this->usuario = $this->LoadModelo("Usuario");
        $this->pessoa = $this->LoadModelo("Pessoa");
        $this->view->setJs(array("novo"));
        // $this->view->setCss(array("style"));
    }

    /*
     * @funcão index
     */

    public function index($pagina = FALSE) {
        if (!$this->filtraInt($pagina)) {
            $pagina = false;
        } else {
            $pagina = (int) $pagina;
        }
        Session::nivelRestrito(array("admin"));
        $paginador = new \vendor\paginador\Paginador();
        $this->view->link = "usuario/adicionar";
        $this->view->usuarios = $paginador->paginar($this->usuario->pesquisar(), $pagina, 5);
        $this->view->paginacao = $paginador->getView('paginacao', 'usuario/index');


        if ($this->getInt('enviar') == 1) {
            $dados = $_POST;

            
            if (!$this->getInt('pessoa')) {
                $this->view->erro = "Porfavor Introduza um nome valido ";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('login')) {
                $this->view->erro = "Porfavor Introduza um login valido ";
                $this->view->renderizar("novo");
                exit;
            }
//            $login = $this->getSqlverifica('login');
//            $c = $this->usuario->listarLogin($login);
//            if ($c) {
//                $this->view->erro = "O usuario já esta registrado.";
//                $this->view->renderizar("novo");
//                exit;
//            }

            if (!$this->getSqlverifica('nivel')) {
                $this->view->erro = "Porfavor Selecciona um nivel para o usuario ";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->alphaNumeric('senha')) {
                $this->view->erro = "Porfavor introduza uma senha valida para o  usuario ";
                $this->view->renderizar("novo");
                exit;
            }



            $this->usuario->setLogin($dados['login']);
            $this->usuario->setNivel($dados['nivel']);
            $this->usuario->setSenha(Hash::getHash('md5', $dados['senha'], HASH_KEY));
            


            if (!$this->usuario->adiciona($this->usuario,$dados['pessoa'])) {
                $this->view->erro = "Não Foi Possivel  Concretizar a operção  tenta mais tarde!";
                $this->view->renderizar("index");
                exit;
            }

            $this->view->dados = FALSE;
            $this->view->mensagem = "Registro  Efectuado com Sucesso";
        }

        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {
        $this->view->renderizar('novo');
    }

    public function editar($id = FALSE) {
        
    }

    public function pesquisaPor($dados = FALSE) {
        $t = $this->pessoa->pesquisaPor();
        echo json_encode($t);
    }

    public function pesquisar($id = FALSE) {
        
    }

    public function remover($id = FALSE) {
        
    }

}
