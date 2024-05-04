using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileStore
{
    public partial class AddProduct : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCategoryDropdown();
            }
        }

        private void PopulateCategoryDropdown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT CategoryID, CategoryName FROM ProductCategory", con);
                    SqlDataReader reader = cmd.ExecuteReader();

                    ddlCategory.DataSource = reader;
                    ddlCategory.DataTextField = "CategoryName"; // The text to display
                    ddlCategory.DataValueField = "CategoryID"; // The value behind each text
                    ddlCategory.DataBind();
                }
                catch (Exception ex)
                {
                    // Handle the error
                    Response.Write("Error occurred: " + ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }

            // Optionally add an "Select a category" item at the beginning.
            ddlCategory.Items.Insert(0, new ListItem("-- Select a Category --", ""));
        }


        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string productID = txtProductID.Text.Trim();
            string productName = txtProductName.Text.Trim();
            string categoryID = ddlCategory.SelectedValue;
            decimal price = decimal.Parse(txtPrice.Text.Trim()); // Ensure that your application handles culture-specific decimal formats if needed.
            string description = txtDescription.Text.Trim();
            int quantity = int.Parse(txtQuantity.Text.Trim());

            string connectionString = ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString;
            using (SqlConnection myCon = new SqlConnection(connectionString))
            {
                // Correct the SQL statement to match the columns with the provided parameters
                string sql = "INSERT INTO Product (ProductID, ProductName, CategoryID, Price, Description, StockQuantity) VALUES (@ProductID, @ProductName, @CategoryID, @Price, @Description, @StockQuantity)";
                SqlCommand cmd = new SqlCommand(sql, myCon);
                cmd.Parameters.AddWithValue("@ProductID", productID);
                cmd.Parameters.AddWithValue("@ProductName", productName);
                cmd.Parameters.AddWithValue("@CategoryID", categoryID);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@StockQuantity", quantity);

                myCon.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                myCon.Close();

                if (rowsAffected > 0)
                {
                    Response.Write("Product added successfully!");
                    Response.Redirect("/Admin/AdminPage.aspx");
                }
                else
                {
                    Response.Write("Error adding product.");
                }
            }
        }
    }
}
