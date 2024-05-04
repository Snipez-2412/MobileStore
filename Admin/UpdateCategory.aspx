<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="MobileStore.UpdateCategory" MasterPageFile="/Main.Master"%>

<asp:Content ID="UpdateCategory" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <label for="txtCategoryName">Category Name:</label>
            <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        </div>
</asp:Content>

