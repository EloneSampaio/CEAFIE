
$(document).ready(function () {

  setTimeout(function () {
        cursos();
    }, 50);
      var oTable = $('#tabela').dataTable();

    /* Add event listener to the dropdown input */
    $('#ano').change(function () {

        oTable.fnFilter($(this).val());
    });
    $('#curso').change(function () {
        oTable.fnFilter($(this).val());
    });
   

    

});


function cursos() {

    $.getJSON('https://localhost/uan/curso/pesquisaPor/', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#curso").append('<option value="' + valor.nome + '">' + valor.nome + '</option>');
        });
    });
}