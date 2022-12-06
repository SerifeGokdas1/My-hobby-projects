using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class EPersonelCare
    {
        public int PersonelCareId { get; set; }
        public int CategoryId { get; set; }
        public string PersonelCareCategory { get; set; }
        public string PersonelCareType { get; set; }
        public string PersonelCareName { get; set; }
        public int PersonelCareCode { get; set; }
        public decimal PersonelCarePrice { get; set; }
        public string PersonelCareDescription { get; set; }
    }
}
