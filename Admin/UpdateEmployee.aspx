<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateEmployee.aspx.cs" Inherits="MobileStore.Admin.UpdateEmployee" MasterPageFile="/Main.Master"%>

<asp:Content ID="UpdateEmployee" ContentPlaceHolderID="MainContent" runat="server">
      <div>
            <label for="txtEmployeeName">Employee Name:</label>
            <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="txtPosition">Position:</label>
            <asp:TextBox ID="txtPosition" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="txtSalary">Salary:</label>
            <asp:TextBox ID="txtSalary" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>
        
        <div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        </div>
</asp:Content>
