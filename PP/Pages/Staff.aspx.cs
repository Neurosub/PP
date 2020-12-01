using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using PP.Classes;
using System.Net.Mail;
using System.Net;

namespace PP.Pages
{
    public partial class Staff : System.Web.UI.Page
    {
        private string QR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                QR = DBConnection.qrStaff;
                if (!IsPostBack)
                {
                    gvFill(QR);
                }
            }
        }
        private void gvFill(string qr)
        {
            sdsStaff.ConnectionString =
                DBConnection.connection.ConnectionString.ToString();
            sdsStaff.SelectCommand = qr;
            sdsStaff.DataSourceMode = SqlDataSourceMode.DataReader;
        }


        public string GetPass()
        {
            int[] arr = new int[12];
            Random rnd = new Random();
            string Password = "";
            string[] arr1 = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z", "b", "c", "d", "f", "g", "h", "j", "k", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z", "A", "E", "U", "Y", "a", "e", "i", "o", "u", "y" };
            for (int i = 0; i < arr.Length; i++)
            {
                Password += arr1[rnd.Next(0, 57)];
            }
            return Password;
        }


        protected void btInsert_Click(object sender, EventArgs e)
        {
            var Password = GetPass();
            int port = 587;
            DBConnection.IDStaff = 0;
            DBProcedures procedures = new DBProcedures();
            procedures.UsersRegistration(Convert.ToString(tbLogin.Text), Convert.ToString(Password), Convert.ToString(tbPosition.Text), Convert.ToString(tbSurname.Text), Convert.ToString(tbName.Text), Convert.ToString(tbMiddleName.Text), Convert.ToString(tbBirthDate.Text));
            Cleaner();
            gvFill(QR);
            bool enableSSL = true;
            string emailFrom = "bot.ordoweat@bk.ru"; /*(почта бота меил@bk.ru)*/ 
            string password = "pp.ordoweat.pp";
            string emailTo = tbEmail.Text; 
            string subject = "Ваши данные для входа:"; /*(заголовок сообщения)*/
            string log = "Ваш логин не изменился.";  /*это текст сообщения*/
            string pass = "Ваш пароль для входа в аккаунт: " + Password;
            string smtpAddress = "smtp.mail.ru";

            MailMessage mail = new MailMessage();

            mail.From = new MailAddress(emailFrom);
            mail.To.Add(emailTo);
            mail.Subject = subject;
            mail.Body = log + "\r\n" + pass;
            mail.IsBodyHtml = false;

            using (SmtpClient smtp = new SmtpClient(smtpAddress, port))
            {
                smtp.Credentials = new NetworkCredential(emailFrom, password);
                smtp.EnableSsl = enableSSL;
                smtp.Send(mail);
            }
            Response.Redirect("Waiting.aspx");
        }

        protected void Cleaner()
        {
            DBConnection.IDStaff = 0;
            tbLogin.Text = string.Empty;
            tbPassword.Text = string.Empty;
            tbSurname.Text = string.Empty;
            tbName.Text = string.Empty;
            tbMiddleName.Text = string.Empty;
            tbBirthDate.Text = string.Empty;

        }

    }
}