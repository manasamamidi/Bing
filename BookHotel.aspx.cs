using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PA7
{
    public partial class BookHotel : System.Web.UI.Page
    {
        BookHotelDataContext bookContext = new BookHotelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:

                    if (Convert.ToInt32(e.Row.Cells[3].Text) == 0)
                    {
                        Button btn = (Button)e.Row.FindControl("deletebtnID");
                        if (btn != null)
                        {
                            btn.Visible = true;
                        }
                    }
                    else
                    {
                        Button bookbtn = (Button)e.Row.FindControl("BookbtnID");
                        if (bookbtn != null)
                        {
                            bookbtn.Visible = true;
                        }
                    }
                    break;
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddHotel.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm1.aspx");
        }

        protected void BookRooms(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string name = gvr.Cells[1].Text;
            int availableRooms = Convert.ToInt32(gvr.Cells[3].Text);
            int bookedRooms = Convert.ToInt32(gvr.Cells[4].Text);
            gvr.Cells[3].Text = (availableRooms - 1).ToString();
            gvr.Cells[4].Text = (bookedRooms + 1).ToString();
            HotelInfo hf = new HotelInfo();
            hf = bookContext.HotelInfos.Single(y => y.HotelName == name);
            hf.AvailableRooms = Convert.ToInt32(gvr.Cells[3].Text);
            hf.NoOfBookedRooms = Convert.ToInt32(gvr.Cells[4].Text);
            bookContext.SubmitChanges();
            if (Convert.ToInt32(gvr.Cells[3].Text) == 0)
            {
                btn.Visible = false;
                btn.Parent.Controls[3].Visible = true;
            }
        }

        protected void DeleteRooms(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string name = gvr.Cells[1].Text;
            HotelInfo hf = new HotelInfo();
            hf = bookContext.HotelInfos.Single(y => y.HotelName == name);
            bookContext.HotelInfos.DeleteOnSubmit(hf);
            bookContext.SubmitChanges();
            GridView1.DataBind();
        }
    }
}
