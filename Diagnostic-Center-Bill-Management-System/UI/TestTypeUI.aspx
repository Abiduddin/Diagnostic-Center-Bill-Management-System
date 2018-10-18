<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTypeUI.aspx.cs" Inherits="Diagnostic_Center_Bill_Management_System.UI.TestTypeUI" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Diagnostic Center Bill Management</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Contents/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../Scripts/my/validate_error.css" rel="stylesheet" />

</head>

<body>
    <div class="jumbotron text-center">
        <h1>BD Diagnostic Center</h1>
        <h3>Bill Management System</h3>
        <%--Slide show here--%>
    </div>

    <div class="container">

        <div>
            <ul class="nav nav-tabs ">
                <li class="nav-item">
                    <a class="nav-link" href="HomeUI.aspx">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="False">Setup</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item active" href="TestTypeUI.aspx">Test Type</a>
                        <a class="dropdown-item" href="TestSetupUI.aspx">Test</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="False">Test Request</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="TestRequestUI.aspx">Entry</a>
                        <a class="dropdown-item" href="PaymentUI.aspx">Payment</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="False">Report</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="TestWiseReportUI.aspx">Test Wise</a>
                        <a class="dropdown-item" href="TypeWiseReportUI.aspx">Type Wise</a>
                        <a class="dropdown-item" href="UnpaidBillReport.aspx">Unpaid Bill</a>
                    </div>
                </li>
            </ul>
        </div>
        <br />
        <br />

        <div class="container">
            <form id="form1" runat="server">

                <div class="form-group row">

                    <label for="typeNameTextBox" class="col-sm-2 col-form-label">Type Name: </label>
                    <div class="col-sm-4">
                        <asp:TextBox runat="server" CssClass="form-control" ID="typeNameTextBox"></asp:TextBox>
                    </div>

                </div>

                <div class="form-group row">
                    <div class="col-sm-10">
                        <asp:Button runat="server" CssClass="btn btn-primary submit" Text="Save" ID="saveButton" OnClick="saveButton_Click" />
                    </div>
                </div>




                <asp:GridView ID="typeViewGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="338px">
                    <Columns>
                        <asp:TemplateField HeaderText="Serial">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<% #Eval("Id")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<% #Eval("Name")%>'></asp:Label>
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
            </form>
        </div>

    </div>

    <script src="../Scripts/jquery-3.3.1.js"></script>
    <script src="../Scripts/popperV1.js"></script>


    <script src="../Scripts/jquery.validate.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <%--<script src="../Scripts/my/validejs.js"></script>--%>

    <script>
        $(document).ready(function() {

            $("#form1").validate({
                rules: {
                    <%= typeNameTextBox.UniqueID %>: {
                        required: true
                    },

                },
                messages: {
                    <%= typeNameTextBox.UniqueID %>: {
                required: "Enter a Valid Type Name"
            },

        }
            });
        });
    </script>


</body>

</html>
