<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddImage.aspx.cs" Inherits="PA7.AddImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Add one more Image" Font-Bold="true" ></asp:Label>

        </div>

        <div> &nbsp </div>

        <asp:Label ID="Label2" runat="server" Text="Select Image Source   "></asp:Label> &nbsp &nbsp &nbsp &nbsp 
        <asp:FileUpload ID="FileUpload1" runat="server" /> <br />
        <br />

            <br /> 
        <div> 
        <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" BackColor="Black" ForeColor="white" /> &nbsp &nbsp &nbsp
        <asp:Button ID="Button2" runat="server" Text="Home" OnClick="Button2_Click" BackColor="Black" ForeColor="white" /> 
    </div>
            </form> 


</body>
</html>
