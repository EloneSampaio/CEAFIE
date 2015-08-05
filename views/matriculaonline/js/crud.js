/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    mostrarCampo();

    editar();
    adicionar();
    remover();

    $('#telefone').keyup(verificacaoTel);
    $('#email').keyup(verificacaoEmail);




});



function remover() {
    var url = "https://localhost/uan/matricula/remover";
    $(document).on('click', '#remover', function () {
        if (confirm('Pretendes Apagar este Aluno?')) {
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


function adicionar() {
    $(document).on('submit', '#adicionar', function () {
        var url = $(this).attr('action');
        var data = $(this).serialize();
        $.post(url, data)
                .done(function (data) {

                    var json = $.parseJSON(data);

                    if (json.cod === 1) {
                        notificar(json.mensagem, json.tipo);
                        setTimeout(function () {
                            $(location).attr('href', url);
                        }, 2000);
                    }
                    else {
                        notificar(json.mensagem, json.tipo);
                    }

                });

        return false;
    });

}

function editar() {
    $(document).on('submit', '#edita', function () {
        var url = $(location).attr('href');
        var data = $(this).serialize();
        
        $.post(url, data)
                .done(function (data) {

                    var json = $.parseJSON(data);

                    if (json.cod === 1) {
                        notificar(json.mensagem, json.tipo);
                        setTimeout(function () {
                            $(location).attr('href', url);
                        }, 2000);
                    }
                    else {
                        notificar(json.mensagem, json.tipo);
                    }

                });

        return false;
    });

}


function notificar(text, type) {


    var n = noty({
        text: text,
        type: type,
        dismissQueue: true,
        layout: 'topCenter',
        closeWith: ['click'],
        theme: 'relax',
        maxVisible: 20,
        animation: {
            open: 'animated bounceInLeft',
            close: 'animated bounceOutLeft',
            easing: 'swing',
            speed: 500
        }
    });
}



function verificacaoTel() {

    var value = $('#telefone').val();
    console.log(value);
    if (value == '' || value.length < 7) {
        $('#telefone').css('border', '3px #CCC solid');

    } else {
        jQuery.ajax({
            type: 'POST', url: 'https://localhost/uan/matricula/verificarTel', data: 'telefone=' + value, dataType: 'json', cache: false, success: function (response) {
                console.log(response.vl);
                if (response === 1) {
                    $('#telefone').css('border', '3px #C33 solid');

                } else {
                    $('#telefone').css('border', '3px #090 solid');

                }
            }
        });
    }
}


function verificacaoEmail() {

    var value = $('#email').val();
    console.log(value);
    if (value == '' || value.length < 7) {
        $('#email').css('border', '3px #CCC solid');
        $('#tick').hide();
    } else {
        jQuery.ajax({
            type: 'POST', url: 'https://localhost/uan/matricula/verificarEmail', data: 'email=' + value, dataType: 'json', cache: false, success: function (response) {
                console.log(response.vl);
                if (response === 1) {
                    $('#email').css('border', '3px #C33 solid');

                } else {
                    $('#email').css('border', '3px #090 solid');

                }
            }
        });
    }
}



function verificacaoBi() {

    var value = $('#bix').val();
    console.log(value);
    if (value == '' || value.length < 6) {
        $('#bix').css('border', '3px #CCC solid');
    } else {
        jQuery.ajax({
            type: 'POST', url: 'https://localhost/uan/matricula/verificarBi', data: 'bi=' + value, cache: false, success: function (response) {
                console.log(response);
                if (response === 1) {
                    $('#bix').css('border', '3px #C33 solid');

                } else {
                    $('#bix').css('border', '3px #090 solid');

                }
            }
        });
    }
}

function verificacaoPas() {

    var value = $('#passaporte').val();
    console.log(value);
    if (value == '' || value.length < 6) {
        $('#passaportes').css('border', '3px #CCC solid');
    } else {
        jQuery.ajax({
            type: 'POST', url: 'https://localhost/uan/matricula/verificarBi', data: 'passaporte=' + value, cache: false, success: function (response) {
                console.log(response);
                if (response === 1) {
                    $('#passaportes').css('border', '3px #C33 solid');

                } else {
                    $('#passaportes').css('border', '3px #090 solid');

                }
            }
        });
    }
}


function mostrarCampo() {

    $('#passaporte').hide();
    $('#bi').hide();

    $('#nacionalidade').change(function () {
        var p = 'ANGOLANA';
        if ($(this).val() == p) {
            $('#passaporte').hide();
            $('#bi').show();

        } else if ($(this).val() == 'Outro') {
            $('#passaporte').show();
            $('#passaportes').keyup(verificacaoPas());
            $('#bi').hide();
        }
        else {
            $('#passaporte').hide();
            $('#bi').hide();
        }
        $('#bix').keyup(verificacaoBi);




    });

}

//$('option[value='+ data[0].start +']').attr('selected', 'selected');