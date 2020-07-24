using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PA7
{
    public partial class AddHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }

        protected void AddHotel_Click(object sender, EventArgs e)
        {
            try
            {

                using (BookHotelDataContext dataContext = new BookHotelDataContext())
                {
                    HotelInfo htlInf = new HotelInfo();
                    htlInf.HotelName = nameTxt.Text;
                    htlInf.PricePerNight = Convert.ToDecimal(priceTxt.Text);
                    htlInf.AvailableRooms = Convert.ToInt32(availableTxt.Text);
                    htlInf.NoOfBookedRooms = Convert.ToInt32(bookedTxt.Text);
                    dataContext.HotelInfos.InsertOnSubmit(htlInf);
                    dataContext.SubmitChanges();

                }

                Response.Redirect("BookHotel.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}