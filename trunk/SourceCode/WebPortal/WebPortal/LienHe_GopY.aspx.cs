using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace WebPortal
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGui_Click(object sender, EventArgs e)
        {
            string chuoigui;
            chuoigui = txtNoiDung.Text;
            SendMail(txtEmail.Text, "Thông Tin Giỏ Hàng", chuoigui);
            lblStatus.Text = "Góp ý của bạn đã được gởi đi...";
            Response.Redirect("Default.aspx");

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }
        //ham gui mail
        public void SendMail(string to, string subject, string body)
        {
            try
            {
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.From = new MailAddress("mytrang1088@gmail.com");
                mail.To.Add(to);
                mail.Subject = subject;
                mail.Body = body;
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;

                //gui mail bang server cua mail
                //khoi tao Smtpclient
                SmtpClient client = new SmtpClient();
                client.Host = "smtp.gmail.com";
                //thuoc tinh credentials dung de dua thong tin dang nhap vao server SMTP
                client.Credentials = new System.Net.NetworkCredential("mytrang1088@gmail.com", "tinhyeucuatoi");
                client.EnableSsl = true;
                client.Send(mail);
            }
            catch
            {
            }
        }
    }
}