<?php

namespace controllers;

use application\Controller;
use application\Dao;
use application\Session;
use application\LogUso;
use \Eventviva\ImageResize;

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
    private $log;

    public function __construct() {
        Session::nivelRestrito(array("gestor"));
        $this->pessoa = $this->LoadModelo('Pessoa');
        $this->docente = $this->LoadModelo('Docente');
        $this->curso = $this->LoadModelo('Curso');
        $this->modulo = $this->LoadModelo('Modulo');
        $this->usuario = $this->LoadModelo('Usuario');
        $this->dm = $this->LoadModelo('DocentModulo');
        $this->log = $this->LoadModelo('Log');
        parent::__construct();
        $this->view->setCss(array('amaran.min', 'animate', 'layout', 'ie', 'multiple-select', 'bootstrap-dialog.min'));
        $this->view->setJs(array("novo", 'validacao', 'crud', "jquery.multiple.select", 'bootstrap-dialog.min', 'jquery.noty.packaged.min'));
        $this->view->menu = $this->getFooter('menu');
        $this->view->titulo = " Tabela de docentes cadastrados";
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
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um nome");
                echo json_encode($ret);
//                $this->view->erro = "Porfavor Insira um nome";
//                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('apelido')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um apelido");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira um apelido";
                //$this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('genero')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Escolha um genero");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira um genero";
                //$this->view->renderizar("novo");
                exit;
            }
//
//            if (!$this->getSqlverifica('bi')) {
//                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira o numero do BI");
//                echo json_encode($ret);
//                //$this->view->erro = "Porfavor Insira o numero do BI";
//                //$this->view->renderizar("novo");
//                exit;
//            }
//            if (!$this->verificarBi($this->view->dados['bi'])) {
//                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira  numero de BI valido...");
//                //echo json_encode($ret);
//                $this->view->erro = "Porfavor Insira numero de BI valido";
//                $this->view->renderizar("novo");
            // exit;
//            }


            if (!$this->getSqlverifica('nacionalidade')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um nacionalidade");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira uma nacionalidade";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('telefone')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um numero de telefone");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira  um numero de telefone";
                //$this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('email')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um email");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira um email";
                //$this->view->renderizar("novo");

                exit;
            }
            $nome = $this->view->dados['nome'] . " " . $this->view->dados['apelido'];
            $this->pessoa->setNome($this->view->dados['nome']);
            $this->pessoa->setApelido($this->view->dados['apelido']);
            $this->pessoa->setGenero($this->view->dados['genero']);
            $this->pessoa->setNacionalidade($this->view->dados['nacionalidade']);
            $this->pessoa->setTelefone($this->view->dados['telefone']);
            $this->pessoa->setImagem(NULL);
            $this->pessoa->setEmail($this->view->dados['email']);
            if ($this->view->dados['bi'] == '') {
                $this->pessoa->setBi($this->view->dados['passaporte']);
                if ($this->pessoa->pesquisarBi($_POST['passaporte'])) {
                    $ret = Array("tipo" => 'error', "mensagem" => "O numero do passaporte já esta sendo usado escolha um outro");
                    echo json_encode($ret);
                    //$this->view->erro = "O numero de bi já esta sendo usado escolha um outro bi";
                    //$this->view->renderizar("novo");
                    exit;
                }
            } else {
                $this->pessoa->setBi($this->view->dados['bi']);
                if ($this->pessoa->pesquisarBi($_POST['bi'])) {
                    $ret = Array("tipo" => 'error', "mensagem" => "O numero de bi já esta sendo usado escolha um outro bi");
                    echo json_encode($ret);
                    //$this->view->erro = "O numero de bi já esta sendo usado escolha um outro bi";
                    //$this->view->renderizar("novo");
                    exit;
                }
            }



