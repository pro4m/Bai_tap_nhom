using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien
{
    class classSua
    {
        public static bool Sua(classSach new_sach , string ID)
        {
            bool res = connect.editSach(new_sach, ID);
            // truy vẫn csdl , sửa sách có id = ID thành new_sach thành công return 1, ko thành công return 0
            return res; 
        }
        public static bool SuaDocGia(classDocGia new_dg, string ID)
        {
            bool res = connect.editDocgia(new_dg, ID);
            //truy van csdl theo id roi sua,sua khong thanh cong return 0
            return res;
        }
    }
}
