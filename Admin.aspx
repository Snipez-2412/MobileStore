﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="MobileStore.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Product List</h2>


            <%-- Product Grid View --%>
            <div class="row" style="margin-top: 20px;">

                <div class="col-sm-8">
                    <asp:HyperLink ID="hlAddProduct" runat="server" NavigateUrl="~/AddProduct.aspx" Text="Add New Product"></asp:HyperLink>
                    <asp:Label ID="lblMessage" runat="server" Text="" CssClass="error-message"></asp:Label>

					<asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                        DataKeyNames="CategoryID"
                        CssClass="table table-striped table-bordered table-condensed" BorderColor="Silver"
                        OnRowDeleting="gvCategory_RowDeleting"
                        OnRowCommand="gvCategory_RowCommand"
                        EmptyDataText="No Data.">
                        <Columns>

                            <%--<asp:TemplateField>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                    <HeaderStyle HorizontalAlign="Left" Width="25px"/>
                                    <ItemStyle HorizontalAlign="Right" Font-Bold="true"/>
                                </ItemTemplate>
                            </asp:TemplateField>--%>

                           <asp:BoundField DataField="CategoryID" HeaderText="Category ID">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <asp:BoundField DataField="CategoryName" HeaderText="Category Name">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <%-- Delete Category --%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDelCategory" Text="Del" runat="server"
                                        OnClientClick="return confirm('Do you want to delete this Category');" CommandName="Delete" />
                                </ItemTemplate>
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Center" Width="50px"/>
                            </asp:TemplateField>

                             <%-- Update Category --%>
                             <asp:TemplateField HeaderText="">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="lbUpdCategory" runat="server" CommandArgument='<%#Eval("CategoryID") %>'
                                         CommandName="Update" Text="Upd" CausesValidation="False"/> 
                                 </ItemTemplate>
                                 <ItemStyle      HorizontalAlign="Center" Width="80px"/>
                             </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

					</br>

                    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                        DataKeyNames="ProductID"
                        CssClass="table table-striped table-bordered table-condensed" BorderColor="Silver"
                        OnRowDeleting="gvProduct_RowDeleting"
                        OnRowCommand="gvProduct_RowCommand"
                        EmptyDataText="No Data.">
                        <Columns>

                           <%-- <asp:TemplateField HeaderText="image">
                                <ItemTemplate>
                                    <asp:Image ID="img" runat="server" Width="100px" Height="100px" imageurl='<%#  "~/Images/"+Eval("img") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>--%>

                            <asp:BoundField DataField="ProductID" HeaderText="Product ID">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <asp:BoundField DataField="ProductName" HeaderText="Product Name">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                           <asp:BoundField DataField="CategoryName" HeaderText="Category">
                                <HeaderStyle HorizontalAlign="Left"/>
                                <ItemStyle HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <asp:BoundField DataField="Price" HeaderText="Price">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <asp:BoundField DataField="Description" HeaderText="Description">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <asp:BoundField DataField="StockQuantity" HeaderText="Stock Quantity">
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
                                     <asp:LinkButton ID="lbUpdProduct" runat="server" CommandArgument='<%#Eval("ProductID") %>'
                                         CommandName="Update" Text="Upd" CausesValidation="False"/> 
                                 </ItemTemplate>
                                 <ItemStyle      HorizontalAlign="Center" Width="80px"/>
                             </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

					</br>

                    <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                        DataKeyNames="Username"
                        CssClass="table table-striped table-bordered table-condensed" BorderColor="Silver"
                        OnRowDeleting="gvUser_RowDeleting"
                        OnRowCommand="gvUser_RowCommand"
                        EmptyDataText="No Data.">
                        <Columns>

                            <asp:BoundField DataField="Username" HeaderText="Username">
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Left"/>
                            </asp:BoundField>

                            <%-- Delete User --%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDelUser" Text="Del" runat="server"
                                        OnClientClick="return confirm('Do you want to delete this User');" CommandName="Delete" />
                                </ItemTemplate>
                                <HeaderStyle    HorizontalAlign="Left"/>
                                <ItemStyle      HorizontalAlign="Center" Width="50px"/>
                            </asp:TemplateField>

                             <%-- Update User --%>
                             <asp:TemplateField HeaderText="">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="lbUpdUser" runat="server" CommandArgument='<%#Eval("username") %>'
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