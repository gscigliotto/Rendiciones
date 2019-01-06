using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class DetalleFact
    {
        public int NroRenglonDelGasto { get; set; }
        public string  ObjetoDelGasto { get; set; }
        public string DescripcionDelGasto { get; set; }
        public double Importe { get; set; }

        public string ConceptoGasto { get; set; }


    }
}
