/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    editar();
    adicionar();
    

});



function remover() {
    var url = "https://localhost/uan/programa/remover";
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

