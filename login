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

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            string u = textBox1.Text.Trim();
            string p = textBox2.Text.Trim();

            if (!File.Exists(userFile))
            {
                MessageBox.Show("No users found!");
                return;
            }

            bool found = false;
            string[] users = File.ReadAllLines(userFile);

            foreach (string line in users)
            {
                string[] parts = line.Split(';');
                if (parts.Length == 2 && parts[0] == u && parts[1] == p)
                {
                    found = true;
                    Form1.nickname = u; // İstifadəçi adı
                    break;
                }
            }

            if (found)
            {
                Form3 library = new Form3();
                library.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Incorrect username or password!");
            }
        }

        private void labelRegister_Click(object sender, EventArgs e)
        {
            Form1 register = new Form1();
            register.Show();
            this.Hide();
        }
    }
}
