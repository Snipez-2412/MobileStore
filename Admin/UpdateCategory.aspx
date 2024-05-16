<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="MobileStore.UpdateCategory" MasterPageFile="/Main.Master"%>

<asp:Content ID="UpdateCategory" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <label for="txtCategoryName" class="form-label">Category Name:</label>
                <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>


