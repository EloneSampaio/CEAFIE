<?php

namespace controllers;

use application\Controller;
use application\Hash;
use application\Session;

/**
 * Description of loginController
 *
 * @author sam
 */
class Login extends Controller {

    //put your code here

    private $log;
     private $logsys;

    public function __construct() {
        $this->log = $this->LoadModelo('Usuario');
        $this->logsys = $this->LoadModelo('Log');
        parent::__construct();
        
    }

    public function index() {

        if (Session::get('id')) {
            $this->redirecionar("dashboard");
        } else {

            $this->view->setJs(array("novo"));
            $this->view->setCss(array("style"));
            $this->view->titulo = "Iniciar Sessão";


            if ($this->getInt('enviar') == 1) {
                $this->dados = $_POST;
                if (!$this->getSqlverifica('login')) {
                    $this->view->erro = "POrfavor Introduza um nome Valido";
                    $this->view->renderizar("index");
                    exit;
                }
                if (!$this->getSqlverifica('senha')) {
                    $this->view->erro = "POrfavor Introduza uma senha Valida";
                    $this->view->renderizar("index");
                    exit;
                }

                $this->log->setLogin($this->getSqlverifica('login'));
                $this->log->setSenha(Hash::getHash('md5', $this->alphaNumeric('senha'), HASH_KEY));
                // $this->log->setSenha($this->alphaNumeric('senha'));
                $linha = $this->log->Autenticar($this->log);
                if (!$linha) {
                    $this->view->erro = "Usuario ou Palavra Passe Incorreta";
                    $this->view->renderizar("index");
                    exit;
                }


                Session::set("autenticado", true);
                Session::set('nivel', $linha->getNivel());
                 Session::set('tema', $linha->getTema());
                Session::set('nome', $linha->getPessoa()->getNome());
                 Session::set('pessoa', $linha->getPessoa()->getId());
                Session::set('id', $linha->getId());
                Session::set('time', time());
                

                if (Session::get('nivel') == "gestor") {
                $this->logsys->setIpMaquina($_SERVER['REMOTE_ADDR']);
               $this->logsys->setAcao('Foi feito um login  ');
                $this->logsys->setData(date('d-m-Y'));

                $this->logsys->adicionar($this->logsys, Session::get('id'));
                    $this->redirecionar('dashboard');
                }

                if (Session::get('nivel') == "aluno") {
                    $this->redirecionar("dashboard/aluno/");
                }

                if (Session::get('nivel') == "docente") {
                	  $this->logsys->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->logsys->setAcao('Foi feito um login  ');
                $this->logsys->setData(date('d-m-Y h:i:s'));

                $this->logsys->adicionar($this->logsys, Session::get('id'));
                    $this->redirecionar("dashboard/docente/");
                }
                if (Session::get('nivel') == "administrador") {
                	  $this->logsys->setIpMaquina($_SERVER['REMOTE_ADDR']);
                $this->logsys->setAcao('Foi feito um login');
                $this->logsys->setData(date('d-m-Y h:i:s'));

                $this->logsys->adicionar($this->logsys, Session::get('id'));
                    $this->redirecionar("dashboard/admin/");
                }
                
                else {
                    $this->redirecionar('index');
                }
            }
        }


        $this->view->renderizar("index");
    }

    public function logof() {
        Session::destruir(array('autenticado', 'nivel', 'nome', 'id', 'time','pessoa'));
        $this->redirecionar("login");
    }

}
