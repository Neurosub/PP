using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PP.Pages
{
    public partial class Waiting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAuth_Click(object sender, EventArgs e)
        {
            Response.Redirect("Authorization.aspx");
        }
    }
}