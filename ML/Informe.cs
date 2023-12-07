using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ML
{
    public class Informe
    {
        public string Caballero { get; set; }
        public string RangoMaestro { get; set; }
        public string SistemaAmenazado { get; set; }

        public List<Informe> Informes { get; set; }
    }
}
