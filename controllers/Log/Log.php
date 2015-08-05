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
 * Description of Modulo
 *
 * @author sam
 */
class Log extends Controller {

    //put your code here


    private $log;

    public function __construct() {
        Session::nivelRestrito(array("administrador"));
        $this->log = $this->LoadModelo('Log');
        parent::__construct();
        $this->view->setJs(array("novo"));
        $this->view->setCss(array('amaran.min', 'animate.min', 'layout', 'ie'));
        $this->view->menu = $this->getFooter('menu');
    }

    public function index() {
        $this->view->dados = $this->log->pesquisar();
        $this->view->renderizar('index');
    }

    public function remover($id = FALSE) {
        if ($this->filtraInt($id)) {
            if ($this->log->remover($id)) {

                return TRUE;
            }
        }
        $this->view->dados = $this->log->pesquisar();
        $this->view->renderizar("remover");
    }

}
