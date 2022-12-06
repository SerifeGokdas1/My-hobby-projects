using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public  class EPerfume
    {
        public int PerfumeId { get; set; }
        public int CategoryId { get; set; }
        public string PerfumeCategory { get; set; }
        public string PerfumeType { get; set; }
        public string PerfumeName { get; set; }
        public int PerfumeCode { get; set; }
        public decimal PerfumePrice { get; set; }
        public string PerfumeDescription { get; set; }
    }
}
