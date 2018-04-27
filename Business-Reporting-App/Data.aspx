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
</asp:Content>