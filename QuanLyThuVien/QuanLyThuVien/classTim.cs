using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien
{
    class classTim
    {
        public static classSach Tim(string id)
        {
            classSach res = null;
            //truy vấn csdl tìm sách theo id, nếu ko tìm được trả lại null
            res = connect.FindSach(id);
            return res;
        }
        public static  classDocGia TimDocGia(string id)
        {
            classDocGia res = null;
            res = connect.FindDocgia(id);
            return res;
        }
        
    }
}
