<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="SalesApp.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<script>  
   function openPopupWindow() {  
       //Open the popup page  
       window.open('Popup.aspx', 'pagename', 'resizable=no,width=200,height=400');  
   }  
</script> 
<form id="form1" runat="server">  
        <asp:TextBox ID="_lname" runat="server"></asp:TextBox>  
        
    </form> 
    <asp:Button ID="btnOpenPopupWindow" runat="server" Text="Open Popup Window" OnClientClick="openPopupWindow();return false;" /> 
</body>
</html>
