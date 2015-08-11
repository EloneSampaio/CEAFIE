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
    private $log;
    private $generico;

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
        $this->view->titulo = "Tabela de formandos Matriculados";

        $this->view->setCss(array('animate', 'layout', 'ie', 'multiple-select', 'bootstrap-dialog.min'));
        $this->view->setJs(array('novo', 'ajax', 'validacao', 'crud', 'jquery.multiple.select', 'run_prettify', 'bootstrap-dialog.min', 'jquery.noty.packaged.min'));

        $this->view->menu = $this->getFooter('menu');
    }

    public function index() {
        Session::nivelRestrito(array("gestor", "funcionario"));
        $this->view->titulo = "Tabela de formandos inscritos";

        $this->view->dados = $this->matricula->pesquisar();

        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {
        Session::nivelRestrito(array("gestor", "funcionario"));


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
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor Escolha uma  data");
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
            $booleano = FALSE;

            if ($this->view->dados['bi'] == '') {
                $this->pessoa->setBi($this->view->dados['passaporte']);
                $booleano = TRUE;
                if ($this->pessoa->pesquisarBi($_POST['passaporte'])) {

                    $ret = Array("tipo" => 'error', "mensagem" => "O numero do passaporte já esta sendo usado escolha um outro");
                    echo json_encode($ret);
                    //$this->view->erro = "O numero de bi já esta sendo usado escolha um outro bi";
                    //$this->view->renderizar("novo");
                    exit;
                }
            } else {
                $this->pessoa->setBi($this->view->dados['bi']);
                $booleano = FALSE;
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


            if ($booleano) {
                $this->usuario->setLogin($this->view->dados['passaporte']);
                $this->usuario->setSenha(\application\Hash::getHash("md5", $_POST['passaporte'], HASH_KEY));
            } else {
                $this->usuario->setLogin($this->view->dados['bi']);
                $this->usuario->setSenha(\application\Hash::getHash("md5", $_POST['bi'], HASH_KEY));
            }
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
                //$this->view->mensagem = "Dados guardados com sucesso";
                //$this->view->dados = array();
                //$this->view->renderizar('novo');
                exit;
            }
        }



        $this->view->renderizar("novo");
    }

    public function editar($id = FALSE) {
        Session::nivelRestrito(array("gestor", "funcionario"));

        if ($this->filtraInt($id)) {
            $this->matricula->setEstado("FECHADO");
            $this->matricula->setId($id);
            $this->matricula->editar($this->matricula);
        }
        $this->view->dados = $this->matricula->pesquisar();
        $this->view->renderizar("editar");
    }

    /** função para edição de registro do aluno* */
    public function editarDados($id = FALSE, $pessoa = FALSE) {
        Session::nivelRestrito(array("gestor", "funcionario"));


        if ($this->getInt('enviar')) {

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




            $nome = $this->view->dados['nome'] . " " . $this->view->dados['apelido'];
            $this->pessoa->setNome($this->view->dados['nome']);
            $this->pessoa->setApelido($this->view->dados['apelido']);
            $this->pessoa->setGenero($this->view->dados['genero']);
            $this->pessoa->setNacionalidade($this->view->dados['nacionalidade']);
            $this->pessoa->setTelefone($this->view->dados['telefone']);
            $this->pessoa->setId($pessoa);
            $this->pessoa->setEmail($this->view->dados['email']);
            if ($this->view->dados['bi'] == '') {
                $this->pessoa->setBi($this->view->dados['passaporte']);
            } else {
                $this->pessoa->setBi($this->view->dados['bi']);
            }
            //Aluno//
            $this->aluno->setGraduacao($this->view->dados['graduacao']);
            $this->aluno->setUniversidade($this->view->dados['universidade']);
            $this->aluno->setUnidadeOrganica($this->view->dados['unidade_organica']);
            $this->aluno->setCategoriaDocente($this->view->dados['categoria_docente']);
            $this->aluno->setFuncao($this->view->dados['funcao']);
            $this->aluno->setCategoriaCientifica($this->view->dados['categoria_centifica']);
            $this->aluno->setId($id);
            //metodos para alteração//

            $r = $this->aluno->edita($this->aluno, $this->pessoa);

            if ($r) {
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao("Foi Editado  informações do aluno");
                $this->log->setData(date('d-m-Y h:i:s'));

                $this->log->adicionar($this->log, Session::get('id'));
                $ret = Array("tipo" => 'success', "mensagem" => "Dados alterado com sucesso", 'cod' => 1);
                echo json_encode($ret);
                //$this->view->mensagem = "Dados guardados com sucesso";
                //$this->view->dados = array();
                //$this->view->renderizar('novo');
                exit;
            } else {
                $ret = Array("tipo" => 'error', "mensagem" => "Erro ao alterar ");
                echo json_encode($ret);

                //$this->view->erro = "Erro ao criar usuario";
                //$this->view->renderizar("novo");
                exit;
            }
        }


        $this->view->dados = $this->matricula->pesquisar($id);
        $this->view->renderizar('editarDados');
    }

    public function pesquisaPor($acao = FALSE) {
        Session::nivelRestrito(array("gestor", "funcionario"));

        if (isset($acao)) {
            $acao1 = $this->getSqlverifica('acao');
            $modulo = $this->getSqlverifica('modulo1');
            $ano = $this->getSqlverifica('ano');

            switch ($acao1):
                case 'buscar': $this->view->dados = $this->matricula->pesquisaPorData($ano, $modulo);

                    $this->view->renderizar('ajax/lista');
                    break;
                    exit;

                case 'editar': $this->view->dados = $this->matricula->pesquisaPorData($ano, $modulo);
                    $this->view->renderizar('ajax/editar');
                    break;
                    exit;

                case 'apagar': $this->view->dados = $this->matricula->pesquisaPorData($ano, $modulo);
                    $this->view->renderizar('ajax/apagar');
                    break;
                    exit;
                default :$this->view->dados = $this->matricula->pesquisaPorData();

                    $this->view->renderizar('ajax/lista');
                    break;
                    exit;
            endswitch;
        }
        else {
            $this->view->dados = $this->matricula->pesquisar();

            $this->view->renderizar("index");
        }
    }

    public function pesquisar($id = FALSE) {
        Session::nivelRestrito(array("gestor", "funcionario"));

        $this->view->dados = $this->matricula->pesquisaPorData();
        $this->view->renderizar('ajax');
    }

    public function remover($id = FALSE) {
        Session::nivelRestrito(array("gestor"));

        if ($this->filtraInt($id)) {
            if ($this->matricula->remover($id)) {
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Removido um aluno ' . $_POST['nome']);
                $this->log->setData(date('d-m-Y h:i:s'));

                $this->log->adicionar($this->log, Session::get('id'));
                return TRUE;
            }
        }
        $this->view->dados = $this->matricula->pesquisar();
        $this->view->renderizar("remover");
    }

    public function editarImagem($id) {
        Session::nivelRestrito(array("gestor", "funcionario", "docente"));

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
        Session::nivelRestrito(array("gestor", "funcionario"));

        $d = $this->mm->pesquisarImprimi($id, $data);

        $css = "views/layout/default/bootstrap/css/bootstrap.min.css";
        $report = new \application\Recibo($css, 'sam');
        $report->setBi($d->getMatricula()->getAluno()->getPessoa()->getBi());
        $report->setNome($d->getMatricula()->getAluno()->getPessoa()->getNome());
        $report->setApelido($d->getMatricula()->getAluno()->getPessoa()->getApelido());
        $report->setData($d->getData());
        $report->setCurso($d->getModulo()->getCurso()->getNome());
        $report->setModulo($d->getModulo()->getNome());
        $report->BuildPDF();
        $report->Exibir();
    }

    public function informacao($id) {
        $this->view->dados = $this->matricula->pesquisar($id);
        if ($this->view->dados) {
            $this->view->modulo = $this->mm->pesquisarPor($this->view->dados->getId());
            $this->view->renderizar("informacao");
        } else {
            $this->view->renderizar("informacao");
        }
    }

    public function detalhes() {
        Session::nivelRestrito(array("gestor", "funcionario"));

        $de = $this->matricula->buscaMatriculaMod($this->filtraInt($_GET['id']));
        echo json_encode($de);
        exit;
    }

    public function addCurso($id) {

        if ($this->getInt('enviar')) {

            if (!$this->getSqlverifica('curso')) {
                $this->view->erro = "Porfavor Escolha um curso";
                $this->view->renderizar("ajax/addCurso");

                exit;
            }

            if (!$this->getSqlverifica('modulo')) {
                $this->view->erro = "Porfavor Escolha um modulo";
                $this->view->renderizar("ajax/addCurso");

                exit;
            }

            if (!$this->getSqlverifica('data')) {
                $this->view->erro = "Porfavor Escolha uma data";
                $this->view->renderizar("ajax/addCurso");

                exit;
            }

            $matricula = $this->matricula->pesquisar($id);
            $r = $this->mm->adiciona($matricula->getId(), $_POST);

            if ($r) {
                $this->view->mensagem = "Adicionado com sucesso";
                $this->informacao($id);
            } else {
                $this->view->erro = "Erro ao adicionar";
                $this->view->renderizar("ajax/addCurso");
            }
        } else {
            $this->view->renderizar('ajax/addCurso');
        }
    }

    public function imprimirFicha($id = FALSE) {
        Session::nivelRestrito(array("gestor", "funcionario"));

        $dados = $this->matricula->pesquisaImpressao($id);
        $css = "views/layout/default/bootstrap/css/bootstrap.min.css";
        $report = new \application\Impressao($css, 'impressao');
        $report->getBody($dados);
        $report->BuildPDF();
        $report->Exibir();
    }

    public function dadosDeAcesso($dados) {
        Session::nivelRestrito(array("gestor", "funcionario"));

        $css = "views/layout/default/bootstrap/css/bootstrap.min.css";
        $report = new \application\DadosDeAcesso($css, 'impressao');
        $report->setNome($dados['nome']);
        $report->setSenha($dados['senha']);
        $report->getBody($dados);
        $report->BuildPDF();
        $report->Exibir();
    }

    public function verificarTel() {
        $r = $this->pessoa->pesquisarTelefone($_POST['telefone']);
        if ($r) {
            echo json_encode(1);
        } else {

            echo json_encode(0);
        }
    }

    public function verificarEmail() {
        $r = $this->pessoa->pesquisarEmail($_POST['email']);
        if ($r) {
            echo json_encode(1);
        } else {

            echo json_encode(0);
        }
    }

    public function verificarBi() {
        $r = $this->pessoa->pesquisarBi($_POST['bi']);
        if ($r) {
            echo json_encode(1);
        } else {

            echo json_encode(0);
        }
    }

    public function verificarPas() {
        $r = $this->pessoa->pesquisarBi($_POST['passaporte']);
        if ($r) {
            echo json_encode(1);
        } else {

            echo json_encode(0);
        }
    }

}