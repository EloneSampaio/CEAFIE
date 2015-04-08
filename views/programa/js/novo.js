
$(document).ready(function () {
    docente();
    cursos();
    modulos();
    //alerta();

    comparaData();
});

function cursos() {

    $.getJSON('http://localhost/uan/curso/pesquisaPor/', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#curso").append('<option name="curso" value="' + valor.id + '">' + valor.nome + '</option>');
        });
    });
}




function docente() {

    $.getJSON('http://localhost/uan/programa/pesquisaPor', {
    }).done(function (data) {

        $.each(data, function (id, valor) {
            console.log(valor);
            $("#docente").append('<option  name="docente" value="' + valor.id + '">' + valor.nome + '</option>');
        });
    });

}




function modulos() {

//evento change   
    $('#curso').on('change', function () {

        $.getJSON('http://localhost/uan/modulo/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (data) {
        }).done(function (data) {
            $.each(data, function (id, valor) {
                console.log(valor);
                $("#modulo").append('<option name="modulo" value="' + valor.id + '">' + valor.nome + '</option>');
            });
        });
    });
}

function pesquisar() {

    $(document).on('submit', '#pesquisar', function () {
        cursos();
        var url = $(this).attr('action');
        var data = $(this).serialize();
        console.log(data);
        $.post(url, data)
                .done(function (data) {
                });
        return false;
    });
    $('#pesquisar').each(function () {
        this.reset();
    });
}


function resetar() {
    $("form").bind("reset", function () {
        setTimeout(function () {
            $('#curso').change()
        }, 50)

        setTimeout(function () {
            $('#modulo').change()
        }, 50)

    });
}

//function alerta(mensagem) {
//    $.amaran({
//        content: {
//            bgcolor: '#8e44ad',
//            color: '#fff',
//            message: mensagem
//        },
//        theme: 'colorful',
//        position: 'top right',
//        closeButton: true,
//        cssanimationIn: 'rubberBand',
//        cssanimationOut: 'bounceOutUp'
//
//    });
//}


function comparaData() {


}

