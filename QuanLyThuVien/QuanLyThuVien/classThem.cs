using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien
{
    class classThem
    {
        public static bool Them(classSach sach)
        {
           bool res = connect.insertSach(sach) ;
            //truy vấn csdl thêm sách mới, nếu thêm thành công return 1, không thành công return 0;
            return res ;
        }
        public static bool ThemDocGia(classDocGia doc_gia)
        {
            bool res ;
            res = connect.insertDocGia(doc_gia);
            //truy van csdl them doc gia, thanh cong return 1, khong thanh cong return 0
            return res ;
        }
    }
}
