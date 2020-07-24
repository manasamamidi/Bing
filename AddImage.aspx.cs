using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PA7
{
    public partial class AddImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

                FileUpload1.SaveAs(Server.MapPath("Images/BgImages/" + filename));

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                using (con)
                {
                    con.Open();
                    string insert = "insert into ImageTable (ImageName,UploadDateTime) " +
                        "values(@name,@DateTime)";
                    SqlCommand cmd = new SqlCommand(insert, con);
                    cmd.Parameters.AddWithValue("@name", filename);
                    cmd.Parameters.AddWithValue("@DateTime", DateTime.Now);
                    cmd.ExecuteNonQuery();
                    con.Close();

                }


            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}