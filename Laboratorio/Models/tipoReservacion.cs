//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Laboratorio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tipoReservacion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tipoReservacion()
        {
            this.reservacions = new HashSet<reservacion>();
        }
    
        public int idTipoReservacion { get; set; }
        public string nombreReservacion { get; set; }
        public string descripcion { get; set; }
        public int activo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<reservacion> reservacions { get; set; }
    }
}
