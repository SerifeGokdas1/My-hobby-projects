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
    public partial class Hastalar : Form
    {
        SqlConnection con = new SqlConnection("Server=215-16\\SQLEXPRESS ; Database=OzelHastane; uid=sa; pwd=Ibb2022#!; ");
        public Hastalar()
        {
            InitializeComponent();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Anasayfa go = new Anasayfa();
            go.Show();
            this.Hide();
        }

        private void Hastalar_Load(object sender, EventArgs e)
        {

        }
        public void Goster()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HastaListele";
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
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HastaEkle";
            cmd.Parameters.AddWithValue("HastaTCNo", textBox1.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", textBox2.Text);
            cmd.Parameters.AddWithValue("Boy", textBox3.Text);
            cmd.Parameters.AddWithValue("Yas", textBox4.Text);
            cmd.Parameters.AddWithValue("Recete", textBox5.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox6.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", textBox7.Text);
            cmd.Parameters.AddWithValue("DoktorNo", textBox8.Text);
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
            cmd.CommandText = "HastaYenile";
            cmd.Parameters.AddWithValue("HastaNo", textBox9.Text);
            cmd.Parameters.AddWithValue("HastaTCNo", textBox1.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", textBox2.Text);
            cmd.Parameters.AddWithValue("Boy", textBox3.Text);
            cmd.Parameters.AddWithValue("Yas", textBox4.Text);
            cmd.Parameters.AddWithValue("Recete", textBox5.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox6.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", textBox7.Text);
            cmd.Parameters.AddWithValue("DoktorNo", textBox8.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            Goster();
            Temizle();
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
            textBox1.Text = satir.Cells["HastaTCNo"].Value.ToString();
            textBox2.Text = satir.Cells["DogumTarihi"].Value.ToString();
            textBox3.Text = satir.Cells["Boy"].Value.ToString();
            textBox4.Text = satir.Cells["Yas"].Value.ToString();
            textBox5.Text = satir.Cells["Recete"].Value.ToString();
            textBox6.Text = satir.Cells["RaporDurumu"].Value.ToString();
            textBox7.Text = satir.Cells["RandevuTarihi"].Value.ToString();
            textBox8.Text = satir.Cells["DoktorNo"].Value.ToString();
            textBox9.Text = satir.Cells["HastaNo"].Value.ToString();
        }
        public void Temizle()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaArama";
            komut.Parameters.AddWithValue("HastaNo", textBox9.Text);
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }
    }
}
