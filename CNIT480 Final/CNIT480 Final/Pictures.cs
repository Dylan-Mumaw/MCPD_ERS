using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;
using SQLitePCL;

namespace CNIT480_Final {
    class Pictures {
        [PrimaryKey, AutoIncrement]
        public int PicID { get; set; }
        [ForeignKey("LocID")]
        public int LocID { get; set; }
        [MaxLength(25)]
        public string PicturePath { get; set; }
    }
}