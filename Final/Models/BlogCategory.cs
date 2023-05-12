namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BlogCategory")]
    public partial class BlogCategory
    {
        public long id { get; set; }

        [Required]
        [StringLength(250)]
        public string title { get; set; }

        [Required]
        [StringLength(500)]
        public string description { get; set; }

        [StringLength(250)]
        public string link { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        public int? displayOrder { get; set; }

        public bool? hide { get; set; }

        public DateTime dateBegin { get; set; }

        public long createBy { get; set; }

        public DateTime dateModife { get; set; }

        public long modifedBy { get; set; }

        public BlogCategory(string title, string description, string link, string meta, int? displayOrder, bool? hide, DateTime dateBegin, long createBy, DateTime dateModife, long modifedBy)
        {
            this.title = title;
            this.description = description;
            this.link = link;
            this.meta = meta;
            this.displayOrder = displayOrder;
            this.hide = hide;
            this.dateBegin = dateBegin;
            this.createBy = createBy;
            this.dateModife = dateModife;
            this.modifedBy = modifedBy;
        }

        public BlogCategory()
        {
        }
    }
}
