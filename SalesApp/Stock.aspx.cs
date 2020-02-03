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
    public partial class Stock : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                // SubmitImageButton.Visible = false;
                LoadAttendanceGrid();
                showCommittees();
            }
        }
        private void showCommittees()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Vendors", con);
            DataSet ds = new DataSet();

            sda.Fill(ds);

            ddlFilterCommittee.DataTextField = "strName";
            ddlFilterCommittee.DataValueField = "nv_Id";
            ddlFilterCommittee.DataSource = ds;
            ddlFilterCommittee.DataBind();
            ddlFilterCommittee.Items.Insert(0, new ListItem("--Select Vendor--", "0"));
        }
        protected void ddlFilterCommittee_SelectedIndexChanged(object sender, EventArgs e)
        {
            //shadow.Text = ddlFilterCommittee.SelectedValue.ToString();
            if (!ddlFilterCommittee.SelectedValue.Equals("0"))
            {
                if (!string.IsNullOrEmpty(txtdate2.Text) && !string.IsNullOrEmpty(txtdate1.Text))
                {
                    string query2 = "select tbl_ProductReceive.ProductName, tbl_ProductReceive.CategoryName,tbl_ProductReceive.ProductSKU,tbl_ProductReceive.Value, tbl_ProductReceive.receiveMY from tbl_ProductReceive where Date between '" + txtdate1.Text + "' And '" + txtdate2.Text + "' AND tbl_ProductReceive.Vendor ='" + ddlFilterCommittee.SelectedValue.ToString() + "' ";
                    SqlDataAdapter sda2 = new SqlDataAdapter(query2, con);
                    DataSet ds2 = new DataSet();
                    sda2.Fill(ds2);
                    gvCategory.DataSource = ds2;
                    gvCategory.DataBind();
                }
                else
                {
                    string query = "select tbl_ProductReceive.ProductName, tbl_ProductReceive.CategoryName,tbl_ProductReceive.ProductSKU,tbl_ProductReceive.Value, tbl_ProductReceive.receiveMY from tbl_ProductReceive where tbl_ProductReceive.Vendor ='" + ddlFilterCommittee.SelectedValue.ToString() + "' ";
                    SqlDataAdapter sda = new SqlDataAdapter(query, con);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    gvCategory.DataSource = ds;
                    gvCategory.DataBind();
                }
            }
            else
            {
                LoadAttendanceGrid();
            }



        }

        private void LoadAttendanceGrid()
        {
                SqlDataAdapter sda = new SqlDataAdapter(@"select  Distinct ProductName, Value, CategoryName, ProductSKU ,SUM(receiveMY) as receiveMY from tbl_ProductReceive group by ProductName, Value, CategoryName, ProductSKU", con);

                DataSet ds = new DataSet();

                sda.Fill(ds);
                gvCategory.DataSource = ds;

                gvCategory.DataBind();
                if (gvCategory.Rows.Count > 0)
                    gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;

                MultiView1.ActiveViewIndex = 0;
              //  txtPaid_Date.Text = "Amount Paid Date : " + txtDate.Text;
            //    SubmitImageButton.Visible = true;
            

        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            LoadAttendanceGrid();
        }

        protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //int salary=0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }

            //int sal = 0;

            // sal = sal + Convert.ToInt32(e.Row.Cells[4].Text);
            gvCategory.FooterRow.Cells[3].Text = "Total";
            //gvCategory.FooterRow.Cells[4].Text = salary.ToString();

        }

        protected void txtdate2_TextChanged(object sender, EventArgs e)
        {
            
                if (!string.IsNullOrEmpty(txtdate2.Text) && !string.IsNullOrEmpty(txtdate1.Text))
                {
                    string query2 = "select tbl_ProductReceive.ProductName, tbl_ProductReceive.CategoryName,tbl_ProductReceive.ProductSKU,tbl_ProductReceive.Value, tbl_ProductReceive.receiveMY from tbl_ProductReceive where Date between '" + txtdate1.Text + "' And '" + txtdate2.Text + "' ";
                    SqlDataAdapter sda2 = new SqlDataAdapter(query2, con);
                    DataSet ds2 = new DataSet();
                    sda2.Fill(ds2);
                    gvCategory.DataSource = ds2;
                    gvCategory.DataBind();
                }
             
            }
            
        }
    }
