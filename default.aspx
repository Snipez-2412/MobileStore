<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="MobileStore._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mobile Store</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Product List</h2>


            <%-- Product Grid View --%>
            <div class="row" style="margin-top: 20px;">
                <div class="col-sm-8">
                    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                        DataKeyNames="prod_id"
                        CssClass="table table-striped table-bordered table-condensed" BorderColor="Silver"
                        OnRowDeleting="gvProduct_RowDeleting"
                        OnRowCommand="gvProduct_RowCommand"
                        EmptyDataText="No Data.">
                        <Columns>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                    <HeaderStyle HorizontalAlign="Left" Width="25px"/>
                                    <ItemStyle HorizontalAlign="Right" Font-Bold="true"/>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="image">
                                <ItemTemplate>
                                    <asp:Image ID="img" runat="server" Width="100px" Height="100px" imageurl='<%#  "~/Images/"+Eval("img") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="prod_id" HeaderText="Product ID">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <asp:BoundField DataField="prod_name" HeaderText="Product Name">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <%-- Delete Product --%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDelProduct" Text="Del" runat="server"
                                        OnClientClick="return confirm('Do you want to delete this product');" CommandName="Delete" />
                                </ItemTemplate>
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Center" Width="50px"/>
                            </asp:TemplateField>

                             <%-- Update Product --%>
                             <asp:TemplateField HeaderText="">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="lbUpdProduct" runat="server" CommandArgument='<%#Eval("prod_ID") %>'
                                         CommandName="Update" Text="Upd" CausesValidation="False"/> 
                                 </ItemTemplate>
                                 <ItemStyle      HorizontalAlign="Center" Width="80px"/>
                             </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <%-- Logout --%>
            <div style="margin-bottom: 20px;">
                <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" CssClass="logout-button" />
            </div>
        </div>
    </form>

    

</body>
</html>
