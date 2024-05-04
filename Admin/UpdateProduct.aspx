<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="MobileStore.UpdateProduct" MasterPageFile="/Main.Master"%>

<asp:Content ID="UpdateProduct" ContentPlaceHolderID="MainContent" runat="server">
      <div>
            <label for="txtProductName">Product Name:</label>
            <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="txtPrice">Price:</label>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="txtDescription">Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div>
            <label for="txtQuantity">Quantity:</label>
            <asp:TextBox ID="txtStockQuantity" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        </div>
</asp:Content>