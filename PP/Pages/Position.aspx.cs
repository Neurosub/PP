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
    public partial class Position : System.Web.UI.Page
    {
        private string QR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                QR = DBConnection.qrPosition;
                if (!IsPostBack)
                {
                    gvFill(QR);
                }
            }
        }
        private void gvFill(string qr)
        {
            sdsPosition.ConnectionString =
                DBConnection.connection.ConnectionString.ToString();
            sdsPosition.SelectCommand = qr;
            sdsPosition.DataSourceMode = SqlDataSourceMode.DataReader;
            gvPosition.DataSource = sdsPosition;
            gvPosition.DataBind();
        }
         protected void gvPosition_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvPosition, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Нажмите, чтобы выбрать запись";
            }
        }
        protected void gvPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvPosition.Rows)
            {
                if (row.RowIndex == gvPosition.SelectedIndex)
                {
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.ToolTip = "Нажмите, чтобы выбрать запись";
                }
            }
            GridViewRow roww = gvPosition.SelectedRow;
            tbName.Text = roww.Cells[2].Text.ToString();
            DBConnection.IDPos = Convert.ToInt32(roww.Cells[1].Text.ToString());
        }
        protected void gvPosition_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Index = Convert.ToInt32(e.RowIndex);
                DBProcedures procedures = new DBProcedures();
                GridViewRow rows = gvPosition.SelectedRow;
                DBConnection.IDPos = Convert.ToInt32(gvPosition.Rows[Index].Cells[1].Text.ToString());
                procedures.spPosition_delete(DBConnection.IDPos);
                gvFill(QR);
                Cleaner();
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Не удалось удалить запись :(')", true);
            }
        }
        protected void btInsert_Click(object sender, EventArgs e)
        {
            DBConnection.IDPos = 0;
            DBProcedures procedures = new DBProcedures();
            procedures.spPosition_insert(Convert.ToString(tbName.Text));
            gvFill(QR);
            Cleaner();
        }
        protected void btUpdate_Click(object sender, EventArgs e)
        {
            DBProcedures procedures = new DBProcedures();
            procedures.spPosition_update(DBConnection.IDPos, Convert.ToString(tbName.Text));       
            gvFill(QR);
            Cleaner();
        }

        protected void Cleaner()
        {
            DBConnection.IDPos = 0;
            tbName.Text = string.Empty;

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

        