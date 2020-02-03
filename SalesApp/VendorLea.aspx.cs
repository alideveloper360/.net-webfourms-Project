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
    public partial class VendorLea : System.Web.UI.Page
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

        protected void btnPayTOVendor_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;

            UpdateLabels(ddlPayVendor.SelectedValue.ToString());
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
            ddlPayVendor.DataTextField = "strName";
            ddlPayVendor.DataValueField = "nv_Id";
            ddlPayVendor.DataSource = ds;
            ddlPayVendor.DataBind();

        }

        protected void ddlVendors_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateLabels(ddlVendors.SelectedValue.ToString());
        }
        private void UpdateLabels(string vendorId)
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select COALESCE(sum(TotalTP),0) as TotalTP from VendorPay where Vendor=" + vendorId, con);
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
            SqlDataAdapter sda1 = new SqlDataAdapter(@"select COALESCE(SUM(PaidAmount),0) as PaidAmount from VendorPay where Vendor= '"+ vendorId+"'", con);
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
            lblTotalPayableAmount.Text = (Convert.ToInt32(retail) - Convert.ToInt32(paid)).ToString();
        }
        protected void btnPayment_Click(object sender, EventArgs e)
        {
            string payable=null;
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select payable from VendorPay";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            while (rd.Read())
            {
                payable = rd[0].ToString();
            }

            con.Close();

            int value = Convert.ToInt32(payable) - Convert.ToInt32(txtAmount.Text);



            SqlCommand cmd = new SqlCommand(@"insert into VendorPay(Vendor,Date,PaidAmount,payable,Description)
                Values(@VendorId,@Date,@Amount,'"+Convert.ToString(value)+"',@Description)", con);

            cmd.Parameters.AddWithValue("@VendorId", ddlPayVendor.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            con.Open();
            if (cmd.ExecuteNonQuery() > 0)
            {
                txtDate.Text = "";
                txtAmount.Text = "";
                lblEmpAdd.Text = "Paymengt done successfully....!!";
                lblEmpAdd.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblEmpAdd.Text = "Error in Receiving Product....!!";
                lblEmpAdd.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
        }

        protected void ddlPayVendor_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateLabels(ddlPayVendor.SelectedValue.ToString());
        }
    }
}