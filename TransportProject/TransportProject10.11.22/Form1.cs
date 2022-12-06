using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TransportProject10._11._22
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        TransportEntities con = new TransportEntities();
        private bool LogIn(string name, string password)
        {
            var query = from p in con.Employees where p.EmployeeName == name && p.EmployeePassword == password select p;

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

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
            groupBox2.Visible = false;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
            groupBox2.Visible = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Employee save = new Employee();
            save.EmployeeName = textBox5.Text;
            save.EmployeeSurname = textBox4.Text;
            save.EmployeePassword = textBox3.Text;
            save.EmployeeMail = textBox6.Text;
            save.EmployeePhone = Convert.ToInt32(textBox7.Text);
            con.EAdd(save.EmployeeName, save.EmployeeSurname, save.EmployeePassword, save.EmployeeMail, save.EmployeePhone);
            con.SaveChanges();
            groupBox1.Visible = true;
            groupBox2.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (LogIn(textBox1.Text, textBox2.Text))
            {
                HomePage GO = new HomePage();
                GO.Show();
                this.Hide();
            }
            else{
                MessageBox.Show("Employee name or password is incorrect.");
            }
        }
    }
}
