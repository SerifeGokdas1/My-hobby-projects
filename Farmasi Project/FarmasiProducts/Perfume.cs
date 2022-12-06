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
    public partial class Perfume : Form
    {
        public Perfume()
        {
            InitializeComponent();
        }

        private void Perfume_Load(object sender, EventArgs e)
        {

        }
        private void List()
        {
            dataGridView1.DataSource = FPerfume.PerfumeList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            List();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            EPerfume add = new EPerfume();
            add.CategoryId = Convert.ToInt32(comboBox3.Text);
            add.PerfumeCategory = comboBox1.Text;
            add.PerfumeType = comboBox2.Text;
            add.PerfumeName = textBox2.Text;
            add.PerfumeCode = Convert.ToInt32(textBox3.Text);
            add.PerfumePrice = Convert.ToDecimal(textBox4.Text);
            add.PerfumeDescription = textBox5.Text;
            FPerfume.PerfumeAdd(add);
            List();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow line = dataGridView1.CurrentRow;
            comboBox3.Tag = line.Cells["PerfumeId"].Value.ToString();
            comboBox3.Text = line.Cells["CategoryId"].Value.ToString();
            comboBox1.Text = line.Cells["PerfumeCategory"].Value.ToString();
            comboBox2.Text = line.Cells["PerfumeType"].Value.ToString();
            textBox2.Text = line.Cells["PerfumeName"].Value.ToString();
            textBox3.Text = line.Cells["PerfumeCode"].Value.ToString();
            textBox4.Text = line.Cells["PerfumePrice"].Value.ToString();
            textBox5.Text = line.Cells["PerfumeDescription"].Value.ToString();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            EPerfume delete = new EPerfume();
            delete.PerfumeId = Convert.ToInt32(comboBox3.Tag);
            FPerfume.PerfumeDelete(delete);
            List();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            EPerfume update = new EPerfume();
            update.PerfumeId = Convert.ToInt32(comboBox3.Tag);
            update.CategoryId = Convert.ToInt32(comboBox3.Text);
            update.PerfumeCategory = comboBox1.Text;
            update.PerfumeType = comboBox2.Text;
            update.PerfumeName = textBox2.Text;
            update.PerfumeCode = Convert.ToInt32(textBox3.Text);
            update.PerfumePrice = Convert.ToDecimal(textBox4.Text);
            update.PerfumeDescription = textBox5.Text;
            FPerfume.PerfumeUpdate(update);
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
