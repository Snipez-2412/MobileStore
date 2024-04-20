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
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["MobileStore"].ConnectionString);
        
        // Load Main page
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    myCon.Open();
                    using (SqlCommand myCom = new SqlCommand("dbo.getProduct", myCon))
                    {
                        myCom.Connection = myCon;
                        myCom.CommandType = System.Data.CommandType.StoredProcedure;

                        SqlDataReader myReader = myCom.ExecuteReader();

                        gvProduct.DataSource = myReader;
                        gvProduct.DataBind();

                        myReader.Close();
                    }
                }
                catch (Exception ex) { }
                finally { myCon.Close(); }
            }
        }

        // Update Product 
        protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e) 
        {
            if(e.CommandName == "UpdProduct")
            {

            }
        }

        // Delete Product
        protected void gvProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
         
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        { 
            System.Web.Security.FormsAuthentication.SignOut();

            Session.Clear();

            Response.Redirect("~/Login.aspx", true);
        }

    }
}