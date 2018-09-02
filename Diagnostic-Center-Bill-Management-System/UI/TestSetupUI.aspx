<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestSetupUI.aspx.cs" Inherits="Diagnostic_Center_Bill_Management_System.UI.TestSetupUI" %>

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
                    <th><label for="testNameTextBox">Test Name : </label></th>
                    <td><asp:TextBox runat="server" ID="testNameTextBox"></asp:TextBox></td>
                </tr>
                <tr>
                    <th><label for="testFeeTextBox">Fee : </label></th>
                    <td><asp:TextBox runat="server" ID="testFeeTextBox"></asp:TextBox> BDT</td> 
                </tr>
                <tr>
                    <th><label for="">Test Type : </label></th>
                    <td><asp:dropdownlist runat="server" ID="testTypeDropdownlist"></asp:dropdownlist> </td>
                </tr>
                <tr>
                    
                    <th></th>
                    <td><asp:button ID="testSaveButton" runat="server" text="Save" OnClick="testSaveButton_Click" /> </td>
                    
                </tr>
                
            </table>
            <asp:gridview runat="server" ID="TestGridView"></asp:gridview>
        </div>
        
    </form>
<body>
</body>

</html>
