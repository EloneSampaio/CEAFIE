
$(document).ready(function () {
    setTimeout(function () {
        cursos();
    }, 50)
    modulos();
     modulos1();
    pesquisarEstado();
    pesquisarData();
    tabela();
    validar();
    remover();
    var oTable = $('#tabela').dataTable();

    /* Add event listener to the dropdown input */
    $('#ano').change(function () {

        oTable.fnFilter($(this).val());
    });
    $('#curso').change(function () {
        oTable.fnFilter($(this).val());
    });
    $('#modulo1').change(function () {
        oTable.fnFilter($(this).val());
    });


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
function modulos1() {


    $('#curso').change(function () {
        if ($(this).val()) {
            $('#modulo1').hide();
            $('.carregando').hide();
            $('.carregando').html("carregando...").show();
            $.getJSON('http://localhost/uan/modulo/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (j) {
                var options = '<option value=""></option>';
                for (var i = 0; i < j.length; i++) {
                    options += '<option value="' + j[i].nome + '">' + j[i].nome + '</option>';
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
            $.getJSON('http://localhost/uan/matricula/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (j) {
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
            $.getJSON('http://localhost/uan/matricula/pesquisaPor/', {id: $(this).val(), ajax: 'true'}, function (j) {
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
    var url = "http://localhost/uan/matricula/index";
    $(document).on('click', '#validar', function () {

        var id = $(this).attr('rel');
        $.post(id)
                .done(function (data) {
                    $(location).attr('href', url);
                });


    });
}


function remover() {
    var url = "http://localhost/uan/matricula/remover";
    $(document).on('click', '#remover', function () {
        if (confirm('Pretendes Apagar este Item?')) {
            var id = $(this).attr('rel');
            console.log(id);
            $.post(id)
                    .done(function (data) {
                        alert("Dados apagado com sucesso");

                        $(location).attr('href', url);
                    });
        }
        else {
            return false;
        }
    });
}



