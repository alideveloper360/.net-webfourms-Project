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
    public partial class VendorLedgersReport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                loadVendors();
                UpdateLabels(ddlVendors.SelectedValue.ToString());
            }

        }
        protected void ddlVendors_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateLabels(ddlVendors.SelectedValue.ToString());
        }
        protected void btnReceived_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select * from ProductReceive where Vendor=" + ddlVendors.SelectedValue.ToString(), con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            grdReceivedRecords.DataSource = ds;
            grdReceivedRecords.DataBind();
            grdReceivedRecords.Visible = true;

            grdSentRecords.Visible = false;

        }
        protected void btnPaid_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select * from VendorPayments where VendorId=" + ddlVendors.SelectedValue.ToString(), con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            grdSentRecords.DataSource = ds;
            grdSentRecords.DataBind();
            grdSentRecords.Visible = true;
            grdReceivedRecords.Visible = false;
        }
        private void UpdateLabels(string vendorId)
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select COALESCE(sum(TotalTP),0) as TotalPayable from ProductReceive where Vendor=" + vendorId, con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            string retail = "";
            if (ds.Tables[0].Rows.Count > 0)
                retail = ds.Tables[0].Rows[0][0].ToString();
            else
            {
                retail = "0";
            }
            lblRetailPrice.Text = retail;
            SqlDataAdapter sda1 = new SqlDataAdapter(@"select COALESCE(SUM(Amount),0) as TotalPaid from VendorPayments where VendorId=" + vendorId, con);
            DataSet ds1 = new DataSet();
            sda1.Fill(ds1);
            string paid = "";
            if (ds1.Tables[0].Rows.Count > 0)
                paid = ds1.Tables[0].Rows[0][0].ToString();
            else
            {
                paid = "0";
            }
            lblPaid.Text = paid;
            lblPayable.Text = (Convert.ToInt32(retail) - Convert.ToInt32(paid)).ToString();
            //lblTotalPayableAmount.Text = (Convert.ToInt32(retail) - Convert.ToInt32(paid)).ToString();
        }

        private void loadVendors()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Vendors", con);
            DataSet ds = new DataSet();
            ddlVendors.DataTextField = "strName";
            ddlVendors.DataValueField = "nv_Id";
            sda.Fill(ds);
            ddlVendors.DataSource = ds;
            ddlVendors.DataBind();

        }
    }
}