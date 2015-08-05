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

class MatriculaOnline extends Controller {

//put your code here
    private $pessoa;
    private $aluno;
    private $matricula;
    private $curso;
    private $usuario;

    public function __construct() {
         parent::__construct();

        $this->pessoa = $this->LoadModelo('Pessoa');
        $this->aluno = $this->LoadModelo('Aluno');
        $this->curso = $this->LoadModelo('Curso');
        $this->matricula = $this->LoadModelo("Matricula");
        $this->nota = $this->LoadModelo("Nota");
        $this->view->menuVertical = $this->getFooter('menuVertical');
        $this->usuario = $this->LoadModelo("Usuario");
        $this->mm = $this->LoadModelo('MatriculaModulo');
        $this->generico = $this->LoadModelo('Generico');
        $this->log = $this->LoadModelo('Log');
        $this->view->titulo = "Tabela de Alunos Matriculados";

        $this->view->setCss(array('animate', 'layout', 'ie', 'multiple-select', 'bootstrap-dialog.min'));
        $this->view->setJs(array('novo', 'ajax', 'validacao', 'crud', 'jquery.multiple.select', 'run_prettify', 'bootstrap-dialog.min', 'jquery.noty.packaged.min'));

        $this->view->menu = $this->getFooter('menu');
    }

    /*
     * @funcão index
     */

    public function index($dados = FALSE) {

        $this->view->titulo = "Formulario de Cadastro";
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

            if (!$this->getSqlverifica('graduacao')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira uma graduacao");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira uma graduacao";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('universidade')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira uma universidade");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira uma universidade";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('unidade_organica')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira uma unidade organica");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira uma unidade organica";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('categoria_docente')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira uma categoria para o docente");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira uma categoria para o docente";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('funcao')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Insira uma função");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Insira uma função";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('categoria_centifica')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Escolha uma categoria centifica");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Escolha uma categoria centifica";
                //$this->view->renderizar("novo");

                exit;
            }
            if (!$this->getSqlverifica('data')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Escolha uma categoria centifica");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Escolha uma data";
                //$this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('curso')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Escolha um curso");
                echo json_encode($ret);
                //$this->view->erro = "Porfavor Escolha um curso";
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
            //Aluno//
            $this->aluno->setGraduacao($this->view->dados['graduacao']);
            $this->aluno->setUniversidade($this->view->dados['universidade']);
            $this->aluno->setUnidadeOrganica($this->view->dados['unidade_organica']);
            $this->aluno->setCategoriaDocente($this->view->dados['categoria_docente']);
            $this->aluno->setFuncao($this->view->dados['funcao']);
            $this->aluno->setCategoriaCientifica($this->view->dados['categoria_centifica']);

            $this->matricula->setEstado("ABERTO");
            $this->matricula->setData($_POST['data']);


            $this->usuario->setLogin($this->view->dados['bi']);
            $this->usuario->setSenha(\application\Hash::getHash("md5", $_POST['bi'], HASH_KEY));
            $this->usuario->setNivel("aluno");


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



            $id = $this->matricula->adiciona($this->pessoa, $this->aluno, $this->matricula, $this->usuario, $_POST['modulo']);


            if (!is_int($id)) {
                $ret = Array("tipo" => 'error', "mensagem" => "Erro ao cadastrar ");
                echo json_encode($ret);

                //$this->view->erro = "Erro ao criar usuario";
                //$this->view->renderizar("novo");
                exit;
            } else {
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Foi criado um novo aluno com o nome de : ' . $nome);
                $this->log->setData(date('d-m-Y h:i:s'));


                $this->log->adicionar($this->log, Session::get('id'));

                $ret = Array("tipo" => 'success', "mensagem" => "Dados guardados com sucesso", 'cod' => 1);
                echo json_encode($ret);
                 exit;
            }
        }



        $this->view->renderizar("novo");
    }

}
