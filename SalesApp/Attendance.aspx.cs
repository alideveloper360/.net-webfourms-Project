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
    public partial class Attendance : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    LoadAttendanceGrid();
            //}
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into Attendance(DateAttendance,EmpCode,Status,Time)Values(@Date,@EmpCode,@Status,@txtTime)", con);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@EmpCode", txtEmpCode.Text);
            cmd.Parameters.AddWithValue("@txtTime", txtTime.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadAttendanceGrid();
        }
        private void LoadAttendanceGrid()
        {
            if (!String.IsNullOrEmpty(txtDate.Text))
            {
                string query = "Select a.*,e.strName from Attendance a inner join tbl_Employees e on a.EmpCode = e.strCode where a.DateAttendance='" + txtDate.Text + "'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                int count = dt.Rows.Count;
                grdRecords.DataSource = dt;
                grdRecords.DataBind();
                if (grdRecords.Rows.Count > 0)
                    grdRecords.HeaderRow.TableSection = TableRowSection.TableHeader;

            }

        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            LoadAttendanceGrid();
        }

        protected void grdRecords_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
            if (grdRecords.Rows.Count > 0)
                grdRecords.HeaderRow.TableSection = TableRowSection.TableHeader;

          

        }

        protected void txtEmpCode_TextChanged(object sender, EventArgs e)
        {
            
           con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select RTRIM(strName) from tbl_Employees where RTRIM(strCode)='" + txtEmpCode.Text + "'";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            while (rd.Read())
            {

                //if (txtEmpCode.Text == rd[0].ToString())
                //{
                //con.Open();
                    Emp_Name.Text = rd[0].ToString();
            //}
            }
            con.Close();
        }
    }
}