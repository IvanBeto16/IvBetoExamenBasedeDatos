using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ML
{
    public class MiembroOrden
    {
        public int IdMiembro { get; set; }
        public string Nombre { get; set; }
        public Especie Especie { get; set; }
        public Planeta Planeta { get; set; }
        public Rango Rango { get; set; }
        public int Edad { get; set; }
        public int Midiclorianos { get; set; }
    }
}
