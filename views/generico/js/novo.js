
$(document).ready(function () {
    pessoas();

    tabela();
    remover();
    validar();
    var oTable = $('#tabela').dataTable();



});




function pessoas() {

    $.getJSON('https://localhost/uan/usuario/pesquisaPor/', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#pessoa").append('<option value="' + valor.id + '">' + valor.nome + '</option>');

        });
    });


}


function remover() {
    $(document).on('click', '#remover', function () {
        if (confirm('Pretendes Apagar este Item?')) {
            var id = $(this).attr('rel');
            console.log(id);
            $.post(id)
                    .done(function (data) {
                        alert("Dados apagado com sucesso");


                    });
        }
        else {
            return false;
        }
    });
}


function validar() {
    $("#adicionar").validate({
        rules: {
            nome: {
                required: true,
                minlength: 4
            },
            login: {
                required: true,
                minlength: 4
            },
            senha: {
                required: true,
                minlength: 6
            },
            nivel: {
                required: true,
            }

        }
    });

}
