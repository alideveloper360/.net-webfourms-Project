<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Barcode.aspx.cs" Inherits="SalesApp.Barcode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title><link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/font-awesome.css" />
    <%--<script>
        function myFunction() {
            var x;
            var val;
            var person = prompt("Please enter your quantity", val);

            if (person != null) {
                x = "" + person + "";
                Session["val"] = x;
            }
        }
</script>--%>
    
</head>
<%--<body onload="javascript: myFunction()">--%>
    <body>
    <form id="form1" runat="server">
    <div>    
          <asp:TextBox ID="qunatity" TextMode="Number" runat="server"></asp:TextBox> <asp:Button ID="btnPrint" OnClick="btnPrint_Click" runat="server" Text="Print" />
        <asp:TextBox ID="demo" Visible="false" runat="server"></asp:TextBox>
        <asp:Repeater ID="RptImages" runat="server">
    <ItemTemplate>
         
        <asp:Image ID="Img" runat="server" ImageUrl='<%# Container.DataItem %>'/>
    </ItemTemplate>
</asp:Repeater>
            </div>
    </form>
</body>
</html>
