//
//    $(document).ajaxStart(function () {
//       
//    });
//
//    $(document).ajaxStop(function () {
// tabela();
//
//    });
$(document).off('.data-api');
$(document).off('.alert.data-api')

$(document).ready(function () {
    var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
    $.fn.bootstrapBtn = bootstrapButton            // give $().bootstrapBtn the Bootstrap functionality
    //$('#telefone').attr('data-mask', '(999) 999-999');
    

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
    var oTable = $('#tabela').dataTable({
             "order": [[ 1, "asc" ]]
        });
    

    var nowDate = new Date();
    var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
    $('#data').datepicker({
        format: "dd-mm-yyyy",
        language: "pt-BR",
        startDate: today,
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


function tabela() {


    $('#tabela').dataTable({
        "pagingType": "full_numbers",
        "sDom": '<"H"Tlfr>t<"F"ip>',
        "oTableTools": {
            "sRowSelect": "multi",
            "aButtons": ["copy", "csv", "xls", "pdf", "print"]
        },
        "bDestroy": true,
        "aoColumnDefs": [{
                'bSortable': false,
                'aTargets': [0, 1]
            }],
        "aLengthMenu": [[5, 10, 25, 50, 75, -1], [5, 10, 25, 50, 75, "All"]],
        "iDisplayLength": 5,
        "bJQueryUI": true,
        "oLanguage": {"sLengthMenu":
                    "Mostrar _MENU_ registros por página",
            "sZeroRecords": "Nenhum registro encontrado",
            "sInfo": "Mostrando _START_ / _END_ de _TOTAL_ registro(s)",
            "sInfoEmpty": "Mostrando 0 / 0 de 0 registros",
            "sInfoFiltered": "(filtrado de _MAX_ registros)",
            "sSearch": "Pesquisar: ",
            "oPaginate": {"sFirst": "Início",
                "sPrevious": "Anterior",
                "sNext": "Próximo",
                "sLast": "Último"},
            "oFilterSelectedOptions": {
                AllText: "All Widgets",
                SelectedText: "Selected Widgets"
            }

        },
        "aaSorting": [[0, 'desc']],
        "aoColumnDefs": [{"sType": "num-html", "aTargets": [0]},
        ]

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




///** * Função para criar um objeto XMLHTTPRequest */
//function CriaRequest() {
//    try {
//        request = new XMLHttpRequest();
//    }
//    catch (IEAtual) {
//        try {
//            request = new ActiveXObject("Msxml2.XMLHTTP");
//        }
//        catch (IEAntigo) {
//
//            try {
//                request = new ActiveXObject("Microsoft.XMLHTTP");
//            } catch (falha) {
//                request = false;
//            }
//        }
//    }
//
//    if (!request)
//        alert("Seu Navegador não suporta Ajax!");
//    else
//        return request;
//}
/** * Função para enviar os dados */

//function getDados(elemento) {
//    // Declaração de Variáveis
//
//    var acao = $('#' + elemento).attr('id');
//    var ano = document.getElementById("ano").value;
//    var imagem = document.getElementById("img").value;
//    var modulo = $("#modulo1").val();
//
//
//    var result = document.getElementById("conteudo");
//    var xmlreq = CriaRequest();
//    // Exibi a imagem de progresso 
//    result.innerHTML = '<img src="' + imagem + '"/>';
//    // Iniciar uma requisição
//
//
//    xmlreq.open("POST", "https://localhost/uan/matricula/pesquisaPor/" + acao + '/' + modulo + '/' + ano + '/', true);
//    // Atribui uma função para ser executada sempre que houver uma mudança de ado
//    xmlreq.onreadystatechange = function () {
//        // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
//        if (xmlreq.readyState == 4) {
//
//            // Verifica se o arquivo foi encontrado com sucesso 
//            if (xmlreq.status == 200) {
//                result.innerHTML = xmlreq.responseText;
//                tabela();
//                
//
//            }
//
//            else {
//                result.innerHTML = "Erro: " + xmlreq.statusText;
//            }
//        }
//    };
//
//    xmlreq.send(null);
//
//
//}
//
//
//function getTodos(elemento) {
//
//
//    var acao = $('#' + elemento).attr('id');
//
//    var result = document.getElementById("conteudo");
//    var imagem = document.getElementById("img").value;
//    var xmlreq = CriaRequest();
//    // Exibi a imagem de progresso 
//    result.innerHTML = '<img src="' + imagem + '"   class="img-circle"/>';
//    // Iniciar uma requisição
//
//
//    xmlreq.open("POST", "https://localhost/uan/matricula/pesquisaPor/" + acao + '/', true);
//    // Atribui uma função para ser executada sempre que houver uma mudança de ado
//    xmlreq.onreadystatechange = function () {
//        // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
//        if (xmlreq.readyState == 4) {
//
//            // Verifica se o arquivo foi encontrado com sucesso 
//            if (xmlreq.status == 200) {
//                result.innerHTML = xmlreq.responseText;
//                tabela();
//
//            }
//
//            else {
//                result.innerHTML = "Erro: " + xmlreq.statusText;
//            }
//        }
//    };
//
//    xmlreq.send(null);
//
//
//}
//








function modal(id) {
    BootstrapDialog.show({
        closable: false,
        message: function (dialog) {
            var $message = $('<div></div>');
            var pageToLoad = dialog.getData('pageToLoad');
            $message.load(pageToLoad);

            return $message;
        },
        data: {
            'pageToLoad': 'https://localhost/uan/matricula/informacao/' + id
        },
        cssClass: 'login-dialog',
        buttons: [{
                cssClass: 'btn btn-primary',
                label: 'Matricular em novo curso',
                action: function (dialogItself) {
                    dialogItself.close();
                    $(location).attr('href', 'https://localhost/uan/matricula/addCurso/' + id);

                }
            },
//            {
//                cssClass: 'btn btn-info',
//                label: 'Imprimir Ficha',
//                action: function (dialogItself) {
//                    dialogItself.close();
//                    $(location).attr('href', 'https://localhost/uan/matricula/imprimirFicha/' + id);
//
//                }
//            }
            {
                cssClass: 'btn btn-danger',
                label: 'Fechar',
                action: function (dialogItself) {
                    dialogItself.close();
                    $(location).attr('href', 'https://localhost/uan/matricula/');
                }


            },
        ]

    });


}
