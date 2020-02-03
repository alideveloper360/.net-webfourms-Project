<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SalesApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox id="p1" runat="server" />  
        <asp:Button Text="button" runat="server" OnClick="Unnamed_Click"/>
        <asp:Label id="p2" runat="server" />
    </div>
    </form>
</body>
</html>
