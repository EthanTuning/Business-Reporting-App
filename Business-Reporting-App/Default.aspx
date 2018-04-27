<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Business_Reporting_App._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Welcome</h1>
        <p class="lead">This is my business reports application!</p>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h2>Data</h2>
                <p>On the "Data" page you can view, add, delete, and update data that is stored in the database.</p>
                <p><a runat="server" class="btn btn-default" href="~/Data">Go &raquo;</a></p>
            </div>
            <div class="col-sm-6">
                <h2>Reports</h2>
                <p>On the "Reports you can run reports on the various data entities and then download them as PDF documents.</p>
                <p><a runat="server" class="btn btn-default" href="~/Reports">Go &raquo;</a></p>
            </div>
        </div>
    </div>
</asp:Content>
