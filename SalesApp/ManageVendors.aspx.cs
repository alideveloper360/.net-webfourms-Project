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
    public partial class ManageVendors : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                showVendors();
            }
        }
        protected void btnAddVendor_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        private void showVendors()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Vendors where bisDeleted='False'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            gvVendors.DataSource = dt;
            gvVendors.DataBind();
            gvVendors.UseAccessibleHeader = true;
            if(gvVendors.Rows.Count > 0)
                gvVendors.HeaderRow.TableSection = TableRowSection.TableHeader;

        }
        protected void btnAddVendors_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("Insert into Vendors(strName, strCellNo, strAddress, strBankAccount, dtAddDate,bisDeleted,strPhoneNumber)Values(@strName, @strCellNo, @strAddress, @strBankAccount, @dtAddDate,@bisDeleted,@strPhoneNumber)", con);
            cmd.Parameters.AddWithValue("@strName", txtVendName.Text);
            cmd.Parameters.AddWithValue("@strCellNo", txtCellNo.Text);
            cmd.Parameters.AddWithValue("@strAddress", txtAddress.Text);
            cmd.Parameters.AddWithValue("@strBankAccount", txtBankAccount.Text);
            cmd.Parameters.AddWithValue("@dtAddDate", DateTime.Today.ToString("dd-MM-yyyy"));
            cmd.Parameters.AddWithValue("@bisDeleted", "False");
            cmd.Parameters.AddWithValue("@strPhoneNumber", txtPhoneNumber.Text);
            con.Open();

            if (cmd.ExecuteNonQuery() > 0)
            {


                txtVendName.Text = "";
                txtCellNo.Text = "";
                txtAddress.Text = "";
                txtBankAccount.Text = "";
            }
            else
            {

                lblVendorMsg.Text = "Error in Adding Vendor....!!";
                lblVendorMsg.ForeColor = System.Drawing.Color.Red;
            }

            showVendors();
            MultiView1.ActiveViewIndex = 0;
            this.Page_Load(null, null);

        }

        protected void gvVendors_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvVendors.EditIndex = -1;
            showVendors();
        }

        protected void gvVendors_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvVendors.EditIndex = e.NewEditIndex;
            showVendors();
        }

        protected void gvVendors_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvVendors.Rows[e.RowIndex].FindControl("lblVendId") as Label;
            TextBox name = gvVendors.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox cell = gvVendors.Rows[e.RowIndex].FindControl("txtCellNo") as TextBox;
            TextBox adddress = gvVendors.Rows[e.RowIndex].FindControl("txtAddress") as TextBox;
            TextBox bankAccount = gvVendors.Rows[e.RowIndex].FindControl("txtBankAccount") as TextBox;

            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Vendors set strName='" + name.Text + "',strCellNo='" + cell.Text + "',strAddress='" + adddress.Text + "',strBankAccount='" + bankAccount.Text + "' where nv_Id=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvVendors.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            showVendors();
        }
        protected void btnBack_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            showVendors();
        }
        protected void gvVendors_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvVendors.Rows[e.RowIndex].FindControl("lblVendId") as Label;
            SqlCommand cmd = new SqlCommand("Update Vendors set bisDeleted=@Delete,dtDeleteDate=@DeleteDate where nv_Id=" + Convert.ToInt32(id.Text), con);
            cmd.Parameters.AddWithValue("@Delete", "True");
            cmd.Parameters.AddWithValue("@DeleteDate", DateTime.Today.ToString("dd-MM-yyyy"));
            con.Open();
            cmd.ExecuteNonQuery();
            showVendors();
        }
        protected void lnkAddTextBox_Click(object sender, EventArgs e)
        {
            //i++;
            //int count = i;
            //int total = Convert.ToInt32(count.ToString());
            //for (int j = 0; j < total; j++)
            //{
            //    TextBox tb = new TextBox();
            //    PlaceHolder1.Controls.Add(tb);
            //    tb.ID = "TxtBankAccount";
            //}
        }

        protected void lnkAddCellNo_Click(object sender, EventArgs e)
        {
            //int index = pnlTextBoxes.Controls.OfType<TextBox>().ToList().Count + 1;
            //this.CreateTextBox("txtDynamic" + index);
        }
        private void CreateTextBox(string id)
        {
            //TextBox txt = new TextBox();
            //txt.ID = id;
            //pnlTextBoxes.Controls.Add(txt);

            //Literal lt = new Literal();
            //lt.Text = "<br />";
            //pnlTextBoxes.Controls.Add(lt);
        }

        protected void gvVendors_RowDataBound(object sender, GridViewRowEventArgs e)
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