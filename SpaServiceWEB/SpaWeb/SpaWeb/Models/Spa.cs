//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SpaWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;

    public partial class Spa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Spa()
        {
            this.Employee = new HashSet<Employee>();
            this.SpaService = new HashSet<SpaService>();
        }
        [DisplayName("Spa Name")]
        public string SpaID { get; set; }
        [DisplayName("Spa Name")]
        public string SpaName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
        public string Zalo { get; set; }
        public string Facebook { get; set; }
        public string Description { get; set; }
        public string Logo { get; set; }
        public string Image { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Employee> Employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SpaService> SpaService { get; set; }
    }
}
