using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;

namespace Business_Reporting_App {

    public partial class Contact : Page {

        protected void Page_Load(object sender, EventArgs e) {

            ScriptManager.GetCurrent(Page).RegisterPostBackControl(RunAllCustomerReportBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(RunAllInvoiceReportBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(RunAllInventoryReportBtn);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(RunAllSupplierReportBtn);
            //ScriptManager.GetCurrent(Page).RegisterPostBackControl(RunSingleCustomerReportBtn);
            //ScriptManager.GetCurrent(Page).RegisterPostBackControl(RunSingleInvoiceReportBtn);
            //ScriptManager.GetCurrent(Page).RegisterPostBackControl(RunSingleInventoryReportBtn);
            //ScriptManager.GetCurrent(Page).RegisterPostBackControl(RunSingleSupplierReportBtn);
            UpdateCustomerDataTable();
            UpdateInvoiceDataTable();
            UpdateInventoryDataTable();
            UpdateSupplierDataTable();

        }

        public override void VerifyRenderingInServerForm(Control control) {

            /* Verifies that the control is rendered */

        }

        private void ExportPDF (Control view) {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=All_Customers_Report.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            view.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document document = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlWorker = new HTMLWorker(document);
            PdfWriter.GetInstance(document, Response.OutputStream);
            document.Open();
            htmlWorker.Parse(sr);
            document.Close();
            Response.Write(document);
            Response.End();


        }

        private void UpdateCustomerDataTable() {

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

        }

        private void UpdateInvoiceDataTable() {

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
        }

        private void UpdateInventoryDataTable() {

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

        }

        private void UpdateSupplierDataTable() {

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

        protected void RunSingleCustomerReportBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "customer-single-modal", "$('#customer-single-modal').modal();", true);
            CustomerSingleUpdatePanel.Update();

        }
        protected void RunSingleInvoiceReportBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "invoice-single-modal", "$('#invoice-single-modal').modal();", true);
            InvoiceSingleUpdatePanel.Update();

        }
        protected void RunSingleInventoryReportBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "inventory-single-modal", "$('#inventory-single-modal').modal();", true);
            InventorySingleUpdatePanel.Update();

        }

        protected void RunSingleSupplierReportBtn_Click(object sender, EventArgs e) {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "supplier-single-modal", "$('#supplier-single-modal').modal();", true);
            SupplierSingleUpdatePanel.Update();

        }

        protected void RunAllCustomerReportBtn_Click(object sender, EventArgs e) {

            ExportPDF(CustomerDataTable);

        }
        protected void RunAllInvoiceReportBtn_Click(object sender, EventArgs e) {

            ExportPDF(InvoiceDataTable);

        }
        protected void RunAllInventoryReportBtn_Click(object sender, EventArgs e) {

            ExportPDF(InventoryDataTable);

        }
        protected void RunAllSupplierReportBtn_Click(object sender, EventArgs e) {

            ExportPDF(SupplierDataTable);

        }

        protected void SingleCustomerSubmitBtn_Click(object sender, EventArgs e) {

            tempGV.DataSource = null;
            tempGV.DataBind();

            string connectionString = ConfigurationManager.ConnectionStrings["db-connection"].ConnectionString;

            using (MySqlConnection connection = new MySqlConnection(connectionString)) {

                using (MySqlCommand command = new MySqlCommand("SELECT * FROM customer WHERE cust_number=@cust_number", connection)) {

                    MySqlParameter param = new MySqlParameter("@cust_number", CustomerSingleInput.Text);
                    command.Parameters.Add(param);
                    connection.Open();
                    command.ExecuteNonQuery();

                    using (MySqlDataAdapter tempDataAdapter = new MySqlDataAdapter()) {

                        command.Connection = connection;
                        tempDataAdapter.SelectCommand = command;

                        using (DataTable table = new DataTable()) {

                            tempDataAdapter.Fill(table);
                            tempGV.DataSource = table;
                            tempGV.DataBind();
                            tempGV.HeaderRow.Cells[0].Text = "Customer ID";
                            tempGV.HeaderRow.Cells[1].Text = "Company";
                            tempGV.HeaderRow.Cells[2].Text = "Billing Address";
                            tempGV.HeaderRow.Cells[3].Text = "Shipping Address";
                            tempGV.HeaderRow.Cells[4].Text = "Contact Email";
                            tempGV.HeaderRow.Cells[5].Text = "Contact Phone";
                            tempGV.HeaderRow.Cells[6].Text = "Sales YTD";

                        }
                    }
                }

                connection.Close();
            }

            UpdateCustomerDataTable();
            ExportPDF(tempGV);
        }

        protected void SingleInvoiceSubmitBtn_Click(object sender, EventArgs e) {



        }

        protected void SingleInventorySubmitBtn_Click(object sender, EventArgs e) {



        }

        protected void SingleSupplierSubmitBtn_Click(object sender, EventArgs e) {



        }
    }
}