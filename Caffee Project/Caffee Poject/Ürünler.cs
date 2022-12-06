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
    public partial class Ürünler : Form
    {
        SqlConnection con = new SqlConnection("Server=215-16\\SQLEXPRESS; Database=Kafe; uid=sa; pwd=Ibb2022#!");

        public void Method(String scode)
        {
            SqlDataAdapter dp = new SqlDataAdapter(scode, con);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        public Ürünler()
        {
            InitializeComponent();
        }

        private void Ürünler_Load(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Method("select * from Urunler");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Siparişler go = new Siparişler();
            go.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Anasayfa go = new Anasayfa();
            go.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Anasayfa go = new Anasayfa();
            go.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
