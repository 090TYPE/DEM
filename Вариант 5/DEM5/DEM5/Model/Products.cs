//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DEM5.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Products()
        {
            this.OrderDetails = new HashSet<OrderDetails>();
            this.PartnerSalesHistory = new HashSet<PartnerSalesHistory>();
            this.ProductMaterials = new HashSet<ProductMaterials>();
            this.ProductPriceHistory = new HashSet<ProductPriceHistory>();
        }
    
        public int ProductID { get; set; }
        public string Article { get; set; }
        public string ProductType { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public byte[] Image { get; set; }
        public Nullable<decimal> MinPartnerPrice { get; set; }
        public Nullable<decimal> PackageLength { get; set; }
        public Nullable<decimal> PackageWidth { get; set; }
        public Nullable<decimal> PackageHeight { get; set; }
        public Nullable<decimal> WeightWithoutPackage { get; set; }
        public Nullable<decimal> WeightWithPackage { get; set; }
        public byte[] QualityCertificate { get; set; }
        public string StandardNumber { get; set; }
        public Nullable<int> ProductionTime { get; set; }
        public Nullable<decimal> CostPrice { get; set; }
        public Nullable<int> WorkshopNumber { get; set; }
        public Nullable<int> EmployeesCount { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetails> OrderDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PartnerSalesHistory> PartnerSalesHistory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMaterials> ProductMaterials { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductPriceHistory> ProductPriceHistory { get; set; }
    }
}
