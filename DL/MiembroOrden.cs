//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DL
{
    using System;
    using System.Collections.Generic;
    
    public partial class MiembroOrden
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MiembroOrden()
        {
            this.MaestroJedi = new HashSet<MaestroJedi>();
            this.MaestroJedi1 = new HashSet<MaestroJedi>();
        }
    
        public int IdMiembro { get; set; }
        public string Nombre { get; set; }
        public Nullable<int> IdEspecie { get; set; }
        public Nullable<int> IdPlaneta { get; set; }
        public Nullable<int> IdRango { get; set; }
        public Nullable<int> Midiclorianos { get; set; }
        public Nullable<int> Edad { get; set; }
    
        public virtual Especie Especie { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MaestroJedi> MaestroJedi { get; set; }
        public virtual Planeta Planeta { get; set; }
        public virtual Rango Rango { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MaestroJedi> MaestroJedi1 { get; set; }
    }
}
