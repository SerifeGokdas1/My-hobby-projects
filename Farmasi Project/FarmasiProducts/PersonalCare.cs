using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Entity;
using Facede;

namespace FarmasiProducts
{
    public partial class PersonalCare : Form
    {
        public PersonalCare()
        {
            InitializeComponent();
        }

        private void PersonalCare_Load(object sender, EventArgs e)
        {

        }
        private void List()
        {
            dataGridView1.DataSource = FPersonelCare.PersonelCareList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            List();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            EPersonelCare add = new EPersonelCare();
            add.CategoryId = Convert.ToInt32(comboBox3.Text);
            add.PersonelCareCategory = comboBox1.Text;
            add.PersonelCareType = comboBox2.Text;
            add.PersonelCareName = textBox2.Text;
            add.PersonelCareCode = Convert.ToInt32(textBox3.Text);
            add.PersonelCarePrice = Convert.ToDecimal(textBox4.Text);
            add.PersonelCareDescription = textBox5.Text;
            FPersonelCare.PersonelCareAdd(add);
            List();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            EPersonelCare delete = new EPersonelCare();
            delete.PersonelCareId = Convert.ToInt32(comboBox3.Tag);
            FPersonelCare.PersonelCareDelete(delete); 
            List();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow line = dataGridView1.CurrentRow;
            comboBox3.Tag = line.Cells["PersonelCareId"].Value.ToString();
            comboBox3.Text = line.Cells["CategoryId"].Value.ToString();
            comboBox1.Text = line.Cells["PersonelCareCategory"].Value.ToString();
            comboBox2.Text = line.Cells["PersonelCareType"].Value.ToString();
            textBox2.Text = line.Cells["PersonelCareName"].Value.ToString();
            textBox3.Text = line.Cells["PersonelCareCode"].Value.ToString();
            textBox4.Text = line.Cells["PersonelCarePrice"].Value.ToString();
            textBox5.Text = line.Cells["PersonelCareDescription"].Value.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            EPersonelCare update = new EPersonelCare();
            update.PersonelCareId = Convert.ToInt32(comboBox3.Tag);
            update.CategoryId = Convert.ToInt32(comboBox3.Text);
            update.PersonelCareCategory = comboBox1.Text;
            update.PersonelCareType = comboBox2.Text;
            update.PersonelCareName = textBox2.Text;
            update.PersonelCareCode = Convert.ToInt32(textBox3.Text);
            update.PersonelCarePrice = Convert.ToDecimal(textBox4.Text);
            update.PersonelCareDescription = textBox5.Text;
            FPersonelCare.PersonelCareUpdate(update);
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
    }
}
