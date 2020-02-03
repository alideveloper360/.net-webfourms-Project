using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace SalesApp
{
    public partial class AattendanceRecord : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                RecordSubmit.Visible = false;

            }
        }


        private void LoadAttendanceGrid()
        {
            if (!String.IsNullOrEmpty(txtDate.Text))
            {
                SqlDataAdapter sda = new SqlDataAdapter(@"select tbl_Employees.strName,Employee_Attendance.Emp_Code, Employee_Attendance.Status, Employee_Attendance.Time ,Employee_Attendance.Date from Employee_Attendance inner join 
                tbl_Employees on Employee_Attendance.Emp_Code=tbl_Employees.strCode   where Employee_Attendance.Date='" + txtDate.Text + "'", con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gvCategory.DataSource = ds;
                gvCategory.DataBind();
                if (gvCategory.Rows.Count > 0)
                    gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;

                MultiView1.ActiveViewIndex = 0;
                RecordSubmit.Visible = true;
            }

        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
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



        protected void RecordSubmit_Click(object sender, EventArgs e)
        {
          
        }
    }
}