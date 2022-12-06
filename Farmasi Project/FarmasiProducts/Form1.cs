using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Text;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Entity;
using Facede;


namespace FarmasiProducts
{
    public partial class Form1 : Form
    {
        SqlConnection con = new SqlConnection("Server= DESKTOP-V44T9NQ\\SQLEXPRESS;Database=FarmasiProducts;Integrated Security=true;");
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
            groupBox2.Visible = false;
            groupBox1.Visible = true;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Visible = true;
            groupBox1.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            EStaffs StaffsAdd = new EStaffs();
            StaffsAdd.StaffNameSurname = textBox3.Text;
            StaffsAdd.StaffPassword = textBox4.Text;
            StaffsAdd.StaffMail = textBox5.Text;
            StaffsAdd.StaffPhone = Convert.ToInt32(textBox6.Text);
            FStaffs.StaffsAdd(StaffsAdd);
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }
       
        /*private bool SignIn(string name, string password)
        {
            var query = from p in Baglanti.SList where p.StaffNameSurname == name && p.StaffPassword == password select p;
            if (query.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
            textBox1.Clear();
            textBox2.Clear();
        }*/
        private void button1_Click(object sender, EventArgs e)
        {
            Category go = new Category();
            go.Show();
            this.Hide();
            /*con.Open();
            SqlCommand command = new SqlCommand("Select * From Staffs where " +
                "StaffNameSurname=@StaffNameSurname and StaffPassword=@StaffPassword", con);
            command.Parameters.AddWithValue("@StaffNameSurname", textBox1.Text);
            command.Parameters.AddWithValue("@StaffPassword", textBox2.Text);
            SqlDataAdapter dr = command.ExecuteReader();
            if (dr.Read())
            {
                MessageBox.Show("Login is successful.", "SUCCESSFUL", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Category go = new Category();
                go.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Username, surname or password is incorrect! Please try again.",
                    "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
            con.Close();
            */
        }
    }
}
