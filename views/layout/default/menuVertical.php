<?php use application\Session;?>
<!--margin-top: 0px; margin-left: 0px; padding-top: 0px;-->
<br /><br /><br />
<aside id="sidebar" class="column" style="position: absolute; top: 115px;">
    <hr/>
    <h3>Formando</h3>
    <ul class="toggle">
        <li class="icn_categories"><a  href="<?php echo URL . "matricula" . DS1 . "index/" ?>"  >Ver</a></li>
       </ul>
    <h3>Formador</h3>
    <ul class="toggle">
        <li class="icn_categories"><a   href="<?php echo URL . "docente" . DS1 . "index/" ?>" >Ver</a></li>
        </ul>
     <h3>Curso</h3>
    <ul class="toggle">
        <li class="icn_categories"><a   href="<?php echo URL . "curso" . DS1 . "index/" ?>" >Ver</a></li>
        </ul>
    
    <h3>Nota</h3>
    <ul class="toggle">
        <li class="icn_categories"><a   href="<?php echo URL . "nota" . DS1 ?>">Ver Notas</a></li>
    </ul>

    <h3>Programa</h3>
    <ul class="toggle">
        <li class="icn_categories"><a   href="<?php echo URL . "programa" . DS1 . "index/" ?>" >Ver</a></li>
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
