
$(document).ready(function () {
    pessoas();
   



});




function pessoas() {

    $.getJSON('http://localhost/uan/usuario/pesquisaPor/', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#pessoa").append('<option value="' + valor.id + '">' + valor.nome + '</option>');

        });
    });


}
