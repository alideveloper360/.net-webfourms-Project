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
    public partial class DailyEmployees : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                //ShowCategories();
                Button1.Visible = false;
            }
        }





        private void LoadAttendanceGrid()
        {
            Label1.Text = "";
            bool flag = false;
            con.Open();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "Select date from Daily where date = '" + txtDate.Text + "'";
            cmd5.Connection = con;
            SqlDataReader rd5 = cmd5.ExecuteReader();
            while (rd5.Read())
            {
                if (txtDate.Text == rd5[0].ToString())
                {

                    lblmsg.Text = "! Already Amount Given";
                    Label1.Text = "";


                    Button1.Visible = false;



                    flag = true;

                };
            }
            con.Close();

            if (flag == false)
            {
                if (!String.IsNullOrEmpty(txtDate.Text))
                {

                    SqlDataAdapter sda = new SqlDataAdapter(@"select Employee_Attendance.id, tbl_Employees.strName,Employee_Attendance.Emp_Code,Employee_Attendance.status, Employee_Attendance.Time  from Employee_Attendance inner join tbl_Employees on Employee_Attendance.Emp_Code=tbl_Employees.strCode where Employee_Attendance.Date='" + txtDate.Text + "' AND Employee_Attendance.Status='Present' AND tbl_Employees.bisDeleted='0'", con);

                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    gvCategory.DataSource = ds;
                    gvCategory.DataBind();
                    if (gvCategory.Rows.Count > 0)
                        gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;

                    MultiView1.ActiveViewIndex = 0;
                    Button1.Visible = true;
                }
            }
            else
            {
                if (!String.IsNullOrEmpty(txtDate.Text))
                {

                    SqlDataAdapter sda = new SqlDataAdapter(@"select Employee_Attendance.id, tbl_Employees.strName,Employee_Attendance.Emp_Code,Employee_Attendance.status, Employee_Attendance.Time  from Employee_Attendance inner join tbl_Employees on Employee_Attendance.Emp_Code=tbl_Employees.strCode where Employee_Attendance.Date='" + txtDate.Text + "' AND Employee_Attendance.Status='Present'", con);

                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    gvCategory.DataSource = null;
                    gvCategory.DataBind();
                    if (gvCategory.Rows.Count > 0)
                        gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;

                    MultiView1.ActiveViewIndex = 0;
                    Button1.Visible = false;
                }
            }

        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            LoadAttendanceGrid();
        }







      
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            bool flag = false;
            con.Open();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "Select date from Daily where date = '" + txtDate.Text + "'";
            cmd5.Connection = con;
            SqlDataReader rd5 = cmd5.ExecuteReader();
            while (rd5.Read())
            {
                if (txtDate.Text == rd5[0].ToString())
                {

                    lblDate_info.Text = "! Already Attendance Taken";
                    Label1.Text = "";
                    Button1.Visible = false;





                    flag = true;

                };
            }
            con.Close();
            if (flag == false)
            {
                //Label Id = gvCategory.Rows[1].FindControl("lblCode") as Label;

                for (int i = 0; i < gvCategory.Rows.Count; i++)
                {
                    con.Open();

                    Label Code = gvCategory.Rows[i].FindControl("lblCode") as Label;
                    TextBox pay = gvCategory.Rows[i].FindControl("txtAmount") as TextBox;
                    SqlCommand cmd = new SqlCommand("insert into Daily(emp_Code,pay,date) values ('" + Convert.ToInt32(Code.Text) + "','" + Convert.ToInt32(pay.Text) + "','" + txtDate.Text + "')", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblmsg.Text = "! Record Submit successfully";
                    Button1.Enabled = false;

                }

            }
            //LoadAttendanceGrid();
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
        ////////////////////////

        protected void gvEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategory.EditIndex = -1;
            LoadAttendanceGrid();
            //showEmployees();
        }

        protected void gvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategory.EditIndex = e.NewEditIndex;
            //showEmployees();
          
            LoadAttendanceGrid();
        }

        protected void gvEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = gvCategory.Rows[e.RowIndex].FindControl("lblId") as Label;
            TextBox Name = gvCategory.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox CNIC = gvCategory.Rows[e.RowIndex].FindControl("txtCode") as TextBox;
            TextBox CellNo = gvCategory.Rows[e.RowIndex].FindControl("txtStatus") as TextBox;
            TextBox Salary = gvCategory.Rows[e.RowIndex].FindControl("txtTime") as TextBox;
            TextBox Address = gvCategory.Rows[e.RowIndex].FindControl("txtpay") as TextBox;
            TextBox Code = gvCategory.Rows[e.RowIndex].FindControl("txtAmount") as TextBox;

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Daily set pay='" + Code.Text + "' where id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvCategory.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            //showEmployees();
            LoadAttendanceGrid();
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
