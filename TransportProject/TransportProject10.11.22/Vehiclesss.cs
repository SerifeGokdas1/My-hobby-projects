using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TransportProject10._11._22
{
    public partial class Vehiclesss : Form
    {
        public Vehiclesss()
        {
            InitializeComponent();
        }
        TransportEntities con = new TransportEntities();
        public void List()
        {
            dataGridView1.DataSource = con.VList();
        }
        private void Vehiclesss_Load(object sender, EventArgs e)
        {

        }
    }
}
