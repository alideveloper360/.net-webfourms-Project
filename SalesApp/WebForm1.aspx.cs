using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace SalesApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        bool flag=false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            
            //flag = false;
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select RTRIM(name) from tb1";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            while (rd.Read())
            {

                //String str =rd[1].ToString();
                if (p1.Text == rd[0].ToString())
                {
                    //lb1.Text = rd[0].ToString();
                    //lb2.Text = txtCategory.Text;
                    flag = true;
                    break;
                }
            }
            if(flag==false)
            {
                p2.Text = "not fount";
            }
            else
            {
                p2.Text = "fount";
            }
            con.Close();
        }
    }
}