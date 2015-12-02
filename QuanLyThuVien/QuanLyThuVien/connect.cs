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

namespace QuanLyThuVien
{
    class connect
    {
        private static string connectionString = QuanLyThuVien.Properties.Settings.Default.QuanLyThuVien;
        private static SqlConnection con;

        public connect()
        {

        }
        public static bool isConnect()
        {
            connectionString = QuanLyThuVien.Properties.Settings.Default.QuanLyThuVien;
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
                com.CommandText = "select * from ThongTinMuon where MaDocGia= '" + name + "'";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                SqlDataAdapter adap = new SqlDataAdapter(com);
                table = new DataTable();
                adap.Fill(table);

            }
            return table;
        }

        public static DataTable LoadFullData()
        {
            DataTable table = null;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                //com.CommandText = "select  from NHANVIEN";
                com.CommandText = "select * from ThongTinMuon" ;
                com.CommandType = CommandType.Text;
                com.Connection = con;
                SqlDataAdapter adap = new SqlDataAdapter(com);
                table = new DataTable();
                adap.Fill(table);

            }
            return table;
        }

        public static bool insertSach(classSach s)
        {
            bool isInsert = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "Add_Book";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ten", s.Ten);
                com.Parameters.AddWithValue("@tacGia", s.TacGia);
                com.Parameters.AddWithValue("@sl", s.sl);
                com.Connection = con;
                int i = com.ExecuteNonQuery();
                isInsert = i > 0 ? true : false;
            }
            return isInsert;
        }

        public static classSach FindSach(string Ma)
        {
            classSach s=new classSach();
            DataTable table = null;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "select * from Sach where MaSach= '" + Ma + "'";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                SqlDataAdapter adap = new SqlDataAdapter(com);
                table = new DataTable();
                adap.Fill(table);
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    s.Ten = dr[1].ToString().Trim();
                    s.TacGia = dr[2].ToString().Trim();
                    s.sl = Convert.ToInt16(dr[3]);
                }
            }
            return s;
        }

        public static bool editSach(classSach s, string MaSach)
        {
            bool isEdit = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "update Sach set TenSach=@ten,TacGia=@Tg,SoLuong=@SL where MaSach=@MaSach";
                com.CommandType = CommandType.Text;
                com.Parameters.AddWithValue("@ten", s.Ten);
                com.Parameters.AddWithValue("@Tg", s.TacGia);
                com.Parameters.AddWithValue("@SL", s.sl);
                com.Parameters.AddWithValue("@MaSach", MaSach);
                com.Connection = con;
                int i = com.ExecuteNonQuery();
                isEdit = i > 0 ? true : false;
            }
            return isEdit;
        }
        public static bool DeleteSach(string MaSach)
        {
            bool isDelete = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "Delete from Sach where MaSach=@ma";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                com.Parameters.AddWithValue("@ma",MaSach);
                int i = com.ExecuteNonQuery();
                isDelete = i > 0 ? true : false;
            }
            return isDelete;
        }

        public static bool insertDocGia(classDocGia s)
        {
            bool isInsert = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "Add_DocGia";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ten", s.ten);
                com.Parameters.AddWithValue("@tgbd", s.tgbd);
                com.Parameters.AddWithValue("@tgkt", s.tgkt);
                com.Parameters.AddWithValue("@dv", s.donvi);
                com.Connection = con;
                int i = com.ExecuteNonQuery();
                isInsert = i > 0 ? true : false;
            }
            return isInsert;
        }

        public static classDocGia FindDocgia(string Ma)
        {
            classDocGia s = new classDocGia();
            DataTable table = null;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "select * from docgia where Madocgia= '" + Ma + "'";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                SqlDataAdapter adap = new SqlDataAdapter(com);
                table = new DataTable();
                adap.Fill(table);
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    s.ten = dr[1].ToString().Trim();
                    s.tgbd = Convert.ToDateTime(dr[2]);
                    s.tgkt = Convert.ToDateTime(dr[3]);
                    s.donvi = dr[4].ToString();

                }
            }
            return s;
        }

        public static bool editDocgia(classDocGia s, string id)
        {
            bool isEdit = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "update DocGia set Ten=@ten,ngaybatdau=@nbd,ngayketthuc=@nkt,donvi=@dv where Madocgia=@id";
                com.CommandType = CommandType.Text;
                com.Parameters.AddWithValue("@ten", s.ten);
                com.Parameters.AddWithValue("@nbd", s.tgbd);
                com.Parameters.AddWithValue("@nkt", s.tgkt);
                com.Parameters.AddWithValue("@dv", s.donvi);
                com.Parameters.AddWithValue("@id", id);
                com.Connection = con;
                int i = com.ExecuteNonQuery();
                isEdit = i > 0 ? true : false;
            }
            return isEdit;
        }
        public static bool DeleteDocgia(string id)
        {
            bool isDelete = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "Delete from Docgia where Madocgia=@ma";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                com.Parameters.AddWithValue("@ma", id);
                int i = com.ExecuteNonQuery();
                isDelete = i > 0 ? true : false;
            }
            return isDelete;
        }

        public static bool Muon(string ma,string id)
        {
            bool muon = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "insert into ThongTinMuon(MaSach,MaDocGia,NgayMuon) values(@ma,@id,@ngaymuon)";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                com.Parameters.AddWithValue("@ma", ma);
                com.Parameters.AddWithValue("@id",id);
                com.Parameters.AddWithValue("@ngaymuon", DateTime.Now);
                int i = com.ExecuteNonQuery();
                muon = i > 0 ? true : false;
            }
            return muon;
        }
        public static bool Tra(string ma, string id)
        {
            bool tra = false;
            if (isConnect())
            {
                SqlCommand com = new SqlCommand();
                com.CommandText = "insert into ThongTinMuon(MaSach,MaDocGia,NgayTra) values(@ma,@id,@ngaytra)";
                com.CommandType = CommandType.Text;
                com.Connection = con;
                com.Parameters.AddWithValue("@ma", ma);
                com.Parameters.AddWithValue("@id", id);
                com.Parameters.AddWithValue("@ngaytra", DateTime.Now);
                int i = com.ExecuteNonQuery();
                tra = i > 0 ? true : false;
            }
            return tra;
        }
    }
}

