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

namespace _31._10._22_Hastane_Project
{
    public partial class Poliklinikler : Form
    {

        SqlConnection con = new SqlConnection
    ("Server=215-16\\SQLEXPRESS; Database=OzelHastane; uid=sa; pwd=Ibb2022#!");
        public Poliklinikler()
        {
            InitializeComponent();
        }

        private void Poliklinikler_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PoliklinikYenile";
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox1.Text);
            cmd.Parameters.AddWithValue("PoliklinikAdi", textBox2.Text);
            cmd.Parameters.AddWithValue("UzmanSayisi", textBox3.Text);
            cmd.Parameters.AddWithValue("Baskani", textBox4.Text);
            cmd.Parameters.AddWithValue("BasHemsiresi", textBox5.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Göster();
            VeriGozukmesin();

        }
        public void Göster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PoliklinikListele";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            VeriGozukmesin();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Göster();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PoliklinikEkle";
            cmd.Parameters.AddWithValue("PoliklinikAdi", textBox2.Text);
            cmd.Parameters.AddWithValue("UzmanSayisi", textBox3.Text);
            cmd.Parameters.AddWithValue("Baskani", textBox4.Text);
            cmd.Parameters.AddWithValue("BasHemsiresi", textBox5.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Göster();
            VeriGozukmesin();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Anasayfa go = new Anasayfa();
            go.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();

        }

        private void button6_Click(object sender, EventArgs e)
        {
            Anasayfa go = new Anasayfa();
            go.Show();
            this.Hide();

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["PoliklinikNo"].Value.ToString();
            textBox2.Text = satir.Cells["PoliklinikAdi"].Value.ToString();
            textBox3.Text = satir.Cells["UzmanSayisi"].Value.ToString();
            textBox4.Text = satir.Cells["Baskani"].Value.ToString();
            textBox5.Text = satir.Cells["BasHemsiresi"].Value.ToString();
            textBox6.Text = satir.Cells["YatakSayisi"].Value.ToString();
            
        }
        public void VeriGozukmesin()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }
    }
}
