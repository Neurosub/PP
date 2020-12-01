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
    public partial class Status : System.Web.UI.Page
    {
        private string QR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                QR = DBConnection.qrStatus;
                if (!IsPostBack)
                {
                    gvFill(QR);
                }
            }
        }
        private void gvFill(string qr)
        {
            sdsStatus.ConnectionString =
                DBConnection.connection.ConnectionString.ToString();
            sdsStatus.SelectCommand = qr;
            sdsStatus.DataSourceMode = SqlDataSourceMode.DataReader;
            gvStatus.DataSource = sdsStatus;
            gvStatus.DataBind();
        }
        //надо
        protected void gvStatus_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvStatus, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Нажмите, чтобы выбрать запись";
            }
        }

        protected void btInsert_Click(object sender, EventArgs e)
        {
            DBConnection.IDStatus = 0;
            DBProcedures procedures = new DBProcedures();
            procedures.spStatus_insert(Convert.ToString(tbName.Text));
            Cleaner();
            gvFill(QR);
        }
        protected void btUpdate_Click(object sender, EventArgs e)
        {
            DBProcedures procedures = new DBProcedures();
            procedures.spStatus_update(DBConnection.IDStatus, Convert.ToString(tbName.Text));
            Cleaner();
            gvFill(QR);
        }
        protected void Cleaner()
        {
            DBConnection.IDStatus = 0;
            tbName.Text = string.Empty;
        }
        //надо
        protected void gvStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvStatus.Rows)
            {
                if (row.RowIndex == gvStatus.SelectedIndex)
                {
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.ToolTip = "Нажмите, чтобы выбрать запись";
                }
            }
            GridViewRow roww = gvStatus.SelectedRow;
            tbName.Text = roww.Cells[2].Text.ToString();
            DBConnection.IDStatus = Convert.ToInt32(roww.Cells[1].Text.ToString());
        }
        protected void gvStatus_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Index = Convert.ToInt32(e.RowIndex);
                DBProcedures procedures = new DBProcedures();
                GridViewRow rows = gvStatus.SelectedRow;
                DBConnection.IDStatus = Convert.ToInt32(gvStatus.Rows[Index].Cells[1].Text.ToString());
                procedures.spStatus_delete(DBConnection.IDStatus);
                gvFill(QR);
                Cleaner();
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Не удалось удалить запись :(')", true);
            }
        }

        protected void btSendHelp_Click(object sender, EventArgs e)
        {
            int port = 587;
            bool enableSSL = true;

            string emailFrom = "bot.ordoweat@bk.ru"; /*(почта бота меил@bk.ru)*/
            string password = "pp.ordoweat.pp";
            string emailTo = "bot.ordoweat@bk.ru";
            string subject = tbNameHelp.Text; /*(заголовок сообщения)*/
            string title = "От:  " + tbNameHelp.Text.ToString();  /*это текст сообщения*/
            string from = "Почта:  " + tbMailHelp.Text;
            string message = "Возникшая проблема:  " + tbHelp.Text;
            string smtpAddress = "smtp.mail.ru";
            MailMessage mail = new MailMessage();

            mail.From = new MailAddress(emailFrom);
            mail.To.Add(emailTo);
            mail.Subject = subject;
            mail.Body = title + "\r\n" + from + "\r\n" + message;
            mail.IsBodyHtml = false;

            using (SmtpClient smtp = new SmtpClient(smtpAddress, port))
            {
                smtp.Credentials = new NetworkCredential(emailFrom, password);
                smtp.EnableSsl = enableSSL;
                smtp.Send(mail);
            }

            Cleaner1();
            Response.Redirect(Request.Url.AbsoluteUri);

        }

     
        protected void Cleaner1()
        {

            tbNameHelp.Text = string.Empty;
            tbMailHelp.Text = string.Empty;
            tbHelp.Text = string.Empty;

        }
    }
}
