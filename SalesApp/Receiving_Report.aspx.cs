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
    public partial class Receiving_Report : System.Web.UI.Page
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
            SqlDataAdapter sda = new SqlDataAdapter("select Vendors.strName, GRN,SUM(receiveMY) as receiveMY,SUM(TotalTP) as TP,SUM(TotalRP) as RP from ProductReceive inner join Vendors on ProductReceive.Vendor=Vendors.nv_Id group by GRN,strName ", con);
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
            lblRetail.Text = (Convert.ToInt32(txtRP.Text.ToString()) * Convert.ToInt32(txtSuits.Text.ToString()) * Convert.ToInt32(txtQuantity.Text.ToString())).ToString();

            if (!string.IsNullOrEmpty(txtTP.Text) && !string.IsNullOrEmpty(txtRP.Text))
            {

                int tp = Convert.ToInt32(lblTrade.Text.ToString());
                int rp = Convert.ToInt32(lblRetail.Text.ToString());
                int val = rp - tp;
                double div = ((Convert.ToDouble(val) / Convert.ToDouble(tp)) * 100);
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
                var VName = (Label)gvBills
          .Rows[Convert.ToInt32(e.CommandArgument)]
          .Cells[0].FindControl("lblQuantity");
                string bill = billNumber.Text;
                string vnam = VName.Text;
                lblbill_no.Text = bill;
                con.Open();
                SqlCommand cmd3 = new SqlCommand();
                cmd3.CommandText = "Select nv_Id from Vendors where strName='" + vnam + "'";
                cmd3.Connection = con;
                SqlDataReader rd1 = cmd3.ExecuteReader();
                while (rd1.Read())
                {
                    lblv_id.Text = rd1[0].ToString();

                }
                con.Close();


                loadFullGrid(bill,vnam);
                

                           }
        }
        private void loadFullGrid(string billNo,string nameV)
        {
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select ProductReceive.GRN,Date from ProductReceive where GRN='" + billNo + "'";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            while (rd.Read())
            {
                lblGRNmsg.Text = rd[0].ToString();
                  lbl_Date.Text= rd[1].ToString(); 

            }
            con.Close();

            con.Open();
            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "Select strName from Vendors where nv_Id='" + lblv_id.Text + "'";
            cmd3.Connection = con;
            SqlDataReader rd3 = cmd3.ExecuteReader();
            while (rd3.Read())
            {
                lbl_V_Name.Text =rd3[0].ToString();

            }
            con.Close();





            string v_name=null;
            con.Open();
            SqlCommand cmd8 = new SqlCommand();
            cmd8.CommandText = "Select nv_Id from Vendors where strName='" + nameV + "'";
            cmd8.Connection = con;
            SqlDataReader rd8 = cmd8.ExecuteReader();
            while (rd8.Read())
            {
                v_name = rd8[0].ToString();
                
            }
            con.Close();


            SqlDataAdapter sda = new SqlDataAdapter("select ProductReceive.Id, ProductReceive.GRN, Vendors.strName, ProductReceive.Date,ProductReceive.ProductName,ProductReceive.CategoryName,ProductReceive.ProductSKU,ProductReceive.Value,ProductReceive.TP,ProductReceive.RP,ProductReceive.receiveMY ,ProductReceive.TotalTP, ProductReceive.TotalRP from ProductReceive inner join Vendors on ProductReceive.Vendor=Vendors.nv_Id where GRN='" + billNo + "' AND Vendor='"+ v_name + "'", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            grdFullRecords.DataSource = ds;
            grdFullRecords.DataBind();
            if (gvBills.Rows.Count > 0)
                gvBills.HeaderRow.TableSection = TableRowSection.TableHeader;
            //txtBillno.Text = "Bill No : " + billNo;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "createFullDataTable()", true);
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

        protected void grdFullRecords_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //double bill = 0;
            double paid = 0;
            int value1 = 0, value2 = 0;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {





            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                int val1 = 0;
                int val2 = 0;
                int val3 = 0;
                value1 = Convert.ToInt32(lblbill_no.Text);
                value2 = Convert.ToInt32(lblv_id.Text);
                con.Open();
                SqlCommand cmd3 = new SqlCommand();
                cmd3.CommandText = "Select SUM(TP),SUM(receiveMY),SUM(TotalTP),SUM(TotalRP) from ProductReceive where GRN='" + lblbill_no.Text+"' AND Vendor='"+lblv_id.Text+"'";
                cmd3.Connection = con;
                SqlDataReader rd1 = cmd3.ExecuteReader();
                while (rd1.Read())
                {
                    paid = Convert.ToDouble(rd1[0].ToString());
                    val1= Convert.ToInt32(rd1[1].ToString());
                    val2= Convert.ToInt32(rd1[2].ToString());
                    val3 = Convert.ToInt32(rd1[3].ToString());
                }

                con.Close();

                
                Label FTPaid1 = (Label)e.Row.FindControl("lblFooterQuantity");
                FTPaid1.Text = val1.ToString();
                Label FTPaid2 = (Label)e.Row.FindControl("lblFooterTrade");
                FTPaid2.Text = val2.ToString();
                Label FTPaid3 = (Label)e.Row.FindControl("lblFooterRetail");
                FTPaid3.Text = val3.ToString();


            }
        }
    }
}