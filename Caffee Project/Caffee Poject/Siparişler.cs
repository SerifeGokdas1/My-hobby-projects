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
    public partial class Siparişler : Form
    {
        SqlConnection con = new SqlConnection("Server=215-16\\SQLEXPRESS; Database=Kafe; uid=sa; pwd=Ibb2022#!");
        public Siparişler()
        {
            InitializeComponent();
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void Siparişler_Load(object sender, EventArgs e)
        {
            label4.Visible = false;
            textBox2.Visible = false;
            label5.Visible = false;

            con.Open();
            SqlCommand komut = new SqlCommand("select * from Urunler", con);
            //komut.Parameters.AddWithValue("@UrunNo", comboBox1.SelectedItem);
            SqlDataReader dr;
            dr = komut.ExecuteReader();
            while (dr.Read())
            {
             comboBox1.Items.Add(dr["UrunNo"]);
            }
            con.Close();

            



        }
        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            int fiyat = Convert.ToInt32(label10.Text);
            int adet = Convert.ToInt32(textBox3.Text);
            int tutar = fiyat * adet;
            textBox2.Text = tutar.ToString();

        }
        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("insert into Siparişler(SiparisAdi, SiparisAdres, UrunNo, SiparisAdet, SiparisTutari) values (@SiparisAdi, @SiparisAdres, @UrunNo, @SiparisAdet, @SiparisTutari)", con);
            komut.Parameters.AddWithValue("@SiparisAdi", textBox5.Text);
            komut.Parameters.AddWithValue("@SiparisAdres", textBox1.Text);
            komut.Parameters.AddWithValue("@UrunNo", comboBox1.Text);
            komut.Parameters.AddWithValue("@SiparisAdet", textBox3.Text);
            komut.Parameters.AddWithValue("@SiparisTutari", textBox2.Text);
            komut.ExecuteNonQuery();
            
            label4.Visible = true;
            textBox2.Visible = true;
            label5.Visible = true;
con.Close();
            
        }

        private void button3_Click(object sender, EventArgs e)
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

        private void button5_Click(object sender, EventArgs e)
        {
            Anasayfa go = new Anasayfa();
            go.Show();
            this.Hide();
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand yeni = new SqlCommand("select * from Urunler where UrunNo=@UrunNo", con);
            yeni.Parameters.AddWithValue("@UrunNo", comboBox1.SelectedItem);
            SqlDataReader dp;
            dp = yeni.ExecuteReader();
            while (dp.Read())
            {
                label10.Text = dp["UrunFiyati"].ToString();
            }
            con.Close();
            //con.Open();
            //SqlCommand komut = new SqlCommand("select * from Urunler where UrunNo=@UrunNo", con);
            //komut.Parameters.AddWithValue("@UrunNo", comboBox1.SelectedItem);
            //SqlDataReader dr;
            //dr = komut.ExecuteReader();
            //while (dr.Read())
            //{
            //    label10.Text = dr["UrunTutari"].ToString();
            //}
            //con.Close();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            //textBox2.Text = (Convert.ToInt32(textBox3.Text) * Convert.ToInt32(comboBox2.Text)).ToString();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {
            label4.Visible = false;
            textBox2.Visible = false;
            label5.Visible = false;
        }
        public void Method(String scode)
        {
            SqlDataAdapter dp = new SqlDataAdapter(scode, con);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Method("select * from Siparişler");
        }

        

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            label4.Visible = false;
            textBox2.Visible = false;
            label5.Visible = false;
        }
    }
}
