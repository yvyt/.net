namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserApply")]
    public partial class UserApply
    {
        public long id { get; set; }

        public long userId { get; set; }

        public long jobId { get; set; }

        [Required]
        [StringLength(250)]
        public string cv { get; set; }

        public int status { get; set; }

        public DateTime dateApply { get; set; }
        public UserApply( long userId, long jobId, string cv, DateTime dateApply)
        {
            this.userId = userId;
            this.jobId = jobId;
            this.cv = cv;
            this.status = 0;
            this.dateApply = dateApply;
        }
        public UserApply() { }
    }
}
