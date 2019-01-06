<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApp.Index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <script src="Scripts/funciones/funciones.js">


    </script>
    <p class="h3">Carga de Rendición de caja chica</p>
    <br />
    <!-- Navegation -->
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item ">
            <a class="nav-link" id="caja-tab" data-toggle="tab" href="#caja" onclick="deshabtabs();" role="tab" aria-controls="caja" aria-selected="true">Validacion de Caja y Periodo</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" id="rendicion-tab" data-toggle="tab" href="#rendicion" role="tab" aria-controls="rendicion" aria-selected="false">Carga de Factura</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" id="extracto-tab" data-toggle="tab" href="#extracto" role="tab" aria-controls="extracto" aria-selected="false">Extracto</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" id="envio-tab" data-toggle="tab" href="#envio" role="tab" aria-controls="envio" aria-selected="false">Envio</a>
        </li>
    </ul>
    <!-- Navegation -->

    
    <!-- Tab Content -->

    <div class="tab-content" id="myTabContent">
          <div id="caja" class="tab-pane active" role="tabpanel" aria-labelledby="caja-tab">
            <asp:GridView ID="Lotes" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" GridLines="None" AllowPaging="True" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="ReIdLote" HeaderText="Lote" SortExpression="Lote" />
                    <asp:BoundField DataField="fechaLote" HeaderText="Fecha" SortExpression="Fecha" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="Descripción" />

                    <asp:TemplateField HeaderText=" ">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkClick" OnClientClick='<%#String.Format("return MostrarRendiciones({0});", Eval("ReIdLote")) %>' runat="server"> Ver. </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ReIdLote], [fechaLote], [descripcion] FROM [LOTE]"></asp:SqlDataSource>
          </div>
          
        <div class="tab-pane fade" id="rendicion" role="tabpanel" aria-labelledby="rendicion-tab">
            <button type="button" class="btn btn-primary btn-sm float-right mt-2 mb-2" data-toggle="modal" data-target="#rendicionModalAltaEdit" data-whatever="">Nueva Rendición</button>



            <asp:GridView ID="rendiciones" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" GridLines="None">
                <Columns>
                    <asp:BoundField ItemStyle-Width="10px" DataField="RendicionId" HeaderText="Rendicion" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Descripcion" HeaderText="Descripcion" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Usuario" HeaderText="Usuario" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnFacturas" OnClientClick='<%#String.Format("return MostrarRendiciones({0});", Eval("RendicionId")) %>' runat="server"> Ver. </asp:LinkButton>
                            <asp:LinkButton ID="btnEditar" OnClientClick='<%#String.Format("return MostrarRendiciones({0});", Eval("RendicionId")) %>' runat="server"> Ver. </asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
          </div>

        <div class="tab-pane fade" id="extracto" role="tabpanel" aria-labelledby="extracto-tab">...</div>
        <div class="tab-pane fade" id="envio" role="tabpanel" aria-labelledby="envio-tab">...</div>
        </div>

    <!-- Tab Content -->



    <!--MODAL NUEVA REDICION-->
    <div class="modal fade" id="rendicionModalAltaEdit" tabindex="-1" role="dialog" aria-labelledby="rendicionModalAltaEdit" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Rendición </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="IdLote">Lote</label>
                                <input type="text" class="form-control" id="IdLote" placeholder="Lote">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="periodo">Periodo</label>
                                <input type="text" class="form-control" id="periodo" placeholder="Periodo">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="estado">Estado</label>
                                <input type="text" class="form-control" id="estado" placeholder="Estado">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="nrocaja">Nro Caja</label>
                                <input type="text" class="form-control" id="nrocaja" placeholder="Nro Caja">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="operador">Opeador</label>
                                <input type="text" class="form-control" id="operador" placeholder="Opeador">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="fechacarga">Fecha de Carga</label>
                                <input type="text" class="form-control" id="fechacarga" placeholder="Fecha de Carga">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group  col-md-10">
                                <label for="descripcion">Descripción</label>
                                <input type="text" class="form-control" id="descripcion" placeholder="Descripción">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="tiporendicion">Tipo de Rendición</label>
                                <input type="text" class="form-control" id="tiporendicion" placeholder="Tipo de Rendición">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="monto">Monto Total</label>
                                <input type="text" class="form-control" id="monto" placeholder="Monto Total">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="estado">Adelantos en Efectivo</label>
                                <input type="text" class="form-control" id="adelantos" placeholder="Adelantos en Efectivo">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group  col-md-10">
                                <label for="motivo">Motivo de Rechazo</label>
                                <input type="text" class="form-control" id="motivo" placeholder="Motivo de Rechazo">
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <!--MODAL LISTA DE FACTURAS -->
    <div class="modal fade" id="modalFacturas" tabindex="-1" role="dialog" aria-labelledby="rendicionModalFacturas" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalFacturaLabel">Facturas </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <button type="button" class="btn btn-primary btn-sm float-right mt-2 mb-2" data-toggle="modal" data-target="#modalCabFacturas" data-whatever="">Nueva</button>
                    <table class="table table-sm" id="facturas">

                        <tbody>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Año Factura</th>
                                <th scope="col">Nro Documento</th>
                                <th scope="col">CUIT</th>
                                <th scope="col">Razon Social</th>
                                <th scope="col">Importe</th>
                                <th scope="col">Fecha</th>
                                <th scope="col"></th>
                            </tr>
                            <tr id="filaFacturas">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

                </div>
            </div>
        </div>
    </div>


    <!--MODAL LISTA CABECERA DE FACTURAS -->
    <div class="modal fade" id="modalCabFacturas" tabindex="-1" role="dialog" aria-labelledby="rendicionModalFacturas" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalCabFacturaLabel">Facturas </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">


                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="IdLoteFC">Lote</label>
                                <input type="text" class="form-control" id="IdLoteFC" placeholder="Lote">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="nroDocumento">Nro Documento</label>
                                <input type="text" class="form-control" id="nroDocumento" placeholder="Nro Documento">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="aniofc">Año</label>
                                <input type="text" class="form-control" id="aniofc" placeholder="Año">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="cuit">CUIT</label>
                                <input type="text" class="form-control" id="cuit" placeholder="CUIT">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="razonsoc">Razon Social</label>
                                <input type="text" class="form-control" id="razonsoc" placeholder="Razon Social">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="importe">Fecha de Carga</label>
                                <input type="text" class="form-control" id="importe" placeholder="0.0">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group  col-md-6">
                                <label for="fechdoc">Fecha Documento</label>
                                <input type="text" class="form-control" id="fechdoc" placeholder="Fecha Documento">
                            </div>
                            <div class="form-group  col-md-4">
                                <label for="estado">Estado</label>
                                <input type="text" class="form-control" id="estado" placeholder="Estado">
                            </div>

                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="agrupamiento">Agrupamiento</label>
                                <input type="text" class="form-control" id="agrupamiento" placeholder="Tipo de Rendición">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="tipoPago">Tipo de Pago</label>
                                <input type="text" class="form-control" id="tipoPago" placeholder="Tipo de Pago">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="ncupon">Nro Cupon</label>
                                <input type="text" class="form-control" id="ncupon" placeholder="0">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group  col-md-10">
                                <label for="cuentaAlternativa">Cuenta Alternativa</label>
                                <input type="text" class="form-control" id="cuentaAlternativa" placeholder="Cuenta Alternativa">
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

                </div>
            </div>
        </div>
    </div>

    <!--MODAL LISTA DETALLE DE FACTURAS -->
    <div class="modal fade" id="modalDetFacturas" tabindex="-1" role="dialog" aria-labelledby="rendicionModalFacturasDet" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Titulo">Detalle de Facturas </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <button type="button" class="btn btn-primary btn-sm float-right mt-2 mb-2">Nueva</button>
                    <table class="table table-sm" id="Detallefacturas">

                        <tbody>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Lote</th>
                                <th scope="col">Año Factura</th>
                                <th scope="col">Nro Documento</th>
                                <th scope="col">CUIT</th>
                                <th scope="col">Razon Social</th>
                                <th scope="col">Nro Renglon</th>
                                <th scope="col">Objeto Del Gasto</th>
                                <th scope="col">Descripcion del Gasto</th>
                                <th scope="col">Concepto</th>
                                <th scope="col">Importe</th>
                                <th scope="col"></th>
                            </tr>
                            <tr class="clonable">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

                </div>
            </div>
        </div>
    </div>



    <script>
        $('#rendicionModalAltaEdit').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var id = button.data('whatever'); // Extract info from data-* attributes
            $('#rendicionModalAltaEdit').css("zIndex", "1040 !important");
            //$('#modalFacturas').modal('toggle');
            //  alert(id);
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this);
            //modal.find('.modal-title').text('New message to ' + recipient)
            //modal.find('.modal-body input').val(recipient)
        });
        $('#modalFacturas').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var id = button.data('whatever'); // Extract info from data-* attributes

            // alert(id);
            ObtenerFacturas(id);
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this);
            //modal.find('.modal-title').text('New message to ' + recipient)
            //modal.find('.modal-body input').val(recipient)
        });
        $('#modalCabFacturas').on('show.bs.modal', function (event) {
            //EVENTO EDITAR O ALTA DE CABECERA

            var button = $(event.relatedTarget); // Button that triggered the modal
            var id = button.data('whatever'); // Extract info from data-* attributes
            $('#modalCabFacturas').css("zIndex", "1040 !important");
            $('#rendicionModalAltaEdit').css("zIndex", "-1040 !important");
            // alert(id);
            //ObtenerFacturas(id);
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this);
            //modal.find('.modal-title').text('New message to ' + recipient)
            //modal.find('.modal-body input').val(recipient)
        });
        $('#modalDetFacturas').on('show.bs.modal', function (event) {
            //EVENTO VER DETALLE DE FACTURA
            var button = $(event.relatedTarget); // Button that triggered the modal
            var id = button.data('whatever'); // Extract info from data-* attributes
            var params = id.split(",");
            var id_lote = params[0];
            var id_documento = params[1];
            var CUIT = params[2];
            var ejercicio = params[3];


            //$('#modalCabFacturas').css("zIndex", "1040 !important");
            //$('#rendicionModalAltaEdit').css("zIndex", "-1040 !important");
            // alert(id);
            ObtenerFacturasDetalle(id_lote, id_documento, CUIT, ejercicio);
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this);
            //modal.find('.modal-title').text('New message to ' + recipient)
            //modal.find('.modal-body input').val(recipient)
        });
    </script>
</asp:Content>
