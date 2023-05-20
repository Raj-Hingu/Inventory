using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace InventoryWF
{
    public partial class Order : System.Web.UI.Page
    {
        private string _connectionString = ConfigurationManager.ConnectionStrings["InventoryConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           /* int orderId = Convert.ToInt32(txtOrderID.Text);
            int customerId = Convert.ToInt32(txtCustomerID.Text);
            decimal purchaseAmount = Convert.ToDecimal(txtPurchaseAmount.Text);
            string orderDate = txtOrderDate.Text;
            int salesmanId = Convert.ToInt32(txtID.Text);

            var query = $"insert into orders (order_no, purch_amt, ord_date, customer_id, salesman_id) values ({orderId},{purchaseAmount},'{orderDate}',{customerId}, {salesmanId})";
            */
            SqlConnection conn = new SqlConnection(_connectionString);

            try
            {
                /*  conn.Open();
                  SqlCommand cmd = new SqlCommand(query, conn);
                  cmd.ExecuteNonQuery();
                  */
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "orderIdAutoincremnt";
                cmd.Parameters.Add("@PurchaseAmount", SqlDbType.VarChar).Value = txtPurchaseAmount.Text;
                cmd.Parameters.Add("@OrderDate", SqlDbType.VarChar).Value = txtOrderDate.Text;
                cmd.Parameters.Add("@CustomerId", SqlDbType.VarChar).Value = txtCustomerID.Text;
                cmd.Parameters.Add("@SalesmanId", SqlDbType.VarChar).Value = txtID.Text;
                cmd.Parameters.Add("@OrderId", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                string id = cmd.Parameters["@OrderId"].Value.ToString();
                BindGridView();
                ClearFields();
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                throw new Exception(message, ex);
            }
        }
        private void BindGridView()
        {
            SqlConnection conn = new SqlConnection(_connectionString);
            try
            {
                conn.Open();
                string selectQuery = "select * from orders";
                SqlCommand cmd = new SqlCommand(selectQuery, conn);
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    // gvCustomer.DataSource = dt;
                    tblOrder.DataBind();
                }
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                throw new Exception(message, ex);
            }
            finally
            {
                conn.Close();
            }
        }

        private void ClearFields()
        {
            txtCustomerID.Text = string.Empty;
            txtOrderID.Text = string.Empty;
            txtPurchaseAmount.Text = string.Empty;
            txtOrderDate.Text = string.Empty;
            txtID.Text = string.Empty;
            txtID.Focus();
        }
    }
}