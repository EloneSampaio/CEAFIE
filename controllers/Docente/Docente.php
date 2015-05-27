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
    private $usuario;
    private $modulo;
    private $curso;
    private $dm;

    public function __construct() {
        Session::nivelRestrito(array("administrador"));
        $this->pessoa = $this->LoadModelo('Pessoa');
        $this->docente = $this->LoadModelo('Docente');
        $this->curso = $this->LoadModelo('Curso');
        $this->modulo = $this->LoadModelo('Modulo');
        $this->usuario = $this->LoadModelo('Usuario');
        $this->dm = $this->LoadModelo('DocentModulo');
        parent::__construct();
        $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie', 'multiple-select'));
        $this->view->setJs(array("novo", "jquery.multiple.select"));
        $this->view->menu = $this->getFooter('menu');
        $this->view->titulo="Docente";
    }

    public function index() {

        $this->view->dados = $this->docente->pesquisar();
        $this->view->detalhes = $this->dm->pesquisar();
        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {


        if ($this->getInt('enviar') == 1) {
            $this->view->dados = $_POST;



            if (!$this->getSqlverifica('nome')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nome");
                //echo json_encode($ret);

                $this->view->erro = "Porfavor Insira um nome";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('nome1')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um apelido");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um apelido";
                $this->view->renderizar("novo");
                exit;
            }
            if (!$this->getSqlverifica('genero')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Escolha um genero");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um genero";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('bi')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira o numero do BI");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor o numero do BI";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->verificarBi($this->view->dados['bi'])) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira o numero de BI valido");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor um numero de BI valido";
                $this->view->renderizar("novo");

                exit;
            }



            if (!$this->getSqlverifica('nacionalidade')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nacionalidade");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor uma nacionalidade";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('telefone')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um numero de telefone");
                //echo json_encode($ret);

                $this->view->erro = "Porfavor um numero de telefone";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('email')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um email");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor um email";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('grau')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma grau");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor uma grau";
                $this->view->renderizar("novo");
                exit;
            }



            $nome = $this->view->dados['nome'] . " " . $this->view->dados['nome1'];
            $this->pessoa->setNome($nome);
            $this->pessoa->setGenero($this->view->dados['genero']);
            $this->pessoa->setNacionalidade($this->view->dados['nacionalidade']);
            $this->pessoa->setTelefone($this->view->dados['telefone']);
            $this->pessoa->setImagem(NULL);
            $this->pessoa->setEmail($this->view->dados['email']);
            $this->pessoa->setBi($this->view->dados['bi']);

//Aluno//
            $this->docente->setGrau($this->view->dados['grau']);

            //verificr dados//
            if ($this->pessoa->pesquisarNome($nome)) {
                $this->view->erro = "O nome já esta sendo usado escolha um outro nome";
                $this->view->renderizar("novo");
                exit;
            }
            if ($this->pessoa->pesquisarEmail($_POST['email'])) {
                $this->view->erro = "O email já esta sendo usado escolha um outro email";
                $this->view->renderizar("novo");
                exit;
            }
            if ($this->pessoa->pesquisarBi($_POST['bi'])) {
                $this->view->erro = "O numero de bi já esta sendo usado escolha um outro bi";
                $this->view->renderizar("novo");
                exit;
            }
            if ($this->pessoa->pesquisarTelefone($_POST['telefone'])) {
                $this->view->erro = "O numero de telefone já esta sendo usado escolha um outro numero";
                $this->view->renderizar("novo");
                exit;
            }





            $id = $this->pessoa->adicionar($this->pessoa);
            $dad = array("pessoa" => $id, "modulo" => $this->view->dados['modulo']);
            if (!is_int($id)) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                //echo json_encode($ret);
                $this->view->erro = "Erro ao guardar dados";
                $this->view->renderizar("novo");

                exit;
            }





            $id1 = $this->docente->adiciona($this->docente, $dad);
            if (!$id1) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                //echo json_encode($ret);
                $this->view->erro = "Erro ao guardar dados";
                $this->view->renderizar("novo");
                exit;
            }



            $mt = $this->docente->pesquisaPor($id1);

            //adicionar docente aos modulos
            $this->dm->adiciona($id1, $_POST['modulo']);


            $login = $this->view->dados['nome1'] . rand(8, 12);
            $this->usuario->setLogin($login);
            $this->usuario->setSenha(\application\Hash::getHash("md5", $login, HASH_KEY));
            $this->usuario->setNivel("docente");
            $id12 = $this->usuario->adiciona($this->usuario, $mt->getPessoa()->getId());
            if (!is_int($id12)) {
                //     $ret = Array("mensagem" => "Erro ao criar usuario");
                //    echo json_encode($ret);
                $this->view->erro = "Erro ao criar usuario";
                $this->view->renderizar("novo");
                exit;

                exit;
            } else {

                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados guardados com sucesso", "status" => "ok");
                //echo json_encode($ret);
                $this->view->mensagem = "Dados guardados com sucesso";
                $this->view->renderizar("novo");

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

    public function editar1($id = FALSE) {
        //if ($this->filtraInt($id)) {


        if ($this->getInt('enviar') == 1) {
            $this->view->dados = $_POST;

            if (!$this->getSqlverifica('nome')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nome");
                //echo json_encode($ret);

                $this->view->erro = "Porfavor Insira um nome";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('nome1')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um apelido");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um apelido";
                $this->view->renderizar("novo");
                exit;
            }
            if (!$this->getSqlverifica('genero')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Escolha um genero");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um genero";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('bi')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira o numero do BI");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor o numero do BI";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->verificarBi($this->view->dados['bi'])) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira o numero de BI valido");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor um numero de BI valido";
                $this->view->renderizar("novo");

                exit;
            }



            if (!$this->getSqlverifica('nacionalidade')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nacionalidade");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor uma nacionalidade";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('telefone')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um numero de telefone");
                //echo json_encode($ret);

                $this->view->erro = "Porfavor um numero de telefone";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('email')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um email");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor um email";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('grau')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma grau");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor uma grau";
                $this->view->renderizar("novo");
                exit;
            }


            $this->pessoa->setNome($this->view->dados['nome']);
            $this->pessoa->setGenero($this->view->dados['genero']);
            $this->pessoa->setNacionalidade($this->view->dados['nacionalidade']);
            $this->pessoa->setTelefone($this->view->dados['telefone']);
            $this->pessoa->setEmail($this->view->dados['email']);
            $this->pessoa->setBi($this->view->dados['bi']);
            $this->pessoa->setId($this->view->dados['pessoa']);

//Aluno//
            $this->docente->setGrau($this->view->dados['grau']);

            $id = $this->pessoa->editar1($this->pessoa);
            if (!$id) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao alterar dados");
                //echo json_encode($ret);
                $this->view->erro = "Erro ao alterar dados";
                $this->view->renderizar("novo");

                exit;
            }
            $this->docente->setId($this->view->dados['id']);
            $id1 = $this->docente->editar($this->docente);
            if (!$id1) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao alterar dados");
                //echo json_encode($ret);
                $this->view->erro = "Erro ao alterar dados";
                $this->view->renderizar("novo");

                exit;
            } else {

                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados alterados com sucesso", "status" => "ok");
                //echo json_encode($ret);

                $this->view->mensagem = "Dados alterados com sucesso";
                $this->view->renderizar("novo");
                exit;
            }
        }
        //}
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

    public function preencherSelect() {

        $var = array();
        $t = array();
        $c = $this->curso->listagem();
        foreach ($c as $valor) {
            foreach ($this->modulo->pesquisar($valor['id']) as $k => $v) {

                $var[] = $v;
            }
        }


        echo json_encode(array_filter($var));
    }

    public function detalhes() {
        $de = $this->dm->pesquisar($this->filtraInt($_GET['id']));
        echo json_encode($de);
        exit;
    }

}
