<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookHotel.aspx.cs" Inherits="PA7.BookHotel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Book Hotel" Font-Size="Larger" Font-Bold="true"></asp:Label>
        </div>

        <div>
            &nbsp
        </div>

        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="LinqDataSource1" EmptyDataText="There are no Hotels available to book." OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="Vertical">
                <RowStyle HorizontalAlign="Center" BackColor="#EEEEEE" ForeColor="Black" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="HotelName" HeaderText="Hotel Name" SortExpression="Hotel Name" />
                    <asp:BoundField DataField="PricePerNight" HeaderText="Price Per Night" SortExpression="Price Per Night" />
                    <asp:BoundField DataField="AvailableRooms" HeaderText="Available number of Rooms" SortExpression="Available number of Rooms" />
                    <asp:BoundField DataField="NoOfBookedRooms" HeaderText="Number of rooms Booked" SortExpression="Number of rooms Booked" />
                   <asp:TemplateField HeaderText="" Visible="True">
                               <ItemTemplate>
                                   <asp:Button Visible="false" ID="BookbtnID" runat="server" Text="Book" CommandName="Book" OnClick="BookRooms"/>
                                   <asp:Button Visible="false" ID="deletebtnID" runat="server" Text="Delete" CommandName="Delete" OnClick="DeleteRooms"/>
                               </ItemTemplate>
                           </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
              
        </div>

        <asp:LinqDataSource ID="LinqDataSource1" EnableDelete="true" runat="server" ContextTypeName="PA7.BookHotelDataContext" EntityTypeName="" TableName="HotelInfos">
        </asp:LinqDataSource>
        <br />

        <div class="header">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Hotel" />
&nbsp &nbsp &nbsp &nbsp
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Home Page" />
        </div>

    </form>
</body>
</html>
