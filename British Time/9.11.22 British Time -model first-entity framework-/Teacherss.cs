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
    public partial class Teacherss : Form
    {
        public Teacherss()
        {
            InitializeComponent();
        }
        Model1Container con = new Model1Container();

        public void List()
        {
            dataGridView1.DataSource = con.TeachersSet.ToList();
        }

        private void Teacherss_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            List();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Teachers save = new Teachers();
            save.TeacherName = textBox4.Text;
            save.TeacherPhone = textBox3.Text;
            save.TeacherMail = textBox5.Text;
            save.TeacherBranch = comboBox1.Text;
            con.TeachersSet.Add(save);
            con.SaveChanges();
            List();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Teachers save = new Teachers();
            save.TeacherName = textBox4.Text;
            save.TeacherPhone = textBox3.Text;
            save.TeacherMail = textBox5.Text;
            save.TeacherBranch = comboBox1.Text;
            con.TeachersSet.Add(save);
            con.SaveChanges();
            List();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow line = dataGridView1.CurrentRow;
            textBox4.Tag = line.Cells["TeacherNo"].Value.ToString();
            textBox4.Text = line.Cells["TeacherName"].Value.ToString();
            textBox3.Text = line.Cells["TeacherPhone"].Value.ToString();
            textBox5.Text = line.Cells["TeacherMail"].Value.ToString();
            comboBox1.Text = line.Cells["TeacherBranch"].Value.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int up = Convert.ToInt32(textBox4.Tag);
            var update = con.TeachersSet.Where(x => x.TeacherNo == up).FirstOrDefault();
            update.TeacherName = textBox4.Text;
            update.TeacherPhone = textBox3.Text;
            update.TeacherMail = textBox5.Text;
            update.TeacherBranch = comboBox1.Text;
            con.SaveChanges();
            List();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int up = Convert.ToInt32(textBox4.Tag);
            var delete = con.TeachersSet.Where(x => x.TeacherNo == up).FirstOrDefault();
            con.TeachersSet.Remove(delete);
            con.SaveChanges();
            List();
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
    }
}
