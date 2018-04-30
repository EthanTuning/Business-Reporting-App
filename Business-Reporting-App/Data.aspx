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
                            <h5 class="modal-label-custom"><asp:Label ID="CustomerModalLabel" runat="server" Text="Edit Data"></asp:Label></h5>
                            <asp:GridView ID="CustomerDataTable" runat="server" CssClass="table"></asp:GridView>
                            <div class="text-center">
                                <asp:Button ID="AddCustomerBtn" CssClass="btn btn-default" runat="server" Text="Add" OnClick="AddCustomerBtn_Click" />
                                <asp:Button ID="DeleteCustomerBtn" CssClass="btn btn-default" runat="server" Text="Delete" OnClick="DeleteCustomerBtn_Click" />
                                <asp:Button ID="UpdateCustomerBtn" CssClass="btn btn-default" runat="server" Text="Update" OnClick="UpdateCustomerBtn_Click" />
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
                                <asp:Button ID="AddInvoiceBtn" CssClass="btn btn-default" runat="server" Text="Add" OnClick="AddInvoiceBtn_Click" />
                                <asp:Button ID="DeleteInvoiceBtn" CssClass="btn btn-default" runat="server" Text="Delete" OnClick="DeleteInvoiceBtn_Click" />
                                <asp:Button ID="UpdateInvoiceBtn" CssClass="btn btn-default" runat="server" Text="Update" OnClick="UpdateInvoiceBtn_Click" />
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
                                <asp:Button ID="AddInventoryBtn" CssClass="btn btn-default" runat="server" Text="Add" OnClick="AddInventoryBtn_Click" />
                                <asp:Button ID="DeleteInventoryBtn" CssClass="btn btn-default" runat="server" Text="Delete" OnClick="DeleteInventoryBtn_Click" />
                                <asp:Button ID="UpdateInventoryBtn" CssClass="btn btn-default" runat="server" Text="Update" OnClick="UpdateInventoryBtn_Click" />
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
                                <asp:Button ID="AddSupplierBtn" CssClass="btn btn-default" runat="server" Text="Add" OnClick="AddSupplierBtn_Click" />
                                <asp:Button ID="DeleteSupplierBtn" CssClass="btn btn-default" runat="server" Text="Delete" OnClick="DeleteSupplierBtn_Click" />
                                <asp:Button ID="UpdateSupplierBtn" CssClass="btn btn-default" runat="server" Text="Update" OnClick="UpdateSupplierBtn_Click" />
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

    <!-- Bootstrap Modal Dialogs For Adding/Updating Data -->

    <div class="modal fade" id="customer-form-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="CustomerFormUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="CustomerFormModalTitle" runat="server" Text="Add/Update A Customer"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label runat="server" Text="Company: "></asp:Label>
                            <asp:TextBox ID="CustomerCompanyInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Contact: "></asp:Label>
                            <asp:TextBox ID="CustomerContactInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Phone: "></asp:Label>
                            <asp:TextBox ID="CustomerPhoneInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Billing Address: "></asp:Label>
                            <asp:TextBox ID="CustomerBillingInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Shipping Address: "></asp:Label>
                            <asp:TextBox ID="CustomerShippingInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="AddCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="AddCustomerSubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="invoice-form-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="InvoiceFormUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="InvoiceFormModalTitle" runat="server" Text="Create/Update An Invoice"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label runat="server" Text="Customer Number: "></asp:Label>
                            <asp:TextBox ID="InvoiceCustomerInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Order Date: "></asp:Label>
                            <asp:TextBox ID="InvoiceOrderDatetInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Shipped Date: "></asp:Label>
                            <asp:TextBox ID="InvoiceShippedDateInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Status: "></asp:Label>
                            <asp:TextBox ID="InvoiceStatusInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="AddInvoiceSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="AddInvoiceSubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="inventory-form-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="InventoryFormUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="InventoryFormModalTitle" runat="server" Text="Add/Update An Item To Your Inventory"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label runat="server" Text="SKU: "></asp:Label>
                            <asp:TextBox ID="InventSKUInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Description: "></asp:Label>
                            <asp:TextBox ID="InventDescInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="QOH: "></asp:Label>
                            <asp:TextBox ID="InventQOHInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Supplier ID: "></asp:Label>
                            <asp:TextBox ID="InventSupllierIDInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="AddInventorySubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="AddInventorySubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="supplier-form-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="SupplierFormUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="SupplierFormModalTitle" runat="server" Text="Add/Update A Supplier"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label runat="server" Text="Company: "></asp:Label>
                            <asp:TextBox ID="SupplierCompanyInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Contact: "></asp:Label>
                            <asp:TextBox ID="SupplierContactInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Phone: "></asp:Label>
                            <asp:TextBox ID="SupplierPhoneInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Billing Address: "></asp:Label>
                            <asp:TextBox ID="SupplierBillingInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label runat="server" Text="Shipping Address: "></asp:Label>
                            <asp:TextBox ID="SupplierShippingInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="AddSupplierSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="AddSupplierSubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!-- Bootstrap Modal Dialogs For Deleting Data -->

    <div class="modal fade" id="customer-delete-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="CustomerDeleteUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="CustomerDeleteModalTitle" runat="server" Text="Delete A Customer By ID"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="CustomerDeleteInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="DeleteCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="DeleteCustomerSubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="invoice-delete-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="InvoiceDeleteUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="InvoiceDeleteModalTitle" runat="server" Text="Delete An Invoice By ID"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="InvoiceDeleteInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="InvoiceCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="DeleteInvoiceSubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="inventory-delete-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="InventoryDeleteUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="InventoryDeleteModalTitle" runat="server" Text="Delete An Inventory Item By ID"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="InventoryDeleteInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="InventoryCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="DeleteInventorySubmitBtn_Click"/>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="supplier-delete-modal" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="SupplierDeleteUpdatePanel" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title modal-title-custom"><asp:Label ID="SupplierDeleteModalTitle" runat="server" Text="Delete A Supplier By ID"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="SupplierDeleteInput" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="SupplierCustomerSubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="DeleteSupplierSubmitBtn_Click"/>
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