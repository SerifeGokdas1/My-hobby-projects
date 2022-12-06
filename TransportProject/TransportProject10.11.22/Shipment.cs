//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TransportProject10._11._22
{
    using System;
    using System.Collections.Generic;
    
    public partial class Shipment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Shipment()
        {
            this.Customers = new HashSet<Customer>();
        }
    
        public int ShipmentId { get; set; }
        public string ShipmentName { get; set; }
        public string ShippingConsigneeAddress { get; set; }
        public string ShippingSenderAddress { get; set; }
        public Nullable<int> Distance { get; set; }
        public Nullable<int> DistanceAmount { get; set; }
        public Nullable<int> EmployeeId { get; set; }
        public Nullable<int> VehicleId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Customer> Customers { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Vehicle Vehicle { get; set; }
    }
}