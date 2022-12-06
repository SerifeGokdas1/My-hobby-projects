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
    public partial class Form1 : Form
    {
        SqlConnection con = new SqlConnection("Server=215-16\\SQLEXPRESS; Database=Kafe; uid=sa; pwd=Ibb2022#!");

        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("insert into Kullanicilar(KullaniciAdi, Sifre,Mail, Telefon) values (@KullaniciAdi, @Sifre, @Mail, @Telefon)", con);
            komut.Parameters.AddWithValue("KullaniciAdi", textBox1.Text);
            komut.Parameters.AddWithValue("Sifre", textBox2.Text);
            komut.Parameters.AddWithValue("Mail", textBox3.Text);
            komut.Parameters.AddWithValue("Telefon", maskedTextBox1.Text);
            komut.ExecuteNonQuery();
            con.Close();

            Form1 go = new Form1();
            go.Show();
            this.Hide();


        }

        private void maskedTextBox1_MaskInputRejected(object sender, MaskInputRejectedEventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand giris = new SqlCommand("select * from Kullanicilar where KullaniciAdi='"+textBox6.Text+"' and Sifre='"+textBox5.Text+"'", con);
            

            SqlDataReader dr;
            dr = giris.ExecuteReader();
            if (dr.Read())
            {
                MessageBox.Show("Tebrikler! Başarılı Bir Şekiide Giriş Yaptınız.");
                Anasayfa git = new Anasayfa();
                git.Show();
                this.Hide();
            } else
            {
                MessageBox.Show("Kullanıcı Adınız veya Şifreniz Hatalı! Tekrar Deneyiniz.");
                textBox6.Clear();
                textBox5.Clear();
            }
            con.Close();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand giris = new SqlCommand("select * from Personeller where PersonelAdi='"+textBox7.Text+"' and Sifre='"+textBox4.Text+"'", con);
            SqlDataReader dr;
            dr = giris.ExecuteReader();
            if (dr.Read())
            {
                MessageBox.Show("Tebrikler! Başarılı Bir Şekiide Giriş Yaptınız.");
                Anasayfapersonel git = new Anasayfapersonel();
                git.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Kullanıcı Adınız veya Şifreniz Hatalı! Tekrar Deneyiniz.");
                textBox7.Clear();
                textBox4.Clear();
            }
            con.Close();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
            groupBox2.Visible = true;
            groupBox3.Visible = true;

        }

        private void button4_Click(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
            groupBox3.Visible = false;
            groupBox1.Visible = true;
        }
    }
}
