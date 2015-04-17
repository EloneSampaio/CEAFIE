<?php

namespace controllers;

use application\Controller;
use application\Dao;
use application\Session;
use \Eventviva\ImageResize;

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

    public function __construct() {
        parent::__construct();
        Session::nivelRestrito(array("administrador"));
        $this->pessoa = $this->LoadModelo('Pessoa');
        $this->aluno = $this->LoadModelo('Aluno');
        $this->curso = $this->LoadModelo('Curso');
        $this->matricula = $this->LoadModelo("Matricula");
        $this->nota = $this->LoadModelo("Nota");
        $this->usuario = $this->LoadModelo("Usuario");
        $this->view->setJs(array("novo"));
    }

    public function index() {

        $this->view->dados = $this->matricula->pesquisar();
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

            if (!$this->getSqlverifica('nome1')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira um apelido");
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

            if (!$this->verificarBi($this->view->dados['bi'])) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira  numero de BI valido...");
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

            if (!$this->getSqlverifica('graduacao')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma graduacao");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('universidade')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma universidade");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('unidade_organica')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma unidade organica");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('categoria_docente')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma categoria para o docente");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('funcao')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Insira uma função");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('categoria_centifica')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Escolha uma categoria centifica");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('curso')) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Porfavor Escolha um curso");
                echo json_encode($ret);
                exit;
            }


            $this->pessoa->setNome($this->view->dados['nome'] . " " . $this->view->dados['nome1']);
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
            $this->matricula->setData(date('Y-m-d'));

            $id = $this->pessoa->adicionar($this->pessoa);
            if (!is_int($id)) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                echo json_encode($ret);
                exit;
            }
            $id1 = $this->aluno->adiciona($this->aluno, $id);
            if (!is_int($id1)) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                echo json_encode($ret);
                exit;
            }


            $id2 = $this->matricula->adiciona($this->matricula, $id1, $this->view->dados['curso'], $this->view->dados['modulo']);
            if (!is_int($id2)) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados");
                echo json_encode($ret);
                exit;
            }
            $mt = $this->aluno->pesquisar($id1);

            $login = $this->view->dados['nome1'] . rand(5, 10);
            $this->usuario->setLogin($login);
            $this->usuario->setSenha(\application\Hash::getHash("md5", $dados['nome1'] . $login, HASH_KEY));
            $this->usuario->setNivel("aluno");
            $id12 = $this->usuario->adiciona($this->usuario, $mt->getPessoa()->getId());
            if (!is_int($id12)) {
                $ret = Array("mensagem" => "Erro ao criar usuario");
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
            $this->matricula->setEstado("FECHADO");
            $this->matricula->setId($id);
            $this->matricula->editar($this->matricula);
        }
        $this->view->dados = $this->matricula->pesquisar();
        $this->view->renderizar("editar");
    }

    public function editarDados($id = FALSE) {
        $this->view->dados = $this->matricula->pesquisar($id);
        $this->view->renderizar('editarDados');
    }

    public function pesquisaPor($dados = FALSE) {
        
    }

    public function pesquisar($id = FALSE) {
        
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

    public function imprimir($id = FALSE) {

        $d = $this->matricula->pesquisar($id);
        $css = "views/layout/default/bootstrap/css/bootstrap.min.css";
        $report = new \application\Recibo($css, 'sam');
        $report->setBi($d->getAluno()->getPessoa()->getBi());
        $report->setNome($d->getAluno()->getPessoa()->getNome());
        $report->setData($d->getData());
        $report->setCurso($d->getCurso()->getNome());
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
