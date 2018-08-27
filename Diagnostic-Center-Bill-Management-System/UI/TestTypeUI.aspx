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
            <asp:gridview runat="server">
                    
                </asp:gridview>
        </div>
    </div>
</form>
<body>
</body>

</html>
