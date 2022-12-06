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
    public partial class Customersss : Form
    {
        public Customersss()
        {
            InitializeComponent();
        }
        TransportEntities con = new TransportEntities();
        public void List()
        {
            dataGridView1.DataSource = con.CList();
        }
        private void Customersss_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Customer save = new Customer();
            save.CustomerNameSurname = textBox4.Text;
            save.Address = textBox3.Text;
            save.Phone = textBox5.Text;
            save.Mail = textBox1.Text;
            save.PaymentMethod = textBox6.Text;
            save.ShipmentId = Convert.ToInt32(comboBox1.Text);
            con.CAdd(save.CustomerNameSurname, save.Address, save.Phone, save.Mail, save.PaymentMethod, save.ShipmentId);
            con.SaveChanges();
        }

        private void button5_Click(object sender, EventArgs e)
        {

        }
    }
}
