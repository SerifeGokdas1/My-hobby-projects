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
    public partial class Ürünlerpersonel : Form
    {
        SqlConnection con = new SqlConnection("Server=215-16\\SQLEXPRESS; Database=Kafe; uid=sa; pwd=Ibb2022#!");
        public Ürünlerpersonel()
        {
            InitializeComponent();
        }
        

        private void Ürünlerpersonel_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("select * from Personeller", con);
            //komut.Parameters.AddWithValue("@UrunNo", comboBox1.SelectedItem);
            SqlDataReader dr;
            dr = komut.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["PersonelNo"]);
            }
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("insert into Urunler(UrunAdi, UrunFiyati, KullanimTarihi, UretimTarihi, PersonelNo) values (@UrunAdi, @UrunFiyati, @KullanimTarihi, @UretimTarihi, @PersonelNo)", con);
            
            komut.Parameters.AddWithValue("@UrunAdi", textBox5.Text);
            komut.Parameters.AddWithValue("@UrunFiyati", textBox1.Text);
            komut.Parameters.AddWithValue("@KullanimTarihi", textBox3.Text);
            komut.Parameters.AddWithValue("@UretimTarihi", textBox4.Text);
            komut.Parameters.AddWithValue("@PersonelNo", comboBox1.Text);
            komut.ExecuteNonQuery();
            Method("select * from Urunler");            
            con.Close();
            



        }
        public void Method(string scode)
        {
            SqlDataAdapter dp = new SqlDataAdapter(scode, con);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Method("select * from Urunler");
            Temizle();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sil = new SqlCommand("delete from Urunler where UrunNo=@UrunNo", con);
            sil.Parameters.AddWithValue("@UrunNo", textBox6.Text);
            sil.ExecuteNonQuery();
            Method("select * from Urunler ");
            con.Close();

        }

        private void button7_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand guncelle = new SqlCommand("update Urunler set UrunAdi='" + textBox5.Text.ToString() + "',UrunFiyati='" + textBox1.Text.ToString() + "',KullanimTarihi='" + textBox3.Text.ToString() + "',UretimTarihi='" + textBox4.Text.ToString() + "',PersonelNo='" + comboBox1.Text.ToString() + "' where UrunNo=@UrunNo", con);
            guncelle.Parameters.AddWithValue("@UrunNo", textBox6.Text);
            guncelle.ExecuteNonQuery();
            Method("select * from Urunler ");
            con.Close();
            Temizle();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Anasayfapersonel go = new Anasayfapersonel();
            go.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Anasayfapersonel go = new Anasayfapersonel();
            go.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox6.Text = satir.Cells["UrunNo"].Value.ToString();
            textBox5.Text = satir.Cells["UrunAdi"].Value.ToString();
            textBox1.Text = satir.Cells["UrunFiyati"].Value.ToString();
            textBox3.Text = satir.Cells["KullanimTarihi"].Value.ToString();
            textBox4.Text = satir.Cells["UretimTarihi"].Value.ToString();
            comboBox1.Text = satir.Cells["PersonelNo"].Value.ToString();
        }
        public void Temizle()
        {
            textBox6.Clear();
            textBox5.Clear();
            textBox1.Clear();
            textBox3.Clear();
            textBox4.Clear();
            comboBox1.Items.Clear();


        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
