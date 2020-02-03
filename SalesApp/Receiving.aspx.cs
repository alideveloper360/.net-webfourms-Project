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
    public partial class Receiving : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HassanCloths"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                //ShowCategories();
                Button1.Visible = false;
                LoadReceiving();
                showVendors();
                showVendors2();
            }
        //    foreach (GridViewRow r in gvCategory.Rows)
        //    {
        //        TextBox txtBox = (TextBox)r.FindControl("txtTP");
        //        txtBox.TextChanged += new Eventhandler(txtTP_TextChanged();
        //    }
        }





        private void LoadReceiving()
        {
           
                    SqlDataAdapter sda = new SqlDataAdapter(@"select Product.Id,Product.Name,Category.Category,Product.SKU from Product inner join Category on Product.CategoryId=Category.Id", con);

                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    gvCategory.DataSource = ds;
                    gvCategory.DataBind();
                    if (gvCategory.Rows.Count > 0)
                        gvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;

                    MultiView1.ActiveViewIndex = 0;
                    Button1.Visible = true;
                
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
            ddlVendor.Items.Insert(0, new ListItem("Select Vendor", "0"));
        }
        private void showVendors2()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Vendors", con);
            DataSet ds = new DataSet();
            DropDownList1.DataTextField = "strName";
            DropDownList1.DataValueField = "nv_Id";
            sda.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Select Vendor", "0"));
        }
        protected void btnLoad_Click(object sender, EventArgs e)
        {
            
            lblDate_info.Text = "";
           
            
                LoadReceiving();
         //   MultiView1.ActiveViewIndex = 0;

        }








        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            bool flag = true;
            
            for (int i = 0; i < gvCategory.Rows.Count; i++)
            {
                CheckBox chk = gvCategory.Rows[i].Cells[0].FindControl("CheckBox1") as CheckBox;
                if (chk.Checked)
                {
                    Label Code = gvCategory.Rows[i].FindControl("lblCode") as Label;
                    Label TotalTP = gvCategory.Rows[i].FindControl("txtTotalTP") as Label;
                    Label TotalRP = gvCategory.Rows[i].FindControl("txtTotalRP") as Label;
                    Label SKU = gvCategory.Rows[i].FindControl("lblSKU") as Label;
                    var P_status = gvCategory.Rows[i].FindControl("value") as DropDownList;
                    String Status_Att = P_status.SelectedItem.Value;

                    Label Time_t = gvCategory.Rows[i].FindControl("lblName") as Label;
                    Label Category = gvCategory.Rows[i].FindControl("lblCode") as Label;

                    TextBox receive = gvCategory.Rows[i].FindControl("txtreceive") as TextBox;

                    TextBox TP = gvCategory.Rows[i].FindControl("txtTP") as TextBox;
                    TextBox RP = gvCategory.Rows[i].FindControl("txtRP") as TextBox;
                    if (txtGRN.Text == "" || txtDate.Text == "" || Time_t.Text == "" || Category.Text == "" || TP.Text == "" || RP.Text == "" || receive.Text == "" || SKU.Text == "" || Status_Att == "")
                    {
                        lblmagerror.Text = "Kindly Fill all value of check box";

                        flag = false;
                        LoadReceiving();
                        break;
                    }
                }
            }
            if (flag == true)
            {
                int TotalTP_Amount = 0;
                //String str_Time = null;
                for (int i = 0; i < gvCategory.Rows.Count; i++)
                {

                    CheckBox chk = gvCategory.Rows[i].Cells[0].FindControl("CheckBox1") as CheckBox;
                    if (chk.Checked)
                    {
                        con.Open();

                        Label Code = gvCategory.Rows[i].FindControl("lblCode") as Label;
                        Label TotalTP = gvCategory.Rows[i].FindControl("txtTotalTP") as Label;
                        Label TotalRP = gvCategory.Rows[i].FindControl("txtTotalRP") as Label;
                        Label SKU = gvCategory.Rows[i].FindControl("lblSKU") as Label;
                        var P_status = gvCategory.Rows[i].FindControl("value") as DropDownList;
                        String Status_Att = P_status.SelectedItem.Value;

                        Label Time_t = gvCategory.Rows[i].FindControl("lblName") as Label;
                        Label Category = gvCategory.Rows[i].FindControl("lblCode") as Label;
                        ///This code is created by Muhammad Ali
                        TextBox receive = gvCategory.Rows[i].FindControl("txtreceive") as TextBox;

                        TextBox TP = gvCategory.Rows[i].FindControl("txtTP") as TextBox;
                        TextBox RP = gvCategory.Rows[i].FindControl("txtRP") as TextBox;
                        //po.Text = "Value Null";
                        //if (txtGRN.Text == "" || txtDate.Text == "" || Time_t.Text == "" || Category.Text == "" || TP.Text == "" || RP.Text == "" || receive.Text == "" || SKU.Text == "" || Status_Att == "")
                        //{ po.Text = "Kindly Fill all value of check box";

                        //}
                        //else
                        //{

                        int amt = Convert.ToInt32(receive.Text) * Convert.ToInt32(TP.Text);
                        TotalTP_Amount = TotalTP_Amount+ amt ;










                        SqlCommand cmd = new SqlCommand("insert into ProductReceive(GRN,Vendor,Date,ProductName,CategoryName,TP,RP,receiveMY,ProductSKU,Value,TotalTP,TotalRP) values ('" + txtGRN.Text + "','" + ddlVendor.SelectedIndex + "','" + txtDate.Text + "','" + Convert.ToString(Time_t.Text) + "','" + Convert.ToString(Category.Text) + "','" + Convert.ToString(TP.Text) + "','" + Convert.ToString(RP.Text) + "','" + Convert.ToString(receive.Text) + "','" + SKU.Text + "','" + Status_Att + "','" + Convert.ToInt32(receive.Text) * Convert.ToInt32(TP.Text) + "','" + Convert.ToInt32(receive.Text) * Convert.ToInt32(RP.Text) + "')", con);
                        SqlCommand cmd1 = new SqlCommand("insert into tbl_ProductReceive(GRN,Vendor,Date,ProductName,CategoryName,TP,RP,receiveMY,ProductSKU,Value,TotalTP,TotalRP) values ('" + txtGRN.Text + "','" + ddlVendor.SelectedIndex + "','" + txtDate.Text + "','" + Convert.ToString(Time_t.Text) + "','" + Convert.ToString(Category.Text) + "','" + Convert.ToString(TP.Text) + "','" + Convert.ToString(RP.Text) + "','" + Convert.ToString(receive.Text) + "','" + SKU.Text + "','" + Status_Att + "','" + Convert.ToInt32(receive.Text) * Convert.ToInt32(TP.Text) + "','" + Convert.ToInt32(receive.Text) * Convert.ToInt32(RP.Text) + "')", con);



                        cmd.ExecuteNonQuery();
                        cmd1.ExecuteNonQuery();






                        con.Close();
                    }
                }

                string payable = null;
                con.Open();
                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = "Select payable from VendorPay where Vendor='"+ ddlVendor.SelectedIndex + "'";
                cmd2.Connection = con;
                SqlDataReader rd = cmd2.ExecuteReader();
                while (rd.Read())
                {
                    payable = rd[0].ToString();
                }

                con.Close();

                int value = Convert.ToInt32(payable) + Convert.ToInt32(TotalTP_Amount);
                con.Open();
                SqlCommand cmd4 = new SqlCommand("insert into VendorPay(GRN,Vendor,Date,TotalTP,payable) values ('" + txtGRN.Text + "','" + ddlVendor.SelectedIndex + "','" + txtDate.Text + "','"+ TotalTP_Amount + "','"+ value + "')", con);
                cmd4.ExecuteNonQuery();
                con.Close();



                txtGRN.Text = "";
                txtDate.Text = "";
                Label1.Text = "! Record Submitted SuccessFully";
                LoadReceiving();
                //Label1.Text =str_Time;
                //LoadReceiving();
            }

        }



        protected void txtGRN_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtTP_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            GridViewRow gr = (GridViewRow)txt.NamingContainer;
            TextBox Tp = (TextBox)gr.FindControl("txtTP");
            TextBox meters = (TextBox)gr.FindControl("txtreceive");
            TextBox totalTp = (TextBox)gr.FindControl("txtTotalTP");
            totalTp.Text = (Convert.ToInt32(meters.Text) * Convert.ToInt32(Tp.Text)).ToString();
        }

        protected void txtRP_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            GridViewRow gr = (GridViewRow)txt.NamingContainer;
            TextBox Rp = (TextBox)gr.FindControl("txtRP");
            TextBox meters = (TextBox)gr.FindControl("txtreceive");
            Label totalRp = (Label)gr.FindControl("txtTotalRP");
            totalRp.Text = (Convert.ToInt32(meters.Text) * Convert.ToInt32(Rp.Text)).ToString();
        }

        protected void txtAddBill_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string payable = null;
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "Select payable from VendorPay where Vendor='" + DropDownList1.SelectedIndex + "'";
            cmd2.Connection = con;
            SqlDataReader rd = cmd2.ExecuteReader();
            while (rd.Read())
            {
                payable = rd[0].ToString();
            }

            con.Close();

            int value = Convert.ToInt32(payable) + Convert.ToInt32(txtAmount1.Text);
            con.Open();
            SqlCommand cmd4 = new SqlCommand("insert into VendorPay(GRN,Vendor,Date,TotalTP,payable,Description) values ('" + txtGRN1.Text + "','" + DropDownList1.SelectedIndex + "','" + txtDate1.Text + "','" + txtAmount1.Text + "','" + value + "','"+txtDescription1.Text+"')", con);
            cmd4.ExecuteNonQuery();
            con.Close();
            txtGRN1.Text = "";
            txtAmount1.Text = "";
            txtDate1.Text = "";
            txtDescription1.Text = "";
            txtmsg.Text = "Successfully submit----!";
        }
    }



       /* protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }*/
    }
