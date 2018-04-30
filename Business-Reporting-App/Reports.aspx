<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Business_Reporting_App.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView Visible="false" ID="tempGV" runat="server" CssClass="table"></asp:GridView>
    <div class="jumbotron">
        <h1>Reports</h1>
        <p class="lead">Select what report you want to run.</p>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h2>Customer Report</h2>
                <p>View all of your customer's or a single customer's information.</p>
                <p><asp:Button ID="CustomerDataBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="CustomerDataBtn_Click" /></p>
            </div>
            <div class="col-sm-6">
                <h2>Invoice Report</h2>
                <p>View all invoices for a given year, or find a single invoice's information.</p>
                <p><asp:Button ID="InvoiceDataBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="InvoiceDataBtn_Click" /></p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <h2>Inventory Report</h2>
                <p>View all of your current inventory, or find a single inventory item.</p>
                <p><asp:Button ID="InventoryDataBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="InventoryDataBtn_Click" /></p>
            </div>
            <div class="col-sm-6">
                <h2>Supplier Report</h2>
                <p>View all of your supplier's information or find a particular supplier's information.</p>
                <p><asp:Button ID="SupplierDataBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="SupplierDataBtn_Click" /></p>
            </div>
        </div>
    </div>

    <!-- Bootstrap Modal Dialogs For Data Tables -->

    <div class="modal fade" id="customer-modal" role="dialog">
        <div class="modal-lg">
            <asp:UpdatePanel ID="CustomerUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="CustomerModalTitle" runat="server" Text="Costumer"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <h5 class="modal-label-custom"><asp:Label ID="CustomerModalLabel" runat="server" Text="View Data"></asp:Label></h5>
                            <asp:GridView ID="CustomerDataTable" runat="server" CssClass="table"></asp:GridView>
                            <div class="text-center">
                                <asp:Button ID="RunSingleCustomerReportBtn" CssClass="btn btn-default" runat="server" Text="Run Single Record Report" OnClick="RunSingleCustomerReportBtn_Click" />
                                <asp:Button ID="RunAllCustomerReportBtn" CssClass="btn btn-default" runat="server" Text="Run All Records Report" OnClick="RunAllCustomerReportBtn_Click" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="invoice-modal" role="dialog">
        <div class="modal-lg">
            <asp:UpdatePanel ID="InvoiceUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="InvoiceModalTitle" runat="server" Text="Invoice"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <h5 class="modal-label-custom"><asp:Label ID="InvoiceModalLabel" runat="server" Text=" Edit Data"></asp:Label></h5>
                            <asp:GridView ID="InvoiceDataTable" runat="server" CssClass="table"></asp:GridView>
                            <div class="text-center">
                                <asp:Button ID="RunSingleInvoiceReportBtn" CssClass="btn btn-default" runat="server" Text="Run Single Record Invoice Report" OnClick="RunSingleInvoiceReportBtn_Click" />
                                <asp:Button ID="RunAllInvoiceReportBtn" CssClass="btn btn-default" runat="server" Text="Run All Invoice Records Report" OnClick="RunAllInvoiceReportBtn_Click" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="inventory-modal" role="dialog">
        <div class="modal-lg">
            <asp:UpdatePanel ID="InventoryUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="InventoryModalTitle" runat="server" Text="Inventory"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <h5 class="modal-label-custom"><asp:Label ID="InventoryModalLabel" runat="server" Text="Edit Data"></asp:Label></h5>
                            <asp:GridView ID="InventoryDataTable" runat="server" CssClass="table"></asp:GridView>
                            <div class="text-center">
                                <asp:Button ID="RunSingleInventoryReportBtn" CssClass="btn btn-default" runat="server" Text="Run Single Record Report" OnClick="RunSingleInventoryReportBtn_Click" />
                                <asp:Button ID="RunAllInventoryReportBtn" CssClass="btn btn-default" runat="server" Text="Run All Inventory Records Report" OnClick="RunAllInventoryReportBtn_Click" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="supplier-modal" role="dialog">
        <div class="modal-lg">
            <asp:UpdatePanel ID="SupplierUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="SupplierModalTitle" runat="server" Text="Supplier"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <h5 class="modal-label-custom"><asp:Label ID="SupplierModalLabel" runat="server" Text="Edit Data"></asp:Label></h5>
                            <asp:GridView ID="SupplierDataTable" runat="server" CssClass="table"></asp:GridView>
                            <div class="text-center">
                                <asp:Button ID="RunSingleSupplierReportBtn" CssClass="btn btn-default" runat="server" Text="Run Report For Single Supplier" OnClick="RunSingleSupplierReportBtn_Click" />
                                <asp:Button ID="RunAllSupplierReportBtn" CssClass="btn btn-default" runat="server" Text="Run Report For All Suppliers" OnClick="RunAllSupplierReportBtn_Click" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <!-- Bootstrap Modal Dialogs For Picking Single Record -->

    <div class="modal fade" id="customer-single-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="CustomerSingleUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="CustomerSingleModalTitle" runat="server" Text="Select A Customer By ID"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="CustomerSingleInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="SingleCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SingleCustomerSubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="invoice-single-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="InvoiceSingleUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="InvoiceSingleModalTitle" runat="server" Text="Select An Invoice By ID"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="InvoiceSingleInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="InvoiceCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SingleInvoiceSubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="inventory-single-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="InventorySingleUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="InventorySingleModalTitle" runat="server" Text="Select An Inventory Item By ID"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="InventorySingleInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="InventoryCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SingleInventorySubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="supplier-single-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="SupplierSingleUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="SupplierSingleModalTitle" runat="server" Text="Select A Supplier By ID"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="SupplierSingleInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="SupplierCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SingleSupplierSubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>