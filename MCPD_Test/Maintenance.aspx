<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maintenance.aspx.cs" Inherits="Maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="MaintenanceStyle.css" />
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
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                    <asp:CommandField ButtonType="Button" HeaderText="Update/Edit" ShowEditButton="True" ShowHeader="True" />
                    <asp:CommandField ButtonType="Button" HeaderText="DELETE" ShowDeleteButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceBuildings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buildings]" DeleteCommand="DELETE FROM [Buildings] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Buildings] ([Name], [Address], [Alias]) VALUES (@Name, @Address, @Alias)" UpdateCommand="UPDATE [Buildings] SET [Name] = @Name, [Address] = @Address, [Type] = @Type, [Alias] = @Alias WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Alias" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Alias" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
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
            <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Pictures]" DeleteCommand="DELETE FROM [Pictures] WHERE [picId] = @picId" InsertCommand="INSERT INTO [Pictures] ([buildId], [refLoc]) VALUES (@buildId, @refLoc)" UpdateCommand="UPDATE [Pictures] SET [buildId] = @buildId, [refLoc] = @refLoc WHERE [picId] = @picId">
                <DeleteParameters>
                    <asp:Parameter Name="picId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="buildId" Type="Int32" />
                    <asp:Parameter Name="refLoc" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="buildId" Type="Int32" />
                    <asp:Parameter Name="refLoc" Type="String" />
                    <asp:Parameter Name="picId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewLogin" runat="server" AutoGenerateColumns="False" DataKeyNames="picId" DataSourceID="SqlDataSourcePictures">
                <Columns>
                    <asp:BoundField DataField="picId" HeaderText="picId" InsertVisible="False" ReadOnly="True" SortExpression="picId" />
                    <asp:BoundField DataField="buildId" HeaderText="buildId" SortExpression="buildId" />
                    <asp:BoundField DataField="refLoc" HeaderText="refLoc" SortExpression="refLoc" />
                    <asp:CommandField ButtonType="Button" HeaderText="Update/Edit" ShowEditButton="True" ShowHeader="True" />
                    <asp:CommandField ButtonType="Button" HeaderText="DELETE" ShowDeleteButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceLogin" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Logins]" DeleteCommand="DELETE FROM [Logins] WHERE [LogId] = @LogId" InsertCommand="INSERT INTO [Logins] ([Name], [UserName], [Password]) VALUES (@Name, @UserName, @Password)" UpdateCommand="UPDATE [Logins] SET [Name] = @Name, [UserName] = @UserName, [Password] = @Password WHERE [LogId] = @LogId">
                <DeleteParameters>
                    <asp:Parameter Name="LogId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="LogId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
