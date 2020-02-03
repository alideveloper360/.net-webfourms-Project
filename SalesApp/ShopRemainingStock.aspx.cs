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
    public partial class ShopRemainingStock : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                // SubmitImageButton.Visible = false;
                LoadAttendanceGrid();
                //showCommittees();
            }
        }


        private void LoadAttendanceGrid()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select C_Name, P_Name, SKU, Value , SUM(Total_Quantity) as Total_Quantity, SUM(Send_Quantity) as Send_Quantity from Shop_Stock group by C_Name, P_Name, SKU, Value", con);

            DataSet ds = new DataSet();

            sda.Fill(ds);
            gvCategory.DataSource = ds;

            gvCategory.DataBind();
            if (gvCategory.Rows.Count > 0)
                gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;

            MultiView1.ActiveViewIndex = 0;
            //  txtPaid_Date.Text = "Amount Paid Date : " + txtDate.Text;
            //    SubmitImageButton.Visible = true;


        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            LoadAttendanceGrid();
        }

        protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //int salary=0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }

            //int sal = 0;

            // sal = sal + Convert.ToInt32(e.Row.Cells[4].Text);
            gvCategory.FooterRow.Cells[3].Text = "Total";
            //gvCategory.FooterRow.Cells[4].Text = salary.ToString();

        }
    }
}