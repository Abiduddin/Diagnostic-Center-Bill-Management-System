<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentUI.aspx.cs" Inherits="Diagnostic_Center_Bill_Management_System.UI.PaymentUI" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Diagnostic Center Bill Management</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Contents/bootstrap-datepicker.css" rel="stylesheet" />


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
                    <a class="nav-link " href="HomeUI.aspx">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="False">Setup</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="TestTypeUI.aspx">Test Type</a>
                        <a class="dropdown-item" href="TestSetupUI.aspx">Test</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="False">Test Request</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="TestRequestUI.aspx">Entry</a>
                        <a class="dropdown-item active" href="PaymentUI.aspx">Payment</a>
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
                <div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Bill No: </label>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" CssClass="form-control" ID="billNoTextBox"></asp:TextBox>
                        </div>
                        <label class="col-sm-2 col-form-label">Or</label>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Mobile NO: </label>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" CssClass="form-control" ID="mobileNoTextBox"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Search" ID="searchButton" OnClick="searchButton_Click" />
                        </div>

                    </div>


                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Amount: </label>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" CssClass="form-control" ID="amountTextbox" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Due Date: </label>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" CssClass="form-control" ID="dueDateTextbox" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Pay" ID="payButton" OnClick="payButton_Click" />
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>

    <script src="../Scripts/jquery-3.3.1.js"></script>
    <script src="../Scripts/popperV1.js"></script>


    <script src="../Scripts/jquery.validate.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap-datepicker.js"></script>
</body>

</html>




























