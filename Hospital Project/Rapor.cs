using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _31._10._22_Hastane_Project
{
    public partial class Rapor : Form
    {
        public Rapor()
        {
            InitializeComponent();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Anasayfa go = new Anasayfa();
            go.Show();
            this.Hide();
        }

        private void Rapor_Load(object sender, EventArgs e)
        {

        }
    }
}
