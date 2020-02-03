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
    public partial class ReceivedProduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                showVendors();
                loadReceivedProducts();
            }
        }
        protected void btnAddnewEmp_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        private void loadReceivedProducts()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select BillNo, SUM(Quantity) as Quantity, SUM(TradePrice) as TradePrice from ReceivedProducts group by BillNo", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gvBills.DataSource = ds;
            gvBills.DataBind();
            if (gvBills.Rows.Count > 0)
                gvBills.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void btnReceive_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(@"insert into ReceivedProducts(BillNo,ProdSKU,MeasureType,Quantity,NoSuits,Cutting,TradePrice,RetailPrice,Margin)
                Values(@BillNo,@ProdSKU,@MeasureType,@Quantity,@NoSuits,@Cutting,@TradePrice,@RetailPrice,@Margin)", con);

            cmd.Parameters.AddWithValue("@BillNo", txtBill.Text);
            cmd.Parameters.AddWithValue("@ProdSKU", txtSKU.Text);
            cmd.Parameters.AddWithValue("@MeasureType", ddlMeasure.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
            cmd.Parameters.AddWithValue("@NoSuits", txtSuits.Text);
            cmd.Parameters.AddWithValue("@Cutting", txtCutting.Text);

            cmd.Parameters.AddWithValue("@TradePrice", lblTrade.Text);

            cmd.Parameters.AddWithValue("@RetailPrice", lblRetail.Text);

            cmd.Parameters.AddWithValue("@Margin", txtPercentage.Text);
            con.Open();
            if (cmd.ExecuteNonQuery() > 0)
            {


                txtBill.Text = "";
                txtSKU.Text = "";
                txtQuantity.Text = "";
                txtSuits.Text = "";
                txtCutting.Text = "";
                lblTrade.Text = "";
                lblRetail.Text = "";
                txtPercentage.Text = "";
                txtTP.Text = "";
                txtRP.Text = "";

            }
            else
            {
                lblEmpAdd.Text = "Error in Receiving Product....!!";
                lblEmpAdd.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
        }
        private void showVendors()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Vendors", con);
            DataSet ds = new DataSet();
            ddlVendor.DataTextField = "strName";
            ddlVendor.DataValueField = "nv_Id";
            sda.Fill(ds);
            ddlVendor.DataSource = ds;
            ddlVendor.DataBind();

        }
        protected void txtSKU_TextChanged(object sender, EventArgs e)
        {
            string query = "select Name from Product where SKU='" + txtSKU.Text.ToString() + "'";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
                txtProdName.Text = ds.Tables[0].Rows[0][0].ToString();
        }
        protected void txtTP_TextChanged(object sender, EventArgs e)
        {
            lblTrade.Text = (Convert.ToInt32(txtTP.Text.ToString()) * Convert.ToInt32(txtSuits.Text.ToString()) * Convert.ToInt32(txtQuantity.Text.ToString())).ToString();

        }

        protected void txtRP_TextChanged(object sender, EventArgs e)
        {
            lblRetail.Text = (Convert.ToInt32(txtRP.Text.ToString()) * Convert.ToInt32(txtSuits.Text.ToString())* Convert.ToInt32(txtQuantity.Text.ToString())).ToString();

            if (!string.IsNullOrEmpty(txtTP.Text) && !string.IsNullOrEmpty(txtRP.Text))
            {

                int tp = Convert.ToInt32(lblTrade.Text.ToString());
                int rp = Convert.ToInt32(lblRetail.Text.ToString());
                int val = rp-tp;
                double div = ((Convert.ToDouble(val) / Convert.ToDouble(tp))*100);
                txtPercentage.Text = div.ToString();
            }
        }

        protected void txtSuits_TextChanged(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(txtTP.Text) && string.IsNullOrEmpty(txtRP.Text)))
            {
                lblTrade.Text = (Convert.ToInt32(txtTP.Text.ToString()) * Convert.ToInt32(txtSuits.Text.ToString())).ToString();
                lblRetail.Text = (Convert.ToInt32(txtRP.Text.ToString()) * Convert.ToInt32(txtSuits.Text.ToString())).ToString();
            }
        }

        protected void gvBills_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewAll")
            {
                var billNumber = (Label)gvBills
           .Rows[Convert.ToInt32(e.CommandArgument)]
           .Cells[0].FindControl("lblBillNo");
                string bill = billNumber.Text;
                loadFullGrid(bill);
            }
        }
        private void loadFullGrid(string billNo)
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from ReceivedProducts where BillNo='" + billNo + "'", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            grdFullRecords.DataSource = ds;
            grdFullRecords.DataBind();
            if (gvBills.Rows.Count > 0)
                gvBills.HeaderRow.TableSection = TableRowSection.TableHeader;
            txtBillno.Text = "Bill No : "+billNo;

            MultiView1.ActiveViewIndex = 2;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            loadReceivedProducts();
            MultiView1.ActiveViewIndex = 0;

        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {

        }
    }
}