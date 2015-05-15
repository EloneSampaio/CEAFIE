<?php

use application\Session; ?>
<header id="header">
    <hgroup>
        <h1 class="site_title"><a href="index.html">
                <?php if (Session::get('nivel') == "administrador"):  $menu="dashboard"; ?>
                    <a class="brand" href="#">Painel de Administração</a>
                   
                <?php endif; ?>

                <?php if (Session::get('nivel') == "docente"):  $menu="dashboard/docente/"; ?>
                    <a class="brand" href="#">Painel de Docente</a>
                    
                <?php endif; ?>

                <?php if (Session::get('nivel') == "aluno"):  $menu="dashboard/aluno/";?>
                    <a class="brand" href="#">Painel de Aluno</a>
                    
                <?php endif; ?>

            </a>
        </h1>
        <h2 class="section_title"><?php if(isset($this->titulo)): echo $this->titulo; endif;?></h2>
    </hgroup>
</header> <!-- end of header bar -->

<section id="secondary_bar">
    <div class="user">
        <p><?php print Session::get('nome'); ?> (<a href="<?php print URL ?>login/logof">Sair</a>)</p>
        <!-- <a class="logout_user" href="#" title="Logout">Logout</a> -->
    </div>
    <div class="breadcrumbs_container">
        <article class="breadcrumbs"><a href="<?php print URL.$menu ?>">Menu Principal</a> <div class="breadcrumb_divider"></div> <a class="current">Dashboard</a></article>
    </div>
</section><!-- end of secondary bar -->
