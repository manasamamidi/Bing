<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteImage.aspx.cs" Inherits="PA7.DeleteImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Delete Image" Font-Bold="true" Font-Size="Larger" ></asp:Label>
        </div>

        <div>
            &nbsp
        </div>

        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select * from [dbo].[ImageTable]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" DataKeyNames="Id" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDeleting="FuntionName" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
               
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="ImageName" HeaderText="Image Name" SortExpression="ImageName" />
                    <asp:BoundField DataField="UploadDateTime" HeaderText="Upload Date Time" SortExpression="UploadDateTime" />
                    <asp:TemplateField HeaderText="Delete Image">

                    <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click" meta:resourcekey="BtnUserDeleteResource1" onClientClick=" return confirm('Are you sure you want to delete?')">Delete</asp:LinkButton>
                    </ItemTemplate>

                </asp:TemplateField>
                    
                     </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Home Page" ForeColor="Wheat" BackColor="Black" OnClick="Button1_Click" />
        
        </div>
    </form>
</body>
</html>
