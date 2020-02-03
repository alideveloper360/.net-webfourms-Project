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
    public partial class EmployeeSalary : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLoans();
                MultiView1.ActiveViewIndex = 0;
                //string str = "2019-07-22";
                //char arr[] = str.ToCharArray();
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
            String check_val = lblmsg.Text;
            if (String.IsNullOrEmpty(check_val))
            {

                var str = txtName.Text;
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
                //////////////////////////////////////////////
                bool flag = false;
                con.Open();
                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = "Select strCode from tbl_Employees";
                cmd2.Connection = con;
                SqlDataReader rd = cmd2.ExecuteReader();
                while (rd.Read())
                {
                    if (rd[0].ToString() == txtAmount.Text) { flag = true; }
                }
                con.Close();





                if (flag == true)
                {

                    //////////////////////////////////////////
                    SqlCommand cmd = new SqlCommand("insert into EmployeeSalary(Emp_Code,Date,Salary,TodayDate,isdeleted,year)Values(@Salary,@Date,@Code,@todaydate,@isdeleted,@Year)", con);

                    cmd.Parameters.AddWithValue("@Date", sha1.Text.ToString());
                    //cmd.Parameters.AddWithValue("@Duration", lbl_Name.Text.ToString());
                    cmd.Parameters.AddWithValue("@Code", txtLoanDate.Text.ToString());
                    cmd.Parameters.AddWithValue("@Salary", txtAmount.Text.ToString());
                    cmd.Parameters.AddWithValue("@todaydate", DateTime.Today.ToString("dd-MM-yyyy"));
                    cmd.Parameters.AddWithValue("@isdeleted", "1");
                    cmd.Parameters.AddWithValue("@Year", txtyear.Text.ToString());
                    con.Open();
                    TotalSal.Text = txtLoanDate.Text;
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        txtName.Text = "";
                        //txtDuration.Text = "";
                        //txtAmount.Text = "";
                        //txtLoanDate.Text = "";
                        txtAdv.Text = "";
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
                    lblName.Text = "";
                }
                else
                {
                    lblmsg.Text = "Employee Code Does not exist";
                }
            }
            else { }
            if (Label2.Text == "Enter")
            {
                //p1.Text = TotalSalary.Text;
                int updatevalue=Convert.ToInt32(p1.Text) - Convert.ToInt32(txtLoanDate.Text);

                p2.Text = TotalSal.Text;
                int rem_salary = Convert.ToInt32(TotalSalary.Text.ToString()) - Convert.ToInt32(TotalSal.Text.ToString());
                int value = 0;
                con.Open();
                SqlCommand cmd8 = new SqlCommand();
                cmd8.CommandText = "Select Amount from AdvanceSalary where Name='" + txtAmount.Text + "'";
                cmd8.Connection = con;
                SqlDataReader rd8 = cmd8.ExecuteReader();
                while (rd8.Read())
                {

                    value = Convert.ToInt32(rd8[0].ToString());

                    //payAmt.Text = rd8[1].ToString();

                }
             //   p1.Text = value.ToString();
              //  p2.Text = rem_salary.ToString();
                con.Close();
                int pk = value - updatevalue;
                int rem_val = value - rem_salary;
                //p3.Text = rem_val.ToString();
                con.Open();
                //updating the record  
                SqlCommand cmd4 = new SqlCommand("Update AdvanceSalary set Amount='" + pk.ToString() + "' where Name=" + Convert.ToInt32(txtAmount.Text.ToString()), con);
                cmd4.ExecuteNonQuery();
                con.Close();
            }
            txtAmount.Text = "";
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
            TextBox Salary = gvCommittee.Rows[e.RowIndex].FindControl("txtGridSalary") as TextBox;
            TextBox Duration = gvCommittee.Rows[e.RowIndex].FindControl("txtGridDuration") as TextBox;
            TextBox Amount = gvCommittee.Rows[e.RowIndex].FindControl("txtGridAmount") as TextBox;
            TextBox Date = gvCommittee.Rows[e.RowIndex].FindControl("txtGridDate") as TextBox;
            //TextBox t_Date = gvCommittee.Rows[e.RowIndex].FindControl("txt_t_date") as TextBox;

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update EmployeeSalary set Emp_Code='" + Duration.Text + "',Date='" + Amount.Text + "',Salary='"+Date.Text+"' where Id=" + Convert.ToInt32(Id.Text), con);
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
            SqlCommand cmd = new SqlCommand("Delete EmployeeSalary where Id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadLoans();
        }
        private void LoadLoans()
        {
            



            string query = "select EmployeeSalary.id,  tbl_Employees.strName, EmployeeSalary.Emp_Code, EmployeeSalary.Date, EmployeeSalary.TodayDate,EmployeeSalary.Salary from EmployeeSalary inner join tbl_Employees on EmployeeSalary.Emp_Code=tbl_Employees.strCode where tbl_Employees.bisDeleted='0'";
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

        protected void txtAmount_TextChanged(object sender, EventArgs e)
        {





            var str1 = txtName.Text;
            string ch1 = str1[5].ToString() + str1[6].ToString();
            string str2 = str1[0].ToString() + str1[1].ToString() + str1[2].ToString() + str1[3].ToString();
            shadow123.Text = str2;
            if (ch1 == "01")
            {
                DateCmp.Text = "january";
            }
            else if (ch1 == "02")
            {
                DateCmp.Text = "February";
            }
            else if (ch1 == "03")
            {
                DateCmp.Text = "March";
            }
            else if (ch1 == "04")
            {
                DateCmp.Text = "April";
            }
            else if (ch1 == "05")
            {
                DateCmp.Text = "May";
            }
            else if (ch1 == "06")
            {
                DateCmp.Text = "June";
            }
            else if (ch1 == "07")
            {
                DateCmp.Text = "July";
            }
            else if (ch1 == "08")
            {
                DateCmp.Text = "August";
            }
            else if (ch1 == "09")
            {
                DateCmp.Text = "September";
            }
            else if (ch1 == "10")
            {
                DateCmp.Text = "october";
            }
            else if (ch1 == "11")
            {
                DateCmp.Text = "november";
            }
            else if (ch1 == "12")
            {
                DateCmp.Text = "december";
            }












            con.Open();
            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "Select Date,year from EmployeeSalary where Emp_Code='" + txtAmount.Text + "'";
            cmd3.Connection = con;
            SqlDataReader rd1 = cmd3.ExecuteReader();
            while (rd1.Read())
            {
                if (DateCmp.Text == rd1[0].ToString() && shadow123.Text == rd1[1].ToString())
                {
                    lblmsg.Text = "! Salary already paid of Month" + "(" + DateCmp.Text + ")" + "(" + shadow123.Text + ")";
                }
            }
            //checkval.Text = "ok";
            //checkval.Text = lblmsg.Text;
            con.Close();










            /////////////////////////////////////////////////////////////////////////////
            int count = 0;
            con.Open();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "Select AdvanceSalary.Name, AdvanceSalary.Amount, AdvanceSalary.Date from AdvanceSalary  where AdvanceSalary.Name = '" + txtAmount.Text + "'";
            cmd5.Connection = con;
            SqlDataReader rd5 = cmd5.ExecuteReader();
            while (rd5.Read())
            {
                //txtLoanDate.Text= rd[0].ToString();
                //lblName.Text = rd5[0].ToString();
                txtAdv.Text = "Advance Amount Taken :" + rd5[1].ToString();
                Label1.Text = rd5[1].ToString();
                count = 1;
                Label2.Text = "Enter";
                //{
                //    lb1.Text = rd[0].ToString();
                //    lb2.Text = txtCategory.Text;
                //    flag = true;
                //    break;
                //}
            }
            con.Close();
            if (count == 1)
            {
                ////////////////////////////////////////////////
                bool flag1 = false;
                con.Open();
                SqlCommand cmd0 = new SqlCommand();
                cmd0.CommandText = "Select strCode from tbl_Employees";
                cmd0.Connection = con;
                SqlDataReader rd0 = cmd0.ExecuteReader();
                while (rd0.Read())
                {
                    if (rd0[0].ToString() == txtAmount.Text) { flag1 = true; }
                }
                con.Close();
                if (flag1 == false) { lblmsg.Text = "Code not exist"; }
                else
                {
                    //////////////////////////////////////////////////
                    int Total_Amt = 0;

                    Total_Amt = Int32.Parse(Label1.Text);
                    /////////////////////////////////

                    con.Open();
                    SqlCommand cmd20 = new SqlCommand();
                    cmd20.CommandText = "Select strName,nSalary from tbl_Employees where strCode='" + txtAmount.Text + "'";
                    cmd20.Connection = con;
                    SqlDataReader rd30 = cmd20.ExecuteReader();
                    while (rd30.Read())
                    {
                        //txtLoanDate.Text= rd[0].ToString();
                        lblName.Text = rd30[0].ToString();
                        //txtLoanDate.Text = rd[1].ToString();
                        payAmt.Text = rd30[1].ToString();
                        //{
                        //    lb1.Text = rd[0].ToString();
                        //    lb2.Text = txtCategory.Text;
                        //    flag = true;
                        //    break;
                        //}
                    }
                    int Value = Int32.Parse(payAmt.Text) - Total_Amt;
                    p1.Text = payAmt.Text;
                    txtLoanDate.Text = Value.ToString();
                    TotalSalary.Text = txtLoanDate.Text;
                    con.Close();

                }
            }


            //////////////////////////Extra/////////////////////
            ////////////////////////////////////////////////
            bool flag = false;
            con.Open();
            SqlCommand cmd4 = new SqlCommand();
            cmd4.CommandText = "Select strCode from tbl_Employees";
            cmd4.Connection = con;
            SqlDataReader rd = cmd4.ExecuteReader();
            while (rd.Read())
            {
                if (rd[0].ToString() == txtAmount.Text) { flag = true; }
            }
            con.Close();
            if (flag == false) { lblmsg.Text = "Code not exist"; }
            else
            {
                //////////////////////////////////////////////////
             //   int Total_Amt = 0;

               // Total_Amt = Int32.Parse(Label1.Text);
                /////////////////////////////////

                con.Open();
                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = "Select strName,nSalary from tbl_Employees where strCode='" + txtAmount.Text + "'";
                cmd2.Connection = con;
                SqlDataReader rd3 = cmd2.ExecuteReader();
                while (rd3.Read())
                {
                    //txtLoanDate.Text= rd[0].ToString();
                    lblName.Text = rd3[0].ToString();
                    //txtLoanDate.Text = rd[1].ToString();
                    payAmt.Text = rd3[1].ToString();
                    //{
                    //    lb1.Text = rd[0].ToString();
                    //    lb2.Text = txtCategory.Text;
                    //    flag = true;
                    //    break;
                    //}
                }
                //int Value = Int32.Parse(payAmt.Text) - Total_Amt;
                //txtLoanDate.Text = Value.ToString();
                //TotalSalary.Text = txtLoanDate.Text;
                txtLoanDate.Text = payAmt.Text;
                con.Close();

            }




            /////////////////////Extra///////////////////////////





        }
    }
}
