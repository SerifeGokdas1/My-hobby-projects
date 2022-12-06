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
    public partial class Shipmentsss : Form
    {
        public Shipmentsss()
        {
            InitializeComponent();
        }
        TransportEntities con = new TransportEntities();
        public void List()
        {
            dataGridView1.DataSource = con.SList();
        }
        private void Shipmentsss_Load(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            HomePage go = new HomePage();
            go.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox4.Tag = satir.Cells["ShipmentId"].Value.ToString();
            textBox4.Text = satir.Cells["ShipmentName"].Value.ToString();
            textBox3.Text = satir.Cells["ShippingConsigneeAddress"].Value.ToString();
            textBox5.Text = satir.Cells["ShippingSenderAddress"].Value.ToString();
            textBox1.Text = satir.Cells["Distance"].Value.ToString();
            textBox6.Text = satir.Cells["DistanceAmount"].Value.ToString();
            comboBox1.SelectedItem = satir.Cells["EmployeeId"].Value.ToString();
            comboBox2.SelectedItem = satir.Cells["VehicleId"].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Shipment save = new Shipment();
            save.ShipmentName = textBox4.Text;
            save.ShippingConsigneeAddress = textBox3.Text;
            save.ShippingSenderAddress = textBox5.Text;
            save.Distance = Convert.ToInt32(textBox1.Text);
            save.DistanceAmount = Convert.ToInt32(textBox6.Text);
            save.EmployeeId = Convert.ToInt32(comboBox1.Text);
            save.VehicleId = Convert.ToInt32(comboBox2.Text);
            con.SAdd(save.ShipmentName, save.ShippingConsigneeAddress, save.ShippingSenderAddress, save.Distance, save.DistanceAmount, save.EmployeeId, save.VehicleId);
            con.SaveChanges();
            List();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            List();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Shipment save = new Shipment();
            textBox4.Tag = save.ShipmentId;
            textBox4.Text = save.ShipmentName;
            textBox3.Text=save.ShippingConsigneeAddress;
            textBox5.Text = save.ShippingSenderAddress;
            textBox1.Text=save.Distance;
            save.DistanceAmount = Convert.ToInt32(textBox6.Text);
            save.EmployeeId = Convert.ToInt32(comboBox1.Text);
            save.VehicleId = Convert.ToInt32(comboBox2.Text);
            con.SAdd(save.ShipmentName, save.ShippingConsigneeAddress, save.ShippingSenderAddress, save.Distance, save.DistanceAmount, save.EmployeeId, save.VehicleId);
            con.SaveChanges();
            List();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
