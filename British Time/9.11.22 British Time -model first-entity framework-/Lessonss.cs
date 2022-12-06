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
    public partial class Lessonss : Form
    {
        public Lessonss()
        {
            InitializeComponent();
        }
        Model1Container con = new Model1Container();

        public void List()
        {
            dataGridView1.DataSource = con.LessonsSet.ToList();
        }
        private void Lessonss_Load(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            List();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Lessons save = new Lessons();
            save.Speech = textBox4.Text;
            save.BusinessEnglish = textBox3.Text;
            save.YDSCourse = textBox5.Text;
            save.ToeflCourse = textBox6.Text;
            save.IeltsCourse = textBox7.Text;
            save.StudentsStudentNo = Convert.ToInt32(textBox2.Text);
            save.TeachersTeacherNo = Convert.ToInt32(textBox1.Text);
            con.LessonsSet.Add(save);
            con.SaveChanges();
            List();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int up = Convert.ToInt32(textBox4.Tag);
            var update = con.LessonsSet.Where(x => x.LessonNo == up).FirstOrDefault();
            update.Speech = textBox4.Text;
            update.BusinessEnglish = textBox3.Text;
            update.YDSCourse = textBox5.Text;
            update.ToeflCourse = textBox6.Text;
            update.IeltsCourse = textBox7.Text;
            update.StudentsStudentNo = Convert.ToInt32(textBox2.Text);
            update.TeachersTeacherNo = Convert.ToInt32(textBox1.Text);
            con.SaveChanges();
            List();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow line = dataGridView1.CurrentRow;
            textBox4.Tag = line.Cells["LessonNo"].Value.ToString();
            textBox4.Text = line.Cells["Speech"].Value.ToString();
            textBox3.Text = line.Cells["BusinessEnglish"].Value.ToString();
            textBox5.Text = line.Cells["YDSCourse"].Value.ToString();
            textBox6.Text = line.Cells["ToeflCourse"].Value.ToString();
            textBox7.Text = line.Cells["IeltsCourse"].Value.ToString();
            textBox2.Text = line.Cells["StudentsStudentNo"].Value.ToString();
            textBox1.Text = line.Cells["TeachersTeacherNo"].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int up = Convert.ToInt32(textBox4.Tag);
            var delete = con.LessonsSet.Where(x => x.LessonNo == up).FirstOrDefault();
            con.LessonsSet.Remove(delete);
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
