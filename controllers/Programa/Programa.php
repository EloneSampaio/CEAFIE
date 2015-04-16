<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace controllers;

use application\Controller;
use application\Dao;
use DateTime;
use application\Session;

/**
 * Description of Programa
 *
 * @author sam
 */
class Programa extends Controller implements Dao {

    //put your code here
    private $programa;
    private $docente;

    public function __construct() {
         Session::nivelRestrito(array("administrador"));
        $this->programa = $this->LoadModelo('Programa');
        $this->docente = $this->LoadModelo('Docente');
        parent::__construct();
        $this->view->setJS(array('novo'));
    }

    public function index() {
        $this->view->dados = $this->programa->pesquisar();
        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {

        if ($this->getInt('enviar')) {

            $dados = $_POST;
            if (!$this->getSqlverifica('curso')) {
                $ret = Array("mensagem" => "Porfavor Escolha um curso");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('modulo')) {
                $ret = Array("Porfavor Escolha um modulo");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('docente')) {
                $ret = Array("mensagem" => "Porfavor Escolha uma docente");
                echo json_encode($ret);
                exit;
            }


            if (!$this->getSqlverifica('local')) {
                $ret = Array("mensagem" => "Porfavor Escolha um local");
                echo json_encode($ret);
                exit;
            }


            if (!$this->getSqlverifica('termino')) {
                $ret = Array("mensagem" => "Porfavor Escolha uma data de termino");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('inicio')) {
                $ret = Array("mensagem" => "Porfavor Escolha uma data de inicio");
                echo json_encode($ret);
                exit;
            }


            if (!$this->getSqlverifica('hora')) {
                $ret = Array("mensagem" => "Porfavor Escolha uma hora");
                echo json_encode($ret);
                exit;
            }
            $format = 'Y-m-d';
            $inicio = DateTime::createFromFormat($format, $dados['inicio']);
            $fim = DateTime::createFromFormat($format, $dados['termino']);

            if ($fim->format($format) < $inicio->format($format)) {
                $ret = Array("mensagem" => "Verifica as Datas");
                echo json_encode($ret);
                exit;
            }
            $this->programa->setHoras($dados['hora']);
            $this->programa->setData($dados['inicio']);
            $this->programa->setLocal($dados['local']);
            $this->programa->setDatafinal($dados['termino']);

            if ($this->programa->adiciona($this->programa, $dados)) {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados guardados com sucesso");
                echo json_encode($ret);
                exit;
            } else {
                $ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados ");
                echo json_encode($ret);
                exit;
            }
        }


        $this->view->renderizar("novo");
    }

    public function editar($id = FALSE) {
        $this->view->dados = $this->programa->pesquisar();
        $this->view->renderizar("editar");
    }

    public function pesquisaPor($dados = FALSE) {
        $t = $this->docente->listagem();
        echo json_encode($t);
    }

    public function pesquisar($id = FALSE) {
        
    }

    public function remover($id = FALSE) {
        if ($this->filtraInt($id)) {
            if ($this->programa->remover($id)) {
                return TRUE;
            }
        }
        $this->view->dados = $this->programa->pesquisar();
        $this->view->renderizar("remover");
    }

}
