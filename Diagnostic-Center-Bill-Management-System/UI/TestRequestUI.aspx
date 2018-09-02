<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRequestUI.aspx.cs" Inherits="Diagnostic_Center_Bill_Management_System.UI.TestRequestUI" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <th>
                    <label for="patientNameTextBox">Name Of The Patient : </label>
                </th>
                <td>
                    <asp:textbox runat="server" id="patientNameTextBox"></asp:textbox>
                </td>
            </tr>

            <tr>
                <th>
                    <label for="birthDateTextBox">Date Of Birth : </label>
                </th>
                <td>
                    <asp:textbox runat="server" id="birthDateTextBox"></asp:textbox>
                </td>
            </tr>

            <tr>
                <th for="mobileNoTextBox">
                    <label for="mobileNoTextBox">Mobile No : </label>
                </th>
                <td>
                    <asp:textbox runat="server" id="mobileNoTextBox"></asp:textbox>
                </td>
            </tr>

            <tr>
                <th>
                    <label for="testDropdownlist">Select Test : </label>
                </th>
                <td>
                    <asp:dropdownlist runat="server" id="testDropdownlist"></asp:dropdownlist>
                </td>
            </tr>

            
            <tr>
                <th></th>
                <td>FEE :
                    <asp:textbox runat="server" id="feeTextBox" readonly="True"></asp:textbox>
                </td>
            </tr>

            <tr>
                <th></th>
                <td>
                    <asp:button runat="server" text="ADD" id="addButton" onclick="addButton_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:gridview ID="testRequestGridView" AutoGenerateColumns="False" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Serial">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Test">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fee">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("Fee") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:gridview>
                </td>

            </tr>
            <tr>
                <th></th>
                <td>Total :
                    <asp:textbox runat="server" id="totalMoneyTextBox"></asp:textbox>
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <asp:button runat="server" id="SaveButton" text="Save" onclick="SaveButton_Click" />
                </td>

            </tr>
        </table>

    </div>
</form>
<body>
</body>

</html>
