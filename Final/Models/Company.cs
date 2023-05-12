namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Company")]
    public partial class Company
    {
        public long id { get; set; }

        [StringLength(250)]
        public string name { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        [Required]
        [StringLength(250)]
        public string type { get; set; }

        [StringLength(250)]
        public string country { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string location { get; set; }

        [Required]
        [StringLength(250)]
        public string website { get; set; }

        [Column(TypeName = "ntext")]
        public string detail { get; set; }

        [StringLength(50)]
        public string contact { get; set; }

        public bool? hide { get; set; }

        public DateTime dateBegin { get; set; }

        public long createBy { get; set; }

        public DateTime dateModife { get; set; }

        public long modifedBy { get; set; }

        [StringLength(500)]
        public string image { get; set; }

        public bool? OT { get; set; }

        public int? employers { get; set; }

        public long userId { get; set; }

        public Company()
        {
        }

        public Company(string name, string meta, string type, string location, string website, DateTime dateBegin, long createBy, DateTime dateModife, long modifedBy, long userId)
        {
            this.name = name;
            this.meta = meta;
            this.type = type;
            this.country = "";
            this.location = location;
            this.website = website;
            this.detail = "";
            this.contact ="";
            this.hide = true;
            this.dateBegin = dateBegin;
            this.createBy = createBy;
            this.dateModife = dateModife;
            this.modifedBy = modifedBy;
            this.image = image;
            OT = false;
            this.employers = 0;
            this.userId = userId;
        }
    }
}
