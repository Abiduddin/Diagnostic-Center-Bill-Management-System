<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentUI.aspx.cs" Inherits="Diagnostic_Center_Bill_Management_System.UI.PaymentUI" %>

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
                <th>Bill No </th>
                <td>
                    <asp:textbox runat="server" id="billNoTextBox"></asp:textbox>
                </td>
                <td>Or</td>

            </tr>
            <tr>
                <th>Mobile NO </th>
                <td>
                    <asp:textbox runat="server" id="mobileNoTextBox"></asp:textbox>
                </td>
                <td>
                    <asp:button runat="server" text="Search" ID="searchButton" OnClick="searchButton_Click" />
                </td>
            </tr>
            
            <tr>
                <th>Amount </th>
                <td>
                    <asp:textbox runat="server" id="amountTextbox"></asp:textbox>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <th>Due Date </th>
                <td>
                    <asp:textbox runat="server" id="dueDateTextbox"></asp:textbox>
                </td>
                <td>
                    <asp:button runat="server" text="Pay" ID="payButton" OnClick="payButton_Click" />
                </td>
            </tr>
        </table>
    </div>
</form>
<body>
</body>

</html>
