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
    
    public partial class MaterialStocks
    {
        public int Id { get; set; }
        public int MaterialId { get; set; }
        public int Quantity { get; set; }
        public int MinQuantity { get; set; }
        public Nullable<System.DateTime> LastUpdate { get; set; }
    
        public virtual Materials Materials { get; set; }
    }
}
