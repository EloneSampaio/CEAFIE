/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {
    validaForm();
   



    jQuery.validator.addMethod("bi", function (valor, elemento) {
        var bi = jQuery.trim(valor);// retira espaços em branco
        if (bi.length < 14 && bi.length < 15) {
            return false;
        }
        var exp = new RegExp(/^[0-9]{9}[A-Z]{2}[0-9]{3}$/);

        if (!bi.match(exp)) {
            return false;
        }

        return true;

    }, "Nª Bi invalido"); // Mensagem padrão 



    jQuery.validator.addMethod("string", function (valor, elemento) {
        var str = jQuery.trim(valor);// retira espaços em branco
        var exp = new RegExp(/^[a-záàâãéèêíïóôõöúçñ ]+$/i);

        if (!str.match(exp)) {
            return false;
        }

        return true;

    }, "Somente Letras"); // Mensagem padrão 

    $.validator.addMethod("verificaBi", function (valor, elemento) {
        console.log(valor);
        var sms = false;
        $.ajax({
            type: 'POST', url: 'https://localhost/uan/matricula/verificarBi',
            data: 'bi=' + valor,
            cache: false,
            dataType: "json",
            async: false,
            success: function (response) {

                sms = response === 1 ? false : true
            }
        });

        return sms;

    }, "Este numero de bi já esta em uso"); // Mensagem padrão 


    $.validator.addMethod("verificaTel", function (valor, elemento) {
        console.log(valor);
        var sms = false;
        $.ajax({
            type: 'POST', url: 'https://localhost/uan/matricula/verificarTel',
            data: 'telefone=' + valor,
            cache: false,
            dataType: "json",
            async: false,
            success: function (response) {

                sms = response === 1 ? false : true
            }
        });

        return sms;

    }, "Este numero de telefone já esta em uso"); // Mensagem padrão 


    $.validator.addMethod("verificarEmail", function (valor, elemento) {
        console.log(valor);
        var sms = false;
        $.ajax({
            type: 'POST', url: 'https://localhost/uan/matricula/verificarEmail',
            data: 'email=' + valor,
            cache: false,
            dataType: "json",
            async: false,
            success: function (response) {

                sms = response === 1 ? false : true
            }
        });

        return sms;

    }, "Este email já esta em uso"); // Mensagem padrão 




});






function validaForm() {
    $("#adicionar").validate({
        rules: {
            apelido: {
                required: true,
                minlength: 3,
                string: true,
                maxlength: 20,
            },
            nome: {
                required: true,
                minlength: 5,
                string: true,
                maxlength: 20,
            },
            genero: {
                required: true

            },
            bi: {
                required: true,
                minlength: 14,
                maxlength: 14,
                bi: true,
                verificaBi: true
            },
            passaporte: {
                required: true,
                minlength: 6,
                maxlength: 7,
            },
            nacionalidade: {
                required: true

            },
            telefone: {
                required: true,
                number: true,
                minlength: 9,
                maxlength: 9,
                verificaTel: true

            },
            email: {
                required: true,
                email: true,
                verificarEmail: true
            },
            grau: {
                required: true,
            },
            dados: {
                required: true
            },
            modulo: {
                required: true
            }
        },
        messages: {
            bi: {minlength: "BI invalido"},
            telefone: {minlength: "Numero Inválido"},
        }
    });

}

