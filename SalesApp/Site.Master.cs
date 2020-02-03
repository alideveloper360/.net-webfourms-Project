using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null || Session["Username"] == null || Session["UserType"] == null)
                {
                    Response.Redirect("~/Authorize.aspx");
                }

                if (Session["Username"] != null)
                {
                    lblName.Text = Session["Username"].ToString();
                }

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["UserId"] = String.Empty;
            Session["Username"] = String.Empty;
            Session["UserType"] = String.Empty;
            Response.Redirect("~/Authorize.aspx");
        }

    }
}