<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTypeUI.aspx.cs" Inherits="Diagnostic_Center_Bill_Management_System.UI.TestTypeUI" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<form id="form1" runat="server">
    <div>

        <label for="typeNameTextBox">Type Name: </label>
        <asp:textbox runat="server" id="typeNameTextBox"></asp:textbox>
        <br />
        <asp:button runat="server" text="Save" id="saveButton" onclick="saveButton_Click" />


        <div>
        </div>
    </div>
<body>
    <asp:GridView ID="typeViewGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="Serial">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<% #Eval("Id")  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type Name">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<% #Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</body>

</form>

</html>
