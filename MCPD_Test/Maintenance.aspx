<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maintenance.aspx.cs" Inherits="Maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="App_Themes/MaintenanceStyle.css" />
    <script type="text/javascript" src="https://cdn.rawgit.com/asvd/dragscroll/master/dragscroll.js"></script>
    <title>Maintenance</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="MainContainer" class="container">
            <div class="container" id="TopRowContainer">
                <!-----------------BUILDING MAINTENANCE GRIDVIEW---------------->
                <div id="BuildingItem">
                    <header>Buildings</header>
                    <div class="item">
                        <div id="GridViewBox">
                            <asp:GridView ID="GridViewBuildings" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="buildId" DataSourceID="SqlDataSourceBuildings">
                                <Columns>
                                    <asp:BoundField DataField="buildId" HeaderText="buildId" InsertVisible="False" ReadOnly="True" SortExpression="buildId" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                </Columns>
                                <PagerStyle BackColor="#ff00ff" />
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSourceBuildings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [Buildings]">
                        </asp:SqlDataSource>

                        <!-----------------BUILDING MAINTENANCE DETAILS LIST---------------->
                        <div id="DetailsViewBox">
                            <asp:DetailsView ID="DetailsViewBuildings" runat="server"
                                DataSourceID="SqlDataSourceBuildingsDetails" DataKeyNames="buildId"
                                AutoGenerateRows="False"
                                OnItemDeleted="DetailsViewBuildings_ItemDeleted"
                                OnItemInserted="DetailsViewBuildings_ItemInserted"
                                OnItemUpdated="DetailsViewBuildings_ItemUpdated">
                                <Fields>

                                    <asp:BoundField DataField="buildId" HeaderText="buildId" InsertVisible="False" ReadOnly="True" SortExpression="buildId" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                                </Fields>

                                <EmptyDataTemplate>
                                    <table cellspacing="0" rules="rows" border="1" id="DetailsViewBuildings" style="border-collapse: collapse;">
                                        <tr>
                                            <td>Building ID:</td>
                                            <td>
                                                <span id="DetailsViewBuildings_lblDetailsViewBuildingId"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Building Name:</td>
                                            <td>
                                                <span id="DetailsViewBuildings_lblDetailsViewBuildingName"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Building Address:</td>
                                            <td>
                                                <span id="DetailsViewBuildings_lblDetailsViewBuildingAddress"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Building Type:</td>
                                            <td>
                                                <span id="DetailsViewBuildings_lblDetailsViewBuildingType"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Building Alias:</td>
                                            <td>
                                                <span id="DetailsViewBuildings_lblDetailsViewBuildingAlias"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button runat="server" ID="newBuilding" Text="New" OnClick="NewBuilding_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:DetailsView>
                        </div id="DetailsViewBox">
                    </div>
                </div>

                <!-----------------BUILDING MAINTENANCE DATA SOURCE---------------->
        
                <div id="MaintenanceItem">
                     <header id="MaintenanceHeader">Maintenance</header>
                    <div class="item">
                        <asp:SqlDataSource ID="SqlDataSourceBuildingsDetails" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [Buildings] WHERE ([buildId] = @buildId)"
                            DeleteCommand="DELETE FROM [Buildings] WHERE [buildId] = @buildId"
                            InsertCommand="INSERT INTO [Buildings] ([Name], [Address], [Type], [Alias]) VALUES (@Name, @Address, @Type, @Alias)"
                            UpdateCommand="UPDATE [Buildings] SET [Name] = @Name, [Address] = @Address, [Type] = @Type, [Alias] = @Alias WHERE [buildId] = @buildId">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridViewBuildings" Name="buildId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="buildId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Alias" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Alias" Type="String" />
                                <asp:Parameter Name="buildId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>


                        <!-----------------TYPE MAINTENANCE DROP-DOWN DATA---------------->
                        <div id="maintenanceItem" class="item">
                            <asp:SqlDataSource ID="SqlDataSourceTypesDdl" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT * FROM [Types]"></asp:SqlDataSource>
                            <div id="GridViewTypesBox">
                                <asp:GridView ID="GridViewTypes" runat="server" AutoGenerateColumns="False" DataKeyNames="typeId" DataSourceID="SqlDataSourceTypes">
                                    <Columns>
                                        <asp:BoundField DataField="typeId" HeaderText="typeId" InsertVisible="False" ReadOnly="True" SortExpression="typeId" />
                                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <asp:SqlDataSource ID="SqlDataSourceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Types] ORDER BY [typeId]">
                            </asp:SqlDataSource>

                            <!-----------------TYPE MAINTENANCE DETAILS LIST---------------->
                            <div id="Box4">
                                <asp:DetailsView ID="DetailsViewTypes" runat="server"
                                    DataSourceID="SqlDataSourceTypesDetails" DataKeyNames="typeId"
                                    AutoGenerateRows="False"
                                    OnItemDeleted="DetailsViewTypes_ItemDeleted"
                                    OnItemInserted="DetailsViewTypes_ItemInserted"
                                    OnItemUpdated="DetailsViewTypes_ItemUpdated">
                                    <Fields>
                                        <asp:BoundField DataField="typeId" HeaderText="typeId" InsertVisible="False" ReadOnly="True" SortExpression="typeId" />
                                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                                    </Fields>

                                    <EmptyDataTemplate>
                                        <table cellspacing="0" rules="rows" border="1" id="DetailsViewTypes" style="border-collapse: collapse;">
                                            <tr>
                                                <td>Type ID:</td>
                                                <td>
                                                    <span id="DetailsViewTypes_lblDetailsViewTypeId"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Building Type:</td>
                                                <td>
                                                    <span id="DetailsViewTypes_lblDetailsViewType"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Button runat="server" ID="newBuilding" Text="New" OnClick="NewType_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:DetailsView>
                            </div id="Box4">

                            <!-----------------TYPE MAINTENANCE DATA---------------->
                            <asp:SqlDataSource ID="SqlDataSourceTypesDetails" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT * FROM [Types] WHERE ([typeId] = @typeId2)"
                                DeleteCommand="DELETE FROM [Types] WHERE [typeId] = @typeId"
                                InsertCommand="INSERT INTO [Types] ([type]) VALUES (@type)"
                                UpdateCommand="UPDATE [Types] SET [type] = @type WHERE [typeId] = @typeId">
                                <DeleteParameters>
                                    <asp:Parameter Name="typeId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="type" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridViewTypes" Name="typeId2" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="type" Type="String" />
                                    <asp:Parameter Name="typeId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

            <!-----------------LOGIN MAINTENANCE DATA---------------->
            <header>Account</header>
            <div id="MiddleRowContainer" class="container">
                <asp:SqlDataSource ID="SqlDataSourceLogin" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Logins]"
                    DeleteCommand="DELETE FROM [Logins] WHERE [LogId] = @LogId"
                    InsertCommand="INSERT INTO [Logins] ([Name], [UserName], [Password]) VALUES (@Name, @UserName, @Password)"
                    UpdateCommand="UPDATE [Logins] SET [Name] = @Name, [UserName] = @UserName, [Password] = @Password WHERE [LogId] = @LogId">
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
                <div id="GridViewLoginBox">
                    <asp:GridView ID="GridViewLogin" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="LogId" DataSourceID="SqlDataSourceLogin">
                        <Columns>
                            <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div id="GridViewLoginBox">

                <!-----------------LOGIN MAINTENANCE DETAILS LIST---------------->
                <asp:DetailsView ID="DetailsViewLogin" runat="server"
                    DataSourceID="SqlDataSourceLoginDetails" DataKeyNames="LogId"
                    AutoGenerateRows="False"
                    OnItemDeleted="DetailsViewLogin_ItemDeleted"
                    OnItemInserted="DetailsViewLogin_ItemInserted"
                    OnItemUpdated="DetailsViewLogin_ItemUpdated">
                    <Fields>
                        <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>

                    <EmptyDataTemplate>
                        <table cellspacing="0" rules="rows" border="1" id="DetailsViewLogin" style="border-collapse: collapse;">
                            <tr>
                                <td>User ID:</td>
                                <td>
                                    <span id="DetailsViewLogin_lblDetailsViewUserId"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Full Name:</td>
                                <td>
                                    <span id="DetailsViewLogin_lblDetailsViewFullName"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td>
                                    <span id="DetailsViewBuildings_lblDetailsViewUserName"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td>
                                    <span id="DetailsViewBuildings_lblDetailsViewPassword"></span>
                                </td>
                            </tr>
                            <td colspan="2">
                                <asp:Button runat="server" ID="newLogin" Text="New" OnClick="NewLogin_Click" />
                            </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:DetailsView>

                <!-----------------LOGIN MAINTENANCE DATA---------------->
                <asp:SqlDataSource ID="SqlDataSourceLoginDetails" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Logins] WHERE ([LogId] = @LogId)"
                    DeleteCommand="DELETE FROM [Logins] WHERE [LogId] = @LogId"
                    InsertCommand="INSERT INTO [Logins] ([Name], [UserName], [Password]) VALUES (@Name, @UserName, @Password)"
                    UpdateCommand="UPDATE [Logins] SET [Name] = @Name, [UserName] = @UserName, [Password] = @Password WHERE [LogId] = @LogId">
                    <DeleteParameters>
                        <asp:Parameter Name="LogId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewLogin" Name="LogId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="LogId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <!-----------------PICTURES MAINTENANCE DATA---------------->
            <header>Images</header>
            <div id="BottomRowContainer" class="container">
                <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Pictures]">
                </asp:SqlDataSource>
                <div id="GridViewPicsBox">
                    <asp:GridView ID="GridViewPictures" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="picId" DataSourceID="SqlDataSourcePictures">
                        <Columns>
                            <asp:BoundField DataField="picId" HeaderText="picId" InsertVisible="False" ReadOnly="True" SortExpression="picId" />
                            <asp:BoundField DataField="buildId" HeaderText="buildId" SortExpression="buildId" />
                            <asp:BoundField DataField="refLoc" HeaderText="refLoc" SortExpression="refLoc" />
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <!-----------------PICTURES MAINTENANCE DETAILS LIST---------------->
                <asp:DetailsView ID="DetailsViewPictures" runat="server"
                    DataSourceID="SqlDataSourcePictureDetails" DataKeyNames="picId"
                    AutoGenerateRows="False"
                    OnItemDeleted="DetailsViewPictures_ItemDeleted"
                    OnItemInserted="DetailsViewPictures_ItemInserted"
                    OnItemUpdated="DetailsViewPictures_ItemUpdated">
                    <Fields>
                        <asp:BoundField DataField="picId" HeaderText="picId" ReadOnly="True" SortExpression="picId" InsertVisible="False" />
                        <asp:BoundField DataField="buildId" HeaderText="buildId" SortExpression="buildId" ConvertEmptyStringToNull="False" />
                        <asp:BoundField DataField="refLoc" HeaderText="refLoc" SortExpression="refLoc" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                    
                   
                    
                </asp:DetailsView>

                <!-----------------PICTURE MAINTENANCE DATA---------------->
                <asp:SqlDataSource ID="SqlDataSourcePictureDetails" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Pictures] WHERE ([picId] = @picId)" DeleteCommand="DELETE FROM [Pictures] WHERE [picId] = @picId" InsertCommand="INSERT INTO [Pictures] ([buildId], [refLoc]) VALUES (@buildId, @refLoc)" UpdateCommand="UPDATE [Pictures] SET [buildId] = @buildId, [refLoc] = @refLoc WHERE [picId] = @picId">
                    <DeleteParameters>
                        <asp:Parameter Name="picId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="buildId" Type="Int32" />
                        <asp:Parameter Name="refLoc" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewPictures" Name="picId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="buildId" Type="Int32" />
                        <asp:Parameter Name="refLoc" Type="String" />
                        <asp:Parameter Name="picId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <p>
                    <asp:Label ID="lblError" runat="server" EnableViewState="false"></asp:Label>
                </p>
            </div id="BottomRowContainer" class="container">
        </div id="MainContainer" class="container">

    </form>
</body>
</html>