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
    public partial class ManageCommittee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ShowCommittee();
        }

        protected void btnAddCommitee_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into Committee(Name,StartDate,EndDate,TotalAmount,RemainingAmount)Values(@Name,@Start,@End,@TotalAmount,@RemainingAmount)", con);

            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Start", txtStartDate.Text);
            cmd.Parameters.AddWithValue("@End", txtEndDateCommittee.Text);
            cmd.Parameters.AddWithValue("@TotalAmount", txtTotalAmount.Text);
            cmd.Parameters.AddWithValue("@RemainingAmount", txtTotalAmount.Text);



            con.Open();
            if (cmd.ExecuteNonQuery() > 0)
            {


                txtName.Text = "";
            
                txtTotalAmount.Text = "";
            }
            else
            {
                lblEmpAdd.Text = "Error in Adding Category....!!";
                lblEmpAdd.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
            
            ShowCommittee();


        }
          protected void btnAddnewEmp_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void gvCommittee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCommittee.EditIndex = -1;
            ShowCommittee();
        }

        protected void gvCommittee_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCommittee.EditIndex = e.NewEditIndex;
            ShowCommittee();
        }

        protected void gvCommittee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = gvCommittee.Rows[e.RowIndex].FindControl("lblId") as Label;
            TextBox Name = gvCommittee.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox Months = gvCommittee.Rows[e.RowIndex].FindControl("txtGridMonths") as TextBox;
            TextBox Amount = gvCommittee.Rows[e.RowIndex].FindControl("txtGridAmount") as TextBox;
            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Committee set Name='" + Name.Text + "',Months='" + Months.Text + "',Amount='" + Amount.Text + "' where Id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvCommittee.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowCommittee();
        }

        protected void gvCommittee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvCommittee.Rows[e.RowIndex].FindControl("lblId") as Label;
            SqlCommand cmd = new SqlCommand("Delete Committee where Id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            ShowCommittee();
        }

        private void ShowCommittee()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select * from Committee", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gvCommittee.DataSource = ds;
            gvCommittee.DataBind();
            if (gvCommittee.Rows.Count > 0)
                gvCommittee.HeaderRow.TableSection = TableRowSection.TableHeader;

            MultiView1.ActiveViewIndex = 0;
        }

        protected void gvCommittee_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        
        }
    }
}