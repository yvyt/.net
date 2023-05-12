namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Blog")]
    public partial class Blog
    {
        public long id { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        [StringLength(500)]
        public string title { get; set; }

        [Column(TypeName = "ntext")]
        public string content_story { get; set; }

        public long? CategoryId { get; set; }

        public int? displayOrder { get; set; }

        public bool? hide { get; set; }

        public DateTime dateBegin { get; set; }

        public long createBy { get; set; }

        public DateTime dateModife { get; set; }

        public long modifedBy { get; set; }

        public Blog(string meta, string title, string content_story, long? categoryId, int? displayOrder, bool? hide, DateTime dateBegin, long createBy, DateTime dateModife, long modifedBy)
        {
            this.meta = meta;
            this.title = title;
            this.content_story = content_story;
            CategoryId = categoryId;
            this.displayOrder = displayOrder;
            this.hide = hide;
            this.dateBegin = dateBegin;
            this.createBy = createBy;
            this.dateModife = dateModife;
            this.modifedBy = modifedBy;
        }
        public Blog() { }
    }
}
