



 $(function() {

    var oTable1 = $('#tabela').dataTable({
        "order": [[1, "asc"]],
        "sDom": 'T<"clear">lfrtip',
        "aoColumns": [
            {"bSortable": false},
           null,null
            
        ],
        "aaSorting": [],
    });
    //TableTools settings
     
    TableTools.classes.container = "btn-group btn-overlap";
    TableTools.classes.print = {
        "body": "DTTT_Print",
        "info": "tableTools-alert gritter-item-wrapper gritter-info gritter-center white",
        "message": "tableTools-print-navbar"
    };

//initiate TableTools extension
    var tableTools_obj = new $.fn.dataTable.TableTools(oTable1, {
        "sSwfPath": "../../views/layout/default/vendors/datatables/media/swf/copy_csv_xls_pdf.swf", //in Ace demo dist will be replaced by correct assets path
        "sSelectedClass": "success",
        "aButtons": [
            {
                "sExtends": "copy",
                "sToolTip": "Copiado para área de trabalho",
                "sButtonClass": "btn btn-white btn-primary btn-bold",
                "sButtonText": "<i class='fa fa-copy bigger-110 pink'></i>",
                "fnComplete": function () {
                    this.fnInfo('<h3 class="no-margin-top smaller">Tabela copiada</h3>\
									<p>Copiado ' + (oTable1.fnSettings().fnRecordsTotal()) + ' row(s) para áea de transferencia.</p>',
                            1500
                            );
                }
            },
            {
                "sExtends": "csv",
                "sToolTip": "Exporta para CSV",
                "sButtonClass": "btn btn-white btn-primary  btn-bold",
                "sButtonText": "<i class='fa fa-file-excel-o bigger-110 green'></i>"
            },
            {
                "sExtends": "pdf",
                "sToolTip": "Exporta para PDF",
                "sButtonClass": "btn btn-white btn-primary  btn-bold",
                "sButtonText": "<i class='fa fa-file-pdf-o bigger-110 red'></i>"
            },
            {
                "sExtends": "print",
                "sToolTip": "Vista para imprensão",
                "sButtonClass": "btn btn-white btn-primary  btn-bold",
                "sButtonText": "<i class='fa fa-print bigger-110 grey'></i>",
                "sMessage": "<div class='navbar navbar-default'><div class='navbar-header pull-left'><a class='navbar-brand' href='#'><small>Optional Navbar &amp; Text</small></a></div></div>",
                "sInfo": "<h3 class='no-margin-top'>Print view</h3>\
									  <p>Porfavor uso o modo de imprensão no seu navegador para\
									  imprimir essa tabela.\
									  <br />Pressiona <b>ESC</b> quando terminar.</p>",
            }
        ]
    });
    //we put a container before our table and append TableTools element to it
    $(tableTools_obj.fnContainer()).appendTo($('.tableTools-container'));
    //also add tooltips to table tools buttons
    //addding tooltips directly to "A" buttons results in buttons disappearing (weired! don't know why!)
    //so we add tooltips to the "DIV" child after it becomes inserted
    //flash objects inside table tools buttons are inserted with some delay (100ms) (for some reason)
    setTimeout(function () {
        $(tableTools_obj.fnContainer()).find('a.DTTT_button').each(function () {
            var div = $(this).find('> div');
            if (div.length > 0)
                div.tooltip({container: 'body'});
            else
                $(this).tooltip({container: 'body'});
        });
    }, 200);
    //ColVis extension
    var colvis = new $.fn.dataTable.ColVis(oTable1, {
        "buttonText": "<i class='fa fa-search'></i>",
        "aiExclude": [0, 6],
        "bShowAll": true,
        "bRestore": true,
        "sAlign": "right",
        "fnLabel": function (i, title, th) {
            return $(th).text(); //remove icons, etc
        }

    });
    //style it
    $(colvis.button()).addClass('btn-group').find('button').addClass('btn btn-white btn-info btn-bold')

    //and append it to our table tools btn-group, also add tooltip
    $(colvis.button())
            .prependTo('.tableTools-container .btn-group')
            .attr('title', 'mostar/esconder colunas').tooltip({container: 'body'});
    //and make the list, buttons and checkboxed Ace-like
    $(colvis.dom.collection)
            .addClass('dropdown-menu dropdown-light dropdown-caret dropdown-caret-right')
            .find('li').wrapInner('<a href="javascript:void(0)" />') //'A' tag is required for better styling
            .find('input[type=checkbox]').addClass('ace').next().addClass('lbl padding-8');
    /////////////////////////////////
    //table checkboxes
    $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
    //select/deselect all rows according to table header checkbox
    $('#tabela > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
        var th_checked = this.checked; //checkbox inside "TH" table header

        $(this).closest('table').find('tbody > tr').each(function () {
            var row = this;
            if (th_checked)
                tableTools_obj.fnSelect(row);
            else
                tableTools_obj.fnDeselect(row);
        });
    });
    //select/deselect a row when the checkbox is checked/unchecked
    $('#tabela').on('click', 'td input[type=checkbox]', function () {
        var row = $(this).closest('tr').get(0);
        if (!this.checked)
            tableTools_obj.fnSelect(row);
        else
            tableTools_obj.fnDeselect($(this).closest('tr').get(0));
    });
    $(document).on('click', '#tabela .dropdown-toggle', function (e) {
        e.stopImmediatePropagation();
        e.stopPropagation();
        e.preventDefault();
    });
    //And for the first simple table, which doesn't have TableTools or dataTables
    //select/deselect all rows according to table header checkbox



    /********************************/
    //add tooltip for small view action buttons in dropdown menu
    $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
    //tooltip placement on right or left
    function tooltip_placement(context, source) {
        var $source = $(source);
        var $parent = $source.closest('table')
        var off1 = $parent.offset();
        var w1 = $parent.width();
        var off2 = $source.offset();
        //var w2 = $source.width();

        if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
            return 'right';
        return 'left';
    }


});
