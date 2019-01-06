using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Factura
    {
        public int IdLote { get; set; }
        public int NroDocumento { get; set; }
        public int AnioFactura { get; set; }
        public string Cuit { get; set; }
        public string RazonSocial { get; set; }
        public double Importe { get; set; }
        public DateTime FechaDocumento { get; set; }
        public string Agrupamiento { get; set; }
        public string Estado { get; set; }
        public int TipoPago { get; set; }
        public int NroCupon { get; set; }
        public string CuentaAlternativa { get; set; }
        public List<DetalleFact> Detalle { get; set; }
    }
}
