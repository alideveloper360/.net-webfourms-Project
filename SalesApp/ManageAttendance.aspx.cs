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
    public partial class ManageAttendance : System.Web.UI.Page
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
            bool flag = false;
            con.Open();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "Select Date from Employee_Attendance where Date = '" + txtDate.Text + "'";
            cmd5.Connection = con;
            SqlDataReader rd5 = cmd5.ExecuteReader();
            while (rd5.Read())
            {
                if (txtDate.Text == rd5[0].ToString())
                {
                    
                    lblDate_info.Text = "! Already Attendance Taken";
                    Label1.Text = "";
                  





                    flag = true;
                    
                };
            }
            con.Close();


            if (flag == false)
            {
                if (!String.IsNullOrEmpty(txtDate.Text))
                {

                    SqlDataAdapter sda = new SqlDataAdapter(@"select ne_id,tbl_Employees.strName,tbl_Employees.strCode from tbl_Employees where bisDeleted='0'", con);

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

                    SqlDataAdapter sda = new SqlDataAdapter(@"select ne_id,tbl_Employees.strName,tbl_Employees.strCode from tbl_Employees", con);

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
            
            lblDate_info.Text = "";
           
            
                LoadAttendanceGrid();
         //   MultiView1.ActiveViewIndex = 0;

        }








        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            bool flag = false;
            con.Open();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "Select Date from Employee_Attendance where Date = '" + txtDate.Text + "'";
            cmd5.Connection = con;
            SqlDataReader rd5 = cmd5.ExecuteReader();
            while (rd5.Read())
            {
                if (txtDate.Text == rd5[0].ToString())
                {

                    lblDate_info.Text = "! Already Attendance Taken";
                    Label1.Text = "";






                    flag = true;

                };
            }
            con.Close();



            if (flag == false)
            {
                string str_Time = "ok";
                //Label Id = gvCategory.Rows[1].FindControl("lblCode") as Label;
                String Att_Date = txtDate.Text;
                for (int i = 0; i < gvCategory.Rows.Count; i++)
                {
                    con.Open();

                    Label Code = gvCategory.Rows[i].FindControl("lblCode") as Label;
                    //Label pay = gvCategory.Rows[i].FindControl("lblCode") as Label;
                    var P_status = gvCategory.Rows[i].FindControl("plo1234") as DropDownList;
                    String Status_Att = P_status.SelectedItem.Value;
                    TextBox Time_t = gvCategory.Rows[i].FindControl("txtTime_Employee") as TextBox;
                    str_Time = Time_t.ToString();
                    SqlCommand cmd = new SqlCommand("insert into Employee_Attendance(Emp_Code,Status,Date,Time) values ('" + Convert.ToInt32(Code.Text) + "','" + Status_Att + "','" + Att_Date + "','" + Convert.ToString(Time_t.Text) + "')", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                Label1.Text = "! Record Submitted SuccessFully";
                //Label1.Text =str_Time;
                //LoadAttendanceGrid();
            }
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