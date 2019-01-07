var Pagename = "Index.aspx";


function MostrarRendiciones(id, fecha) {
    jQuery.ajax({
        url: Pagename+'/GetRendiciones',
        type: "POST",
        dataType: "json",
        data: "{'id': '" + id + "','fecha':'"+fecha+"'}",
        contentType: "application/json; charset=utf-8",
        success: OnSuccess,
        failure: function (response) {
            alert(response.d);
        },
        error: function (response) {
            alert(response.d);
        }
    });
    return false;
}
var id_lote;
function OnSuccess(response) {
    $('#rendicion-tab').removeClass('disabled');
    $('.nav-tabs a[href="#rendicion"]').tab('show');
    var row = $("[id*=rendiciones] tr:last-child").clone(true);
    $("[id*=rendiciones] tr").not($("[id*=rendiciones] tr:first-child")).remove();
    //$.each(customers, function () {
    for (var i = 0; i < response.d.length; i++) {
        //alert(response.d[i].IdLote);  // (o el campo que necesites)
        var customer = $(this);
        var enableEdit = "";
        id_lote = response.d[i].IdLote;
        $("td", row).eq(0).html(response.d[i].IdLote);

        $("td", row).eq(1).html(response.d[i].Descripcion);
        $("td", row).eq(2).html(response.d[i].OperadorCarga);
        $("td", row).eq(3).html($("<button type='button' class='btn btn-secondary btn-sm mr-3' data-toggle='modal' data-target='#modalFacturas' data-whatever='" + response.d[i].IdLote + "'>Facturas</button>", this));
        if (response.d[i].Borrador == 1) {
            enableEdit = '';
        }
        else {
            enableEdit = 'disabled';
        }
        $("td", row).eq(3).append($("<button " + enableEdit + " type='button' class='btn btn-secondary btn-sm " + enableEdit + "' data-toggle='modal' data-target='#rendicionModalAltaEdit' data-whatever='" + response.d[i].IdLote + "'>Editar</button>", this));

        $("[id*=rendiciones]").append(row);
        row = $("[id*=rendiciones] tr:last-child").clone(true);
    }

}
function ObtenerFacturas(id) {
    jQuery.ajax({
        url: Pagename+'/GetFacturas',
        type: "POST",
        dataType: "json",
        data: "{'id': '" + id + "'}",
        contentType: "application/json; charset=utf-8",
        success: OnSuccessFacturas,
        failure: function (response) {
            alert(response.d);
        },
        error: function (response) {
            alert(response.d);
        }
    });
    return false;
}

var filasFacturasGrilla;
function OnSuccessFacturas(response) {

    var row = $("[id=facturas] tr:last-child").clone(true);



    $("[id=facturas] tr").not($("[id=facturas] tr:first-child")).remove();
    //$.each(customers, function () {
    for (var i = 0; i < response.d.length; i++) {
        //alert(response.d[i].IdLote);  // (o el campo que necesites)
        var customer = $(this);
        var enableEdit = "";

        var re = /-?\d+/;
        var m = re.exec(response.d[i].FechaDocumento);
        var d = new Date(parseInt(m[0]));
        $("td", row).eq(0).html(response.d[i].IdLote);

        $("td", row).eq(1).html(response.d[i].AnioFactura);
        $("td", row).eq(2).html(response.d[i].NroDocumento);
        $("td", row).eq(3).html(response.d[i].Cuit);
        $("td", row).eq(4).html(response.d[i].RazonSocial);
        $("td", row).eq(5).html(response.d[i].Importe);
        $("td", row).eq(6).html(d.toLocaleDateString("es-AR"));
        $("td", row).eq(7).html($("<button type='button' class='btn btn-secondary btn-sm mr-3' data-toggle='modal' data-target='#modalDetFacturas' data-whatever='" + response.d[i].IdLote + "," + response.d[i].NroDocumento + "," + response.d[i].Cuit + "," + response.d[i].AnioFactura + "'>Detalle</button>", this));
        if (response.d[i].Estado == "1") {
            enableEdit = '';
        }
        else {
            // enableEdit = 'disabled'; DEJO QUE SIEMPRE TODAS SE PUEDA EDITAR
        }
        $("td", row).eq(7).append($("<button " + enableEdit + " type='button' class='btn btn-secondary btn-sm " + enableEdit + "' data-toggle='modal' data-target='#modalCabFacturas' data-whatever='" + response.d[i].IdLote + "'>Editar</button>", this));

        $("[id=facturas]").append(row);
        row = $("[id=facturas] tr:last-child").clone(true);
    }

}


