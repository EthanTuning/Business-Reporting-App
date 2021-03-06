﻿using System;
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
using System.Text.RegularExpressions;

namespace Business_Reporting_App {
    public partial class About : Page {

        protected void Page_Load(object sender, EventArgs e) {

            ScriptManager.GetCurrent(Page).RegisterPostBackControl(AddCustomerSubmitBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(AddInvoiceSubmitBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(AddInventorySubmitBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(AddSupplierSubmitBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(DeleteCustomerSubmitBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(DeleteInvoiceSubmitBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(DeleteInventorySubmitBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(DeleteSupplierSubmitBtn);
            UpdateCustomerDataTable();
            UpdateInvoiceDataTable();
            UpdateInventoryDataTable();
            UpdateSupplierDataTable();

        }

        private void UpdateCustomerDataTable() {

            try {

                string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

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
            } catch(MySqlException err) {

                Response.Write("<script>alert('Connection was interrupted.');</script>");

            }

        }

        private void UpdateInvoiceDataTable() {

            try {

                string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

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
            } catch(MySqlException err) {

                Response.Write("<script>alert('Connection was interrupted.');</script>");

            }
        }

        private void UpdateInventoryDataTable() {

            try {

                string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

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
            } catch(MySqlException err) {

                Response.Write("<script>alert('Connection was interrupted.');</script>");

            }

        }

        private void UpdateSupplierDataTable() {

            try {

                string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

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
            } catch (MySqlException err) {

                Response.Write("<script>alert('Connection was interrupted.');</script>");

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

            if (Regex.IsMatch(CustomerCompanyInput.Text, @"[\s\S]*") &&
                Regex.IsMatch(CustomerPhoneInput.Text, @"\d{0,10}") && Regex.IsMatch(CustomerBillingInput.Text, @"[\s\S]*") &&
                Regex.IsMatch(CustomerShippingInput.Text, @"[\s\S]*")) {

                try {

                    string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                    using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                        using (MySqlCommand command = new MySqlCommand("INSERT INTO customer (company, contact, phone, billing_address, shipping_address) VALUES (@company, @contact, @phone, @billing_address, @shipping_address)", connection)) {

                            MySqlParameter param1 = new MySqlParameter("@company", CustomerCompanyInput.Text);
                            MySqlParameter param2 = new MySqlParameter("@contact", CustomerContactInput.Text);
                            MySqlParameter param3 = new MySqlParameter("@phone", CustomerPhoneInput.Text);
                            MySqlParameter param4 = new MySqlParameter("@billing_address", CustomerBillingInput.Text);
                            MySqlParameter param5 = new MySqlParameter("@shipping_address", CustomerShippingInput.Text);
                            object[] parms = new object[] { param1, param2, param3, param4, param5 };
                            command.Parameters.AddRange(parms);
                            connection.Open();
                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_invoice_totals();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_sales_ytd();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        connection.Close();
                    }
                } catch(MySqlException err) {

                    Response.Write("<script>alert('Connection was interrupted.');</script>");

                }

            } else {

                Response.Write("<script>alert('Review the input fields! Some are not in proper form.');</script>");

            }

            UpdateCustomerDataTable();

        }

        protected void AddInvoiceSubmitBtn_Click(object sender, EventArgs e) {

            if (Regex.IsMatch(InvoiceCustomerInput.Text, @"[a-zA-Z]{0,20}") && Regex.IsMatch(InvoiceOrderDateInput.Text, @"\d{4}-\d{2}-\d{2}") &&
                Regex.IsMatch(InvoiceShippedDateInput.Text, @"\d{4}-\d{2}-{2}") && Regex.IsMatch(InvoiceStatusInput.Text, @"\bfilled|Filled|Open|open\b") &&
                Regex.IsMatch(InvoiceNumberInput.Text, @"\d{0,10}") && Regex.IsMatch(InvoiceSKUInput.Text, @"\d{0,10}") && 
                Regex.IsMatch(InvoiceOrderDateInput.Text, @"\d{0,10}")) {

                try {

                    string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                    using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                        using (MySqlCommand command = new MySqlCommand("INSERT INTO invoice (invoice_num, cust_number, order_date, shipped_date, status) VALUES (@invoice_num, @cust_number, @order_date, @shipped_date, @status);" +
                                                                       "INSERT INTO line_item (invoice_num, sku, quantity) VALUES (@invoice_num, @sku, @quantity);", connection)) {

                            MySqlParameter param1 = new MySqlParameter("@cust_number", InvoiceCustomerInput.Text);
                            MySqlParameter param2 = new MySqlParameter("@order_date", InvoiceOrderDateInput.Text);
                            MySqlParameter param3 = new MySqlParameter("@status", InvoiceStatusInput.Text);
                            MySqlParameter param4 = new MySqlParameter("@shipped_date", InvoiceShippedDateInput.Text);
                            MySqlParameter param5 = new MySqlParameter("@invoice_num", InvoiceNumberInput.Text);
                            MySqlParameter param6 = new MySqlParameter("@sku", InvoiceSKUInput.Text);
                            MySqlParameter param7 = new MySqlParameter("@quantity", InvoiceQuantityInput.Text);
                            object[] parms = new object[] { param1, param2, param3, param4, param5, param6, param7 };
                            command.Parameters.AddRange(parms);
                            connection.Open();
                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_invoice_totals();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_sales_ytd();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        connection.Close();
                    }
                } catch(MySqlException err) {

                    Response.Write("<script>alert('Connection was interrupted.');</script>");

                }

            } else {

                Response.Write("<script>alert('Review the input fields! Some are not in proper form.');</script>");

            }

            UpdateCustomerDataTable();

        }

        protected void AddInventorySubmitBtn_Click(object sender, EventArgs e) {

            if (Regex.IsMatch(InventDescInput.Text, @"[a-zA-Z]{0,20}") && Regex.IsMatch(InventQOHInput.Text, @"\d{0,10}") &&
                Regex.IsMatch(InventWeightInput.Text, @"\d{0,5}") && Regex.IsMatch(InventPriceInput.Text, @"\d{0,10}") &&
                Regex.IsMatch(InventSupplierIDInput.Text, @"\d{0,5}")) {

                try {

                    string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                    using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                        using (MySqlCommand command = new MySqlCommand("INSERT INTO inventory (description, qoh, unit_weight, unit_price, supplier_id) VALUES (@description, @qoh, @unit_weight, @unir_price, @supplier_id)", connection)) {

                            MySqlParameter param1 = new MySqlParameter("@description", InventDescInput.Text);
                            MySqlParameter param2 = new MySqlParameter("@qoh", InventQOHInput.Text);
                            MySqlParameter param3 = new MySqlParameter("@unit_weight", InventWeightInput.Text);
                            MySqlParameter param4 = new MySqlParameter("@unit_price", InventPriceInput.Text);
                            MySqlParameter param5 = new MySqlParameter("@supplier_id", InventSupplierIDInput.Text);
                            object[] parms = new object[] { param1, param2, param3, param4, param5 };
                            command.Parameters.AddRange(parms);
                            connection.Open();
                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_invoice_totals();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_sales_ytd();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        connection.Close();
                    }
                } catch(MySqlException err) {

                    Response.Write("<script>alert('Connection was interrupted.');</script>");

                }

            } else {

                Response.Write("<script>alert('Review the input fields! Some are not in proper form.');</script>");

            }
            UpdateCustomerDataTable();

        }

        protected void AddSupplierSubmitBtn_Click(object sender, EventArgs e) {

            if (Regex.IsMatch(SupplierCompanyInput.Text, @"[a-zA-Z]{0,20}") && Regex.IsMatch(SupplierContactInput.Text, @"[\s\S]*") &&
                Regex.IsMatch(SupplierPhoneInput.Text, @"\d{0,10}") && Regex.IsMatch(SupplierBillingInput.Text, @"[\s\S]*") &&
                Regex.IsMatch(SupplierShippingInput.Text, @"[\s\S]*")) {

                try {

                    string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                    using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                        using (MySqlCommand command = new MySqlCommand("INSERT INTO supplier (company, contact, phone, billing_address, shipping_address) VALUES (@company, @contact, @phone, @billing_address, @shipping_address)", connection)) {

                            MySqlParameter param1 = new MySqlParameter("@company", SupplierCompanyInput.Text);
                            MySqlParameter param2 = new MySqlParameter("@contact", SupplierContactInput.Text);
                            MySqlParameter param3 = new MySqlParameter("@phone", SupplierPhoneInput.Text);
                            MySqlParameter param4 = new MySqlParameter("@billing_address", SupplierBillingInput.Text);
                            MySqlParameter param5 = new MySqlParameter("@shipping_address", SupplierShippingInput.Text);
                            object[] parms = new object[] { param1, param2, param3, param4, param5 };
                            command.Parameters.AddRange(parms);
                            connection.Open();
                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_invoice_totals();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_sales_ytd();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        connection.Close();
                    }
                } catch(MySqlException err) {

                    Response.Write("<script>alert('Connection was interrupted.');</script>");

                }

            } else {

                Response.Write("<script>alert('Review the input fields! Some are not in proper form.');</script>");

            }

            UpdateCustomerDataTable();

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

            if (Regex.IsMatch(CustomerDeleteInput.Text, @"\d{0,20}")) {

                try {

                    string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                    using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                        using (MySqlCommand command = new MySqlCommand("DELETE FROM customer WHERE cust_number=@cust_number", connection)) {

                            MySqlParameter param = new MySqlParameter("@cust_number", CustomerDeleteInput.Text);
                            command.Parameters.Add(param);
                            connection.Open();
                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_invoice_totals();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_sales_ytd();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        connection.Close();
                    }
                } catch(MySqlException err) {

                    Response.Write("<script>alert('Connection was interrupted.');</script>");

                }

            } else {

                Response.Write("<script>alert('Review the input fields! Some are not in proper form.');</script>");

            }

            UpdateCustomerDataTable();

        }

        protected void DeleteInvoiceSubmitBtn_Click(object sender, EventArgs e) {

            if (Regex.IsMatch(InvoiceDeleteInput.Text, @"\d{0,20}")) {

                try {

                    string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                    using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                        using (MySqlCommand command = new MySqlCommand("DELETE FROM invoice WHERE invoice_num=@invoice_num", connection)) {

                            MySqlParameter param = new MySqlParameter("@invoice_num", InvoiceDeleteInput.Text);
                            command.Parameters.Add(param);
                            connection.Open();
                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_invoice_totals();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_sales_ytd();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        connection.Close();
                    }

                } catch(MySqlException err) {

                    Response.Write("<script>alert('Connection was interrupted.');</script>");

                }

            } else {

                Response.Write("<script>alert('Review the input fields! Some are not in proper form.');</script>");

            }

            UpdateCustomerDataTable();

        }

        protected void DeleteInventorySubmitBtn_Click(object sender, EventArgs e) {

            if (Regex.IsMatch(InventoryDeleteInput.Text, @"\d{0,20}")) {

                try {

                    string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                    using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                        using (MySqlCommand command = new MySqlCommand("DELETE FROM Inventory WHERE sku=@sku", connection)) {

                            MySqlParameter param = new MySqlParameter("@sku", InventoryDeleteInput.Text);
                            command.Parameters.Add(param);
                            connection.Open();
                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_invoice_totals();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_sales_ytd();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        connection.Close();
                    }
                } catch (MySqlException err) {

                    Response.Write("<script>alert('Connection was interrupted.');</script>");

                }

            } else {

                Response.Write("<script>alert('Review the input fields! Some are not in proper form.');</script>");

            }

            UpdateCustomerDataTable();

        }

        protected void DeleteSupplierSubmitBtn_Click(object sender, EventArgs e) {

            if (Regex.IsMatch(SupplierDeleteInput.Text, @"\d{0,20}")) {

                try {

                    string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

                    using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                        using (MySqlCommand command = new MySqlCommand("DELETE FROM supplier WHERE supplier_id=@supplier_id", connection)) {

                            MySqlParameter param = new MySqlParameter("@supplier_id", SupplierDeleteInput.Text);
                            command.Parameters.Add(param);
                            connection.Open();
                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_invoice_totals();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        using (MySqlCommand command = new MySqlCommand("SET SQL_SAFE_UPDATES = 0; CALL update_sales_ytd();", connection)) {

                            command.ExecuteNonQuery();

                        }

                        connection.Close();
                    }

                } catch (MySqlException err) {

                    Response.Write("<script>alert('Connection was interrupted.');</script>");

                }

            } else {

                Response.Write("<script>alert('Connection was interrupted.');</script>");

            }

            UpdateCustomerDataTable();

        }
    }
}