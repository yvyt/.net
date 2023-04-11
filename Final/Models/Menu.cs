namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Linq;
    using System.Web.Mvc;

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

        [Required]
        [StringLength(50)]
        public string modifedBy { get; set; }

        public int? displayOrder { get; set; }

        public bool hide { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime dateBegin { get; set; }

        [Required]
        [StringLength(50)]
        public string createBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime dateModife { get; set; }

        public long? inner_menu { get; set; }
        public List<SelectListItem> GetMenuList()
        {
            ItJobDbContext db = new ItJobDbContext();
            var menus = db.Menus.ToList();
            var listItems = new List<SelectListItem>();
            foreach (var menu in menus)
            {
                listItems.Add(new SelectListItem()
                {
                    Text = menu.name,
                    Value = menu.id.ToString()
                });
            }
            return listItems;
        }
    }
}
