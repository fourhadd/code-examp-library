using System;
using System.IO;
using System.Windows.Forms;

namespace WinFormsApp1
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            string username = textBoxUsername.Text.Trim();
            string password = textBoxPassword.Text.Trim();

            if (!File.Exists("users.txt"))
            {
                MessageBox.Show("İstifadəçi yoxdur, əvvəlcə qeydiyyatdan keçin.");
                return;
            }

            bool found = false;
            string[] users = File.ReadAllLines("users.txt");
            foreach (string line in users)
            {
                string[] parts = line.Split(';');
                if (parts.Length == 2 && parts[0] == username && parts[1] == password)
                {
                    found = true;
                    Form1.nickname = username;
                    break;
                }
            }

            if (found)
            {
                Form3 libraryForm = new Form3();
                libraryForm.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("İstifadəçi tapılmadı!");
            }
        }

        private void labelRegister_Click(object sender, EventArgs e)
        {
            Form1 regForm = (Form1)Application.OpenForms["Form1"];
            if (regForm == null) regForm = new Form1();
            regForm.Show();
            this.Hide();
        }
    }
}
