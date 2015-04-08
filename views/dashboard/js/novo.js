


$(document).ready(function () {
    $("#imagem").hide();
    open();
    saudacao();
    adicionar();
    remover();
    validar();
    editarMatricula1();
    editarDocente1();
    editarCurso1();
    //$('#inicio').datepicker();
    resetar();

});

function notificacao(nome, mensagem, url) {
    $.amaran({
        content: {
            img: url + "views/layout/default/images/gravatar.jpg",
            user: nome,
            message: mensagem
        },
        theme: 'user green',
        position: 'top right',
        closeButton: true,
        cssanimationIn: 'rubberBand',
        cssanimationOut: 'bounceOutUp'
    });

}



function saudacao() {
    $.getJSON('http://localhost/uan/dashboard/listarUsuario', function (data) {
        notificacao(data.nome, data.mensagem, data.url);
    });
}


function open() {

    $(document).on('click', '.click', function () {
        var id = $(this).attr('rel');
        console.log(id);

        $('#imagem').show();
        setTimeout("$('#pageContent').load('" + id + "', function(){ $('#imagem').hide(); });", 1000);
    });
}






function adicionar() {

    $(document).on('submit', '#adicionar', function () {
        cursos();
        var url = $(this).attr('action');
        var data = $(this).serialize();
        console.log(data);
        $.post(url, data)
                .done(function (data) {
                    var json = $.parseJSON(data);

                    alert(json.mensagem);
                    $('#adicionar').each(function () {
                        this.reset();
                    });

                });

        return false;
    });

}

function alerta(mensagem) {
    $.amaran({
        content: {
            bgcolor: '#8e44ad',
            color: '#fff',
            message: mensagem
        },
        theme: 'colorful',
        position: 'top right',
        closeButton: true,
        cssanimationIn: 'rubberBand',
        cssanimationOut: 'bounceOutUp'

    });


}

function remover() {

    $(document).on('click', '#remover', function () {
        if (confirm('Pretendes Apagar este Item?')) {
            var id = $(this).attr('rel');

            $.post(id)
                    .done(function (data) {
                        alert("Dados apagado com sucesso");

                        setTimeout("$('#pageContent').load('" + id + "', function(){ $('#imagem').hide(); });", 1000);
                    });
        }
        else {
            return false;
        }
    });
}


function validar() {
    var url = "http://localhost/uan/matricula/index";
    $(document).on('click', '#validar', function () {

        var id = $(this).attr('rel');
        $.post(id)
                .done(function (data) {
                    setTimeout("$('#pageContent').load('" + url + "', function(){ $('#imagem').hide(); });", 1000);
                });


    });
}


function editarMatricula1() {

    $(document).on('click', '#editar1', function () {
        var id = $(this).attr('rel');
        var url = "http://localhost/uan/matricula/editarDados/" + id;
        console.log(id);
        setTimeout("$('#pageContent').load('" + url + "', function(){ $('#imagem').hide(); });", 1000);

    });
}


function editarDocente1() {

    $(document).on('click', '#docente1', function () {
        var id = $(this).attr('rel');
        var url = "http://localhost/uan/docente/editarDados/" + id;
        console.log(url);
        setTimeout("$('#pageContent').load('" + url + "', function(){ $('#imagem').hide(); });", 1000);

    });
}

function editarCurso1() {

    $(document).on('click', '#curso1', function () {
        var id = $(this).attr('rel');
        var url = "http://localhost/uan/curso/editarDados/" + id;
        console.log(url);
        setTimeout("$('#pageContent').load('" + url + "', function(){ $('#imagem').hide(); });", 1000);

    });
}


function resetar() {
    $("form").bind("reset", function () {
        setTimeout(function () {
            $('#adicionar').change()
        }, 150)

    });
}












