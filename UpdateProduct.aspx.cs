using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MobileStore
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load data into form for editing
                if (Request.QueryString["ProductID"] != null)
                {
                    string productId = Request.QueryString["ProductID"];
                    LoadProductData(productId);
                }
            }
        }

        //Load Data
        protected void LoadProductData(string productId)
        {
            // Fetch data from database and populate form
            SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString);
            using (myCon) 
            {
                string query = "SELECT ProductName, Price, Description, StockQuantity FROM Product WHERE ProductID = @ProductID";
                SqlCommand command = new SqlCommand(query, myCon);
                command.Parameters.AddWithValue("@ProductID", productId);

                myCon.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    txtProductName.Text = reader["ProductName"].ToString();
                    txtPrice.Text = reader["Price"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtStockQuantity.Text = reader["StockQuantity"].ToString();
                }
                reader.Close();
            }
        }

        // Update Button
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Update data in database
            SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString);
            using (myCon)
            {
                string query = "UPDATE Product SET ProductName = @ProductName, Price = @Price, Description = @Description, StockQuantity = @StockQuantity WHERE ProductID = @ProductID";
                SqlCommand command = new SqlCommand(query, myCon);
                command.Parameters.AddWithValue("@ProductID", Request.QueryString["ProductID"]);
                command.Parameters.AddWithValue("@ProductName", txtProductName.Text);
                command.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                command.Parameters.AddWithValue("@Description", txtDescription.Text);
                command.Parameters.AddWithValue("@StockQuantity", Convert.ToInt32(txtStockQuantity.Text));

                myCon.Open();
                command.ExecuteNonQuery();
            }

            // Redirect to a confirmation page or back to product list
            Response.Redirect("Admin.aspx");
        }
    }
}
