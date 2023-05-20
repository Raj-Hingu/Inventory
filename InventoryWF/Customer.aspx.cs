using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.ComponentModel.DataAnnotations;

namespace InventoryWF
{
    public partial class Customer : System.Web.UI.Page
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
            
          /* int customerId = Convert.ToInt32(txtCustomerID.Text);
           string Name = txtCustomerName.Text;
           string City = txtCity.Text; 
           int Grade = Convert.ToInt32(txtGrade.Text);
           int salesmanId = Convert.ToInt32(txtID.Text);

            var query = $"insert into customer (customer_id, cust_name, city, grade, salesman_id) values ('{customerId}','{Name}','{City}',{Grade}, {salesmanId})";
            */
            SqlConnection conn = new SqlConnection(_connectionString);

            try
            {
                /* conn.Open();
                 SqlCommand cmd = new SqlCommand(query, conn);
                 cmd.ExecuteNonQuery();
                 */
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "customerIdAutoincremnt";
                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = txtCustomerName.Text;
                cmd.Parameters.Add("@City", SqlDbType.VarChar).Value = txtCity.Text;
                cmd.Parameters.Add("@Grade", SqlDbType.VarChar).Value = txtGrade.Text;
                cmd.Parameters.Add("@SalesmanId", SqlDbType.VarChar).Value = txtID.Text;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                string id = cmd.Parameters["@CustomerId"].Value.ToString();
                BindGridView();
                ClearFields();
                Validation();
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
                string selectQuery = "select * from customer";
                SqlCommand cmd = new SqlCommand(selectQuery, conn);
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                   // gvCustomer.DataSource = dt;
                    tblCustomer.DataBind();
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
            txtCity.Text = string.Empty;
            txtGrade.Text = string.Empty;
            txtCustomerName.Text = string.Empty;
            txtID.Text = string.Empty;
            txtID.Focus();
        }

        private void Validation()
        {
            if(txtCustomerName == null)
            {
                txtCustomerName.Text = "Name is Required";
            }

        }

        
    }
}