//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PartnerOrderSystem.DataBase
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Products()
        {
            this.ApplicationProducts = new HashSet<ApplicationProducts>();
            this.ProductMaterials = new HashSet<ProductMaterials>();
            this.ProductStocks = new HashSet<ProductStocks>();
        }
    
        public int Id { get; set; }
        public int ProductTypeId { get; set; }
        public string Article { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public byte[] Image { get; set; }
        public decimal MinPartnerPrice { get; set; }
        public Nullable<decimal> PackageLength { get; set; }
        public Nullable<decimal> PackageWidth { get; set; }
        public Nullable<decimal> PackageHeight { get; set; }
        public Nullable<decimal> NetWeight { get; set; }
        public Nullable<decimal> GrossWeight { get; set; }
        public Nullable<int> ProductionTime { get; set; }
        public Nullable<decimal> CostPrice { get; set; }
        public Nullable<int> WorkshopNumber { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ApplicationProducts> ApplicationProducts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMaterials> ProductMaterials { get; set; }
        public virtual ProductTypes ProductTypes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductStocks> ProductStocks { get; set; }
    }
}
