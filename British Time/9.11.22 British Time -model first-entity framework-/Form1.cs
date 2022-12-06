using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _9._11._22_British_Time__model_first_entity_framework_
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        Model1Container con = new Model1Container();

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false; 
            groupBox1.Visible = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Staffs save = new Staffs();
            save.StaffName = textBox4.Text;
            save.StaffMail = textBox3.Text;
            save.StaffPassword = textBox6.Text;
            save.StaffPhone = (Convert.ToInt32(textBox7.Text));
            con.StaffsSet.Add(save);
            con.SaveChanges();
            groupBox2.Visible = false;
            groupBox1.Visible = true;

        }
        private bool SignIn(string Name, String Password)
        {
            var query = from p in con.StaffsSet where p.StaffName == Name && p.StaffPassword == Password select p;
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
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (SignIn(textBox1.Text,textBox2.Text))
            {
                HomePage go = new HomePage();
                go.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Staff Name or Staff Password is incorrect!");
            }

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Visible = true;
            groupBox1.Visible = false;
        }
    }
}
