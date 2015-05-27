
$(document).off('.data-api');
$(document).off('.alert.data-api')
$(document).ready(function () {
    teste();

    cursos();
    modulos();
    tabela();
    remover();

    extras();


});



function extras() {

    var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
    $.fn.bootstrapBtn = bootstrapButton            // give $().bootstrapBtn the Bootstrap functionality
    var oTable = $('#tabela').dataTable();
    $('#curso').change(function () {
        oTable.fnFilter($(this).val());
    });
    $(".modal1").click(function () {
        var id = $(this).attr('rel');

        $.getJSON('http://localhost/uan/docente/detalhes/', {id: id, ajax: 'true'}, function (data) {

            $("#myModal").modal('show');
            var html;
            $.each(data, function (id, valor) {

                $("#conteudo").append('<p>' + valor.nome + '</p>');
            });

            var url = 'localhost/uan/docente/index';
            $("#fechar").click(function () {
                $(location).attr('href', '');

            });
        });
    });
}



function teste() {

    $.getJSON('http://localhost/uan/docente/preencherSelect/', {
    }).done(function (data) {


        var json = JSON.parse(JSON.stringify(data));
        console.log(json);
        var grupos = {};
        var select = document.getElementById("dados");
        json.forEach(function (data) {

            var grupo = data.nome1;
            console.log(grupo);
            if (!grupos[grupo]) {
                var optG = document.createElement('optgroup');
                optG.label = data.nome1;
                select.appendChild(optG);
                var g = {
                    data: [],
                    el: optG
                }
                grupos[grupo] = g;
                g.data.push(data);
            }
            var option = document.createElement('option');
            option.value = data.id;
            option.innerHTML = data.nome;
            grupos[grupo].el.appendChild(option);
        });
        $("#dados").multipleSelect({
            multiple: true,
            multipleWidth: 255,
            width: '100%',
            position: 'top'
        });
    });
}




function cursos() {



    $.getJSON('http://localhost/uan/curso/pesquisaPor/', {
    }).done(function (data) {

        $.each(data, function (id, valor) {

            $("#curso").append('<option value="' + valor.nome + '">' + valor.nome + '</option>');
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
                teste1();
                $('.carregando').hide();
            });
        } else {
            $('#modulo').html('<option value="">-- Escolha um curso --</option>');
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




function remover() {
    var url = "http://localhost/uan/docente/remover";
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

