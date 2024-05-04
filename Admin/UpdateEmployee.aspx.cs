using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileStore.Admin
{
    public partial class UpdateEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load data into form for editing
                if (Request.QueryString["EmployeeID"] != null)
                {
                    string employeeId = Request.QueryString["EmployeeID"];
                    LoadEmployeeData(employeeId);
                }
            }
        }

        //Load Data
        protected void LoadEmployeeData(string employeeId)
        {
            // Fetch data from database and populate form
            SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString);
            using (myCon)
            {
                string query = "SELECT Name, Position, Salary FROM Employee WHERE EmployeeID = @EmployeeID";
                SqlCommand command = new SqlCommand(query, myCon);
                command.Parameters.AddWithValue("@EmployeeID", employeeId);

                myCon.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    txtEmployeeName.Text = reader["Name"].ToString();
                    txtPosition.Text = reader["Position"].ToString();
                    txtSalary.Text = reader["Salary"].ToString();
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
                string query = "UPDATE Employee SET Name = @Name, Position = @Position, Salary = @Salary WHERE EmployeeID = @EmployeeID";
                SqlCommand command = new SqlCommand(query, myCon);
                command.Parameters.AddWithValue("@EmployeeID", Request.QueryString["EmployeeID"]);
                command.Parameters.AddWithValue("@Name", txtEmployeeName.Text);
                command.Parameters.AddWithValue("@Position", Convert.ToDecimal(txtPosition.Text));
                command.Parameters.AddWithValue("@Salary", txtSalary.Text);

                myCon.Open();
                command.ExecuteNonQuery();
            }

            // Redirect to a confirmation page or back to product list
            Response.Redirect("/Admin/AdminPage.aspx");
        }
    }
}