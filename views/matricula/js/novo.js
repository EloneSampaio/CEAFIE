
$(document).ready(function () {
    setTimeout(function () {
        cursos();
    }, 50)
    modulos();

});



function cursos() {



    $.getJSON('http://localhost/uan/curso/pesquisaPor/', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#curso").append('<option value="' + valor.id + '">' + valor.nome + '</option>');
        });
    });
}

function modulos() {


    $('#curso').change(function () {
        if ($(this).val()) {
            $('#modulo').hide();
            $('.carregando').hide();
            $('.carregando').html("carregando...").show();
            $.getJSON('http://localhost/uan/modulo/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (j) {
                var options = '<option value=""></option>';
                for (var i = 0; i < j.length; i++) {
                    options += '<option value="' + j[i].id + '">' + j[i].nome + '</option>';
                }
                $('#modulo').html(options).show();
                $('.carregando').hide();
            });
        } else {
            $('#modulo').html('<option value="">-- Escolha um curso --</option>');
        }
    });
}

//function pesquisar() {
//
//    $(document).on('submit', '#pesquisar', function () {
//        cursos();
//        var url = $(this).attr('action');
//        var data = $(this).serialize();
//        console.log(data);
//        $.post(url, data)
//                .done(function (data) {
//                });
//        return false;
//    });
//    $('#pesquisar').each(function () {
//        this.reset();
//    });
//}


function resetar() {
    $("form").bind("reset", function () {
        setTimeout(function () {
            $('#curso').change()
        }, 50)

//        setTimeout(function () {
//            $('#modulo').change()
//        }, 50)
    });
}



function adicionar() {

    $(document).on('submit', '#adicionar', function () {
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





function resetar1() {
    $("form").bind("reset", function () {
        setTimeout(function () {
            $('#select').change()
        }, 50)

    });
}


function resetar() {
    $(container).find(":input, select").each(function () {
        switch (this.type) {
            case "file":
            case "password":
            case "text":
            case "textarea":
                $(this).val("");
                break;
            case "checkbox":
            case "radio":
                this.checked = false;
        }

        $(this).children("option:selected").removeAttr("selected").end()
                .children("option:first").attr("selected", "selected");
    });

}







