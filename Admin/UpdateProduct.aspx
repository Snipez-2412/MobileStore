<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="MobileStore.UpdateProduct" MasterPageFile="/Main.Master"%>

<asp:Content ID="UpdateProduct" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <label for="txtProductName" class="form-label">Product Name:</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtPrice" class="form-label">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtDescription" class="form-label">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                <label for="txtStockQuantity" class="form-label">Quantity:</label>
                <asp:TextBox ID="txtStockQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                
                <div class="text-center">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
