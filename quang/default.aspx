<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="MobileStore._default" MasterPageFile="/Main.Master"%>

<asp:Content ID="default" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="error-message"></asp:Label>

        <%-- Product Card View --%>

        <div class="row">
            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <asp:Image ID="ImagePath" runat="server" Width="150px" Height="160px" ImageUrl='<%# "~/Images/" + Eval("ImagePath") %>' />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("ProductName") %></h5>
                                <p class="card-text">Price: <%# Eval("Price") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>
