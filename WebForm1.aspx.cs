using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PA7
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["DeleteList"] = new List<string>();
                ViewState["Images"] = new List<string>();
                ViewState["arrowIndex"] = 0;
                getImages("Id");
          
            }
        }

        protected void getImages(string sortOrder)
        {
            DataTable dt = FetchImagesFromDB(sortOrder);
            List<string> Images = new List<string>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow data in dt.Rows)
                {
                    string x = data["ImageName"].ToString();
                    Images.Add(x);
                }
            }
            Session["ImageList"] = Images;
        }

        public static DataTable FetchImagesFromDB(string sortBy)
        {
            DataTable dt = new DataTable();

            try
            {
                SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                using (scon)
                {
                    string sql = "Select * from [dbo].[ImageTable] order by " + sortBy;
                    scon.Open();
                    SqlCommand cmd = new SqlCommand(sql, scon);
                    SqlDataAdapter myAdapter = new SqlDataAdapter(cmd);
                    myAdapter.Fill(dt);
                
                }
            }
            catch (Exception ex)
            {
                
            }
            return dt; 
        }


    
    protected void previous(object sender, EventArgs e)
        {
            string imagePath = string.Empty;
            List<string> preImage = (List<string>)(Session["ImageList"]);
            if (Convert.ToInt32(ViewState["arrowIndex"]) > preImage.Count - 1)
            {
                ViewState["arrowIndex"] = preImage.Count - 1;
                imagePath = string.Format("'Images/BgImages/{0}'", preImage[Convert.ToInt32(ViewState["arrowIndex"])]);
            }

            if (Convert.ToInt32(ViewState["arrowIndex"]) == 0)
            {
                ViewState["arrowIndex"] = preImage.Count - 1;
                imagePath = string.Format("'Images/BgImages/{0}'", preImage[Convert.ToInt32(ViewState["arrowIndex"])]);
            }

            else
            {
                ViewState["arrowIndex"] = Convert.ToInt32(ViewState["arrowIndex"]) - 1;
                imagePath = string.Format("'Images/BgImages/{0}'", preImage[Convert.ToInt32(ViewState["arrowIndex"])]);
            }
            ScriptManager.RegisterStartupScript(this, Page.GetType(), "Script", "javascript:ChangeBodyBackground(" + imagePath + ");", true);
        }

        protected void next(object sender, EventArgs e)
        {
            string imagePath = string.Empty;
            List<string> preImage = (List<string>)(Session["ImageList"]);
    if (Convert.ToInt32(ViewState["arrowIndex"]) == preImage.Count - 1)
            {
                ViewState["arrowIndex"] = 0;
                imagePath = string.Format("'Images/BgImages/{0}'", preImage[Convert.ToInt32(ViewState["arrowIndex"])]);
            }
            else
            {
                ViewState["arrowIndex"] = Convert.ToInt32(ViewState["arrowIndex"]) + 1;
                imagePath = string.Format("'Images/BgImages/{0}'", preImage[Convert.ToInt32(ViewState["arrowIndex"])]);
            }


            ScriptManager.RegisterStartupScript(this, Page.GetType(), "Script", "javascript:ChangeBodyBackground(" + imagePath + ");", true);
        }


        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            
             if (e.Item.Text == "By Name")
            {
                getImages("ImageName");
                List<string> sortImage = (List<string>)(Session["ImageList"]);
                ViewState["arrowIndex"] = 0;
                string imagePath = string.Format("'Images/BgImages/{0}'", sortImage[0]);
                ScriptManager.RegisterStartupScript(this, Page.GetType(), "Script", "javascript:ChangeBodyBackground(" + imagePath + ");", true);
                backgroundImage.Attributes.Add("style", imagePath);
            }

            if(e.Item.Text == "By Upload Date Time")
            {
                getImages("UploadDateTime");
                List<string> sortImage = (List<string>)(Session["ImageList"]);
                ViewState["arrowIndex"] = 0;
                string imagePath = string.Format("'Images/BgImages/{0}'", sortImage[0]);
                ScriptManager.RegisterStartupScript(this, Page.GetType(), "Script", "javascript:ChangeBodyBackground(" + imagePath + ");", true);
            }
        }
    }
}