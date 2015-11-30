using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLyNhanSu
{
    public partial class formLogin : Form
    {
        public formLogin()
        {
            InitializeComponent();
        }
        private static string connectionString = QuanLyNhanSu.Properties.Settings.Default.QuanLyNhanSu;
        private static SqlConnection con= new SqlConnection(connectionString);
        private SqlDataAdapter da = new SqlDataAdapter();
        private DataTable dt = new DataTable();
        private void logInBut_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand();
            command.Connection = con;
            command.CommandType = CommandType.Text;
            command.CommandText = "Select username,pass from Login_user where (username=@user) and (pass=@pass)";
            command.Parameters.Add("@user", SqlDbType.NVarChar, 50).Value = uNameBox.Text;
            command.Parameters.Add("@pass", SqlDbType.NVarChar, 50).Value = pWordBox.Text;
            da.SelectCommand = command;
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                formManage ql = new formManage();
                ql.Show();
                Hide();
            }
            else
            {
                MessageBox.Show("Đăng nhập thất bại. Sai mật khẩu hoặc tên tài khoản");
            }

            
        }
    }
}
