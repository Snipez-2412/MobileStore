<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="MobileStore.UpdateCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Category</title>
</head>
<body>
    <form id="updateForm" runat="server">
        <div>
            <label for="txtCategoryName">Category Name:</label>
            <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        </div>
    </form>
</body>
</html>
