namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Comment
    {
        public long id { get; set; }

        public long userId { get; set; }

        public long CompanyID { get; set; }

        [Column(TypeName = "ntext")]
        public string ContentComment { get; set; }

        public double? star { get; set; }
    }
}
