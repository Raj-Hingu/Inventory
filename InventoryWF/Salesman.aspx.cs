using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWF
{
    public partial class Salesman : System.Web.UI.Page
    {
        private string _connectionString = ConfigurationManager.ConnectionStrings["InventoryConnectionString"].ConnectionString;
   

        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                BindGridView();
            }
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

           /* int salesmanId = Convert.ToInt32(txtID.Text);
           // int salesmanId = new System.Data.DataColumn("salesman_id", typeof(int));
            string name = txtSalesmanName.Text;
            string city = txtCity.Text;
            string commission = txtCommission.Text;

            var query = $"insert into salesman (salesman_id, name, city, commission) values ({salesmanId},'{name}','{city}',{commission})";
            */
            SqlConnection conn = new SqlConnection(_connectionString);

            try
            {
                /*conn.Open();
                 SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                */
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "salesmanIdAutoincremnt";
                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = txtSalesmanName.Text;
                cmd.Parameters.Add("@City", SqlDbType.VarChar).Value = txtCity.Text;
                cmd.Parameters.Add("@Commission", SqlDbType.Float).Value = txtCommission.Text;
                cmd.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
              string id = cmd.Parameters["@id"].Value.ToString();
               
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
                string selectQuery = "select * from salesman";
                SqlCommand cmd = new SqlCommand(selectQuery, conn);
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvSalesman.DataSource = dt;
                    gvSalesman.DataBind();
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
            txtID.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtCommission.Text = string.Empty;
            txtSalesmanName.Text = string.Empty;
            txtID.Focus();
        }
    }
}