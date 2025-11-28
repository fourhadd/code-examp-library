using System;
using System.IO;
using System.Windows.Forms;

namespace WinFormsApp1
{
    public partial class Form2 : Form
    {
        private string userFile = "users.txt";

        public Form2()
        {
            InitializeComponent();
            if (!File.Exists(userFile))
                File.WriteAllText(userFile, ""); // fayl yoxdursa yarat
        }

        private void label2_Click(object sender, EventArgs e)
        {
            // Registration formuna qayıt
            Form1 form1;
            if (Application.OpenForms["Form1"] != null)
                form1 = (Form1)Application.OpenForms["Form1"];
            else
                form1 = new Form1();

            form1.Show();
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string username = textBox1.Text.Trim();
            string password = textBox2.Text.Trim();

            if (username == "" || password == "")
            {
                MessageBox.Show("Please enter both username and password.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            bool found = false;

            string[] users = File.ReadAllLines(userFile);
            foreach (string line in users)
            {
                string[] parts = line.Split(';');
                if (parts.Length == 2 && parts[0] == username && parts[1] == password)
                {
                    found = true;
                    Form1.nickname = username; // İstifadəçi adı Form3 üçün
                    break;
                }
            }

            if (found)
            {
                Form3 form3 = new Form3();
                form3.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("User not found or incorrect password.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
