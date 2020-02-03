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
    public partial class ManageEmployees : System.Web.UI.Page
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
            SqlDataAdapter sda = new SqlDataAdapter("select * from Designation", con);
            DataSet ds = new DataSet();
            ddlCategory.DataTextField = "designation";
            ddlCategory.DataValueField = "d_id";
            sda.Fill(ds);
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select Designation--", "0"));
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
            SqlDataAdapter sda = new SqlDataAdapter(@"select tbl_Employees.ne_Id, tbl_Employees.strName , Designation.designation, tbl_Employees.strCNIC, tbl_Employees.strCellNo, tbl_Employees.nSalary, tbl_Employees.strAddress,tbl_Employees.strCode from tbl_Employees INNER JOIN Designation ON tbl_Employees.d_id=Designation.d_id
            where tbl_Employees.bisDeleted=0", con);
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
            bool flag;
            flag = false;
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select RTRIM(strCode) from tbl_Employees";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            while (rd.Read())
            {
                if (txtEmpCode.Text == rd[0].ToString())
                {
                    //lb1.Text = rd[0].ToString();
                    //lb2.Text = txtCategory.Text;
                    flag = true;
                    break;
                }
            }
            con.Close();
            if (flag == true)
            {
                p1.Text = "Employee code\t"+txtEmpCode.Text + "\t Already exist";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into tbl_Employees(strName,strCNIC,strCode, strCellNo, nSalary, strAddress, dtAddDate,bisDeleted,d_id)Values(@strName,@strCNIC,@strCode, @strCellNo, @nSalary, @strAddress, @dtAddDate,@bisDeleted,@cat)", con);

                cmd.Parameters.AddWithValue("@strName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@strCNIC", txtCNIC.Text);
                cmd.Parameters.AddWithValue("@strCode", txtEmpCode.Text);
                cmd.Parameters.AddWithValue("@strCellNo", txtCell.Text);
                cmd.Parameters.AddWithValue("@nSalary", txtSalary.Text);
                cmd.Parameters.AddWithValue("@strAddress", txtAddress.Text);
                cmd.Parameters.AddWithValue("@dtAddDate", DateTime.Today.ToString("dd-MM-yyyy"));
                cmd.Parameters.AddWithValue("@bisDeleted", "False");
                cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {


                    txtEmpName.Text = "";
                    txtCNIC.Text = "";
                    txtCell.Text = "";
                    txtSalary.Text = "";
                    txtAddress.Text = "";
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
            TextBox Name = gvEmployee.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox CNIC = gvEmployee.Rows[e.RowIndex].FindControl("txtCNIC") as TextBox;
            TextBox CellNo = gvEmployee.Rows[e.RowIndex].FindControl("txtCellNo") as TextBox;
            TextBox Salary = gvEmployee.Rows[e.RowIndex].FindControl("txtSalary") as TextBox;
            TextBox Address = gvEmployee.Rows[e.RowIndex].FindControl("txtAddress") as TextBox;
            TextBox Code = gvEmployee.Rows[e.RowIndex].FindControl("txtCode") as TextBox;
                        bool flag;
            flag = false;
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select RTRIM(strCode) from tbl_Employees";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            while (rd.Read())
            {
                if (Code.Text == rd[0].ToString())
                {
                    //lb1.Text = rd[0].ToString();
                    //lb2.Text = txtCategory.Text;
                    flag = true;
                    break;
                }
            }
            con.Close();
            if (flag == true)
            {
                lblmsg.Text = "Code Already exist";
            }

            else
            {
                con.Open();
                //updating the record  
                SqlCommand cmd = new SqlCommand("Update tbl_Employees set strName='" + Name.Text + "',strCNIC='" + CNIC.Text + "',strCellNo='" + CellNo.Text + "',nSalary='" + Salary.Text + "',strAddress='" + Address.Text + "',strCode='" + Code.Text + "' where ne_Id=" + Convert.ToInt32(Id.Text), con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
                gvEmployee.EditIndex = -1;
                lblmsg.Text = "";
                //Call ShowData method for displaying updated data  
            }
                
            
            showEmployees();
        }

        protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvEmployee.Rows[e.RowIndex].FindControl("lblId") as Label;
            SqlCommand cmd = new SqlCommand("Update tbl_Employees set bisDeleted=@Delete, dtDeleteDate=@dtDelete where ne_Id=" + Convert.ToInt32(id.Text), con);
            cmd.Parameters.AddWithValue("@Delete", "True");
            cmd.Parameters.AddWithValue("@dtDelete", DateTime.Today.ToString("dd-MM-yyyy"));
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