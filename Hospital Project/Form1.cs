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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
       
            SqlConnection con = new SqlConnection
        ("Server=215-16\\SQLEXPRESS; Database=OzelHastane; uid=sa; pwd=Ibb2022#!");
        
        


        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;

        }
       
        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "KullaniciEkle";
            cmd.Parameters.AddWithValue("KullaniciAdi", textBox3.Text);
            cmd.Parameters.AddWithValue("Sifre", textBox4.Text);
            cmd.Parameters.AddWithValue("Mail", textBox5.Text);
            cmd.Parameters.AddWithValue("Telefon", textBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            groupBox1.Visible = false;


        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "Giris";
            komut.Parameters.AddWithValue("KullaniciAdi", textBox1.Text);
            komut.Parameters.AddWithValue("Sifre", textBox2.Text);
            con.Open();
            SqlDataReader dr;
            dr = komut.ExecuteReader();

            if(dr.Read())
            {
                MessageBox.Show("Tebrikler! Başarılı Bir Şekilde Giriş Yaptınız. ");
                Anasayfa git = new Anasayfa();
                git.Show();
                this.Hide();
            } else
            {
                MessageBox.Show("Kullanıcı Adınız veya Şifreniz Hatalı. Kontrol Ediniz. ");
                textBox1.Clear();
                textBox2.Clear();
            }
            con.Close();


        }
    }
}