//Docente//
            $this->docente->setGrau($this->view->dados['grau']);

            //verificr dados//

            if ($this->pessoa->pesquisarEmail($_POST['email'])) {
                $ret = Array("tipo" => 'error', "mensagem" => "O email já esta sendo usado escolha um outro email");
                echo json_encode($ret);
                //$this->view->erro = "O email já esta sendo usado escolha um outro email";
                //$this->view->renderizar("novo");
                exit;
            }

            if ($this->pessoa->pesquisarTelefone($_POST['telefone'])) {
                $ret = Array("tipo" => 'error', "mensagem" => "O numero de telefone já esta sendo usado escolha um outro numero");
                echo json_encode($ret);
                //$this->view->erro = "O numero de telefone já esta sendo usado escolha um outro numero";
                //$this->view->renderizar("novo");
                exit;
            }





            $id = $this->pessoa->adicionar($this->pessoa);
            $dad = array("pessoa" => $id, "modulo" => $this->view->dados['modulo']);
            if (!is_int($id)) {
                $ret = Array("tipo" => 'error', "mensagem" => "Erro ao guadar dados");

                echo json_encode($ret);
                //$this->view->erro = "O numero de telefone já esta sendo usado escolha um outro numero";
                //$this->view->renderizar("novo");

                exit;
            }





            $id1 = $this->docente->adiciona($this->docente, $dad);
            if (!$id1) {
                $ret = Array("tipo" => 'error', "mensagem" => "Erro ao guadar dados");

                echo json_encode($ret);
                //$this->view->erro = "O numero de telefone já esta sendo usado escolha um outro numero";
                //$this->view->renderizar("novo");

                exit;
            }



            $mt = $this->docente->pesquisaPor($id1);

            //adicionar docente aos modulos
            $this->dm->adiciona($id1, $_POST['modulo']);



            $this->usuario->setLogin($_POST['bi']);
            $this->usuario->setSenha(\application\Hash::getHash("md5", $_POST['bi'], HASH_KEY)); //$this->geraSenha()
            $this->usuario->setNivel("docente");
            $id12 = $this->usuario->adiciona($this->usuario, $mt->getPessoa()->getId());
            if (!is_int($id12)) {
                $ret = Array("tipo" => 'error', "mensagem" => "Erro ao criar usuario");

                echo json_encode($ret);
                //$this->view->erro = "O numero de telefone já esta sendo usado escolha um outro numero";
                //$this->view->renderizar("novo");
                exit;
            } else {
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Foi criado um novo docente com o nome de : ' . $nome);
                $this->log->setData(date('d-m-Y h:i:s'));
                $this->log->adicionar($this->log, Session::get('id'));
                $ret = Array("tipo" => 'success', "mensagem" => "Dados guardados com sucesso", 'cod' => 1);
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

        if ($this->getInt('enviar') == 1) {
            $this->view->dados = $_POST;

            if (!$this->getSqlverifica('nome')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um nome");
                echo json_encode($ret);
//                $this->view->erro = "Porfavor Insira um nome";
//                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('apelido')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um apelido");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira um apelido";
                //$this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('genero')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Escolha um genero");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira um genero";
                //$this->view->renderizar("novo");
                exit;
            }
//
            if (!$this->getSqlverifica('bi')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira o numero do BI");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira o numero do BI";
                //$this->view->renderizar("novo");
                exit;
            }
//            if (!$this->verificarBi($this->view->dados['bi'])) {
//                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira  numero de BI valido...");
//                //echo json_encode($ret);
//                $this->view->erro = "Porfavor Insira numero de BI valido";
//                $this->view->renderizar("novo");
            // exit;
//            }


            if (!$this->getSqlverifica('nacionalidade')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um nacionalidade");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira uma nacionalidade";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('telefone')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um numero de telefone");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira  um numero de telefone";
                //$this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('email')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um email");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira um email";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('grau')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira um grau");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira um email";
                //$this->view->renderizar("novo");

                exit;
            }


            $this->pessoa->setNome($this->view->dados['nome']);
            $this->pessoa->setApelido($this->view->dados['apelido']);
            $this->pessoa->setGenero($this->view->dados['genero']);
            $this->pessoa->setNacionalidade($this->view->dados['nacionalidade']);
            $this->pessoa->setTelefone($this->view->dados['telefone']);
            $this->pessoa->setId($id);
            $this->pessoa->setEmail($this->view->dados['email']);
            $this->pessoa->setBi($this->view->dados['bi']);
           

//Docente//
            $this->docente->setGrau($this->view->dados['grau']);

            $r = $this->pessoa->editarDados($this->pessoa);
            if (!$r) {
                $ret = Array("tipo" => 'error', "mensagem" => "Erro ao alterar dados");
                echo json_encode($ret);

                exit;
            }

            $this->docente->setId($this->view->dados['id']);
            $id1 = $this->docente->editar($this->docente);
            if (!$id1) {
                $ret = Array("tipo" => 'error', "mensagem" => "Erro ao alterar dados");
                echo json_encode($ret);

                exit;
            } else {
                //$this->view->mensagem = "Dados alterados com sucesso";
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao("Foi Editado  informações do docente" . ' Com o nome de : ' . $_POST['nome']);
                $this->log->setData(date('d-m-Y h:i:s'));
                $this->log->adicionar($this->log, Session::get('id'));
                $ret = Array("tipo" => 'success', "mensagem" => "Dados alterado com sucesso", 'cod' => 1);
                echo json_encode($ret);
                exit;
            }
        }
        //}
        $this->view->dados = $this->docente->pesquisar($id);
        $this->view->renderizar('editarDados');
    }

    public function editarImagem($id = FALSE, $docente = FALSE) {
        if ($this->filtraInt($id)) {
            $diretorio = "upload/";
            move_uploaded_file($_FILES['imagem']["tmp_name"], $diretorio . $_FILES['imagem']["name"]);
            $resize = new ImageResize($diretorio . $_FILES['imagem']["name"]);
            $resize->crop(240, 320);
            unlink($diretorio . $_FILES['imagem']["name"]);
            $resize->save($diretorio . $_FILES['imagem']["name"]);
            $this->pessoa->setImagem($diretorio . $_FILES['imagem']["name"]);
            $this->pessoa->setId($id);
            $p = $this->pessoa->editar($this->pessoa);
            if ($p) {
                $this->redirecionar("docente/informacao/" . $docente);
            }
        }
        $this->redirecionar("docente");
    }

    public function pesquisaPor($acao = FALSE, $curso = FALSE) {
        switch ($acao):

            case 'buscar': $this->view->dados = $this->docente->pesquisaPorCurso($curso);

                $this->view->renderizar('ajax/lista');
                break;
                exit;

            case 'editar': $this->view->dados = $this->docente->pesquisaPorCurso($curso);
                $this->view->renderizar('ajax/editar');
                break;
                exit;

            case 'apagar': $this->view->dados = $this->docente->pesquisaPorCurso($curso);
                $this->view->renderizar('ajax/apagar');
                break;
                exit;
        endswitch;
    }

    public function pesquisar($id = FALSE) {
        
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

    public function informacao($id) {
        $this->view->dados = $this->docente->pesquisaPor($id);
        $this->view->modulo = $this->dm->pesquisarPor($id);
        $this->view->renderizar("informacao");
    }

    public function addCurso($id) {
        if ($this->getInt('enviar')) {

            if (!$this->getSqlverifica('curso')) {
                $this->view->erro = "Porfavor Escolha um curso";
                $this->view->renderizar("addCurso");

                exit;
            }

            if (!$this->getSqlverifica('modulo')) {
                $this->view->erro = "Porfavor Escolha um modulo";
                $this->view->renderizar("addCurso");

                exit;
            }


            $r = $this->dm->adiciona($id, $_POST['modulo']);
            if (is_int($r)) {
                $this->view->mensagem = "Adicionado com sucesso";
                $this->view->renderizar("addCurso");
            } else {
                $this->view->erro = "Erro ao adicionar";
                $this->view->renderizar("addCurso");
            }
        } else {
            $this->view->renderizar('addCurso');
        }
    }

    public function remover($id = FALSE) {
        if ($id) {
            $this->docente->remover($id);
            $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
            $this->log->setAcao("Foi removido um  docente do sistema");
            $this->log->setData(date('d-m-Y h:i:s'));

            $this->log->adicionar($this->log, Session::get('id'));

            $lo = new LogUso('log');
            $lo->verificarArquivo();
            $lo->gravar("Foi removido um  docente do sistema");
            return TRUE;
        }
        $this->view->dados = $this->docente->pesquisar();


        $this->view->renderizar("remover");
    }

}
