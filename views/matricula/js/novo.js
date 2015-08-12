
$(document).off('.data-api');
$(document).off('.alert.data-api')

$(document).ready(function () {
     
    
    var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
    $.fn.bootstrapBtn = bootstrapButton            // give $().bootstrapBtn the Bootstrap functionality
    $('#carregar').hide();
    $("#modulo").hide();
    $("#modhide").hide();
    setTimeout(function () {
        cursos();
    }, 50);
    modulos();
    modulos1();
    pesquisarEstado();
    pesquisarData();
    validar();
    remover();
    validaForm();
    validaFormEdit();
    var nowDate = new Date();
    var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
    $('#data').datepicker({
        format: "dd-mm-yyyy",
        language: "pt-BR",
        startDate: today
    });
});
function cursos() {

    $.getJSON('https://localhost/uan/curso/pesquisaPor/', {
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
            $.getJSON('https://localhost/uan/modulo/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (j) {
                var options;
                for (var i = 0; i < j.length; i++) {
                    options += '<option value="' + j[i].id + '">' + j[i].nome + '</option>';
                }
                $('#modulo').html(options).show();
                $('#modhide').show();
                $('.carregando').hide();
            });
        } else {
            $('#modulo').html('<option value="">-- Escolha um curso --</option>');
        }
    });
}
function modulos1() {


    $('#curso').change(function () {
        if ($(this).val()) {
            $('#modulo1').hide();
            $('.carregando').hide();
            $('.carregando').html("carregando...").show();
            $.getJSON('https://localhost/uan/modulo/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (j) {
                var options = '<option value=""></option>';
                for (var i = 0; i < j.length; i++) {
                    options += '<option value="' + j[i].id + '">' + j[i].nome + '</option>';
                }
                $('#modulo1').html(options).show();
                $('.carregando').hide();
            });
        } else {
            $('#modulo1').html('<option value="">-- Escolha um curso --</option>');
        }
    });
}

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



function pesquisarEstado() {

    $('#pesquisaEstado').change(function () {
        if ($(this).val()) {
            $.getJSON('https://localhost/uan/matricula/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (j) {
                console.log(j.id);
            });
        } else {
            console.log("erro");
        }
    });
}


function pesquisarData() {

    $('#pesquisaData').change(function () {
        if ($(this).val()) {
            $.getJSON('https://localhost/uan/matricula/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (j) {
                console.log(j.nome);
            });
        } else {
            console.log("erro");
        }
    });
}




function validar() {
    var url = "https://localhost/uan/matricula/pesquisaPor/$";
    $(document).on('click', '#validar', function () {

        var id = $(this).attr('rel');
        $.post(id)
                .done(function (data) {
                    $(location).attr('href', url);
                });
    });
}


