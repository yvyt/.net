using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Final.Models
{
    public partial class ItJobDbContext : DbContext
    {
        public ItJobDbContext()
            : base("name=Model2")
        {
        }

        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<BlogCategory> BlogCategories { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Footer> Footers { get; set; }
        public virtual DbSet<Job> Jobs { get; set; }
        public virtual DbSet<JobCategory> JobCategories { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<SubMenu> SubMenus { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserApply> UserApplies { get; set; }
        public virtual DbSet<Story> Stories { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Blog>()
                .Property(e => e.meta)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.createBy)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.modifedBy)
                .IsUnicode(false);

            modelBuilder.Entity<BlogCategory>()
                .Property(e => e.link)
                .IsUnicode(false);

            modelBuilder.Entity<BlogCategory>()
                .Property(e => e.meta)
                .IsUnicode(false);

            modelBuilder.Entity<BlogCategory>()
                .Property(e => e.createBy)
                .IsUnicode(false);

            modelBuilder.Entity<BlogCategory>()
                .Property(e => e.modifedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.meta)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.type)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.website)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.contact)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.createBy)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.modifedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.image)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .Property(e => e.salary)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Job>()
                .Property(e => e.meta)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .Property(e => e.createBy)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .Property(e => e.modifedBy)
                .IsUnicode(false);

            modelBuilder.Entity<JobCategory>()
                .Property(e => e.link)
                .IsUnicode(false);

            modelBuilder.Entity<JobCategory>()
                .Property(e => e.meta)
                .IsUnicode(false);

            modelBuilder.Entity<JobCategory>()
                .Property(e => e.createBy)
                .IsUnicode(false);

            modelBuilder.Entity<JobCategory>()
                .Property(e => e.modifedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Menu>()
                .Property(e => e.modifedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Menu>()
                .Property(e => e.createBy)
                .IsUnicode(false);

            modelBuilder.Entity<Slide>()
                .Property(e => e.createBy)
                .IsUnicode(false);

            modelBuilder.Entity<Slide>()
                .Property(e => e.modifedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Story>()
                .Property(e => e.meta)
                .IsUnicode(false);

            modelBuilder.Entity<Story>()
                .Property(e => e.createBy)
                .IsUnicode(false);

            modelBuilder.Entity<Story>()
                .Property(e => e.modifedBy)
                .IsUnicode(false);
        }
    }
}
