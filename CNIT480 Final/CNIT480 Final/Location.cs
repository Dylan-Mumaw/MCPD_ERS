using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace CNIT480_Final {
    class Location {
        [PrimaryKey, AutoIncrement]
        public int LocID { get; set; }
        [MaxLength(25)]
        public string Address { get; set; }
        [MaxLength(100)]
        public string Name { get; set; }
        [MaxLength(25)]
        public string Alias { get; set; }
    }
}