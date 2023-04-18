namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Footer")]
    public partial class Footer
    {
        public long id { get; set; }

        [Column(TypeName = "ntext")]
        public string contentF { get; set; }

        public bool? hide { get; set; }

        [StringLength(50)]
        public string type { get; set; }

        public int? columnIndex { get; set; }
    }
}
