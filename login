using System;
using System.IO;
using System.Windows.Forms;

namespace WinFormsApp1
{
    public partial class Form2 : Form
    {
        string userFile = "users.txt";

        public Form2()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 form1 = (Form1)Application.OpenForms["Form1"];
            form1.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string u = textBox1.Text.Trim();
            string p = textBox2.Text.Trim();

            if (u == "" || p == "")
            {
                MessageBox.Show("Please enter username and password");
                return;
            }

            bool found = false;

            // Fayldan oxu
            string[] users = File.ReadAllLines(userFile);

            foreach (string line in users)
            {
                if (line.Trim() == "") continue;

                string[] parts = line.Split(';');  // username;password

                if (parts.Length == 2)
                {
                    string fileUser = parts[0];
                    string filePass = parts[1];

                    if (u == fileUser && p == filePass)
                    {
                        found = true;
                        Form1.nickname = u; // hazırda giriş edən user
                        break;
                    }
                }
            }

            if (found)
            {
                Form3 f3 = new Form3();
                f3.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("User not found");
            }
        }
    }
}
