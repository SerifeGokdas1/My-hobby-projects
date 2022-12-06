using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Caffee_Poject
{
    public partial class Anasayfa : Form
    {
        SqlConnection con = new SqlConnection("Server=215-16\\SQLEXPRESS; Database=Kafe; uid=sa; pwd=Ibb2022#!");
        public Anasayfa()
        {
            InitializeComponent();
        }

        private void Anasayfa_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Ürünler go = new Ürünler();
            go.Show();
            this.Hide();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Siparişler go = new Siparişler();
            go.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();

        }
    }
}
