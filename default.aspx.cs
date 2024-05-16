using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MobileStore
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductData();
            }
        }

        private void BindProductData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("dbo.getAllProducts", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                con.Open();
                da.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    rptProducts.DataSource = dt;
                    rptProducts.DataBind();
                }
                else
                {
                    lblMessage.Text = "No products found.";
                }
            }
        }

        private DataTable GetProductData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ProductID", typeof(int));
            dt.Columns.Add("ImagePath", typeof(string));
            dt.Columns.Add("ProductName", typeof(string));
            dt.Columns.Add("Price", typeof(decimal));

            return dt;
        }
    }
}
