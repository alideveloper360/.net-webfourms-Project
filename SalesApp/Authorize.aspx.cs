using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesApp
{
    public partial class Authorize : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select Id,Username,Type from Users where Username=@UserName AND Password=@Password", conn);
            cmd.Parameters.AddWithValue("@UserName", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Session["UserId"] = dt.Rows[0]["Id"].ToString();
                Session["Username"] = txtUsername.Text;
                Session["UserType"] = dt.Rows[0]["Type"].ToString();
                Response.Redirect("ManageCategories.aspx");
            }
        }
    }
}