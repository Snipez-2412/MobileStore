<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="MobileStore.AddCategory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Product</title>
</head>
<body>
    <form id="addCategory" runat="server">
        <div>
            <label for="txtCategoryID">Category ID:</label>
            <asp:TextBox ID="txtCategoryID" runat="server"></asp:TextBox><br />

            <label for="txtCategoryName">Category Name:</label>
            <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox><br 

            <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" OnClick="btnAddCategory_Click" />
        </div>
    </form>
</body>
</html>
