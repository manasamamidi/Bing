<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddHotel.aspx.cs" Inherits="PA7.AddHotel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%">
                <tr class="header">

                    <td colspan="2">
                        <p style="font-size:larger; font-weight:600">Please Add Hotel Details</p>
                    </td>

                </tr>

                    <tr style="height:15px" >
                        <td colspan="2" >
                            &nbsp
                        </td>

                    </tr>
                 <tr>

                <td>
                         <asp:Label ID="hotelName" runat="server" Text="Hotel Name"></asp:Label>
                     </td>

                     <td>
                         <asp:TextBox ID="nameTxt" runat="server"></asp:TextBox>
                     &nbsp &nbsp
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nameTxt"  ForeColor="Red" ErrorMessage="Please Enter Hotel Name"></asp:RequiredFieldValidator>
                     </td>

                     </tr>

                   <tr>

                     <td>
                     <asp:Label ID="PriceperNight" runat="server" Text="Price per Night"></asp:Label>
                     </td>

                     <td>
                         <asp:TextBox ID="priceTxt" runat="server"></asp:TextBox>
                     &nbsp &nbsp
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="priceTxt" ErrorMessage="Please Enter the Price Per Night" ForeColor="Red"></asp:RequiredFieldValidator>
                           &nbsp

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Price in Numbers upto 2 decimal places" ControlToValidate="priceTxt" ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,2})?$"></asp:RegularExpressionValidator>

                     </td>
                 </tr>

                   <tr>
                     <td>
                         <asp:Label ID="AvailableRooms" runat="server" Text="Available Number of Rooms"></asp:Label>
                     </td>
                     <td>
                         <asp:TextBox ID="availableTxt" runat="server"></asp:TextBox>
                     &nbsp;

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="availableTxt" ErrorMessage="Please Enter Available Rooms" ForeColor="Red"></asp:RequiredFieldValidator>
                         &nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter only Positive numeric values" ControlToValidate="availableTxt" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                     </td>
                       
                 </tr>
                   <tr>
                     <td>
 <asp:Label ID="BookedRooms" runat="server" Text="Number of Booked Rooms"></asp:Label>
                     </td>
                     <td>
<asp:TextBox ID="bookedTxt" runat="server" Text="0" Enabled="false"></asp:TextBox>
                     &nbsp
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="bookedTxt" ErrorMessage="Please Enter Booked Rooms" ForeColor="Red"></asp:RequiredFieldValidator>
                     </td>
                 </tr>
                 <tr style="height:15px"><td colspan="2"></td></tr>
                 <tr>
                     <td colspan="2">
                     <div >
                        <asp:Button ID="Add" runat="server"  BackColor="Black" ForeColor="white" Text="Add" Height="34px" Width="140px" OnClick="AddHotel_Click" />  &nbsp &nbsp &nbsp &nbsp  
                       
                        <asp:Button ID="Home" runat="server" BackColor="Black" ForeColor="white" Text="Home" Width="140px"  OnClick="Home_Click" Height="34px" CausesValidation="false" />
                            </div>
                         </td>
                 </tr>
                  
                 </table>
    </form>
</body>
</html>
