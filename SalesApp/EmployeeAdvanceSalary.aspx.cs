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
    public partial class EmployeeAdvanceSalary : System.Web.UI.Page
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
            SqlDataAdapter sda = new SqlDataAdapter("select strCode,strName from tbl_Employees where bisDeleted='0'", con);
            DataSet ds = new DataSet();
            ddlCategory.DataTextField = "strName";
            ddlCategory.DataValueField = "strCode";
            sda.Fill(ds);
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select Employee Name--", "0"));
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "Select Amount from EmployeeLoanIn where Name='" + ddlCategory.SelectedValue + "'";
            cmd3.Connection = con;
            SqlDataReader rd1 = cmd3.ExecuteReader();
            while (rd1.Read())
            {
                //if (DateCmp.Text == rd1[0].ToString() && shadow123.Text == rd1[1].ToString())
                //{
                txtAmount.Text = rd1[0].ToString();
                // lblmsg.Text = "! Salary already paid of Month" + "(" + DateCmp.Text + ")" + "(" + shadow123.Text + ")";

                //}
            }

            con.Close();
        }
        protected void btnAddLoan_Click(object sender, EventArgs e)
        {
            var str = txtLoanDate.Text;
            string ch = str[5].ToString() + str[6].ToString();
            string year = str[0].ToString() + str[1].ToString() + str[2].ToString() + str[3].ToString();
            txtyear.Text = year;
            if (ch == "01")
            {
                sha1.Text = "january";
            }
            else if (ch == "02")
            {
                sha1.Text = "February";
            }
            else if (ch == "03")
            {
                sha1.Text = "March";
            }
            else if (ch == "04")
            {
                sha1.Text = "April";
            }
            else if (ch == "05")
            {
                sha1.Text = "May";
            }
            else if (ch == "06")
            {
                sha1.Text = "June";
            }
            else if (ch == "07")
            {
                sha1.Text = "July";
            }
            else if (ch == "08")
            {
                sha1.Text = "August";
            }
            else if (ch == "09")
            {
                sha1.Text = "September";
            }
            else if (ch == "10")
            {
                sha1.Text = "october";
            }
            else if (ch == "11")
            {
                sha1.Text = "november";
            }
            else if (ch == "12")
            {
                sha1.Text = "december";
            }
            bool flag = false;
            bool flag1 = true;
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select Name,Amount,Total_Amount from AdvanceSalary";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            String Remaining_Amount = null;
            String Total_Amount = null;
            while (rd.Read())
            {
                if (ddlCategory.SelectedValue == rd[0].ToString())
                {
                    Remaining_Amount = rd[1].ToString();
                    Total_Amount = rd[2].ToString();
                    //lb1.Text = rd[0].ToString();
                    //lb2.Text = txtCategory.Text;
                    flag = true;
                    break;
                }
            }
            con.Close();
            if (flag == true)
            {
                int T_Amount=Convert.ToInt32(Remaining_Amount)+Convert.ToInt32(txtAmount.Text);
                int Total_Amt= Convert.ToInt32(Total_Amount) + Convert.ToInt32(txtAmount.Text);
                con.Open();
                SqlCommand cmd4 = new SqlCommand("Update AdvanceSalary set Amount='" + T_Amount.ToString() + "', Date='"+ txtLoanDate.Text.ToString() + "',Total_Amount='"+Total_Amt.ToString()+"' where Name= '" + ddlCategory.SelectedValue + "'", con);
                cmd4.ExecuteNonQuery();
                flag1 = false;
                con.Close();
                MultiView1.ActiveViewIndex = 0;
                this.Page_Load(null, null);
                LoadLoans();

                /////////////////////////////////////////////////////
                SqlCommand cmd9 = new SqlCommand("insert into AdvanceSalaryReport(emp_Code,Amount,Date,Month,Year,Total_Amount)Values(@Cat,@Amount,@Date,@Month,@Year,@Amount)", con);

                //cmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
                //cmd.Parameters.AddWithValue("@Duration", txtDuration.Text.ToString());
                cmd9.Parameters.AddWithValue("@Date", txtLoanDate.Text.ToString());
                cmd9.Parameters.AddWithValue("@Amount", txtAmount.Text.ToString());
                cmd9.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
                //cmd.Parameters.AddWithValue("@Description", txtDescription.Text.ToString());
                cmd9.Parameters.AddWithValue("@Year", txtyear.Text.ToString());
                cmd9.Parameters.AddWithValue("@Month", sha1.Text.ToString());




                con.Open();
                //cmd9.ExecuteNonQuery();
                if (cmd9.ExecuteNonQuery() > 0)
                {
                    //txtName.Text = "";
                    //txtDuration.Text = "";
                    txtAmount.Text = "";
                    txtLoanDate.Text = "";
                    //    txtDescription.Text = "";

                }
                else
                {
                    lblEmpAdd.Text = "Error in Adding Loan....!!";
                    lblEmpAdd.ForeColor = System.Drawing.Color.Red;
                }
                con.Close();


                //////////////////////////////////////////////////////
            }
            
            else
            {
                SqlCommand cmd = new SqlCommand("insert into AdvanceSalary(Name,Amount,Date,Month,Year,Total_Amount)Values(@Cat,@Amount,@Date,@Month,@Year,@Amount)", con);
                //SqlCommand cmd9 = new SqlCommand("insert into AdvanceSalaryReport(emp_Code,Amount,Date,Month,Year,Total_Amount)Values(@Cat,@Amount,@Date,@Month,@Year,@Amount)", con);

                //cmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
                //cmd.Parameters.AddWithValue("@Duration", txtDuration.Text.ToString());
                cmd.Parameters.AddWithValue("@Date", txtLoanDate.Text.ToString());
                cmd.Parameters.AddWithValue("@Amount", txtAmount.Text.ToString());
                cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
                //cmd.Parameters.AddWithValue("@Description", txtDescription.Text.ToString());
                cmd.Parameters.AddWithValue("@Year", txtyear.Text.ToString());
                cmd.Parameters.AddWithValue("@Month", sha1.Text.ToString());




                con.Open();
               // cmd9.ExecuteNonQuery();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    flag1 = false;
                    //txtName.Text = "";
                    //txtDuration.Text = "";
                 //   txtAmount.Text = "";
                  //  txtLoanDate.Text = "";
                    //    txtDescription.Text = "";

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
                if (flag1 == false)
                {
                    //SqlCommand cmd = new SqlCommand("insert into AdvanceSalary(Name,Amount,Date,Month,Year,Total_Amount)Values(@Cat,@Amount,@Date,@Month,@Year,@Amount)", con);
                    SqlCommand cmd9 = new SqlCommand("insert into AdvanceSalaryReport(emp_Code,Amount,Date,Month,Year,Total_Amount)Values(@Cat,@Amount,@Date,@Month,@Year,@Amount)", con);

                    //cmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
                    //cmd.Parameters.AddWithValue("@Duration", txtDuration.Text.ToString());
                    cmd9.Parameters.AddWithValue("@Date", txtLoanDate.Text.ToString());
                    cmd9.Parameters.AddWithValue("@Amount", txtAmount.Text.ToString());
                    cmd9.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
                    //cmd.Parameters.AddWithValue("@Description", txtDescription.Text.ToString());
                    cmd9.Parameters.AddWithValue("@Year", txtyear.Text.ToString());
                    cmd9.Parameters.AddWithValue("@Month", sha1.Text.ToString());




                    con.Open();
                    //cmd9.ExecuteNonQuery();
                    if (cmd9.ExecuteNonQuery() > 0)
                    {
                        //txtName.Text = "";
                        //txtDuration.Text = "";
                        txtAmount.Text = "";
                        txtLoanDate.Text = "";
                        //    txtDescription.Text = "";

                    }
                    else
                    {
                        lblEmpAdd.Text = "Error in Adding Loan....!!";
                        lblEmpAdd.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
                }
            }
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
            string query = "select AdvanceSalary.id, tbl_Employees.strName, AdvanceSalary.Total_Amount, AdvanceSalary.Date from AdvanceSalary inner join tbl_Employees on tbl_Employees.strCode=AdvanceSalary.Name where bisDeleted='0'";
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