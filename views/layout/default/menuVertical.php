<?php use application\Session;?>
<!--margin-top: 0px; margin-left: 0px; padding-top: 0px;-->
<br /><br /><br />
<aside id="sidebar" class="column" style="position: absolute; top: 40px;">
    <hr/>
    <h3>Formando</h3>
    <ul class="toggle">
        <li class="icn_categories"><a  href="<?php echo URL . "matricula" . DS1 . "index/" ?>"  >Ver</a></li>
        <li class="icn_new_article"><a  href="<?php echo URL . "matricula" . DS1 . "adicionar/" ?>" >Novo</a></li>
        <li class="icn_edit_article"><a href="<?php echo URL . "matricula" . DS1 . "editar/" ?>" >Editar</a></li>
        <?php if(strcmp(Session::get('nivel'), 'gestor')==0):?>
        <li class="icn_jump_back"><a   href="<?php echo URL . "matricula" . DS1 . "remover/" ?>" >Apagar</a></li>
        <?php endif;?>
    </ul>
    <h3>Formador</h3>
    <ul class="toggle">
        <li class="icn_categories"><a   href="<?php echo URL . "docente" . DS1 . "index/" ?>" >Ver</a></li>
        <li class="icn_new_article"><a href="<?php echo URL . "docente" . DS1 . "adicionar/" ?>" >Novo</a></li>
        <li class="icn_edit_article"><a href="<?php echo URL . "docente" . DS1 . "editar/" ?>" >Editar</a></li>
        <?php if(strcmp(Session::get('nivel'), 'gestor')==0):?>
        <li class="icn_jump_back"><a href="<?php echo URL . "docente" . DS1 . "remover/" ?>" >Apagar</a></li>
         <?php endif;?>
    </ul>
    
    <h3>Nota</h3>
    <ul class="toggle">
        <li class="icn_categories"><a   href="<?php echo URL . "nota" . DS1 . "listar/" ?>">Ver Notas</a></li>

        <li class="icn_categories"><a   href="<?php echo URL . "nota" . DS1 . "index/" ?>" >Lançar Nota</a></li>
        <li class="icn_edit_article"><a href="<?php echo URL . "nota" . DS1 . "editar/" ?>" >Editar</a></li>
        <?php if(strcmp(Session::get('nivel'), 'gestor')==0):?>
        <li class="icn_jump_back"><a href="<?php echo URL . "nota" . DS1 . "remover/" ?>">Apagar</a></li>
        <?php endif;?>
    </ul>

    <h3>Programa</h3>
    <ul class="toggle">
        <li class="icn_categories"><a   href="<?php echo URL . "programa" . DS1 . "index/" ?>" >Ver</a></li>
        <li class="icn_new_article"><a href="<?php echo URL . "programa" . DS1 . "adicionar/" ?>" >Novo</a></li>
        <li class="icn_edit_article"><a href="<?php echo URL . "programa" . DS1 . "editar/" ?>" >Editar</a></li>
         <?php if(strcmp(Session::get('nivel'), 'gestor')==0):?>
        <li class="icn_jump_back"><a href="<?php echo URL . "programa" . DS1 . "remover/" ?>" >Apagar</a></li>
        <?php endif;?>
    </ul>

</ul>

<h3>Relatorio</h3>
<ul class="toggle">
    <li class="icn_categories"><a   href="<?php echo URL . "relatorio" . DS1 . "graficoGeral/" ?>" >Grafico</a></li>
    <li class="icn_categories"><a   href="<?php echo URL . "relatorio" . DS1 . "index/" ?>" >Por Matricula</a></li>
    <li class="icn_categories"><a   href="<?php echo URL . "relatorio" . DS1 . "aproveitamentoGrafico/" ?>" >Por Aproveitamento</a></li>
</ul>

<h3>Diploma</h3>
<ul class="toggle">
    <li class="icn_categories"><a   href="<?php echo URL . "diploma" . DS1 . "index/" ?>" >Ver</a></li>

</ul>

</aside><!-- end of sidebar -->
