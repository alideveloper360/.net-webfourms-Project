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
    public partial class ManageProducts : System.Web.UI.Page
    {
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
        private void showProducts()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select * from Product", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gvProducts.DataSource = ds;
            gvProducts.DataBind();
            if (gvProducts.Rows.Count > 0)
                gvProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
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
            if(!ddlCategory.SelectedValue.Equals("0"))
            {
                SqlDataAdapter sda = new SqlDataAdapter("select Code from Category where Id=" + ddlCategory.SelectedItem.Value, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                txtSKU.Text = ds.Tables[0].Rows[0][0].ToString() + txtProductCode.Text;
            }

        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            showProducts();
        }


        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = gvProducts.Rows[e.RowIndex].FindControl("lblId") as Label;
            TextBox Name = gvProducts.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox Code = gvProducts.Rows[e.RowIndex].FindControl("txtCode") as TextBox;
            TextBox Sale = gvProducts.Rows[e.RowIndex].FindControl("txtSale") as TextBox;
            TextBox Cost = gvProducts.Rows[e.RowIndex].FindControl("txtCost") as TextBox;
            
            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Product set Name='" + Name.Text + "',Code='" + Code.Text + "',CostPrice='" + Cost.Text + "',SalePrice='" + Sale.Text + "' where Id=" + Convert.ToInt32(Id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvProducts.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            showProducts();
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = gvProducts.Rows[e.RowIndex].FindControl("lblId") as Label;
            SqlCommand cmd = new SqlCommand("Delete Product where Id=" + Convert.ToInt32(id.Text), con);
            con.Open();
            cmd.ExecuteNonQuery();
            showProducts();

        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            showProducts();

        }

        protected void gvProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}