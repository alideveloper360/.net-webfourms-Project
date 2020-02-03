using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace SalesApp
{
    public partial class CategoryStock : System.Web.UI.Page
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
            SqlDataAdapter sda = new SqlDataAdapter("select Distinct CategoryName from ProductReceive", con);
            DataSet ds = new DataSet();

            sda.Fill(ds);
            
            ddlFilterCommittee.DataTextField = "CategoryName";
            //ddlFilterCommittee.DataValueField = "Id";
            ddlFilterCommittee.DataSource = ds;
            ddlFilterCommittee.DataBind();
            ddlFilterCommittee.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }
        protected void ddlFilterCommittee_SelectedIndexChanged(object sender, EventArgs e)
        {
            shadow.Text = ddlFilterCommittee.SelectedValue.ToString();
            if (!ddlFilterCommittee.SelectedValue.Equals("0"))
            {
                string query = "select ProductName, CategoryName,ProductSKU,Value,receiveMY from ProductReceive where CategoryName='" + ddlFilterCommittee.SelectedValue.ToString() + "'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gvCategory.DataSource = ds;
                gvCategory.DataBind();
            }
            else
            {
                LoadAttendanceGrid();
            }



        }
        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            //shadow.Text = ddlFilterCommittee.SelectedValue.ToString();
            if (!ddlFilterCommittee.SelectedValue.Equals("0"))
            {
                string query = "select ProductName, CategoryName,ProductSKU,Value,receiveMY from ProductReceive where CategoryName='" + ddlFilterCommittee.SelectedValue.ToString() + "' AND Value='"+ DropDownList1.SelectedValue.ToString()+ "'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gvCategory.DataSource = ds;
                gvCategory.DataBind();
            }
            else
            {
                LoadAttendanceGrid();
            }



        }
        private void LoadAttendanceGrid()
        {
            SqlDataAdapter sda = new SqlDataAdapter(@"select  Distinct ProductName, CategoryName,Value, ProductSKU ,SUM(receiveMY) as receiveMY from ProductReceive group by ProductName, CategoryName, Value, ProductSKU", con);

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

        protected void Unnamed_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtDatee.Text))
            {
                lblmsg.Text = "Enter Date Before Submit";
            }
            else
            {
                for (int i = 0; i < gvCategory.Rows.Count; i++)
                {
                    TextBox txtstock = gvCategory.Rows[i].FindControl("txtstock") as TextBox;
                    if (!string.IsNullOrEmpty(txtstock.Text))
                    {

                        Label C_Name = gvCategory.Rows[i].FindControl("lblName") as Label;
                        Label TotalTP = gvCategory.Rows[i].FindControl("lblCode") as Label;
                        Label TotalRP = gvCategory.Rows[i].FindControl("lblSKU") as Label;
                        Label SKU = gvCategory.Rows[i].FindControl("lblStatus") as Label;
                        Label P_status = gvCategory.Rows[i].FindControl("lblValue") as Label;
                        TextBox Amount = gvCategory.Rows[i].FindControl("txtstock") as TextBox;
                        string Quantity2 = Convert.ToString(Amount.Text);
                        int Quantity = Convert.ToInt32(Quantity2);
                        if(Convert.ToInt32(Amount.Text)> Convert.ToInt32(P_status.Text)) {
                            lblmsg.Text = "Send quantity is greater then Total Quantity";
                            break;
                        }
                        if(Convert.ToInt32(Amount.Text)==0 && Convert.ToInt32(P_status.Text)>0 )
                        {
                            lblmsg.Text = "Send quantity is greater then Total Quantity";
                            break;
                        }
                        if (Convert.ToInt32(Amount.Text) == 0 && Convert.ToInt32(P_status.Text) == 0)
                        {
                            lblmsg.Text = "Send quantity is greater then Total Quantity";
                            break;
                        }
                        //bool flag = false;
                        int count = -1;
                        con.Open();
                        SqlCommand cmd5 = new SqlCommand();
                        cmd5.CommandText = "Select Id,receiveMY from ProductReceive where CategoryName = '" + C_Name.Text + "' AND ProductName='" + TotalTP.Text + "' AND ProductSKU='" + TotalRP.Text + "' AND Value='" + SKU.Text + "'";
                        cmd5.Connection = con;
                        SqlDataReader rd5 = cmd5.ExecuteReader();

                        while (rd5.Read())
                        {
                            if (count == -1)
                            {
                                int ret_val = Convert.ToInt32(rd5[1].ToString());
                                if (Quantity > ret_val)
                                {
                                    ret_val = Quantity - ret_val;
                                }
                                else if (Quantity < ret_val || Quantity == ret_val)
                                {
                                    ret_val = ret_val - Quantity;
                                    Quantity = 0;
                                    count = 0;
                                }
                                //con.Open();
                                SqlCommand cmd4 = new SqlCommand("Update ProductReceive set receiveMY='" + ret_val.ToString() + "' where Id='" + Convert.ToInt32(rd5[0]) + "'", con);
                                cmd4.ExecuteNonQuery();
                                //con.Close();
                            }
                        }
                        con.Close();










                        con.Open();

                        //////////////////////////////////////
                        SqlCommand cmd = new SqlCommand("insert into Shop_Stock(C_Name, P_Name, SKU, Value, Total_Quantity,Send_Quantity,Date) values ('" + Convert.ToString(C_Name.Text) + "','" + Convert.ToString(TotalTP.Text) + "','" + Convert.ToString(TotalRP.Text) + "','" + Convert.ToString(SKU.Text.ToString()) + "','" + Convert.ToString(P_status.Text.ToString()) + "','" + Convert.ToString(txtstock.Text) + "','"+Convert.ToString(txtDatee.Text)+"')", con);

                        cmd.ExecuteNonQuery();

                        lblmsg.Text = "! Successfully Submit Record";

                        con.Close();

                    }
                }
                LoadAttendanceGrid();
            }
        }
    }
}