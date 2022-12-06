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
    public partial class Anasayfa : Form
    {
        public Anasayfa()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            


        }

        private void button1_Click(object sender, EventArgs e)
        {
            Poliklinikler go = new Poliklinikler();
            go.Show();
            this.Hide();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Doktorlar go = new Doktorlar();
            go.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Hastalar go = new Hastalar();
            go.Show();
            this.Hide();

        }

        private void Anasayfa_Load(object sender, EventArgs e)
        {

        }
    }
}
