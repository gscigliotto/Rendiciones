using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using ENTIDADES;
using Newtonsoft.Json.Linq;

namespace WebApp
{
    public partial class Index : Page 
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            this.BindDummyRow();

        }

        [WebMethod()]
        public static List<Rendicion> GetRendiciones(string id,string fecha)
        {
   

            ENTIDADES.Rendicion rendiview = new ENTIDADES.Rendicion();

            List<Rendicion> rendiciones = new List<Rendicion>();
            Rendicion rendicion = new Rendicion(1,2018,"Descripcion",2,"Carlos Gomez",DateTime.Now,1000,2,1,1, DateTime.Now, "",0,0,1);
            Rendicion rendicionPdos = new Rendicion(2, 2018, "Descripcion", 2, "Carlos Gomez", DateTime.Now, 1000, 2, 1, 1, DateTime.Now, "", 0, 0, 0);

            rendiciones.Add(rendicion);
            rendiciones.Add(rendicionPdos);
            return rendiciones;


        }
        [WebMethod()]
        public static List<Factura> GetFacturas(string id)
        {


            List<Factura> facturas = new List<Factura>();
            Factura factura = new Factura();
            factura.Agrupamiento = "Agrupamiento";
            factura.AnioFactura = 2018;
            factura.CuentaAlternativa = "CuentaAlternativa";
            factura.Cuit = "20303332805";
            factura.Estado = "Estado";
            factura.FechaDocumento = DateTime.Now;
            factura.IdLote = 1;
            factura.Importe = 1000;
            factura.NroCupon = 1;
            factura.NroDocumento = 1;
            factura.RazonSocial = "Razon Social";
            factura.TipoPago = 1;
            facturas.Add(factura);
            
            return facturas;


        }

        [WebMethod()]
        public static Factura GetFacturasDetalle(int id, int idDocumento,string CUIT,int ejercicio)
        {
           
            Factura factura = new Factura();
            factura.Agrupamiento = "Agrupamiento";
            factura.AnioFactura = 2018;
            factura.CuentaAlternativa = "CuentaAlternativa";
            factura.Cuit = "20303332805";
            factura.Estado = "Estado";
            factura.FechaDocumento = DateTime.Now;
            factura.IdLote = 1;
            factura.Importe = 1000;
            factura.NroCupon = 1;
            factura.NroDocumento = 1;
            factura.RazonSocial = "Razon Social";
            factura.TipoPago = 1;
            factura.Detalle = new List<DetalleFact>();
            factura.Detalle.Add(new DetalleFact() { ConceptoGasto = "Gastos Corrientes", DescripcionDelGasto = "Sueldo", Importe = 100.00, NroRenglonDelGasto = 1, ObjetoDelGasto = "1.1.2" });


            return factura;


        }

        private void BindDummyRow()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("RendicionId");
            dummy.Columns.Add("Descripcion");
            dummy.Columns.Add("Usuario");
            dummy.Rows.Add();
            rendiciones.DataSource = dummy;
            rendiciones.DataBind();

        }




        [WebMethod()]
        public static int CreateRendicion(string rendicion) {
            //JObject json = JObject.Parse(rendicion);
           // if ((string)json.GetValue("IdLote") == "0") {

                throw new Exception("Mensaje de Validacion prueba");
            //}

            return 100;

        }
        [WebMethod()]
        public static int CreateRendicion(Rendicion rendicion)
        {
            //JObject json = JObject.Parse(rendicion);
            // if ((string)json.GetValue("IdLote") == "0") {

            throw new Exception("Mensaje de Validacion prueba");
            //}

            return 100;

        }

    }
}