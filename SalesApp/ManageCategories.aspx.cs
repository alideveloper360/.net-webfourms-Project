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
    public partial class ManageCategories : System.Web.UI.Page
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

        private void ShowCategories()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select * from Category", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gvCategory.DataSource = ds;
            gvCategory.DataBind();
            if (gvCategory.Rows.Count > 0)
            {
                gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;
                gvCategory.UseAccessibleHeader = true;
                gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
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
            gvCategory.EditIndex = -1;
            ShowCategories();
        }

        protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategory.EditIndex = e.NewEditIndex;
            ShowCategories();
        }

        protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = gvCategory.Rows[e.RowIndex].FindControl("lblId") as Label;
            TextBox Name = gvCategory.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox Code = gvCategory.Rows[e.RowIndex].FindControl("txtCode") as TextBox;
            con.Open();
            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "Select SKU from Product where CategoryId='" + Id.Text.ToString() + "'";
            cmd3.Connection = con;
            SqlDataReader rd1 = cmd3.ExecuteReader();
            String update = null;
            while (rd1.Read())
            {
                update = rd1[0].ToString();
               
                int r = 0;
                int n = Convert.ToInt32(update);
                int left = n;
                int rev = 0;
                int count = 0;
                int val = 0;
                while (left > 0)
                {

                    r = left % 10;
                    if (count > 3)
                    {
                        val = val * 10 + r;
                        //count++;
                    }
                    else
                    {

                        rev = rev * 10 + r;
                        count++;
                    }
                    left = left / 10;
                }

                left = rev;
                int updateSku = 0;
                int r1 = 0;
                while (left > 0)
                {

                    r1 = left % 10;





                    updateSku = updateSku * 10 + r1;


                    left = left / 10;
                }
                left = val;
                int updateSku1 = 0;

                while (left > 0)
                {

                    r1 = left % 10;

                    // val = val * 10 + r1;



                    updateSku1 = updateSku1 * 10 + r1;


                    left = left / 10;
                }
                
                p1.Text = Code.Text.ToString() + updateSku.ToString();
                SqlCommand cmd5 = new SqlCommand("update product set SKU='" + p1.Text + "' where Id='"+Id.Text.ToString()+"'", con);
                cmd5.ExecuteNonQuery();
                
            }
            //p1.Text = update;

            con.Close();
            con.Open();
 
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Category set Code='" + Code.Text + "' where Id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvCategory.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowCategories();
        }

        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvCategory.Rows[e.RowIndex].FindControl("lblId") as Label;
            SqlCommand cmd = new SqlCommand("Delete Category where Id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            ShowCategories();
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            if (txtCategoryCode.Text.Length < 4 || txtCategoryCode.Text.Length > 4)
            {
                lblerrormsg.Text = "Enter only 4 digit code";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into Category(Category,Code)Values(@Name,@Code)", con);

                cmd.Parameters.AddWithValue("@Name", txtCategory.Text);
                cmd.Parameters.AddWithValue("@Code", txtCategoryCode.Text);


                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {


                    txtCategory.Text = "";
                    txtCategoryCode.Text = "";

                }
                else
                {
                    lblEmpAdd.Text = "Error in Adding Category....!!";
                    lblEmpAdd.ForeColor = System.Drawing.Color.Red;
                }
                ShowCategories();
                con.Close();
                lblerrormsg.Text = "";
            }
        }
        protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
       
        }
    }
}