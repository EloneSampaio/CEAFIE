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

/**
 * Description of Materia
 *
 * @author sam
 */
class Materia extends Controller implements Dao {

    //put your code here


    private $materia;
    private $docente;

    public function __construct() {
        Session::nivelRestrito(array("docente", "aluno"));
        $this->materia = $this->LoadModelo('Materia');
        $this->docente = $this->LoadModelo('Docente');
        parent::__construct();
        $this->view->setJS(array('novo'));
    }

    public function index() {
        $this->view->dados = $this->materia->pesquisar();
        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {
        if ($this->getInt('enviar')) {

            $dados = $_POST;
            if (!$this->getSqlverifica('curso')) {
                $this->view->erro = "Porfavor Selecciona um curso";
                $this->view->renderizar('novo');
                exit;
            }

            if (!$this->getSqlverifica('modulo')) {
                $this->view->erro = "Porfavor Selecciona um modulo";
                $this->view->renderizar('novo');
                exit;
            }

            if (!$this->getSqlverifica('docente')) {
                $this->view->erro = "Porfavor Selecciona um docente";
                $this->view->renderizar('adicionar');
                exit;
            }


            if (!$this->getSqlverifica('data')) {
                $this->view->erro = "Porfavor Selecciona uma data";
                $this->view->renderizar('novo');
                exit;
            }

            if (!isset($_FILES['arquivo']["name"]) && empty($_FILES['arquivo']["name"])) {
                $this->view->erro = "Porfavor Selecciona um arquivo";
                $this->view->renderizar('novo');
                exit;
            }

            $diretorio = "upload/";
            move_uploaded_file($_FILES['arquivo']["tmp_name"], $diretorio . $_FILES['arquivo']["name"]);


            $this->materia->setNome($diretorio . $_FILES['arquivo']["name"]);
            $this->materia->setData($dados['data']);

            if ($this->materia->adiciona($this->materia, $dados)) {
                $this->view->mensagem = "Dados guardado com sucesso";
                $this->view->renderizar('novo');
                exit;
            } else {
                $this->view->erro = "Erro ao guardar dados";
                $this->view->renderizar('novo');
                exit;
            }
        }

        $this->view->renderizar("novo");
    }

    public function editar($id = FALSE) {
        
    }

    public function pesquisaPor($dados = FALSE) {
        
    }

    public function pesquisar($id = FALSE) {
        
    }

    public function remover($id = FALSE) {
        
    }

    public function adicionar1($dados = FALSE) {
        if ($this->getInt('enviar')) {
            Session::get('pessoa');
            $id = $this->docente->pesquisar(Session::get('pessoa'));
            $_POST['docente'] = $id->getId();
            $dados = $_POST;
            if (!$this->getSqlverifica('curso')) {
                $this->view->erro = "Porfavor Selecciona um curso";
                $this->view->renderizar('novo1');
                exit;
            }

            if (!$this->getSqlverifica('modulo')) {
                $this->view->erro = "Porfavor Selecciona um modulo";
                $this->view->renderizar('novo1');
                exit;
            }


            if (!$this->getSqlverifica('data')) {
                $this->view->erro = "Porfavor Selecciona uma data";
                $this->view->renderizar('novo1');
                exit;
            }

            if (!isset($_FILES['arquivo']["name"]) && empty($_FILES['arquivo']["name"])) {
                $this->view->erro = "Porfavor Selecciona um arquivo";
                $this->view->renderizar('novo1');
                exit;
            }

            $diretorio = "upload/";
            move_uploaded_file($_FILES['arquivo']["tmp_name"], $diretorio . $_FILES['arquivo']["name"]);


            $this->materia->setNome($diretorio . $_FILES['arquivo']["name"]);
            $this->materia->setData($dados['data']);

            if ($this->materia->adiciona($this->materia, $dados)) {
                $this->view->mensagem = "Dados guardado com sucesso";
                $this->view->renderizar('novo1');
                exit;
            } else {
                $this->view->erro = "Erro ao guardar dados";
                $this->view->renderizar('novo1');
                exit;
            }
        }

        $this->view->renderizar("novo1");
    }

}
