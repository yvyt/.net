namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Job")]
    public partial class Job
    {
        public long id { get; set; }

        [StringLength(250)]
        public string name { get; set; }

        [StringLength(250)]
        public string levelJ { get; set; }

        public int? quantity { get; set; }

        [Column(TypeName = "ntext")]
        public string description { get; set; }

        public decimal? salary { get; set; }

        public long categoryID { get; set; }

        public long companyID { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        [Column(TypeName = "ntext")]
        public string detail { get; set; }

        public bool? hide { get; set; }

        public DateTime? dateBegin { get; set; }

        public long createBy { get; set; }

        public DateTime dateModife { get; set; }

        public long modifedBy { get; set; }
    }
}
