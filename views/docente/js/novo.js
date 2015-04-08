
$(document).ready(function () {
    $("#img").hide();
    validar();
    


});

function validar() {
alert(1);
   // dispara o evento change do checkbox
$("input[name=s]").change(function(){
  // verifica se foi selecionado
  if($(this).is(':checked')){
    // sim: mostro o campo select
    alert(1);
    $("#img1").show();
  } else {
    // não: não mostro o campo select
    
  }
});

}