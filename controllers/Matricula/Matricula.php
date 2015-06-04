<?php

namespace controllers;

use application\Controller;
use application\Dao;
use application\Session;
use \Eventviva\ImageResize;
use application\Sms;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Matricula
 *
 * @author sam
 */
class Matricula extends Controller implements Dao {

    private $pessoa;
    private $aluno;
    private $matricula;
    private $curso;
    private $nota;
    private $usuario;
    private $mm;

    public function __construct() {
        parent::__construct();
        Session::nivelRestrito(array("administrador"));
        $this->pessoa = $this->LoadModelo('Pessoa');
        $this->aluno = $this->LoadModelo('Aluno');
        $this->curso = $this->LoadModelo('Curso');
        $this->matricula = $this->LoadModelo("Matricula");
        $this->nota = $this->LoadModelo("Nota");
        $this->usuario = $this->LoadModelo("Usuario");
        $this->mm = $this->LoadModelo('MatriculaModulo');

        $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie', 'multiple-select'));
        $this->view->setJs(array("novo", 'jquery.multiple.select'));

        $this->view->menu = $this->getFooter('menu');
    }

    public function index() {
        $this->view->titulo = "Lista de Alunos Matriculados";
        $this->view->dados = $this->matricula->pesquisar();

        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {

        $this->view->titulo = "Formulario de Cadastro";
        if ($this->getInt('enviar') == 1) {
            $this->view->dados = $_POST;


            if (!$this->getSqlverifica('nome')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nome");
                $this->view->erro = "Porfavor Insira um nome";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('nome1')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um apelido");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um apelido";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('genero')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Escolha um genero");
                // echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um genero";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('bi')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira o numero do BI");
                // echo json_encode($ret);
                $this->view->erro = "Porfavor Insira o numero do BI";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->verificarBi($this->view->dados['bi'])) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira  numero de BI valido...");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira numero de BI valido";
                $this->view->renderizar("novo");
                exit;
            }


            if (!$this->getSqlverifica('nacionalidade')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um nacionalidade");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira uma nacionalidade";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('telefone')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um numero de telefone");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira  um numero de telefone";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('email')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um email");
                // echo json_encode($ret);
                $this->view->erro = "Porfavor Insira um email";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('graduacao')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma graduacao");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira uma graduacao";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('universidade')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma universidade");
                // echo json_encode($ret);
                $this->view->erro = "Porfavor Insira uma universidade";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('unidade_organica')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma unidade organica");
                // echo json_encode($ret);
                $this->view->erro = "Porfavor Insira uma unidade organica";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('categoria_docente')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma categoria para o docente");
                // echo json_encode($ret);
                $this->view->erro = "Porfavor Insira uma categoria para o docente";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('funcao')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma função");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Insira uma função";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('categoria_centifica')) {
                // $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Escolha uma categoria centifica");
                // echo json_encode($ret);
                $this->view->erro = "Porfavor Escolha uma categoria centifica";
                $this->view->renderizar("novo");

                exit;
            }

            if (!$this->getSqlverifica('curso')) {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Escolha um curso");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Escolha um curso";
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
            $this->aluno->setGraduacao($this->view->dados['graduacao']);
            $this->aluno->setUniversidade($this->view->dados['universidade']);
            $this->aluno->setUnidadeOrganica($this->view->dados['unidade_organica']);
            $this->aluno->setCategoriaDocente($this->view->dados['categoria_docente']);
            $this->aluno->setFuncao($this->view->dados['funcao']);
            $this->aluno->setCategoriaCientifica($this->view->dados['categoria_centifica']);

            $this->matricula->setEstado("ABERTO");
            $this->matricula->setData($_POST['data']);

            $login = $this->view->dados['nome1'] . rand(5, 10);
            $this->usuario->setLogin($login);
            $this->usuario->setSenha(\application\Hash::getHash("md5", $dados['nome1'] . $login, HASH_KEY));
            $this->usuario->setNivel("aluno");


//verificr dados//
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



            $id = $this->matricula->adiciona($this->pessoa, $this->aluno, $this->matricula, $this->usuario, $_POST['modulo']);
            if (!is_int($id)) {
                $this->view->erro = "Erro ao criar usuario";
                $this->view->renderizar("novo");
                exit;
            } else {

                $this->view->mensagem = "Dados guardados com sucesso";
            }
        }



        $this->view->renderizar("novo");
    }

    public function editar($id = FALSE) {
        if ($this->filtraInt($id)) {
            $this->matricula->setEstado("FECHADO");
            $this->matricula->setId($id);
            $this->matricula->editar($this->matricula);
        }

        //Enviar mensagem confirmando a matricula
        $mensagem = "Matricula Confirmada. CEAFIE";
        $telefone = 934895543;
        // Sms::enviarSMS("127.0.0.1", 8800, "", "", $telefone, $mensagem);
        $this->view->dados = $this->matricula->pesquisar();
        $this->view->renderizar("editar");
    }

    public function editarDados($id = FALSE) {
        $this->view->dados = $this->matricula->pesquisar($id);
        $this->view->renderizar('editarDados');
    }

    public function pesquisaPor($ano=FALSE, $modulo=FALSE) {
        $this->view->dados = $this->matricula->pesquisaPorData($ano, $modulo);
        $this->view->renderizar('ajax');
    }

    public function pesquisar($id=FALSE) {
        $this->view->dados = $this->matricula->pesquisaPorData();
        $this->view->renderizar('ajax');
    }

    public function remover($id = FALSE) {
        if ($this->filtraInt($id)) {
            if ($this->matricula->remover($id)) {
                return TRUE;
            }
        }
        $this->view->dados = $this->matricula->pesquisar();
        $this->view->renderizar("remover");
    }

    public function editarImagem($id) {
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
                $this->redirecionar("matricula/informacao/" . $_POST['id']);
            }
        }
        $this->redirecionar("dashboard");
    }

    public function imprimir($id, $data) {

        $d = $this->mm->pesquisar(array("id" => $id, 'data' => $data));

        $css = "views/layout/default/bootstrap/css/bootstrap.min.css";
        $report = new \application\Recibo($css, 'sam');
        $report->setBi($d->getMatricula()->getAluno()->getPessoa()->getBi());
        $report->setNome($d->getMatricula()->getAluno()->getPessoa()->getNome());
        $report->setData($d->getData());
        $report->setCurso($d->getModulo()->getCurso()->getNome());
        $report->setModulo($d->getModulo()->getNome());
        $report->BuildPDF();
        $report->Exibir();
    }

    public function informacao($id) {
        $this->view->dados = $this->matricula->pesquisar($id);
        if ($this->view->dados) {
            $this->view->nota = $this->nota->pesquisaNota($this->view->dados->getAluno()->getId());
            //\Doctrine\Common\Util\Debug::dump($this->view->nota ); exit;
            $this->view->renderizar("informacao");
        } else {
            $this->view->renderizar("informacao");
        }
    }

}