function ObtenerFacturasDetalle(id, id_doc, CUIT, a_doc) {
    jQuery.ajax({
        url: Pagename+'/GetFacturasDetalle',
        type: "POST",
        dataType: "json",
        data: "{'id': " + id + ",'idDocumento':" + id_doc + ",'CUIT':'" + CUIT + "','ejercicio':" + a_doc + "}",
        contentType: "application/json; charset=utf-8",
        success: OnSuccessFacturasDetalle,
        failure: function (response) {
            alert(response.d);
        },
        error: function (response) {
            alert(response.d);
        }
    });
    return false;
}


function OnSuccessFacturasDetalle(response) {

    var rowFila = $("[id=Detallefacturas] tr:last-child").clone(true);


    $("[id=Detallefacturas] tr").not($("[id=Detallefacturas] tr:first-child")).remove();
    //$.each(customers, function () {

    var id_lote = response.d.IdLote;
    var ejercicio_fact = response.d.AnioFactura;
    var nro_documento = response.d.NroDocumento;
    var cuit = response.d.Cuit;
    var razon_social = response.d.RazonSocial;

    for (var i = 0; i < response.d.Detalle.length; i++) {
        //alert(response.d.Detalle[i].NroRenglonDelGasto);  // (o el campo que necesites)
        var enableEdit = "";
        var j = i;
        $("td", rowFila).eq(0).html(j + 1);
        $("td", rowFila).eq(1).html(id_lote);

        $("td", rowFila).eq(2).html(ejercicio_fact);
        $("td", rowFila).eq(3).html(nro_documento);
        $("td", rowFila).eq(4).html(cuit);
        $("td", rowFila).eq(5).html(razon_social);
        $("td", rowFila).eq(6).html(response.d.Detalle[i].NroRenglonDelGasto);
        $("td", rowFila).eq(7).html(response.d.Detalle[i].ObjetoDelGasto);
        $("td", rowFila).eq(8).html(response.d.Detalle[i].NroRenglonDelGasto);
        $("td", rowFila).eq(9).html(response.d.Detalle[i].ConceptoGasto);
        $("td", rowFila).eq(10).html(response.d.Detalle[i].Importe);


        $("[id=Detallefacturas]").append(rowFila);
        //alert(rowFila)
        rowFila = $("[id*=Detallefacturas] tr:last-child").clone(true);
    }

}

function enviarFormulario() {
    var valid;
    var caja = $('#numeroCaja').val();
    var fecha = $('#fechaCaja').val();

    if (caja == 0) {
        $('#numeroCajaValid').addClass('d-block');
        valid = false;
    } else {
        $('#numeroCajaValid').removeClass('d-block');
        valid = true;
    }


    if (fecha == "") {
        $('#fechaCajaValid').addClass('d-block');
        valid = false;
    } else {
        $('#fechaCajaValid').removeClass('d-block');
        valid = true;
    }




    if (!valid) {
        return false;
    }
    else {
        MostrarRendiciones(caja, fecha);
    }
}

function deshabtabs() {
    $('#rendicion-tab').addClass('disabled');
}


