<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="MobileStore.AddProduct" MasterPageFile="/Main.Master"%>


<asp:Content ID="AddProduct" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <label for="txtProductID">Product ID:</label>
                <asp:TextBox ID="txtProductID" runat="server" CssClass="form-control"></asp:TextBox><br />

                <label for="txtProductName">Product Name:</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox><br />

                <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                </asp:DropDownList><br />

                <label for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox><br />

                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox><br />

                <label for="txtQuantity">Quantity:</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox><br />

                <label for="txtImagePath">Image:</label>
                <asp:TextBox ID="txtImagePath" runat="server" CssClass="form-control"></asp:TextBox><br />

                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>
