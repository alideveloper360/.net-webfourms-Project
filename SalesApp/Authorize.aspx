<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authorize.aspx.cs" Inherits="SalesApp.Authorize" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hassan cloth house</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <!--== FAV ICON ==-->
    <link rel="shortcut icon" href="images/fav.ico"/>

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700" rel="stylesheet"/>

    <!-- FONT-AWESOME ICON CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css"/>

    <!--== ALL CSS FILES ==-->
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/mob.css"/>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/materialize.css" />
</head>
<body>
    <form id="form1" runat="server">
         <div class="blog-login">
        <div class="blog-login-in">
                <img src="images/logo.png" alt="" />
                <div class="row">
                    <div class="input-field col s12">
                        <asp:TextBox ID="txtUsername" runat="server" class="validate"></asp:TextBox>
                        <label for="txtUsername">User Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                     <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="validate"></asp:TextBox>
                        <label for="txtPassword">Password</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <asp:Button ID="btnLogin" class="waves-effect waves-light btn-large btn-log-in" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </div>
                </div>
                <a href="forgot.html" class="for-pass">Forgot Password?</a>
        </div>
    </div>

  
    </form>
      <!--======== SCRIPT FILES =========-->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/materialize.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>
