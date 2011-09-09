using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebPortal
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            
            // Code that runs on application startup
           

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }
        int count_online = 0;
        int count_visit = 0;
        void Session_Start(object sender, EventArgs e)
        {                 
          //Kiểm tra file count_visit.txt nếu không tồn tại thì
            if (System.IO.File.Exists(Server.MapPath("count_visit.txt")) == false)
            {
                count_visit = 1;
            }
            // Ngược lại thì
            else
            {
                // Đọc dử liều từ file count_visit.txt
                System.IO.StreamReader read = new System.IO.StreamReader(Server.MapPath("count_visit.txt"));
                count_visit = int.Parse(read.ReadLine());
                read.Close();

                // Tăng biến count_visit thêm 1
                count_visit++;
            }

          // khóa website
          Application.Lock();
         
          // gán biến Application count_visit
          Application["count_visit"] = count_visit;
          
          // Mở khóa website
          Application.UnLock();
         
         // Lưu dử liệu vào file count_visit.txt
          System.IO.StreamWriter writer = new System.IO.StreamWriter(Server.MapPath("count_visit.txt"));
          writer.WriteLine(count_visit);
          writer.Close();

          if (System.IO.File.Exists(Server.MapPath("count_online.txt")) == false)
          {
              count_visit = 1;
          }

          else
          {

              System.IO.StreamReader read = new System.IO.StreamReader(Server.MapPath("count_online.txt"));
              count_visit = int.Parse(read.ReadLine());
              read.Close();


              count_online++;
          }

          // khóa website
          Application.Lock();


          Application["count_online"] = count_online;
          // Mở khóa website
          Application.UnLock();
          System.IO.StreamWriter writer2 = new System.IO.StreamWriter(Server.MapPath("count_online.txt"));
          writer2.WriteLine(count_visit);
          writer2.Close();
        }

        void Session_End(object sender, EventArgs e)            
        {
            try
            {
                count_online--;
                System.IO.StreamWriter writer2 = new System.IO.StreamWriter(Server.MapPath("count_online.txt"));
                writer2.WriteLine(count_visit);
                writer2.Close();
                Application["count_online"] = count_online;
            }
            catch
            { }
        }

    }
}
