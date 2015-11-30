using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Windows.Forms;


namespace QuanLyNhanSu
{
    class connect
    {
        private static string connectionString = QuanLyNhanSu.Properties.Settings.Default.QuanLyNhanSu;
        private static SqlConnection con;
        
        public connect()
        {
            
        }
        public static bool isConnect()
        {
            connectionString = QuanLyNhanSu.Properties.Settings.Default.QuanLyNhanSu;
            con = new SqlConnection(connectionString);
            bool connect = false;
            try
            {
                con.Open();
                if (con.State == ConnectionState.Open)
                {
                    connect = true;
                }
               else
                {
                    throw new Exception("ko ket noi");
                }
            }
            catch (Exception ex)
            {
            }
            return connect;
        }
        public static DataTable LoadData(string name)
        {
            DataTable table = null;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                //com.CommandText = "select  from NHANVIEN";
                com.CommandText = "select * from NHANVIEN where HoTen= '" + name +"'";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                SqlDataAdapter adap = new SqlDataAdapter(com);
                table = new DataTable();
                adap.Fill(table);

            }
            return table;
        }
        public static bool insert(classNV s)
        {
            bool isInsert = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "Add_NV";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@hoten", s.hoten);
                com.Parameters.AddWithValue("@ngaysinh", s.ns);
                com.Parameters.AddWithValue("@quequan", s.quequan);
                com.Parameters.AddWithValue("@hesoluong", s.hesoluong);
                com.Parameters.AddWithValue("@maphong", s.donvi);
                com.Parameters.AddWithValue("@sodt", s.sodienthoai);
                com.Parameters.AddWithValue("@socmnd", s.socmnd);
                com.Connection = con;
                int i = com.ExecuteNonQuery();
                isInsert = i > 0 ? true : false;
            }
            return isInsert;
        }

       
        public static DataTable Find(string CMND)
        {
            DataTable table = null;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "select * from NHANVIEN where SoCMND= '" + CMND + "'";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                SqlDataAdapter adap = new SqlDataAdapter(com);
                table = new DataTable();
                adap.Fill(table);

            }
            return table;
        }

        public static bool edit(classNV s,string CMND)
        {
            bool isEdit = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "Edit_NV";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@_socmnd",CMND);
                com.Parameters.AddWithValue("@hoten", s.hoten);
                com.Parameters.AddWithValue("@ngaysinh", s.ns);
                com.Parameters.AddWithValue("@quequan", s.quequan);
                com.Parameters.AddWithValue("@hesoluong", s.hesoluong);
                com.Parameters.AddWithValue("@donvi", s.donvi);
                com.Parameters.AddWithValue("@sodt", s.sodienthoai);
                com.Connection = con;
                int i = com.ExecuteNonQuery();
                isEdit = i > 0 ? true : false;
            }
            return isEdit;
        }
        public static bool Delete(string CMND)
        {
            bool isDelete = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "Delete_NV ";
                com.CommandType = CommandType.StoredProcedure;
                com.Connection = con;
                com.Parameters.AddWithValue("@socmnd", CMND);
                int i = com.ExecuteNonQuery();
                isDelete = i > 0 ? true : false;
            }
            return isDelete;
        }
    }
}
