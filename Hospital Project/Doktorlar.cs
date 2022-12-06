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
    public partial class Doktorlar : Form
    {
        SqlConnection con = new SqlConnection("Server=215-16\\SQLEXPRESS; Database=OzelHastane; uid=sa; pwd=Ibb2022#!");
        public Doktorlar()
        {
            InitializeComponent();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Anasayfa go = new Anasayfa();
            go.Show();
            this.Hide();
        }

        private void Doktorlar_Load(object sender, EventArgs e)
        {

        }
        public void Goster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DoktorListele";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            Temizle();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Goster();
            
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DoktorEkle";          
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox1.Text);
            cmd.Parameters.AddWithValue("DoktorTCNo", textBox2.Text);
            cmd.Parameters.AddWithValue("UzmanlikAlani", textBox3.Text);
            cmd.Parameters.AddWithValue("Unvani", textBox4.Text);
            cmd.Parameters.AddWithValue("Telefon", maskedTextBox2.Text);
            cmd.Parameters.AddWithValue("Adres", textBox6.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox8.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Goster();
            Temizle();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DoktorYenile";
            cmd.Parameters.AddWithValue("DoktorNo", textBox5.Text);
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox1.Text);
            cmd.Parameters.AddWithValue("DoktorTCNo", textBox2.Text);
            cmd.Parameters.AddWithValue("UzmanlikAlani", textBox3.Text);
            cmd.Parameters.AddWithValue("Unvani", textBox4.Text);
            cmd.Parameters.AddWithValue("Telefon", maskedTextBox2.Text);
            cmd.Parameters.AddWithValue("Adres", textBox6.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox8.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Goster();
            Temizle();

        }

        private void button7_Click_1(object sender, EventArgs e)
        {

            Goster();
            
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

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox5.Text = satir.Cells["DoktorNo"].Value.ToString();
            textBox1.Text = satir.Cells["DoktorAdSoyad"].Value.ToString();
            textBox2.Text = satir.Cells["DoktorTCNo"].Value.ToString();
            textBox3.Text = satir.Cells["UzmanlikAlani"].Value.ToString();
            textBox4.Text = satir.Cells["Unvani"].Value.ToString();
            maskedTextBox2.Text = satir.Cells["Telefon"].Value.ToString();
            textBox6.Text = satir.Cells["Adres"].Value.ToString();
            maskedTextBox1.Text = satir.Cells["DogumTarihi"].Value.ToString();
            textBox8.Text = satir.Cells["PoliklinikNo"].Value.ToString();
        }
        public void Temizle()
        {
            textBox5.Clear();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            maskedTextBox2.Clear();
            textBox6.Clear();
            maskedTextBox1.Clear();
            textBox8.Clear();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorArama";
            komut.Parameters.AddWithValue("DoktorNo", textBox9.Text);
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
        }
    }
}
