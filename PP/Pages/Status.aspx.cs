using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using PP.Classes;

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
        protected void gvStatus_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowIndex == 0)
                    e.Row.Style.Add("height", "50px");
            }
        }

        protected void btInsert_Click(object sender, EventArgs e)
        {
            DBConnection.IDStatus = 0;
            DBProcedures procedures = new DBProcedures();
            procedures.spStatus_insert(Convert.ToString(tbName.Text));
            Cleaner();
            gvFill(QR);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        protected void btUpdate_Click(object sender, EventArgs e)
        {
            DBProcedures procedures = new DBProcedures();
            procedures.spStatus_update(DBConnection.IDStatus, Convert.ToString(tbName.Text));
            Cleaner();
            gvFill(QR);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        protected void Cleaner()
        {
            DBConnection.IDStatus = 0;
            tbName.Text = string.Empty;
        }
    }
}