function validarRendicion() {
    var valid = true;
    var idLote = $('#IdLote').val();
    var periodo = $('#periodo').val();
    var estado = $('#estadoRendicion').val();
    var nrocaja = $('#nrocaja').val();
    var operador = $('#operador').val();
    var fechacarga = $('#fechacarga').val();
    var descripcion = $('#descripcion').val();
    var tiporendicion = $('#tiporendicion').val();
    var monto = $('#monto').val();
    var adelantos = $('#adelantos').val();
    var motivo = $('#motivo').val();

    if ((idLote == "")&&(valid)) {
        $('#IdLoteValid').addClass('d-block');
        valid = false;
    } else {
        $('#IdLoteValid').removeClass('d-block');
        valid = true;
    }
 
    
    if ((periodo == "") && (valid)) {
        $('#periodoValid').addClass('d-block');
        valid = false;
    } else {
        $('#periodoValid').removeClass('d-block');
        valid = true;
    }

    if ((estado == "") && (valid)) {
        $('#estadoRendicionValid').addClass('d-block');
        valid = false;
    } else {
        $('#estadoRendicionValid').removeClass('d-block');
        valid = true;
    }



    if ((nrocaja == "") && (valid)) {
        $('#nrocajaValid').addClass('d-block');
        valid = false;
    } else {
        $('#nrocajaValid').removeClass('d-block');
        valid = true;
    }




    if ((operador == "") && (valid)) {
        $('#operadorValid').addClass('d-block');
        valid = false;
    } else {
        $('#operadorValid').removeClass('d-block');
        valid = true;
    }
    if ((fechacarga == "") && (valid)) {
        $('#fechacargaValid').addClass('d-block');
        valid = false;
    } else {
        $('#fechacargaValid').removeClass('d-block');
        valid = true;
    }

    if ((descripcion == "") && (valid)) {
        $('#descripcionValid').addClass('d-block');
        valid = false;
    } else {
        $('#descripcionValid').removeClass('d-block');
        valid = true;
    }

    if ((tiporendicion == "") && (valid)) {
        $('#tiporendicionValid').addClass('d-block');
        valid = false;
    } else {
        $('#tiporendicionValid').removeClass('d-block');
        valid = true;
    }
    /*
    if (monto == "") {
        $('#montoValid').addClass('d-block');
        valid = false;
    } else {
        $('#montoValid').removeClass('d-block');
        valid = true;
    }
    */
    if ((adelantos == "" || !adelantos.match(/^\d{0,2}(?:\.\d{0,2}){0,1}$/)) && (valid)) {
        $('#adelantosValid').addClass('d-block');
        valid = false;
    } else {
        $('#adelantosValid').removeClass('d-block');
        valid = true;
    }

    if ((motivo == "") && (valid)) {
        $('#motivoValid').addClass('d-block');
        valid = false;
    } else {
        $('#motivoValid').removeClass('d-block');
        valid = true;
    }

    if (!valid) {
        return false;
    }
    else {
        var jsonRendicion = {
            "IdLote": idLote,
            "Periodo": periodo,
            "Descripcion": descripcion,
            "NroCajaChica": nrocaja,
            "OperadorCarga": operador,
            "FechaCarga": fechacarga,
            "FechaCarga": "",
            //"MontoTotalRendicion": monto,
            "TipoRendicion":tiporendicion,
            "EstadoRendicion": estado,
            "BajaModificacionEstado": estado,
            "BajaModificacionFecha": "",
            "MotivoRechazo": motivo,
            "AdelantosEnEfectivo": adelantos,
           // "IncrementoAdelantosEnEfectivo":"",
            "Borrador": 1

        }
        CreateRendicion(jsonRendicion);
    }


    function CreateRendicion(jsonRendicion) {
        var json = JSON.stringify(jsonRendicion);
        jQuery.ajax({
            url: Pagename+'/CreateRendicion',
            type: "POST",
            dataType: "json",
            data: "{'rendicion': " + json + "}",
            //data:{obj:  json },
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                $('#rendicionModalAltaEdit').modal('hide')
                limpiarRendicion();

            },
            failure: function (response) {
                alert(response.d);
                $('#rendicionMsg').html(response.d);
                $('#rendicionMsg').removeClass('d-none');
            },
            error: function (response) {
                $('#rendicionMsg').html(response.responseJSON.Message);
                $('#rendicionMsg').removeClass('d-none');
            }
        });
        return false;


    }

    function limpiarRendicion() {
        /*
        $('rendicionMsg').html('');
        $('#rendicionMsg').removeClass('d-none');
        $('#rendicionMsg').addClass('d-none');
        $('#IdLote').val("");
        $('#periodo').val("");
        $('#estadoRendicion').val("");
        $('#nrocaja').val("");
        $('#operador').val("");
        $('#fechacarga').val("");
        $('#descripcion').val("");
        $('#tiporendicion').val("");
        $('#monto').val("");
        $('#adelantos').val("");
        $('#motivo').val("");
        */
        
        $('#rendicionMsg').removeClass('d-none');

    }


}