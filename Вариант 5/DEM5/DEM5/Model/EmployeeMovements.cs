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
    
    public partial class EmployeeMovements
    {
        public int MovementID { get; set; }
        public int EmployeeID { get; set; }
        public System.DateTime MovementTime { get; set; }
        public string MovementType { get; set; }
    
        public virtual Employees Employees { get; set; }
    }
}
