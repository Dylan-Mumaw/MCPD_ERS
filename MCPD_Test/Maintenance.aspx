<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maintenance.aspx.cs" Inherits="Maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="https://cdn.rawgit.com/asvd/dragscroll/master/dragscroll.js"></script>
    <title>Maintenance</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridViewBuildings" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceBuildings">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                    <asp:CommandField ButtonType="Button" HeaderText="Update/Edit" ShowEditButton="True" ShowHeader="True" />
                    <asp:CommandField ButtonType="Button" HeaderText="DELETE" ShowDeleteButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceBuildings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buildings]"></asp:SqlDataSource>
            <asp:GridView ID="GridViewPictures" runat="server" AutoGenerateColumns="False" DataKeyNames="LogId" DataSourceID="SqlDataSourceLogin">
                <Columns>
                    <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:CommandField ButtonType="Button" HeaderText="Update/Edit" ShowEditButton="True" ShowHeader="True" />
                    <asp:CommandField ButtonType="Button" HeaderText="DELETE" ShowDeleteButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Pictures]"></asp:SqlDataSource>
            <asp:GridView ID="GridViewLogin" runat="server" AutoGenerateColumns="False" DataKeyNames="picId" DataSourceID="SqlDataSourcePictures">
                <Columns>
                    <asp:BoundField DataField="picId" HeaderText="picId" InsertVisible="False" ReadOnly="True" SortExpression="picId" />
                    <asp:BoundField DataField="buildId" HeaderText="buildId" SortExpression="buildId" />
                    <asp:BoundField DataField="refLoc" HeaderText="refLoc" SortExpression="refLoc" />
                    <asp:CommandField ButtonType="Button" HeaderText="Update/Edit" ShowEditButton="True" ShowHeader="True" />
                    <asp:CommandField ButtonType="Button" HeaderText="DELETE" ShowDeleteButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceLogin" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Logins]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
