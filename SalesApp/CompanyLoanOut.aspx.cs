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
    public partial class CompanyLoanOut : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLoans();
                MultiView1.ActiveViewIndex = 0;
                showCategories();
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void btnAddnewEmp_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        private void showCategories()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select DISTINCT Name from Loans where isdeleted='0'", con);
            DataSet ds = new DataSet();
            ddlCategory.DataTextField = "Name";
            //ddlCategory.DataValueField = "d_id";
            sda.Fill(ds);
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select Name--", "0"));
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Amount_val = 0;
            String txtName_P = ddlCategory.SelectedValue;
            con.Open();
            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "Select Amount from Loans where Name='" + txtName_P + "'";
            cmd3.Connection = con;
            SqlDataReader rd1 = cmd3.ExecuteReader();
            while (rd1.Read())
            {
                //if (DateCmp.Text == rd1[0].ToString() && shadow123.Text == rd1[1].ToString())
                //{
                 Amount_val+= Int32.Parse(rd1[0].ToString());
                   // lblmsg.Text = "! Salary already paid of Month" + "(" + DateCmp.Text + ")" + "(" + shadow123.Text + ")";

                //}
            }
            
            con.Close();
            txtAmount.Text = Amount_val.ToString();
        }
        protected void btnAddLoan_Click(object sender, EventArgs e)
        {
            int val = 0;
            con.Open();
            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "Select Amount from Loans where Name='" + ddlCategory.SelectedValue + "'";
            cmd3.Connection = con;
            SqlDataReader rd1 = cmd3.ExecuteReader();
            while (rd1.Read())
            {
                val = Int32.Parse(rd1[0].ToString());
                
            }

            con.Close();

            int ret_Amount=0;



            SqlCommand cmd = new SqlCommand("insert into CompanyLoanOut(Name,AmountPaid,Date,Description)Values(@Cat,@Amount,@Date,@Description)", con);
            

            //cmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
            //cmd.Parameters.AddWithValue("@Duration", txtDuration.Text.ToString());
            cmd.Parameters.AddWithValue("@Date", txtLoanDate.Text.ToString());
            cmd.Parameters.AddWithValue("@Amount", PayAmount.Text.ToString());
            cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.ToString());
            ret_Amount=val - Int32.Parse(txtAmount.Text.ToString());
            

            con.Open();
            if (cmd.ExecuteNonQuery() > 0)
            {
                //txtName.Text = "";
                //txtDuration.Text = "";
                txtAmount.Text = "";
                txtLoanDate.Text = "";
                txtDescription.Text = "";

            }
            else
            {
                lblEmpAdd.Text = "Error in Adding Loan....!!";
                lblEmpAdd.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
            MultiView1.ActiveViewIndex = 0;
            this.Page_Load(null, null);
            LoadLoans();
        }
        protected void gvLoans_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCommittee.EditIndex = -1;
            LoadLoans();
        }

        protected void gvLoans_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCommittee.EditIndex = e.NewEditIndex;
            LoadLoans();
        }

        protected void gvLoans_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = gvCommittee.Rows[e.RowIndex].FindControl("lblId") as Label;
            TextBox Name = gvCommittee.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox Duration = gvCommittee.Rows[e.RowIndex].FindControl("txtGridDuration") as TextBox;
            TextBox Amount = gvCommittee.Rows[e.RowIndex].FindControl("txtGridAmount") as TextBox;
            TextBox Date = gvCommittee.Rows[e.RowIndex].FindControl("txtGridDate") as TextBox;

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Loans set Name='" + Name.Text + "',Duration='" + Duration.Text + "',Amount='" + Amount.Text + "',Date='" + Date.Text + "' where Id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvCommittee.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            LoadLoans();
        }

        protected void gvLoans_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvCommittee.Rows[e.RowIndex].FindControl("lblId") as Label;
            SqlCommand cmd = new SqlCommand("Delete Loans where Id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadLoans();
        }
        private void LoadLoans()
        {
            string query = "select * from CompanyLoanOut";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gvCommittee.DataSource = ds;
            gvCommittee.DataBind();
            if (gvCommittee.Rows.Count > 0)
                gvCommittee.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void gvLoans_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
          
        }
    }
}