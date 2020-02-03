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
    public partial class ExpenceType : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                ShowCategories();

            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aqua'";
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white'";
            }
        }
        private void ShowCategories()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select * from ExpenseType where isdeleted=0", con);
            //DataSet ds = new DataSet();
            DataTable ds = new DataTable();
            sda.Fill(ds);
            gvDesignation.DataSource = ds;
            gvDesignation.DataBind();
            gvDesignation.UseAccessibleHeader = true;
            if (gvDesignation.Rows.Count > 0)
                gvDesignation.HeaderRow.TableSection = TableRowSection.TableHeader;

            MultiView1.ActiveViewIndex = 0;

        }

        private void showDistribution()
        {
            //if (ddlDistribution.Items.Count == 0)
            //{
            //    SqlDataAdapter sda = new SqlDataAdapter("select * from tbl_Distributors where bisDeleted='False'", con);
            //    DataSet ds = new DataSet();
            //    ddlDistribution.DataTextField = "strDistributorName";
            //    ddlDistribution.DataValueField = "nd_Id";
            //    sda.Fill(ds);
            //    ddlDistribution.DataSource = ds;

            //    ddlDistribution.DataBind();
            //    ddlDistribution.Items.Insert(0, new ListItem("--Select Distribution--", "-1"));

            //}
        }

        protected void btnAddnewEmp_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {

        }


        //-================================Gridview Functionality======================//

        protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDesignation.EditIndex = -1;
            ShowCategories();
        }

        protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDesignation.EditIndex = e.NewEditIndex;
            ShowCategories();
        }

        protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = gvDesignation.Rows[e.RowIndex].FindControl("lblId") as Label;
            TextBox Name = gvDesignation.Rows[e.RowIndex].FindControl("txtName") as TextBox;

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update ExpenseType set ExpenseType='" + Name.Text + "' where id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvDesignation.EditIndex = -1;
            //Call ShowData method for displaying updated data  

            ShowCategories();

        }
        protected void ShowPopup(object sender, EventArgs e)
        {
            string title = "Greetings";
            string body = "Welcome to ASPSnippets.com";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
        }
        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvDesignation.Rows[e.RowIndex].FindControl("lblId") as Label;
            SqlCommand cmd = new SqlCommand("Update ExpenseType set isdeleted=1 where id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            ShowCategories();
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            bool flag;
            flag = false;
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select ExpenseType from ExpenseType";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            while (rd.Read())
            {

                if (txtCategory.Text == rd[0].ToString())
                {
                    lb1.Text = rd[0].ToString();
                    lb2.Text = txtCategory.Text;
                    flag = true;
                    break;
                }
            }
            con.Close();
            if (flag == true)
            {
                p1.Text = txtCategory.Text + "\t Already exist";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into ExpenseType(ExpenseType,isdeleted)Values(@designation,@isdeleted)", con);

                cmd.Parameters.AddWithValue("@designation", txtCategory.Text);
                cmd.Parameters.AddWithValue("@isdeleted", '0');
                // cmd.Parameters.AddWithValue("@Code", txtCategoryCode.Text);


                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {


                    txtCategory.Text = "";
                    //txtCategoryCode.Text = "";

                }
                else
                {
                    lblEmpAdd.Text = "Error in Adding Category....!!";
                    lblEmpAdd.ForeColor = System.Drawing.Color.Red;
                }
                ShowCategories();
                con.Close();
            }

        }


        protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
            //this.gvDesignation.GridViewElement.DrawBorder = false;
            
            //gvDesignation.RowStyle.BorderStyle = BorderStyle.Solid;
            

        }
    }
}