<%@ Page Title="Data" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Data.aspx.cs" Inherits="Business_Reporting_App.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Data</h1>
        <p class="lead">Select what entity you want to work with.</p>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h2>Customer</h2>
                <p>Add, remove, or update customer information.</p>
                <p><asp:Button ID="CustomerDataBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="CustomerDataBtn_Click" /></p>
            </div>
            <div class="col-sm-6">
                <h2>Invoice</h2>
                <p>Create or discard an invoice.</p>
                <p><asp:Button ID="InvoiceDataBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="InvoiceDataBtn_Click" /></p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <h2>Inventory</h2>
                <p>Add, remove, or update inventory items.</p>
                <p><asp:Button ID="InventoryDataBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="InventoryDataBtn_Click" /></p>
            </div>
            <div class="col-sm-6">
                <h2>Supplier</h2>
                <p>Add, remove, or update a suppliers information.</p>
                <p><asp:Button ID="SupplierDataBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="SupplierDataBtn_Click" /></p>
            </div>
        </div>
    </div>

    <!-- Bootstrap Modal Dialog -->
    <div class="modal fade" id="customer-modal" role="dialog">
        <div class="modal-lg">
            <asp:UpdatePanel ID="CustomerUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><asp:Label ID="CustomerModalTitle" runat="server" Text="Costumer"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="CustomerModalLabel" runat="server" Text="Data"></asp:Label>
                            <asp:Table ID="CustomerTable" runat="server" CssClass="table">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell>Customer Number</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Company</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Contact</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Phone</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Billing Address</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Shipping Address</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Sales YTD</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
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
                            <h4 class="modal-title"><asp:Label ID="InvoiceModalTitle" runat="server" Text="Invoice"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="InvoiceModalLabel" runat="server" Text="Data"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                            <asp:Table ID="InvoiceTable" runat="server" CssClass="table">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell>Invoice Number</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Customer Number</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Order Date</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Shipped Date</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Total</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
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
                            <h4 class="modal-title"><asp:Label ID="InventoryModalTitle" runat="server" Text="Inventory"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="InventoryModalLabel" runat="server" Text="Data"></asp:Label>
                            <asp:Table ID="InventoryTable" runat="server" CssClass="table">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell>SKU</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Description</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Quantity on Hand</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Unit Weight</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Unit Price</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Supplier ID</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
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
                            <h4 class="modal-title"><asp:Label ID="SupplierModalTitle" runat="server" Text="Supplier"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="SupplierModalLabel" runat="server" Text="Data"></asp:Label>
                            <asp:Table ID="SupplierTable" runat="server" CssClass="table">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell>Supplier ID</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Company</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Contact</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Phone</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Billing Address</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Shipping Address</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
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