using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PA7
{
    public partial class DeleteImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                BindValues();
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }
        private DataSet GetData(string query)
        {
            string str = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlCommand cmnd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(str))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmnd.Connection = con;
                    sda.SelectCommand = cmnd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds;
                    }
                }
            }
        }
        public void BindValues()
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = GetData("SELECT * from [dbo].[ImageTable]");
            GridView1.DataBind();
        }
        protected void lnkdelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            int Id = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
            int result;
            string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection scon = new SqlConnection(conString))
            {
                scon.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[ImageTable] where Id=" + Id, scon);
                result = cmd.ExecuteNonQuery();
                scon.Close();
            }
 
            var filePath = Server.MapPath("~/Images/BgImages/" + gvrow.Cells[1].Text);
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
            if (result == 1)
            {
                BindValues();
            }

        }
        protected void FuntionName(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}