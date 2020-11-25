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
    public partial class Staff : System.Web.UI.Page
    {
        private string QR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                QR = DBConnection.qrStaff;
                if (!IsPostBack)
                {
                    //gvFill(QR);
                }
            }
        }
     
        //private void gvFill(string qr)
        //{
        //    sdsStaff.ConnectionString =
        //        DBConnection.connection.ConnectionString.ToString();
        //    sdsStaff.SelectCommand = qr;
        //    sdsStaff.DataSourceMode = SqlDataSourceMode.DataReader;
        //    gvStaff.DataSource = sdsStaff;
        //    gvStaff.DataBind();
        //}
        //protected void gvStaff_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    e.Row.Cells[1].Visible = false;
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        if (e.Row.RowIndex == 0)
        //            e.Row.Style.Add("height", "50px");
        //    }
        //}

        //protected void btInsert_Click(object sender, EventArgs e)
        //{
        //    DBConnection.IDStaff = 0;
        //    DBProcedures procedures = new DBProcedures();
        //    procedures.spStaff_insert(Convert.ToString(tbNumber.Text), Convert.ToString(tbSurname.Text), Convert.ToString(tbName.Text), Convert.ToString(tbMiddleName.Text), Convert.ToString(tbBirthDate.Text), Convert.ToInt32(ddlLogin.SelectedValue), Convert.ToInt32(ddlPassword.SelectedValue));
        //    Cleaner();
        //    gvFill(QR);
        //    Response.Redirect(Request.Url.AbsoluteUri);
        //}
        //protected void btUpdate_Click(object sender, EventArgs e)
        //{
        //    DBProcedures procedures = new DBProcedures();
        //    procedures.spStaff_update(DBConnection.IDStaff, Convert.ToString(tbBranchers.Text));
        //    Cleaner();
        //    gvFill(QR);
        //    Response.Redirect(Request.Url.AbsoluteUri);
        //}
        //protected void Cleaner()
        //{
        //    DBConnection.IDStaff = 0;
        //    tbBranchers.Text = string.Empty;
        //}

    }
}