<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MobileStore.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Login</h2>
        <asp:Label ID="LblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:Label ID="LblUsername" runat="server" Text="Username:"></asp:Label>
        <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblPassword" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
    </div>
    </form>
</body>
</html>
