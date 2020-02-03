using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

namespace SalesApp
{
    public partial class ok : System.Web.UI.Page
    {
        string str;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                showCategories();
                showProducts();
            }

        }
        protected void btngotoprint_Click(object sender, EventArgs e)
        {

           
            str= val_label.Text;
            String p_val = txtnop.Text;
            Response.Redirect(String.Format("BarcodeImage.aspx?val={0}&printval={1}", Server.UrlEncode(str), Server.UrlEncode(p_val)));
            
        }
        protected void btnprintbc_Click(object sender, EventArgs e)
        {
            GridViewRow gvr = (GridViewRow)((Button)sender).NamingContainer;
            Session["val"] = "12390";
            Response.Redirect("Barcode.aspx?val=12390");
       
        }
        private void showProducts()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select * from Product", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gvCommittee.DataSource = ds;
            gvCommittee.DataBind();
            if (gvCommittee.Rows.Count > 0)
                gvCommittee.HeaderRow.TableSection = TableRowSection.TableHeader;
            MultiView1.ActiveViewIndex = 0;
        }

        private void showCategories()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Category", con);
            DataSet ds = new DataSet();
            ddlCategory.DataTextField = "Category";
            ddlCategory.DataValueField = "Id";
            sda.Fill(ds);
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            
            if (txtProductCode.Text.Length < 4 || txtProductCode.Text.Length > 4)
            {
                lblerrormsg.Text = "Enter only 4 digit code";
            }
            else
            {

                SqlCommand cmd = new SqlCommand("insert into Product(Name,CategoryId,Code,SKU)Values(@Name,@Cat,@Code,@SKU)", con);

                cmd.Parameters.AddWithValue("@Name", txtProdName.Text);
                cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);

                cmd.Parameters.AddWithValue("@Code", txtProductCode.Text);

                cmd.Parameters.AddWithValue("@SKU", txtSKU.Text);



                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {


                    txtProdName.Text = "";
                    txtSKU.Text = "";
                    txtProductCode.Text = "";

                }
                else
                {
                    lblEmpAdd.Text = "Error in Adding Category....!!";
                    lblEmpAdd.ForeColor = System.Drawing.Color.Red;
                }
                con.Close();
                showProducts();
                MultiView1.ActiveViewIndex = 0;
                lblerrormsg.Text = "";
            }
        }
        protected void btnAddnewEmp_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            setSKU();
        }

        protected void txtProductCode_TextChanged(object sender, EventArgs e)
        {
            setSKU();
        }
        private void setSKU()
        {
            if (!ddlCategory.SelectedValue.Equals("0"))
            {
                SqlDataAdapter sda = new SqlDataAdapter("select Code from Category where Id=" + ddlCategory.SelectedItem.Value, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                txtSKU.Text = ds.Tables[0].Rows[0][0].ToString() + txtProductCode.Text;
            }

        }
        /// <summary>
        /// //////////////////////////////////////////////////////////////////////////////
        /// </summary>


       
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
            TextBox SKU = gvCommittee.Rows[e.RowIndex].FindControl("txtSKU") as TextBox;
            //TextBox Date = gvCommittee.Rows[e.RowIndex].FindControl("txtGridDate") as TextBox;
            //Label lblSKUProduct = gvCommittee.Rows[e.RowIndex].FindControl("lblDuration") as Label;
            if (Duration.Text.Length < 4 || Duration.Text.Length > 4)
            {
                lblmsgerror.Text = "Enter only 4 digit code";
            }
            else
            {
                lblmsgerror.Text = "";
                int r = 0;
                int n = Convert.ToInt32(SKU.Text);
                int left = n;
                int rev = 0;
                int count = 0;
                int val = 0;
                while (left > 0)
                {

                    r = left % 10;
                    if (count > 3)
                    {
                        val = val * 10 + r;
                        //count++;
                    }
                    else
                    {

                        rev = rev * 10 + r;
                        count++;
                    }
                    left = left / 10;
                }

                left = rev;
                int updateSku = 0;
                int r1 = 0;
                while (left > 0)
                {

                    r1 = left % 10;





                    updateSku = updateSku * 10 + r1;


                    left = left / 10;
                }
                left = val;
                int updateSku1 = 0;

                while (left > 0)
                {

                    r1 = left % 10;

                    // val = val * 10 + r1;



                    updateSku1 = updateSku1 * 10 + r1;


                    left = left / 10;
                }
                p1.Text = updateSku1.ToString() + Duration.Text.ToString();
                con.Open();
                //updating the record  
                SqlCommand cmd = new SqlCommand("Update Product set Name='" + Name.Text + "',Code='" + Duration.Text + "',SKU='" + p1.Text.ToString() + "' where Id=" + Convert.ToInt32(Id.Text), con);
                cmd.ExecuteNonQuery();
                
                con.Close();
                
                //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
                gvCommittee.EditIndex = -1;
                //Call ShowData method for displaying updated data  
                
            }
            LoadLoans();
        }

        protected void gvLoans_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvCommittee.Rows[e.RowIndex].FindControl("lblId") as Label;
            SqlCommand cmd = new SqlCommand("Delete Product where Id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadLoans();
        }
        private void LoadLoans()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select * from Product", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gvCommittee.DataSource = ds;
            gvCommittee.DataBind();
            if (gvCommittee.Rows.Count > 0)
                gvCommittee.HeaderRow.TableSection = TableRowSection.TableHeader;
            MultiView1.ActiveViewIndex = 0;
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

        protected void gvCommittee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "GenerateBarcodes")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = gvCommittee.Rows[rowIndex];
                //Fetch value of Name.
                string sku = (row.FindControl("lblSKU") as Label).Text;
                Session["val"] = sku;
                Response.Redirect("Barcode.aspx?val=" + sku);
            }
        }

       
    }
}