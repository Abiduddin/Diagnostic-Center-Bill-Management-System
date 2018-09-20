<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRequestUI.aspx.cs" Inherits="Diagnostic_Center_Bill_Management_System.UI.TestRequestUI" %>


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
                        <a class="dropdown-item active" href="TestRequestUI.aspx">Entry</a>
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
                <div>
                    <div class="form-group row">
                        <label for="patientNameTextBox" class="col-sm-4 col-form-label">Name Of The Patient : </label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" CssClass="form-control" ID="patientNameTextBox"></asp:TextBox>
                        </div>
                    </div>



                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label" for="birthDateTextBox">Date Of Birth : </label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" CssClass="form-control" ID="birthDateTextBox"></asp:TextBox>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label" for="mobileNoTextBox">Mobile No : </label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" CssClass="form-control" ID="mobileNoTextBox"></asp:TextBox>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label" for="testDropdownlist">Select Test : </label>
                        <div class="col-sm-8">
                            <asp:DropDownList runat="server" CssClass="form-control" ID="testDropdownlist"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-4">
                        </div>
                        <label class="col-sm-3 col-form-label" for="feeTextBox">FEE : </label>
                        <div class="col-sm-5">
                            <asp:TextBox runat="server" CssClass="form-control" ID="feeTextBox" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-7">
                        </div>
                        <div class="col-sm-1">
                            <asp:Button runat="server" CssClass="btn btn-primary" Text="ADD" ID="addButton" OnClick="addButton_Click" />
                        </div>
                    </div>


                    <asp:GridView ID="testRequestGridView" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="214px" Width="844px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Serial">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("Id")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Test">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fee">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("Fee")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
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

                    <br/>


                    <div class="form-group row">
                        <div class="col-sm-4">
                        </div>
                        <label class="col-sm-3 col-form-label" for="totalMoneyTextBox">Total:</label>
                        <div class="col-sm-5">
                            <asp:TextBox runat="server" CssClass="form-control" ID="totalMoneyTextBox" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-7">
                        </div>
                        <div class="col-sm-1">
                            <asp:Button runat="server" CssClass="btn btn-primary" ID="SaveButton" Text="Save" OnClick="SaveButton_Click" />
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











