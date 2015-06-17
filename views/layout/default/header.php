<?php

use application\Session; ?>
<html lang="pt">

    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title><?php if (isset($this->titulo)) print $this->titulo; ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!--[if lt IE 9]>
        <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->	

        <script>window.jQuery || document.write("<script src='assets/js/jquery-1.8.3.min.js'>\x3C/script>")</script>

        <script type="text/javascript" src="<?php print $_layoutParam["caminho_vendores"] ?>jquery-1.9.1.min.js"></script> 


        <link rel="stylesheet" href="<?php print $_layoutParam["caminho_css"] ?>bootstrap-responsive.min.css" media="screen"/>
        <link rel="stylesheet" href="<?php print $_layoutParam["caminho_css"] ?>bootstrap.min.css" media="screen"/> 
        <link rel="stylesheet" href="<?php print $_layoutParam["caminho_assets"] ?>styles.css" media="screen"/>
        <script type="text/javascript" src="<?php print $_layoutParam["caminho_vendores"] ?>datatables/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="<?php print $_layoutParam["caminho_vendores"] ?>datatables/media/ZeroClipboard/ZeroClipboard.js"></script>
        <script type="text/javascript" src="<?php print $_layoutParam["caminho_vendores"] ?>datatables/media/js/TableTools.js"></script>
        <script type="text/javascript" src="<?php print $_layoutParam["caminho_vendores"] ?>datatables/js/dataTables.bootstrap.js"></script>


        <script type="text/javascript" src="<?php print $_layoutParam["caminho_vendores"] ?>modernizr-2.6.2-respond-1.1.0.min.js"></script>


        <script type="text/javascript" src="<?php print $_layoutParam["caminho_js"] ?>bootstrap.min.js"></script>
        <script type="text/javascript" src="<?php print $_layoutParam["caminho_js"] ?>bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="<?php print URL; ?>public/js/jquery.leanModal.min.js"></script>
        <script type="text/javascript" src="<?php print $_layoutParam["caminho_assets"] ?>scripts.js"></script>

        <?php if (isset($_layoutParam['css']) && count($_layoutParam['css'])): ?>
            <?php for ($i = 0; $i < count($_layoutParam['css']); $i++): ?>
                <link rel="stylesheet" href="<?php print $_layoutParam['css'][$i] ?>" />       
            <?php endfor; ?>
        <?php endif; ?>

        <?php if (isset($_layoutParam['js']) && count($_layoutParam['js'])): ?>
            <?php for ($i = 0; $i < count($_layoutParam['js']); $i++): ?>
                <script type="text/javascript" src="<?php print $_layoutParam['js'][$i] ?>"></script>       
            <?php endfor; ?>
        <?php endif; ?>
        <style>
            .datepicker{z-index:1151 !important;}
        </style>

    </head>

    <body>



        <noscript>Para usar todas funcionalidades ativa o javascript no seu navegador</noscript> 


        <div>
            <?php if (isset($this->erro)): ?>
                <h4 class="text-center alert-danger">  <?php print $this->erro; ?> </h4>

            <?php endif; ?>
        </div>
        <div><?php if (isset($this->mensagem)): ?>
                <h3 class="text-center alert-info">  <?php print $this->mensagem; ?> </h3>
            <?php endif; ?>
        </div>

