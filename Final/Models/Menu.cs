namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Menu")]
    public partial class Menu
    {
        public long id { get; set; }

        [StringLength(250)]
        public string name { get; set; }

        [StringLength(250)]
        public string link { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        public long modifedBy { get; set; }

        public int? displayOrder { get; set; }

        public bool hide { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime dateBegin { get; set; }

        public long createBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime dateModife { get; set; }

        public long? inner_menu { get; set; }
    }
}
