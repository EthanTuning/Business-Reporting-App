using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Web.Configuration;

namespace Business_Reporting_App {
    public partial class About : Page {

        
        private OleDbDataReader mInvoiceDataReader;
        private OleDbDataReader mInventoryDataReader;
        private OleDbDataReader mLineItemDataReader;
        private OleDbDataReader mSupplierDataReader;
        


        protected void Page_Load(object sender, EventArgs e) {

            OleDbConnection connection;
            OleDbCommand command;
            OleDbDataReader customerDataReader;
            string connectionPath;

            if (IsPostBack == false) {

                try {

                    connection = new OleDbConnection();
                    connectionPath = WebConfigurationManager.ConnectionStrings["Business-Reports-App-DB"].ConnectionString;
                    connection.ConnectionString = connectionPath;
                    connection.Open();
                    command = new OleDbCommand("SELECT * FROM tblCustomer", connection);
                    customerDataReader = command.ExecuteReader();

                    while (customerDataReader.Read()) {


                        TableRow tblRow = new TableRow();
                        CustomerTable.Rows.Add(tblRow);

                        TableCell tblCell1 = new TableCell();
                        tblCell1.Text = customerDataReader["CustNumber"].ToString();
                        tblRow.Cells.Add(tblCell1);

                        TableCell tblCell2 = new TableCell();
                        tblCell2.Text = customerDataReader["Company"].ToString();
                        tblRow.Cells.Add(tblCell2);

                        TableCell tblCell3 = new TableCell();
                        tblCell3.Text = customerDataReader["Billing Address"].ToString();
                        tblRow.Cells.Add(tblCell3);

                        TableCell tblCell4 = new TableCell();
                        tblCell4.Text = customerDataReader["Shipping Address"].ToString();
                        tblRow.Cells.Add(tblCell4);

                        TableCell tblCell5 = new TableCell();
                        tblCell3.Text = customerDataReader["Contact"].ToString();
                        tblRow.Cells.Add(tblCell5);

                        TableCell tblCell6 = new TableCell();
                        tblCell6.Text = customerDataReader["Phone"].ToString();
                        tblRow.Cells.Add(tblCell6);

                        TableCell tblCell7 = new TableCell();
                        tblCell7.Text = customerDataReader["SalesYTD"].ToString();
                        tblRow.Cells.Add(tblCell7);

                    }

                    //customerDataReader.Close();
                    //connection.Close();
                }
                catch (Exception err) {

                    Console.WriteLine(err.Message);

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