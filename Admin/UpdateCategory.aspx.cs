using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MobileStore
{
    public partial class UpdateCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load data into form for editing
                if (Request.QueryString["CategoryID"] != null)
                {
                    string categoryId = Request.QueryString["CategoryID"];
                    LoadCategoryData(categoryId);
                }
            }
        }

        //Load Data
        protected void LoadCategoryData(string categoryId)
        {
            // Fetch data from database and populate form
            SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString);
            using (myCon)
            {
                string query = "SELECT CategoryName FROM ProductCategory WHERE CategoryID = @CategoryID";
                SqlCommand command = new SqlCommand(query, myCon);
                command.Parameters.AddWithValue("@CategoryID", categoryId);

                myCon.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    txtCategoryName.Text = reader["CategoryName"].ToString();
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
                string query = "UPDATE ProductCategory SET CategoryName = @CategoryName WHERE CategoryID = @CategoryID";
                SqlCommand command = new SqlCommand(query, myCon);
                command.Parameters.AddWithValue("@CategoryID", Request.QueryString["CategoryID"]);
                command.Parameters.AddWithValue("@CategoryName", txtCategoryName.Text);

                myCon.Open();
                command.ExecuteNonQuery();
            }

            // Redirect to a confirmation page or back to Category list
            Response.Redirect("/Admin/AdminPage.aspx");
        }
    }
}
