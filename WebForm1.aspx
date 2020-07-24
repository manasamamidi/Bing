<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PA7.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head runat="server">
    <title></title>
      <link href="Styles/StyleSheet1.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-3.5.0.min.js"> </script>
    <script src="JavaScript.js"></script>
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</head>
<body id="backgroundImage" runat="server">
    <form id="form1" runat="server">

    <div id="bodyBackImg1" class="container"> 

    <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
   <asp:UpdatePanel ID="updatepanel" runat="server" >
        <ContentTemplate>
     
        <table style="width:100%">
            <tr>
                <td style="width:50%" >
                    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="MenuItems"  OnMenuItemClick="Menu1_MenuItemClick" >
                        <Items> 
                            <asp:MenuItem Text="Images"> </asp:MenuItem> 
                             <asp:MenuItem Text="..." >
                                 <asp:MenuItem Text="Vedios"> </asp:MenuItem>
                                 <asp:MenuItem Text="Maps"> </asp:MenuItem>
                                 <asp:MenuItem Text="News"> </asp:MenuItem>
                                 <asp:MenuItem Text="Shopping"> </asp:MenuItem>
                                 <asp:MenuItem Text="MSN"> </asp:MenuItem>
                                 <asp:MenuItem Text="Office"> 
                                     <asp:MenuItem Text="Outlook"> </asp:MenuItem>
                                     <asp:MenuItem Text="Work"> </asp:MenuItem>
                                     <asp:MenuItem Text="Excel"> </asp:MenuItem>
                                     <asp:MenuItem Text="PowerPoint"> </asp:MenuItem>
                                     <asp:MenuItem Text="OneNote"> </asp:MenuItem>
                                     <asp:MenuItem Text="Sway"> </asp:MenuItem>
                                     <asp:MenuItem Text="OneDrive"> </asp:MenuItem>
                                     <asp:MenuItem Text="Calender"> </asp:MenuItem>
                                 </asp:MenuItem>
                             </asp:MenuItem>
                            <asp:MenuItem Text="MyBing">
                                <asp:MenuItem Text="Add one more image" NavigateUrl="~/AddImage.aspx"  > </asp:MenuItem>
                                <asp:MenuItem Text="Delete one existing image" NavigateUrl="~/DeleteImage.aspx"> </asp:MenuItem>
                                <asp:MenuItem Text="Select your image replacing order">
                                    <asp:MenuItem Text="By Name">

                                </asp:MenuItem>
                                    <asp:MenuItem Text="By Upload Date Time">

                                </asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="Booking a Hotel" NavigateUrl="~/BookHotel.aspx"> </asp:MenuItem>
                            </asp:MenuItem>
                        </Items>
                    </asp:Menu>
       
                </td>
                <td style="padding-left:20%">
                    <asp:HyperLink ID="HyperLink1" ForeColor="White"  runat="server" > Sign In</asp:HyperLink>  &nbsp
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/sign.png" Height="30px" />
                    <asp:HyperLink ID="HyperLink2" ForeColor="White"  runat="server"> Rewards</asp:HyperLink> &nbsp 

                   <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/reward.png" Height="20px" />
                </td>
            </tr>

            <tr style="height:40px">
                <td>
                    &nbsp
                </td>
            </tr>

            <tr >
                <td colspan="2" style="text-align:center">
                 
                       <asp:Image ID="Image1" runat="server"  ImageUrl="~/Images/bing.png"  Height="50px" Width="200px" />
                    <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="450px"></asp:TextBox>
                           
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Track local and global case numbers and the latest news."></asp:Label>
                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="true" ForeColor="White" Font-Underline="false"  NavigateUrl="https://bing.com/covid/local/unitedstates?form=COVD07">Coronovirus tracker</asp:HyperLink>
                </td>
            </tr>

            <tr>
                <td class="buttons">
                    <asp:Button ID="Button1" runat="server" Text="<" BackColor="black" Height="30px" Width="30px" ForeColor="white" OnClick="previous" OnClientClick="previous" /> &nbsp &nbsp
                     <asp:Button ID="Button2" runat="server" Text=">" BackColor="black"  Height="30px" Width="30px" ForeColor="white" OnClick="next" OnClientClick="next" />
                </td>
            </tr>
        </table>

            
             </ContentTemplate>
       </asp:UpdatePanel>
       </div>
    </form>
</body>
</html>
