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
    public partial class StaffList : System.Web.UI.Page
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
            gvStaff.DataSource = sdsStaff;
            gvStaff.DataBind();
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


        protected void gvStaff_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[8].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvStaff, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Нажмите, чтобы выбрать запись";
            }
        }

        protected void btInsert_Click(object sender, EventArgs e)
        {
            DBConnection.IDStaff = 0;
            DBProcedures procedures = new DBProcedures();
            procedures.Users_insert(Convert.ToString(tbLogin.Text), Convert.ToString(tbPassword.Text), Convert.ToString(tbPosition.Text), Convert.ToString(tbSurname.Text), Convert.ToString(tbName.Text), Convert.ToString(tbMiddleName.Text), Convert.ToString(tbBirthDate.Text));
            Cleaner();
            gvFill(QR);

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            DBProcedures procedures = new DBProcedures();
            procedures.Users_update(DBConnection.IDStaff, Convert.ToString(tbLogin.Text), Convert.ToString(tbPassword.Text), Convert.ToString(tbPosition.Text), Convert.ToString(tbSurname.Text), Convert.ToString(tbName.Text), Convert.ToString(tbMiddleName.Text), Convert.ToString(tbBirthDate.Text));
            Cleaner();
            gvFill(QR);

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Cleaner()
        {
            DBConnection.IDStaff = 0;
            tbLogin.Text = string.Empty;
            tbPassword.Text = string.Empty;
            tbPosition.Text = string.Empty;
            tbSurname.Text = string.Empty;
            tbName.Text = string.Empty;
            tbMiddleName.Text = string.Empty;
            tbBirthDate.Text = string.Empty;

        }

        protected void gvStaff_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvStaff.Rows)
            {
                if (row.RowIndex == gvStaff.SelectedIndex)
                {
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.ToolTip = "Нажмите, чтобы выбрать запись";
                }
            }
            GridViewRow roww = gvStaff.SelectedRow;
            tbSurname.Text = roww.Cells[2].Text.ToString();
            tbName.Text = roww.Cells[3].Text.ToString();
            tbMiddleName.Text = roww.Cells[4].Text.ToString();
            tbBirthDate.Text = roww.Cells[5].Text.ToString();
            tbPosition.Text = roww.Cells[7].Text.ToString();
            tbLogin.Text = roww.Cells[9].Text.ToString();
            tbPassword.Text = roww.Cells[10].Text.ToString();
            DBConnection.IDStaff = Convert.ToInt32(roww.Cells[1].Text.ToString());
        }
        protected void gvStaff_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Index = Convert.ToInt32(e.RowIndex);
                DBProcedures procedures = new DBProcedures();
                GridViewRow rows = gvStaff.SelectedRow;
                DBConnection.IDStaff = Convert.ToInt32(gvStaff.Rows[Index].Cells[1].Text.ToString());
                DBConnection.IDPos = Convert.ToInt32(gvStaff.Rows[Index].Cells[6].Text.ToString());
                DBConnection.IDAuth = Convert.ToInt32(gvStaff.Rows[Index].Cells[8].Text.ToString());
                procedures.Users_delete(DBConnection.IDStaff, DBConnection.IDPos, DBConnection.IDAuth);
                gvFill(QR);
                Cleaner();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Не удалось удалить запись :(')", true);
            }
        }
    }
}