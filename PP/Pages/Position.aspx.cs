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
                if (e.Row.RowIndex == 0)
                    e.Row.Style.Add("height", "50px");
            }
        }


    }
}