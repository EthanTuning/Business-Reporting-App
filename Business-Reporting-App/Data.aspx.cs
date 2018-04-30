using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace Business_Reporting_App {
    public partial class About : Page {

        private string connectionString;

        protected void Page_Load(object sender, EventArgs e) {

            if (!IsPostBack) {


                connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                UpdateCustomerDataTable();
                UpdateInvoiceDataTable();
                UpdateInventoryDataTable();
                UpdateSupplierDataTable();

            }

        }

        private void UpdateCustomerDataTable() {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                connection.Open();

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM customer")) {

                    using (MySqlDataAdapter customerDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        customerDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            customerDataAdapter.Fill(table);
                            CustomerDataTable.DataSource = table;
                            CustomerDataTable.DataBind();
                            CustomerDataTable.HeaderRow.Cells[0].Text = "Customer ID";
                            CustomerDataTable.HeaderRow.Cells[1].Text = "Company";
                            CustomerDataTable.HeaderRow.Cells[2].Text = "Billing Address";
                            CustomerDataTable.HeaderRow.Cells[3].Text = "Shipping Address";
                            CustomerDataTable.HeaderRow.Cells[4].Text = "Contact Email";
                            CustomerDataTable.HeaderRow.Cells[5].Text = "Contact Phone";
                            CustomerDataTable.HeaderRow.Cells[6].Text = "Sales YTD";
                        }
                    }
                }

                connection.Close();
            }

        }

        private void UpdateInvoiceDataTable() {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                connection.Open();

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM invoice")) {

                    using (MySqlDataAdapter invoiceDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        invoiceDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            invoiceDataAdapter.Fill(table);
                            InvoiceDataTable.DataSource = table;
                            InvoiceDataTable.DataBind();
                            InvoiceDataTable.HeaderRow.Cells[0].Text = "Invoice ID";
                            InvoiceDataTable.HeaderRow.Cells[1].Text = "Ordered";
                            InvoiceDataTable.HeaderRow.Cells[2].Text = "Shipped";
                            InvoiceDataTable.HeaderRow.Cells[3].Text = "Total Amount";
                            InvoiceDataTable.HeaderRow.Cells[4].Text = "Customer ID";
                            InvoiceDataTable.HeaderRow.Cells[5].Text = "Status";

                        }
                    }
                }

                connection.Close();

            }
        }

        private void UpdateInventoryDataTable() {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                connection.Open();

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM inventory")) {

                    using (MySqlDataAdapter inventoryDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        inventoryDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            inventoryDataAdapter.Fill(table);
                            InventoryDataTable.DataSource = table;
                            InventoryDataTable.DataBind();
                            InventoryDataTable.HeaderRow.Cells[0].Text = "SKU";
                            InventoryDataTable.HeaderRow.Cells[1].Text = "Description";
                            InventoryDataTable.HeaderRow.Cells[2].Text = "Quantity on Hand";
                            InventoryDataTable.HeaderRow.Cells[3].Text = "Weight";
                            InventoryDataTable.HeaderRow.Cells[4].Text = "Price";
                            InventoryDataTable.HeaderRow.Cells[5].Text = "Supplier ID";

                        }
                    }
                }

                connection.Close();
            }

        }

        private void UpdateSupplierDataTable() {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                connection.Open();

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM supplier")) {

                    using (MySqlDataAdapter supplierDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        supplierDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            supplierDataAdapter.Fill(table);
                            SupplierDataTable.DataSource = table;
                            SupplierDataTable.DataBind();
                            SupplierDataTable.HeaderRow.Cells[0].Text = "Supplier ID";
                            SupplierDataTable.HeaderRow.Cells[1].Text = "Company";
                            SupplierDataTable.HeaderRow.Cells[2].Text = "Contact Email";
                            SupplierDataTable.HeaderRow.Cells[3].Text = "Contact Phone";
                            SupplierDataTable.HeaderRow.Cells[4].Text = "Billing Address";
                            SupplierDataTable.HeaderRow.Cells[5].Text = "Shipping Address";

                        }
                    }
                }

                connection.Close();

            }

        }

        protected void CustomerDataBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "customer-modal", "$('#customer-modal').modal();", true);
            CustomerUpdatePanel.Update();

        }

        protected void InvoiceDataBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "invoice-modal", "$('#invoice-modal').modal();", true);
            CustomerUpdatePanel.Update();

        }

        protected void InventoryDataBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "inventory-modal", "$('#inventory-modal').modal();", true);
            CustomerUpdatePanel.Update();

        }

        protected void SupplierDataBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "supplier-modal", "$('#supplier-modal').modal();", true);
            CustomerUpdatePanel.Update();

        }

        protected void AddCustomerBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "customer-form-modal", "$('#customer-form-modal').modal();", true);
            CustomerFormUpdatePanel.Update();

        }

        protected void AddInvoiceBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "invoice-form-modal", "$('#invoice-form-modal').modal();", true);
            InvoiceFormUpdatePanel.Update();

        }

        protected void AddInventoryBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "inventory-form-modal", "$('#inventory-form-modal').modal();", true);
            InventoryFormUpdatePanel.Update();

        }

        protected void AddSupplierBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "supplier-form-modal", "$('#supplier-form-modal').modal();", true);
            SupplierFormUpdatePanel.Update();

        }

        protected void AddCustomerSubmitBtn_Click(object sender, EventArgs e) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                connection.Open();

                using (MySqlCommand command = new MySqlCommand("INSERT INTO customer (company, contact, phone, billing_address, shipping_address) VALUES (@company, @contact, @phone, @billing_address, @shipping_address)")) {

                    MySqlParameter param1 = new MySqlParameter("@company", CustomerCompanyInput);
                    MySqlParameter param2 = new MySqlParameter("@contact", CustomerContactInput);
                    MySqlParameter param3 = new MySqlParameter("@phone", CustomerPhoneInput);
                    MySqlParameter param4 = new MySqlParameter("@billing_address", CustomerBillingInput);
                    MySqlParameter param5 = new MySqlParameter("@shipping_address", CustomerShippingInput);
                    object[] parms = new object[] { param1, param2, param3, param4, param5 };
                    command.Parameters.AddRange(parms);
                    command.ExecuteNonQuery();

                }

                using (MySqlCommand command = new MySqlCommand("CALL update_input_totals()")) {

                    command.ExecuteNonQuery();

                }

                using(MySqlCommand command = new MySqlCommand("CALL update_sales_ytd()")) {

                    command.ExecuteNonQuery();

                }

                connection.Close();
            }

            UpdateCustomerDataTable();

        }

        protected void AddInvoiceSubmitBtn_Click(object sender, EventArgs e) {



        }

        protected void AddInventorySubmitBtn_Click(object sender, EventArgs e) {



        }

        protected void AddSupplierSubmitBtn_Click(object sender, EventArgs e) {



        }

        protected void UpdateCustomerBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "customer-form-modal", "$('#customer-form-modal').modal();", true);
            CustomerFormUpdatePanel.Update();

        }

        protected void UpdateInvoiceBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "invoice-form-modal", "$('#invoice-form-modal').modal();", true);
            InvoiceFormUpdatePanel.Update();

        }

        protected void UpdateInventoryBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "inventory-form-modal", "$('#inventory-form-modal').modal();", true);
            InventoryFormUpdatePanel.Update();

        }

        protected void UpdateSupplierBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "supplier-form-modal", "$('#supplier-form-modal').modal();", true);
            SupplierFormUpdatePanel.Update();

        }

        protected void DeleteCustomerBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "customer-delete-modal", "$('#customer-delete-modal').modal();", true);
            CustomerDeleteUpdatePanel.Update();

        }

        protected void DeleteInvoiceBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "invoice-delete-modal", "$('#invoice-delete-modal').modal();", true);
            InvoiceDeleteUpdatePanel.Update();

        }

        protected void DeleteInventoryBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "inventory-delete-modal", "$('#inventory-delete-modal').modal();", true);
            InventoryDeleteUpdatePanel.Update();

        }

        protected void DeleteSupplierBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "supplier-delete-modal", "$('#supplier-delete-modal').modal();", true);
            SupplierDeleteUpdatePanel.Update();

        }

        protected void DeleteCustomerSubmitBtn_Click(object sender, EventArgs e) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("DELETE FROM customer WHERE cust_number=@cust_number")) {

                    MySqlParameter param = new MySqlParameter("@cust_number", CustomerDeleteInput);
                    command.Parameters.Add(param);
                    command.ExecuteNonQuery();

                }
            }

        }

        protected void DeleteInvoiceSubmitBtn_Click(object sender, EventArgs e) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("DELETE FROM invoice WHERE invoice_num=@invoice_num")) {

                    MySqlParameter param = new MySqlParameter("@invoice_num", InvoiceDeleteInput);
                    command.Parameters.Add(param);
                    command.ExecuteNonQuery();

                }
            }

        }

        protected void DeleteInventorySubmitBtn_Click(object sender, EventArgs e) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("DELETE FROM inventory WHERE sku=@sku")) {

                    MySqlParameter param = new MySqlParameter("@sku", InventoryDeleteInput);
                    command.Parameters.Add(param);
                    command.ExecuteNonQuery();

                }
            }

        }

        protected void DeleteSupplierSubmitBtn_Click(object sender, EventArgs e) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("DELETE FROM supplier WHERE supply_id=@supply_id")) {

                    MySqlParameter param = new MySqlParameter("@supplier_id", SupplierDeleteInput);
                    command.Parameters.Add(param);
                    command.ExecuteNonQuery();

                }
            }

        }
    }
}