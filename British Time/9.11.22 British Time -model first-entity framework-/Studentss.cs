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
    public partial class Studentss : Form
    {
        public Studentss()
        {
            InitializeComponent();
        }
        Model1Container con = new Model1Container();
        public void List()
        {
            dataGridView1.DataSource = con.StudentsSet.ToList();
        }

        private void Studentss_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            List();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Students save = new Students();
            save.StudentName = textBox4.Text;
            save.StudentPhone = textBox3.Text;
            save.StudentMail = textBox5.Text;
            save.TeachersTeacherNo = Convert.ToInt32(comboBox1.Text);
            con.StudentsSet.Add(save);
            con.SaveChanges();
            List();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int up = Convert.ToInt32(textBox4.Tag);
            var update = con.StudentsSet.Where(x => x.StudentNo == up).FirstOrDefault();
            update.StudentName = textBox4.Text;
            update.StudentPhone = textBox3.Text;
            update.StudentMail = textBox5.Text;
            update.TeachersTeacherNo = Convert.ToInt32(comboBox1.Text);
            con.SaveChanges();
            List();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int up = Convert.ToInt32(textBox4.Tag);
            var delete = con.StudentsSet.Where(x => x.StudentNo == up).FirstOrDefault();
            con.StudentsSet.Remove(delete);
            con.SaveChanges();
            List();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow linee = dataGridView1.CurrentRow;
            textBox4.Tag = linee.Cells["StudentNo"].Value.ToString();
            textBox4.Text = linee.Cells["StudentName"].Value.ToString();
            textBox3.Text = linee.Cells["StudentPhone"].Value.ToString();
            textBox5.Text = linee.Cells["StudentMail"].Value.ToString();
            comboBox1.Text = linee.Cells["TeachersTeacherNo"].Value.ToString();
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
