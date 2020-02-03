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
    public partial class PayExpense : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                showEmployees();
                showDesignation();
                showDistribution();
                showCategories();
            }
        }

        private void showDesignation()
        {
            //if (ddlDesignation.Items.Count == 0)
            //{
            //    SqlDataAdapter sda = new SqlDataAdapter("select * from tbl_Designation where bisDeleted='False'", con);
            //    DataSet ds = new DataSet();
            //    ddlDesignation.DataTextField = "strDsgName";
            //    ddlDesignation.DataValueField = "dsg_Id";
            //    sda.Fill(ds);
            //    ddlDesignation.DataSource = ds;

            //    ddlDesignation.DataBind();
            //    ddlDesignation.Items.Insert(0, new ListItem("--Select Designation--", "-1"));
            //}
        }

        private void showCategories()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from ExpenseType", con);
            DataSet ds = new DataSet();
            ddlCategory.DataTextField = "ExpenseType";
            ddlCategory.DataValueField = "id";
            sda.Fill(ds);
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select Item--", "0"));
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            //setSKU();
        }

        protected void txtProductCode_TextChanged(object sender, EventArgs e)
        {
            //setSKU();
        }
        private void setSKU()
        {
            //if (!ddlCategory.SelectedValue.Equals("0"))
            //{
            //  SqlDataAdapter sda = new SqlDataAdapter("select Code from Category where Id=" + ddlCategory.SelectedItem.Value, con);
            // DataSet ds = new DataSet();
            // sda.Fill(ds);
            // txtSKU.Text = ds.Tables[0].Rows[0][0].ToString() + "-" + txtProductCode.Text;
            //}

        }




        private void showEmployees()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select PayExpense.id, ExpenseType.ExpenseType, PayExpense.Date, PayExpense.Amount  
            ,PayExpense.Description from PayExpense inner join  ExpenseType on PayExpense.Expense=ExpenseType.id where PayExpense.isdeleted=0", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            gvEmployee.DataSource = ds;
            gvEmployee.DataBind();
            if (gvEmployee.Rows.Count > 0)
                gvEmployee.HeaderRow.TableSection = TableRowSection.TableHeader;
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
            
                SqlCommand cmd = new SqlCommand("insert into PayExpense(Expense,Date,Amount, Description, isdeleted)Values(@Cat,@strCNIC,@strCode, @strCellNo, @bisDeleted)", con);


                cmd.Parameters.AddWithValue("@strCNIC", txtCNIC.Text);
                cmd.Parameters.AddWithValue("@strCode", txtEmpCode.Text);
                cmd.Parameters.AddWithValue("@strCellNo", txtCell.Text);
              
                cmd.Parameters.AddWithValue("@bisDeleted", "False");
                cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {


                   // txtEmpName.Text = "";
                    txtCNIC.Text = "";
                    txtCell.Text = "";
                   // txtSalary.Text = "";
                   // txtAddress.Text = "";
                    txtEmpCode.Text = "";

                }
                else
                {
                    lblEmpAdd.Text = "Error in Adding Vendor....!!";
                    lblEmpAdd.ForeColor = System.Drawing.Color.Red;
                }
                showEmployees();
                con.Close();


                /////////////////////////////*****************************************

            }


        


        //-================================Gridview Functionality======================//

        protected void gvEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmployee.EditIndex = -1;
            showEmployees();
        }

        protected void gvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmployee.EditIndex = e.NewEditIndex;
            showEmployees();
        }

        protected void gvEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = gvEmployee.Rows[e.RowIndex].FindControl("lblId") as Label;
            TextBox Amount = gvEmployee.Rows[e.RowIndex].FindControl("txtAmount") as TextBox;
            TextBox Description = gvEmployee.Rows[e.RowIndex].FindControl("txtDescription") as TextBox;
            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update PayExpense set Amount='" + Amount.Text + "',Description='" + Description.Text + "' where id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvEmployee.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            showEmployees();
        }

        protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvEmployee.Rows[e.RowIndex].FindControl("lblId") as Label;
            SqlCommand cmd = new SqlCommand("Update PayExpense set isdeleted=@Delete where id=" + Convert.ToInt32(id.Text), con);
            //SqlCommand cmd = new SqlCommand("Update set bisDeleted=@Delete, dtDeleteDate=@dtDelete where ne_Id=" + Convert.ToInt32(id.Text), con);
            cmd.Parameters.AddWithValue("@Delete", "True");
            con.Open();
            cmd.ExecuteNonQuery();
            showEmployees();
        }

        protected void gvEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}