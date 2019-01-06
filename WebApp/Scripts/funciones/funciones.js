function MostrarRendiciones(id) {
    jQuery.ajax({
        url: 'Index.aspx/GetRendiciones',
        type: "POST",
        dataType: "json",
        data: "{'id': '" + id + "'}",
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
        url: 'Index.aspx/GetFacturas',
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
        url: 'Index.aspx/GetFacturasDetalle',
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


        //ConceptoGasto: "Gastos Corrientes"
        //DescripcionDelGasto: "Sueldo"
        //Importe: 100
        //NroRenglonDelGasto: 1
        //ObjetoDelGasto: "1.1.2"
        //__proto__: Object


        //$("td", row).eq(7).html($("<button type='button' class='btn btn-secondary btn-sm mr-3' data-toggle='modal' data-target='#modalDetFacturas' data-whatever='" + response.d[i].IdLote + "," + response.d[i].NroDocumento + "," + response.d[i].Cuit + "," + response.d[i].AnioFactura + "'>Detalle</button>", this));
        //if (response.d[i].Estado == "1") {
        //    enableEdit = '';
        //} else {
        // enableEdit = 'disabled'; DEJO QUE SIEMPRE TODAS SE PUEDA EDITAR
        //}
        // $("td", rowFila).eq(11).append($("<button " + enableEdit + " type='button' class='btn btn-secondary btn-sm " + enableEdit + "' data-toggle='modal' data-target='#modalCabFacturas' data-whatever='" + response.d[i].IdLote + "'>Editar</button>", this));

        $("[id=Detallefacturas]").append(rowFila);
        //alert(rowFila)
        rowFila = $("[id*=Detallefacturas] tr:last-child").clone(true);
    }

}



function deshabtabs() {
    $('#rendicion-tab').addClass('disabled');
}