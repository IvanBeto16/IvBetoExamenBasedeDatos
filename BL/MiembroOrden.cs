using ML;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class MiembroOrden
    {

        public static Informe InformeJedi()
        {
            Informe informe = new Informe(); 
            using (DL.DB_SofomSWEntities context = new DL.DB_SofomSWEntities())
            {
                var query = context.InformeJedi();
                if(query != null)
                {
                    informe.Informes = new List<Informe>();
                    foreach (var item in query)
                    {
                        Informe aux = new Informe();
                        aux.Caballero = item.Caballero;
                        aux.RangoMaestro = item.RangoMaestro;
                        aux.SistemaAmenazado = item.Sistema_en_el_que_combate;

                        informe.Informes.Add(aux);
                    }
                }
                return informe;
            }
        }
    }
}
