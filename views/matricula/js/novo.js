
$(document).ready(function () {
    adicionar();

});


function adicionar() {

    $(document).on('submit', '#guardar', function () {

        var url = $(this).attr('action');
        var data = $(this).serialize();
        console.log(data);
        $.post(url, data)
                .done(function (data) {
                    if (data.mensagem == "ok") {
                        var url = "http://localhost/uan/matricula/editarImagem/";
                        setTimeout(url, 1000);
                    }

                });

        return false;
    });

}
