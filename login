using System;
using System.IO;
using System.Windows.Forms;

namespace WinFormsApp1
{
    public partial class Form2 : Form
    {
        private string usersDataFile = "users.txt";

        public Form2()
        {
            InitializeComponent();
            if (!File.Exists(usersDataFile))
                File.WriteAllText(usersDataFile, "");
        }

        // Dizayndakı button1 — Login
        private void button1_Click(object sender, EventArgs e)
        {
            string u = textBox1.Text.Trim();
            string p = textBox2.Text.Trim();
            bool found = false;

            string[] users = File.ReadAllLines(usersDataFile);
            foreach (string line in users)
            {
                string[] parts = line.Split(';');
                if (parts.Length == 2 && parts[0] == u && parts[1] == p)
                {
                    found = true;
                    Form1.nickname = u;
                    break;
                }
            }

            if (found)
            {
                Form3 libraryForm;
                if (Application.OpenForms["Form3"] != null)
                    libraryForm = (Form3)Application.OpenForms["Form3"];
                else
                    libraryForm = new Form3();

                libraryForm.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("User not found!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Dizayndakı label2 — Back to Register
        private void label2_Click(object sender, EventArgs e)
        {
            Form1 registerForm;
            if (Application.OpenForms["Form1"] != null)
                registerForm = (Form1)Application.OpenForms["Form1"];
            else
                registerForm = new Form1();

            registerForm.Show();
            this.Hide();
        }
    }
}
