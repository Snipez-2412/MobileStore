using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileStore
{
    public partial class AddCategory : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }


        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string CategoryID = txtCategoryID.Text.Trim();
            string CategoryName = txtCategoryName.Text.Trim();
        

            string connectionString = ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString;
            using (SqlConnection myCon = new SqlConnection(connectionString))
            {
                // Correct the SQL statement to match the columns with the provided parameters
                string sql = "INSERT INTO Category (CategoryID, CategoryName) VALUES (@CategoryID, @CategoryName)";
                SqlCommand cmd = new SqlCommand(sql, myCon);
                cmd.Parameters.AddWithValue("@CategoryID", CategoryID);
                cmd.Parameters.AddWithValue("@CategoryName", CategoryName);

                myCon.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                myCon.Close();

                if (rowsAffected > 0)
                {
                    Response.Write("Category added successfully!");
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    Response.Write("Error adding Category.");
                }
            }
        }
    }
}
