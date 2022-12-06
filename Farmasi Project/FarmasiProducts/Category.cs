using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FarmasiProducts
{
    public partial class Category : Form
    {
        public Category()
        {
            InitializeComponent();
        }

        private void cATEGORYToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void mAKEUPToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Makeup go = new Makeup();
            go.Show();
            this.Hide();
        }

        private void pERSONELCAREToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PersonalCare go = new PersonalCare();
            go.Show();
            this.Hide();
        }

        private void pERFUMEToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Perfume go = new Perfume();
            go.Show();
            this.Hide();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }

        

        private void rEPORTToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            Report go = new Report();
            go.Show();
            this.Hide();
        }
    }
}
