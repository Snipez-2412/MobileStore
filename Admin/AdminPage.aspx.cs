using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileStore
{
    public partial class AdminPage : System.Web.UI.Page
    {
        SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString);

        // Load Main page
        // Load Main page
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    // Open connection
                    myCon.Open();

                    // Check if the connection was successful
                    if (myCon.State == System.Data.ConnectionState.Open)
                    {
                        // Get Category from SQL
                        using (SqlCommand getCategory = new SqlCommand("dbo.getAllCategories", myCon))
                        {
                            getCategory.CommandType = System.Data.CommandType.StoredProcedure;
                            SqlDataReader categoryReader = getCategory.ExecuteReader();
                            gvCategory.DataSource = categoryReader;
                            gvCategory.DataBind();
                            categoryReader.Close();
                        }

                        // Get Product from SQL
                        using (SqlCommand getProduct = new SqlCommand("dbo.getAllProducts", myCon))
                        {
                            getProduct.CommandType = System.Data.CommandType.StoredProcedure;
                            SqlDataReader productReader = getProduct.ExecuteReader();
                            gvProduct.DataSource = productReader;
                            gvProduct.DataBind();
                            productReader.Close();
                        }

                        // Get Employees from SQL
                        using (SqlCommand getEmployee = new SqlCommand("dbo.getAllEmployees", myCon))
                        {
                            getEmployee.CommandType = System.Data.CommandType.StoredProcedure;
                            SqlDataReader userReader = getEmployee.ExecuteReader();
                            gvEmployee.DataSource = userReader;
                            gvEmployee.DataBind();
                            userReader.Close();
                        }
                    }
                    else
                    {
                       lblMessage.Text = "Connection to database failed.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred: " + ex.Message;
                }
                finally
                {
                    // Close connection
                    myCon.Close();
                }
            }
        }



        // CATEGORY FUNCTIONS
        // Update Category 
        protected void gvCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                // Get the ProductID of the selected row
                string categoryId = e.CommandArgument.ToString();

                // Redirect to the UpdateProduct.aspx page with the ProductID in the query string
                Response.Redirect("UpdateCategory.aspx?CategoryID=" + categoryId);
            }
        }

       

        // PRODUCT FUNCTIONS
        // Update Product 
        protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                // Get the ProductID of the selected row
                string productId = e.CommandArgument.ToString();

                // Redirect to the UpdateProduct.aspx page with the ProductID in the query string
                Response.Redirect("UpdateProduct.aspx?ProductID=" + productId);
            }
        }

        // Delete Product
        protected void gvProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string productId = gvProduct.DataKeys[rowIndex].Value.ToString();

            try
            {
                myCon.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Product WHERE ProductID = @ProductID", myCon))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@ProductID", productId);

                    // Execute the command
                    int rowsAffected = cmd.ExecuteNonQuery();

                    // Check if the deletion was successful
                    if (rowsAffected > 0)
                    { 
                        BindProductGridView();
                    }
                    else
                    { 
                        lblMessage.Text = "Failed to delete product.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
               myCon.Close();
            }
        }

        // Method to bind data to the gvProduct GridView
        private void BindProductGridView()
        {
            using (SqlCommand getProduct = new SqlCommand("dbo.getAllProducts", myCon))
            {
                getProduct.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader productReader = getProduct.ExecuteReader();
                gvProduct.DataSource = productReader;
                gvProduct.DataBind();
                productReader.Close();
            }
        }


        // USER FUNCTIONS
        // Update Employee 
        protected void gvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                // Get the ProductID of the selected row
                string employeeId = e.CommandArgument.ToString();

                // Redirect to the UpdateProduct.aspx page with the ProductID in the query string
                Response.Redirect("UpdateEmployee.aspx?EmployeeID=" + employeeId);
            }
        }

        // Delete Employee
        protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string employeeId = gvEmployee.DataKeys[rowIndex].Value.ToString();

            try
            {
                myCon.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Product WHERE EmployeeID = @EmployeeID", myCon))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", employeeId);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        BindProductGridView();
                    }
                    else
                    {
                        lblMessage.Text = "Failed to delete employee.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
                myCon.Close();
            }
        }

        // Logout function
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();

            Session.Clear();

            Response.Redirect("~/Login.aspx", true);
        }
    }
}