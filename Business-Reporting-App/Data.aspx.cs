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
        
        protected void Page_Load(object sender, EventArgs e) {

            if (!IsPostBack) {


                string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;
                updateCustomerDataTable(connectionString);
                updateInvoiceDataTable(connectionString);
                updateInventoryDataTable(connectionString);
                updateSupplierDataTable(connectionString);

            }

        }

        private void updateCustomerDataTable(string connectionString) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM customer")) {

                    using (MySqlDataAdapter customerDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        customerDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            customerDataAdapter.Fill(table);
                            CustomerDataTable.DataSource = table;
                            CustomerDataTable.DataBind();

                        }
                    }
                }
            }

        }

        private void updateInvoiceDataTable(string connectionString) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM invoice")) {

                    using (MySqlDataAdapter invoiceDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        invoiceDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            invoiceDataAdapter.Fill(table);
                            InvoiceDataTable.DataSource = table;
                            InvoiceDataTable.DataBind();

                        }
                    }
                }
            }
        }

        private void updateInventoryDataTable(string connectionString) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM inventory")) {

                    using (MySqlDataAdapter inventoryDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        inventoryDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            inventoryDataAdapter.Fill(table);
                            InventoryDataTable.DataSource = table;
                            InventoryDataTable.DataBind();

                        }
                    }
                }
            }

        }

        private void updateSupplierDataTable(string connectionString) {

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM supplier")) {

                    using (MySqlDataAdapter supplierDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        supplierDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            supplierDataAdapter.Fill(table);
                            SupplierDataTable.DataSource = table;
                            SupplierDataTable.DataBind();

                        }
                    }
                }
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



        }

        protected void AddInvoiceSubmitBtn_Click(object sender, EventArgs e) {



        }

        protected void AddInventorySubmitBtn_Click(object sender, EventArgs e) {



        }

        protected void AddSupplierSubmitBtn_Click(object sender, EventArgs e) {



        }
    }
}