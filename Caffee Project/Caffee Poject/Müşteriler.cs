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
    public partial class Müşteriler : Form
    {
        SqlConnection con = new SqlConnection("Server=215-16\\SQLEXPRESS; Database=Kafe; uid=sa; pwd=Ibb2022#!");
        public void Method(String scode)
        {
            SqlDataAdapter dp = new SqlDataAdapter(scode, con);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        public Müşteriler()
        {
            InitializeComponent();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }

        private void Müşteriler_Load(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            Anasayfapersonel go = new Anasayfapersonel();
            go.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Anasayfapersonel go = new Anasayfapersonel();
            go.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            Method("select * from Kullanicilar");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Method("select * from Siparişler");
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }
    }
}
