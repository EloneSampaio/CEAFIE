/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {
    validar();



    jQuery.validator.addMethod("string", function (valor, elemento) {
        var str = jQuery.trim(valor);// retira espaços em branco
        var exp = new RegExp(/^[a-záàâãéèêíïóôõöúçñ ]+$/i);

        if (!str.match(exp)) {
            return false;
        }

        return true;

    }, "Somente Letras"); // Mensagem padrão 


    jQuery.validator.addMethod("verificaData",
            function (value, element, params) {

                if (!/Invalid|NaN/.test(new Date(value))) {
                    return new Date(value) > new Date($(params).val());
                }

                return isNaN(value) && isNaN($(params).val())
                        || (Number(value) > Number($(params).val()));
            }, 'verifica a data de {0}.');




});



function validar() {
    $("#adicionar").validate({
        rules: {
            local: {
                required: true,
                minlength: 4
            },
            inicio: {
                required: true,
               
            },
            termino: {
                required: true,
                
              verificaData: "#inicio"
            },
            
        }

    });

}


function validaForm() {
    $("#adicionar").validate({
        rules: {
            docente: {
                required: true,
            },
            curso: {
                required: true,
            },
            modulo: {
                required: true,
            },
            local: {
                required: true,
                minlength: 4
            },
            inicio: {
                required: true,
               
            },
            termino: {
                required: true,
                
                verificaData: "#inicio"},
            hora: {
                required: true,
            }

        }
    });
}

