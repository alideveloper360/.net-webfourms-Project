using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesApp
{
    public partial class Barcode : System.Web.UI.Page
    {
        HttpContext _cont = HttpContext.Current;
        #region CodeExcluded
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    { txtBarCode.Text = ""; }
        //}

        //protected void barcodebtn_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/ViewBarCode.aspx?val=" + txtBarCode.Text);
        //}
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
           GenerateBarcodes();
        }

        private void GenerateBarcodes()
        {
            try
            {
                //    if (!IsPostBack)
                //    {
                //        pnlBarCode.Visible = false;
                //    } 
                //string Code = Session["val"].ToString();
                string Code= Request.QueryString["val"];
                //string s_c = Code + ""+Environment.NewLine+"Size:" + size;
                //lblprice.Text ="RS."+ Session["price"].ToString()+"";
                // lblsize.Text = "4";
                // Multiply the lenght of the code by 40 (just to have enough width)
                int w = Code.Length * 15;

                // Create a bitmap object of the width that we calculated and height of 100
                Bitmap oBitmap = new Bitmap(190, 90);

                // then create a Graphic object for the bitmap we just created.
                Graphics oGraphics = Graphics.FromImage(oBitmap);

                // Now create a Font object for the Barcode Font
                // (in this case the IDAutomationHC39M) of 18 point size
                Font oFont = new Font("IDAutomationHC39M", 9);

                // Let's create the Point and Brushes for the barcode
                PointF oPoint = new PointF(1f, 1f);
                //PointF oPoint2 = new PointF(5f, 10f);
                SolidBrush oBrushWrite = new SolidBrush(Color.Black);
                SolidBrush oBrush = new SolidBrush(Color.White);
                //SolidBrush oBrush2 = new SolidBrush(Color.White);
                //SolidBrush oBrushWrite2 = new SolidBrush(Color.Red);
                // Now lets create the actual barcode image
                // with a rectangle filled with white color
                oGraphics.FillRectangle(oBrush, 0, 0, 190, 90);
                //oGraphics.FillRectangle(oBrush2, 0, 0, w, 85);

                //string x=null;
                // We have to put prefix and sufix of an asterisk (*),
                // in order to be a valid barcode
                //oGraphics.DrawString("Rs." + price + "", oFont, oBrushWrite2, oPoint2);
                oGraphics.DrawString("*" + Request.QueryString["val"] + "*", oFont, oBrushWrite, oPoint);

                string ImagePath = _cont.Server.MapPath("~") + @"\Attachments\BarCodes\";
                oBitmap.Save(ImagePath + Request.QueryString["val"] + ".jpeg", System.Drawing.Imaging.ImageFormat.Jpeg);
                oBitmap.Dispose();


                // Img.ImageUrl = "~/Attachments/BarCodes/" + Session["SKU"] + ".jpeg";

                //pnlBarCode.Visible = true;
                //pnlGenerate.Visible = false;
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string ImagePath = _cont.Server.MapPath("~") + @"\Attachments\BarCodes\";
            List<string> images = new List<string>();
            int quan = Convert.ToInt32(qunatity.Text);
            for (int i=0; i< quan; i++)
            {
                images.Add(String.Concat("~/Attachments/Barcodes/", Request.QueryString["val"] + ".jpeg"));
            }
            RptImages.DataSource = images;
            RptImages.DataBind();
            qunatity.Visible = false;
            btnPrint.Visible = false;
        }
    }
}