using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Rendicion
    {

        public int IdLote { get; set; }
        public int Periodo { get; set; }
        public string Descripcion { get; set; }
        public int NroCajaChica { get; set; }
        public string OperadorCarga { get; set; }
        public DateTime FechaCarga { get; set; }
        public double MontoTotalRendicion { get; set; }
        public int TipoRendicion { get; set; }
        public int EstadoRendicion { get; set; }
        public int BajaModificacionEstado { get; set; }
        public DateTime BajaModificacionFecha { get; set; }
        public string MotivoRechazo { get; set; }
        public double AdelantosEnEfectivo { get; set; }
        public double IncrementoAdelantosEnEfectivo { get; set; }
        public int Borrador { get; set; }
        public Rendicion() { }
        public Rendicion(int IdLote,int Periodo,string Descripcion,int NroCajaChica, string OperadorCarga, DateTime FechaCarga,double MontoTotalRendicion,int TipoRendicion,int EstadoRendicion,
            int BajaModificacionEstado, DateTime BajaModificacionFecha, string MotivoRechazo, double AdelantosEnEfectivo,double IncrementoAdelantosEnEfectivo, int Borrador) {
            this.IdLote = IdLote;
            this.Periodo = Periodo;
            this.Descripcion = Descripcion;
            this.NroCajaChica = NroCajaChica;
            this.OperadorCarga = OperadorCarga;
            this.FechaCarga = FechaCarga;
            this.MontoTotalRendicion = MontoTotalRendicion;
            this.TipoRendicion = TipoRendicion;
            this.EstadoRendicion = EstadoRendicion;
            this.BajaModificacionEstado = BajaModificacionEstado;
            this.BajaModificacionFecha = BajaModificacionFecha;
            this.MotivoRechazo = MotivoRechazo;
            this.AdelantosEnEfectivo = AdelantosEnEfectivo;
            this.IncrementoAdelantosEnEfectivo = IncrementoAdelantosEnEfectivo;
            this.Borrador = Borrador;
        }
    }
}
