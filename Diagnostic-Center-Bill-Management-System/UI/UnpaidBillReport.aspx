<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnpaidBillReport.aspx.cs" Inherits="Diagnostic_Center_Bill_Management_System.UI.UnpaidBillReport" %>

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
                        <a class="dropdown-item" href="TestTypeUI.aspx">Test Type</a>
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
                        <a class="dropdown-item active" href="UnpaidBillReport.aspx">Unpaid Bill</a>
                    </div>
                </li>
            </ul>
        </div>

        <br />
        <br />
        <div class="container">
            <form id="form1" runat="server">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="fromDateTextBox">From Date: </label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="fromDateTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                    </div>

                </div>


                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="toDateTextBox">To Date: </label>
                    <div class="col-sm-6">
                        <asp:TextBox CssClass="form-control" ID="toDateTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:Button runat="server" CssClass="btn btn-primary" ID="showButton" Text="Show" OnClick="showButton_Click" />
                    </div>
                </div>
                <br />
                <br />
                <asp:GridView ID="UnpaidGridView" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="218px" Width="381px">
                    <Columns>
                        <asp:TemplateField HeaderText="Serial">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bill Number">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("BillNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contract No">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("MobileNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Patient Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bill Amount">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<% #Eval("TotalFee")%>'></asp:Label>
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
                
                
                <br/>
                
                <div class="form-group row">
                    
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-2">
                        <asp:Button runat="server" CssClass="btn btn-primary" ID="pdfButton" Text="PDF" />
                    </div>
                    <label class="col-sm-1 col-form-label" for="totalMoneyTextBox">Total: </label>
                    <div class="col-sm-4">
                        <asp:TextBox CssClass="form-control" ID="totalMoneyTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
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
    <script>
        $(document).ready(function() {
            $("#toDateTextBox").datepicker({
                format:"yyyy-mm-dd",
                clearBtn:true,
                daysOfWeekHighlighted: "5,6",
                todayHighlight: true
            });
            $("#fromDateTextBox").datepicker({
                format:"yyyy-mm-dd",
                clearBtn:true,
                daysOfWeekHighlighted: "5,6",
                todayHighlight: true
            });

            $("#form1").validate({
                rules: {
                    <%=fromDateTextBox.UniqueID%>: {
                        required: true
                    },
                    <%=toDateTextBox.UniqueID%>: {
                        required: true
                    }
                },
                messages: {
                    <%=fromDateTextBox.UniqueID%>: {
                         required: "Enter From Date"
                     },
                    <%=toDateTextBox.UniqueID%>: {
                        required: "Enter To Date"
                    }
                }
            });
        });
    </script>


</body>

</html>
