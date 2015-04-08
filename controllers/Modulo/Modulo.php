<?php

namespace controllers;

use application\Controller;
use application\Dao;

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
class Modulo extends Controller implements Dao {

    //put your code here


    private $modulo;

    public function __construct() {
        $this->modulo = $this->LoadModelo("Modulo");
        parent::__construct();
    }

    public function index() {
        
    }

    public function adicionar($dados = FALSE) {
        
    }

    public function editar($id = FALSE) {
        
    }

    public function pesquisaPor($dados = FALSE) {
        $t = $this->modulo->pesquisar($_GET['id']);
        echo json_encode($t);
    }

    public function pesquisar($id = FALSE) {
        
    }

    public function remover($id = FALSE) {
        
    }

}
