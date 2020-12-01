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
    public partial class Documents : System.Web.UI.Page
    {
        private string QR = "";
        private string QRR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                QR = DBConnection.qrStaffList;
                QRR = DBConnection.qrStaff;
                if (!IsPostBack)
                {
                    gvFill(QR);
                    ddlStatusFill();
                    gvFilll(QRR);
                    ddlStaffFill();
                }
            }
        }

        private void gvFilll(string qrr)
        {
            sdsStaff.ConnectionString =
                DBConnection.connection.ConnectionString.ToString();
            sdsStaff.SelectCommand = qrr;
            sdsStaff.DataSourceMode = SqlDataSourceMode.DataReader;
            gvStaff.DataSource = sdsStaff;
            gvStaff.DataBind();
        }
        private void gvFill(string qr)
        {
            sdsStaffList.ConnectionString =
                DBConnection.connection.ConnectionString.ToString();
            sdsStaffList.SelectCommand = qr;
            sdsStaffList.DataSourceMode = SqlDataSourceMode.DataReader;
            gvStaffList.DataSource = sdsStaffList;
            gvStaffList.DataBind();
        }

        private void ddlStatusFill()
        {
            sdsddl.ConnectionString =
                DBConnection.connection.ConnectionString.ToString();
            sdsddl.SelectCommand = DBConnection.qrStatus;
            sdsddl.DataSourceMode = SqlDataSourceMode.DataReader;
            ddlStatus.DataSource = sdsddl;
            ddlStatus.DataTextField = "Название";
            ddlStatus.DataValueField = "ID_Status";
            ddlStatus.DataBind();
        }

        private void ddlStaffFill()
        {
            sdsddl.ConnectionString =
            DBConnection.connection.ConnectionString.ToString();
            sdsddl.SelectCommand = DBConnection.qrFio;
            sdsddl.DataSourceMode = SqlDataSourceMode.DataReader;
            ddlStaff.DataSource = sdsddl;
            ddlStaff.DataTextField = "ФИО";
            ddlStaff.DataValueField = "ID_Staff";
            ddlStaff.DataBind();
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

        protected void btInsert_Click(object sender, EventArgs e)
        {
            DBConnection.IDStaffList = 0;
            DBProcedures procedures = new DBProcedures();
            procedures.spStaffList_insert(Convert.ToInt32(ddlStatus.SelectedValue), Convert.ToInt32(ddlStaff.SelectedValue));
            Cleaner();
            gvFill(QR);

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            DBProcedures procedures = new DBProcedures();
            procedures.spStaffList_update(DBConnection.IDStaffList, Convert.ToInt32(ddlStatus.SelectedValue), Convert.ToInt32(ddlStaff.SelectedValue));
            Cleaner();
            gvFill(QR);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        protected void Cleaner()
        {
            DBConnection.IDStaffList = 0;
            ddlStaff.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;

        }
        protected void gvStaff_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[8].Visible = false;            
        }

        protected void gvStaffList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Index = Convert.ToInt32(e.RowIndex);
                DBProcedures procedures = new DBProcedures();
                GridViewRow rows = gvStaffList.SelectedRow;
                DBConnection.IDStaffList = Convert.ToInt32(gvStaff.Rows[Index].Cells[1].Text.ToString());
                procedures.spStaffList_delete(DBConnection.IDStaffList);
                gvFill(QR);
                Cleaner();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Не удалось удалить запись :(')", true);
            }
        }

        protected void gvStaffList_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvStaffList.Rows)
            {
                if (row.RowIndex == gvStaffList.SelectedIndex)
                {
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.ToolTip = "Нажмите, чтобы выбрать запись";
                }
            }
            GridViewRow roww = gvStaffList.SelectedRow;
            ddlStaff.SelectedValue = roww.Cells[4].Text.ToString();
            ddlStatus.SelectedValue = roww.Cells[2].Text.ToString();
            DBConnection.IDStaffList = Convert.ToInt32(roww.Cells[1].Text.ToString());
        }

        protected void gvStaffList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[2].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvStaffList, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Нажмите, чтобы выбрать запись";
            }
        }


        //protected void CreateDocx(string Format)
        //{
        //    DBConnection connection = new DBConnection();
        //    string docPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + @"\Reservation information № " + Convert.ToString(DBConnection.idRecord) + Format;
        //    // Путь для скачивания документа
        //    DocumentCore dc = new DocumentCore();
        //    Section section = new Section(dc);
        //    dc.Sections.Add(section);
        //    section.PageSetup.PaperType = PaperType.A4;
        //    //Добавление строк
        //    dc.Content.End.Insert("\nИНФОРМАЦИЯ О БРОНИРОВАНИИ", new CharacterFormat() { FontName = "Times New Roman", Size = 18, FontColor = Color.Black, Bold = true });
        //    SpecialCharacter lBr = new SpecialCharacter(dc, SpecialCharacterType.LineBreak);
        //    dc.Content.End.Insert(lBr.Content);
        //    dc.Content.End.Insert("Вы забронировали стол №" + ddlNumber.SelectedItem.Text + ". Стол забронирован на " + tbDate.Text + " " +
        //        "в " + Convert.ToString(ddlTime.SelectedItem.Text) + ". Количество гостей " + tbQuantity.Text + ".",
        //        new CharacterFormat() { FontName = "Times New Roman", Size = 16, FontColor = Color.Black, });
        //    SpecialCharacter lBr2 = new SpecialCharacter(dc, SpecialCharacterType.LineBreak);
        //    dc.Content.End.Insert(lBr2.Content);
        //    dc.Content.End.Insert("Ваш номер бронирования " + Convert.ToString(DBConnection.idRecord) + ".",
        //        new CharacterFormat() { FontName = "Times New Roman", Size = 16, FontColor = Color.Black, });
        //    SpecialCharacter lBr3 = new SpecialCharacter(dc, SpecialCharacterType.LineBreak);
        //    dc.Content.End.Insert(lBr2.Content);
        //    dc.Content.End.Insert("Кому, " + connection.KlientData(DBConnection.idKlient) + ".",
        //        new CharacterFormat() { FontName = "Times New Roman", Size = 14, FontColor = Color.Black });
        //    //Документ в формате .docx
        //    if (Format == ".docx")
        //    {
        //        // Сохраняем документ в формате .docx
        //        dc.Save(docPath, new DocxSaveOptions());

        //        // Открываем документ
        //        Process.Start(new ProcessStartInfo(docPath) { UseShellExecute = true });
        //    }
            
        //}
        ////Создание документа .Word
        //protected void btWord_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        CreateDocx(".docx");
        //        Cleaner();
        //        lblExportError.Visible = false;
        //    }
        //    catch
        //    {
        //        lblExportError.Visible = true;
        //    }
        //}




    }
}