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
    public partial class ok1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLoans();
                MultiView1.ActiveViewIndex = 0;
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


        protected void btnAddLoan_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into Zakat(Name,Date,Amount,isdeleted)Values(@Name,@Date,@Amount,0)", con);

            cmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
            cmd.Parameters.AddWithValue("@Date", txtLoanDate.Text.ToString());
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text.ToString());
            con.Open();
            if (cmd.ExecuteNonQuery() > 0)
            {
                txtName.Text = "";

                txtAmount.Text = "";
                txtLoanDate.Text = "";
            }
            else
            {
                lblEmpAdd.Text = "Error in Adding Loan....!!";
                lblEmpAdd.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
            LoadLoans();
            MultiView1.ActiveViewIndex = 0;
            this.Page_Load(null, null);
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
            TextBox Amount = gvCommittee.Rows[e.RowIndex].FindControl("txtGridAmount") as TextBox;
            TextBox Date = gvCommittee.Rows[e.RowIndex].FindControl("txtGridDate") as TextBox;

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Zakat set Name='" + Name.Text + "',Amount='" + Amount.Text + "',Date='" + Date.Text + "' where Id=" + Convert.ToInt32(Id.Text), con);
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
            SqlCommand cmd = new SqlCommand("Update  Zakat set isdeleted=1 where Id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadLoans();
        }
        private void LoadLoans()
        {
            string query = "select id,Name,Date,Amount from Zakat where isdeleted=0";
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