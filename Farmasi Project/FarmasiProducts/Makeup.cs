using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Entity;
using Facede;

namespace FarmasiProducts
{
    public partial class Makeup : Form
    {
        public Makeup()
        {
            InitializeComponent();
        }

        private void Makeup_Load(object sender, EventArgs e)
        {

        }
        private void List()
        {
            dataGridView1.DataSource = FMakeup.MakeupList();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            List();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            EMakeup add = new EMakeup();
            add.CategoryId = Convert.ToInt32(comboBox3.Text);
            add.MakeupCategory = comboBox1.Text;
            add.MakeupType = comboBox2.Text;
            add.MakeupName = textBox2.Text;
            add.MakeupCode = Convert.ToInt32(textBox3.Text);
            add.MakeupPrice= Convert.ToDecimal(textBox4.Text);
            add.MakeupDescription = textBox5.Text;
            FMakeup.MakeupAdd(add);
            List();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow line = dataGridView1.CurrentRow;
            comboBox3.Tag = line.Cells["MakeupId"].Value.ToString();
            comboBox3.Text = line.Cells["CategoryId"].Value.ToString();
            comboBox1.Text = line.Cells["MakeupCategory"].Value.ToString();
            comboBox2.Text = line.Cells["MakeupType"].Value.ToString();
            textBox2.Text = line.Cells["MakeupName"].Value.ToString();
            textBox3.Text = line.Cells["MakeupCode"].Value.ToString();
            textBox4.Text = line.Cells["MakeupPrice"].Value.ToString();
            textBox5.Text = line.Cells["MakeupDescription"].Value.ToString();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            EMakeup delete = new EMakeup();
            delete.MakeupId = Convert.ToInt32(comboBox3.Tag);
            FMakeup.MakeupDelete(delete);
            List();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            EMakeup update = new EMakeup();
            update.MakeupId = Convert.ToInt32(comboBox3.Tag);
            update.CategoryId = Convert.ToInt32(comboBox3.Text);
            update.MakeupCategory = comboBox1.Text;
            update.MakeupType = comboBox2.Text;
            update.MakeupName = textBox2.Text;
            update.MakeupCode = Convert.ToInt32(textBox3.Text);
            update.MakeupPrice = Convert.ToDecimal(textBox4.Text);
            update.MakeupDescription = textBox5.Text;
            FMakeup.MakeupUpdate(update);
            List();

        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Category go = new Category();
            go.Show();
            this.Hide();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
                   
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
           /* SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select * from Categorys";
            cmd.CommandType = CommandType.Text;
            cmd.Connection.Open();
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["CategoryName"]);
            }
            cmd.Connection.Close();
            List();*/
        }
    }
}
