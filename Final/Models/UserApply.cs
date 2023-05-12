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
        private DateTime today;

        
        public long id { get; set; }

        public long userId { get; set; }

        public long jobId { get; set; }

        [Required]
        [StringLength(250)]
        public string cv { get; set; }

        public int status { get; set; }

        public DateTime dateApply { get; set; }
        public UserApply(long userId, long jobId, string cv, DateTime today)
        {
            this.userId = userId;
            this.jobId = jobId;
            this.cv = cv;
            this.status = 0;
            this.today = today;
        }
        public UserApply() { }

    }
}
