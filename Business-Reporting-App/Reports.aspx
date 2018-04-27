<%@ Page Title="Reprts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Business_Reporting_App.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Reports</h1>
        <p class="lead">Select what report you want to run.</p>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h2>Customer Report</h2>
                <p>View all of your customer's or a single customer's information.</p>
                <p><asp:Button ID="CustomerReportBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="CustomerReportBtn_Click" /></p>
            </div>
            <div class="col-sm-6">
                <h2>Invoice Report</h2>
                <p>View all invoices for a given year, or find a single invoice's information.</p>
                <p><asp:Button ID="InvoiceReportBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="InvoiceReportBtn_Click" /></p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <h2>Inventory Report</h2>
                <p>View all of your current inventory, or find a single inventory item.</p>
                <p><asp:Button ID="InventoryReportBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="InventoryReportBtn_Click" /></p>
            </div>
            <div class="col-sm-6">
                <h2>Supplier</h2>
                <p>View all of your supplier's information or find a particular supplier's information.</p>
                <p><asp:Button ID="SupplierReportBtn" runat="server" CssClass="btn btn-default" Text="Go &raquo;" OnClick="SupplierReportBtn_Click" /></p>
            </div>
        </div>
    </div>
</asp:Content>