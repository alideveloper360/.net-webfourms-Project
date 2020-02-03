using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace SalesApp
{
    public partial class VendorLeadure : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            showCategories();
        }
        private void showCategories()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Designation", con);
            DataSet ds = new DataSet();
            ddlCategory.DataTextField = "designation";
            ddlCategory.DataValueField = "d_id";
            sda.Fill(ds);
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select Designation--", "0"));
        }
    }
}