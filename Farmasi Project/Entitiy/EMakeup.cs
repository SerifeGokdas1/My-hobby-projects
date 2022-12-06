using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class EMakeup
    {
        public int MakeupId { get; set; }
        public int CategoryId { get; set; }
        public string MakeupCategory { get; set; }
        public string MakeupType { get; set; }
        public string MakeupName { get; set; }
        public int MakeupCode { get; set; }
        public decimal MakeupPrice { get; set; }
        public string MakeupDescription { get; set; }

    }
}
