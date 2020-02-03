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
    public partial class PayCommitee : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                showPayments();
                showCommittees();
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

        private void showCommittees()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Committee", con);
            DataSet ds = new DataSet();
            ddlCommittee.DataTextField = "Name";
            ddlCommittee.DataValueField = "Id";
            sda.Fill(ds);
            ddlCommittee.DataSource = ds;
            ddlCommittee.DataBind();
            ddlCommittee.Items.Insert(0, new ListItem("--Select Committee--", "0"));
            ddlFilterCommittee.DataTextField = "Name";
            ddlFilterCommittee.DataValueField = "Id";
            ddlFilterCommittee.DataSource = ds;
            ddlFilterCommittee.DataBind();
            ddlFilterCommittee.Items.Insert(0, new ListItem("--Select Committee--", "0"));
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

            con.Open();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "Select TotalAmount from Committee where Id='" + ddlCommittee.SelectedValue + "'";
            cmd5.Connection = con;
            SqlDataReader rd5 = cmd5.ExecuteReader();
            while (rd5.Read())
            {
                txtTotalAmount.Text = rd5[0].ToString();
            }
            con.Close();
        }
        protected void btnAddPayment_Click(object sender, EventArgs e)
        {
            
            if (!ddlCommittee.SelectedValue.Equals("0"))
            {
                SqlCommand cmd = new SqlCommand("insert into PayCommittee(CommitteeId,Date,Amount)Values(@Cat,@Date,@Amount)", con);

                cmd.Parameters.AddWithValue("@Cat", ddlCommittee.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Date", txtDate.Text.ToString());
                cmd.Parameters.AddWithValue("@Amount", TextBox1.Text.ToString());
                
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                { 
                    txtDate.Text = "";
                }
                else
                {
                    lblEmpAdd.Text = "Error in Adding Category....!!";
                    lblEmpAdd.ForeColor = System.Drawing.Color.Red;
                }
                con.Close();
                MultiView1.ActiveViewIndex = 0;
                showPayments();



                ////////////////////////////

                ///////////////////////////Update Amount/////////////////

                String Total_Amount = null;

                con.Open();
                SqlCommand cmd5 = new SqlCommand();
                cmd5.CommandText = "Select TotalAmount from Committee where Id='" + ddlCommittee.SelectedValue + "'";
                cmd5.Connection = con;
                SqlDataReader rd5 = cmd5.ExecuteReader();
                while (rd5.Read())
                {
                    Total_Amount = rd5[0].ToString();
                }
                con.Close();
                // String Amount = txt_Zakat_TotalAmount.Text.ToString();

                String netAmount = TextBox1.Text;
                int net_Amount = Int32.Parse(netAmount);
                int TotalAmount_Zakat = Int32.Parse(Total_Amount);
                int T_Amount = TotalAmount_Zakat - net_Amount;


                ///////////////////Update Record////////////////////
                //String UpdateAmount = ddlCategory.SelectedValue;

                con.Open();
                //updating the record  
                SqlCommand cmd9 = new SqlCommand("Update Committee set TotalAmount='" + Convert.ToString(T_Amount) + "' where Id='" + ddlCommittee.SelectedValue + "'", con);
                cmd9.ExecuteNonQuery();
                if (cmd9.ExecuteNonQuery() > 0)
                {
                    //txt_Zakat_TotalAmount.Text = "";
                    txtTotalAmount.Text = "";
                    TextBox1.Text = "";
                    ddlCommittee.SelectedIndex = 0;
                }
                con.Close();
            }
        }
        protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategory.EditIndex = -1;
            showPayments();
        }

        protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategory.EditIndex = e.NewEditIndex;
            showPayments();
        }

        protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = gvCategory.Rows[e.RowIndex].FindControl("lblId") as Label;
      
            TextBox Amount = gvCategory.Rows[e.RowIndex].FindControl("txtAmount") as TextBox;
          
            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update PayCommittee set Amount='" + Amount.Text + "' where Id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvCategory.EditIndex = -1;
            showPayments();
        }

        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvCategory.Rows[e.RowIndex].FindControl("lblEmpId") as Label;
            SqlCommand cmd = new SqlCommand("Delete PayCommittee where Id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            showPayments();
        }
        private void showPayments()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select c.Name,p.Amount,p.Id,p.Date from Committee c inner join PayCommittee p on p.CommitteeId = c.Id", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gvCategory.DataSource = ds;
            gvCategory.DataBind();
            if (gvCategory.Rows.Count > 0)
                gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;

            MultiView1.ActiveViewIndex = 0;
        }

        protected void ddlFilterCommittee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddlFilterCommittee.SelectedValue.Equals("0"))
            {
                string query = "select c.Name,p.Amount,p.Id,p.Date from Committee c inner join PayCommittee p on p.CommitteeId = c.Id where c.Id=" + ddlFilterCommittee.SelectedValue.ToString();
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gvCategory.DataSource = ds;
                gvCategory.DataBind();
            }
            else
            {
                showPayments();
            }

            
            con.Open();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "Select RemainingAmount,TotalAmount from Committee where Id='" + ddlFilterCommittee.SelectedValue + "'";
            cmd5.Connection = con;
            SqlDataReader rd5 = cmd5.ExecuteReader();
            while (rd5.Read())
            {
                //txtLoanDate.Text= rd[0].ToString();
                //lblName.Text = rd5[0].ToString();
                lblTotal_Amount.Text = "Total Amount :" + rd5[0].ToString()+" | ";
                lblRemaining_Amount.Text ="Remaining Amount :"+ rd5[1].ToString();
                //{
                //    lb1.Text = rd[0].ToString();
                //    lb2.Text = txtCategory.Text;
                //    flag = true;
                //    break;
                //}
            }
            con.Close();
        }

       /* protected void ddlCommittee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddlCommittee.SelectedValue.Equals("0"))
            {
                string query = "select * from Committee where Id=" + ddlCommittee.SelectedValue.ToString();
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                txtAmountCommittee.Text = ds.Tables[0].Rows[0]["Amount"].ToString();
            }
        }*/

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