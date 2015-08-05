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
use DateTimeZone;
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
    private $log;

    public function __construct() {
        Session::nivelRestrito(array("gestor"));
        $this->programa = $this->LoadModelo('Programa');
        $this->docente = $this->LoadModelo('Docente');
        $this->log = $this->LoadModelo('Log');
        parent::__construct();
        $this->view->setJS(array('novo', 'validacao', 'crud', 'jquery.noty.packaged.min'));
        $this->view->setCss(array('amaran.min', 'animate', 'layout', 'ie'));
        $this->view->menu = $this->getFooter('menu');
    }

    public function index() {
        $this->view->dados = $this->programa->pesquisar();
        $this->view->renderizar("index");
    }

    public function adicionar($dados = FALSE) {

        if ($this->getInt('enviar')) {

            $this->view->dados = $_POST;
            if (!$this->getSqlverifica('curso')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor escolha um curso");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('modulo')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor escolha um módulo");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('docente')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor escolha um docente");
                echo json_encode($ret);
                exit;
            }


            if (!$this->getSqlverifica('local')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor escolha um local");
                echo json_encode($ret);

                exit;
            }


            if (!$this->getSqlverifica('termino')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor escolha uma data de termino");
                echo json_encode($ret);
                exit;
            }

            if (!$this->getSqlverifica('inicio')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor escolha um data de inicio");
                echo json_encode($ret);
                exit;
            }


            if (!$this->getSqlverifica('hora')) {
                $ret = Array("tipo" => 'error', "mensagem" => "Porfavor escolha uma hora");
                echo json_encode($ret);
                exit;
            }


//            $format = 'd-m-Y';
//            $timeZone = new DateTimeZone('UTC');
//            $inicio = DateTime::createFromFormat($format, $dados['inicio'],$timeZone);
//            $fim = DateTime::createFromFormat($format, $dados['termino'],$timeZone);
//
//            if ($fim->format($format) < $inicio->format($format)) {
//                //$ret = Array("mensagem" => "Verifica as Datas");
//                //echo json_encode($ret);
//                $this->view->erro = "Verifica as Datas";
//                $this->view->renderizar("novo");
//
//                exit;
//            }
//            if ($this->compararDatas($this->view->dados['inicio'], $this->view->dados['termino'])) {
//                $ret = Array("tipo" => 'error', "mensagem" => "Verifica as Datas");
//                echo json_encode($ret);
//                // 
//                /// $this->view->erro = "Verifica as Datas";
//                //$this->view->renderizar("novo");
//                exit;
//            }

            $this->programa->setHoras($this->view->dados['hora']);
            $this->programa->setData($this->view->dados['inicio']);
            $this->programa->setLocal($this->view->dados['local']);
            $this->programa->setDatafinal($this->view->dados['termino']);

            if ($this->programa->adiciona($this->programa, $this->view->dados)) {


                //$this->view->mensagem = "Dados guardados com sucesso";
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Criado um novo programa ');
                $this->log->setData(date('d-m-Y h:i:s'));
                $this->log->adicionar($this->log, Session::get('id'));

                $ret = Array("tipo" => 'success', "mensagem" => "Dados guardados com sucesso", 'cod' => 1);
                echo json_encode($ret);
                exit;
            } else {
                $ret = Array("tipo" => 'error', "mensagem" => "Erro ao criar programa");
                echo json_encode($ret);
                exit;
            }
        }


        $this->view->renderizar("novo");
    }

    public function editarDados($id) {

        if ($this->getInt('enviar')) {

            $dados = $_POST;


            if (!$this->getSqlverifica('local')) {
                //$ret = Array("mensagem" => "Porfavor Escolha um local");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Escolha um local";
                $this->view->renderizar("novo");

                exit;
            }


            if (!$this->getSqlverifica('termino')) {
                //$ret = Array("mensagem" => "Porfavor Escolha uma data de termino");
                //echo json_encode($ret);

                $this->view->erro = "Porfavor Escolha uma data de termino";
                $this->view->renderizar("novo");
                exit;
            }

            if (!$this->getSqlverifica('inicio')) {
                //$ret = Array("mensagem" => "Porfavor Escolha uma data de inicio");
                //echo json_encode($ret);
                $this->view->erro = "Porfavor Escolha uma data de inicio";
                $this->view->renderizar("novo");
                exit;
            }


            if (!$this->getSqlverifica('hora')) {
                //$ret = Array("mensagem" => "Porfavor Escolha uma hora");
                //echo json_encode($ret);

                $this->view->erro = "Porfavor Escolha uma hora";
                $this->view->renderizar("novo");
                exit;
            }

            $this->programa->setHoras($dados['hora']);
            $this->programa->setData($dados['inicio']);
            $this->programa->setLocal($dados['local']);
            $this->programa->setDatafinal($dados['termino']);

            if ($this->programa->editar1($this->programa, $dados)) {
                //    $ret = Array("nome" => Session::get('nome'), "mensagem" => "Dados guardados com sucesso");
                //   echo json_encode($ret);
                $this->view->mensagem = "Dados guardados com sucesso";
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Alterado um  programa ');
                $this->log->setData(date('d-m-Y h:i:s'));

                $this->log->adicionar($this->log, Session::get('id'));
                $this->view->renderizar("novo");

                exit;
            } else {
                //$ret = Array("nome" => Session::get('nome'), "mensagem" => "Erro ao guardar dados ");
                //echo json_encode($ret);
                $this->view->erro = "Erro ao guardar dados";
                $this->view->renderizar("novo");

                exit;
            }
        }


        $this->view->dados = $this->programa->pesquisar($id);
        $this->view->renderizar('editarDados');
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
                $this->log->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->log->setAcao('Apagado um  programa ');
                $this->log->setData(date('d-m-Y h:i:s'));

                $this->log->adicionar($this->log, Session::get('id'));
                return TRUE;
            }
        }
        $this->view->dados = $this->programa->pesquisar();
        $this->view->renderizar("remover");
    }

    public function gerar($id) {

        $d = $this->programa->pesquisar($id);
        $css = "views/layout/default/bootstrap/css/bootstrap.min.css";
        $report = new \application\Recibo($css, 'sam');
        $report->BuildPDFPrograma($d);
        $report->Exibir();
    }

}
