/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    categoriaCientifica();
    categoriaDocente();
    funcao();
    graduacao();
    unidadeOrganica();
    universidade();
    

});



function categoriaCientifica() {

    $.getJSON('https://localhost/uan/generico/pesquisaPor/CategoriaCientifica', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#categoria_centifica").append('<option value="' + valor.nome + '">' + valor.nome + '</option>');
        });
    });
}


function categoriaDocente() {

    $.getJSON('https://localhost/uan/generico/pesquisaPor/CategoriaDocente', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#categoria_docente").append('<option value="' + valor.nome + '">' + valor.nome + '</option>');
        });
    });
}

function funcao() {

    $.getJSON('https://localhost/uan/generico/pesquisaPor/Funcao', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#funcao").append('<option value="' + valor.nome + '">' + valor.nome + '</option>');
        });
    });
}


function graduacao() {

    $.getJSON('https://localhost/uan/generico/pesquisaPor/Graduacao', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#graduacao").append('<option value="' + valor.nome + '">' + valor.nome + '</option>');
        });
    });
}


function unidadeOrganica() {

    $.getJSON('https://localhost/uan/generico/pesquisaPor/UnidadeOrganica', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#unidade_organica").append('<option value="' + valor.nome + '">' + valor.nome + '</option>');
        });
    });
}

function universidade() {

    $.getJSON('https://localhost/uan/generico/pesquisaPor/Universidade', {
    }).done(function (data) {
        $.each(data, function (id, valor) {

            $("#universidade").append('<option value="' + valor.nome + '">' + valor.nome + '</option>');
        });
    });
}










