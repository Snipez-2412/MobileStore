<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MobileStore.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
   <link href="Content/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Login</h2>
            <asp:Label ID="LblErrorMessage" runat="server" CssClass="error-message"></asp:Label>
            <div class="form-group">
                <asp:Label ID="LblUsername" runat="server" Text="Username:"></asp:Label>
                <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LblPassword" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="BtnLogin_Click" />
        </div>
    </form>
</body>
</html>
