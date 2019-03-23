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
                            <asp:GridView ID="GridViewBuildings" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceBuildings">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                                    <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="True" ShowHeader="True" />
                                </Columns>
                                <PagerStyle BackColor="#ff00ff" />
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSourceBuildings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [Buildings]"
                            DeleteCommand="DELETE FROM [Buildings] WHERE [Id] = @Id"
                            InsertCommand="INSERT INTO [Buildings] ([Name], [Address], [Alias]) VALUES (@Name, @Address, @Alias)"
                            UpdateCommand="UPDATE [Buildings] SET [Name] = @Name, [Address] = @Address, [Type] = @Type, [Alias] = @Alias WHERE [Id] = @Id">
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

                        <!-----------------BUILDING MAINTENANCE DETAILS LIST---------------->
                        <div id="DetailsViewBox">
                            <asp:DetailsView ID="DetailsViewBuildings" runat="server"
                                DataSourceID="SqlDataSourceBuildingsDetails" DataKeyNames="Id"
                                AutoGenerateRows="false"
                                OnItemDeleted="DetailsViewBuildings_ItemDeleted"
                                OnItemInserted="DetailsViewBuildings_ItemInserted"
                                OnItemUpdated="DetailsViewBuildings_ItemUpdated">
                                <Fields>

                                    <asp:TemplateField HeaderText="Building ID:">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDetailsViewBuildingId" runat="server"
                                                Text='<%# Eval("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblDetailsViewBuildingId" runat="server"
                                                Text='<%# Eval("Id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:Label ID="lblDetailsViewBuildingId" runat="server"
                                                Text='<%# GetNextId("Buildings") %>'></asp:Label>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Building Name:">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDetailsViewBuildingName" runat="server"
                                                Text='<%# Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDetailsViewBuildingName" runat="server"
                                                Text='<%# Bind("Name") %>' Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidatorBuildingName" runat="server"
                                                ControlToValidate="txtDetailsViewBuildingName"
                                                ErrorMessage="Name is a required field.">
                                            </asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="txtDetailsViewBuildingName" runat="server"
                                                Text='<%# Bind("Name") %>' Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidatorBuildingName" runat="server"
                                                ControlToValidate="txtDetailsViewBuildingName"
                                                ErrorMessage="Name is a required field.">
                                            </asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Building Address:">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDetailsViewBuildingAddress" runat="server"
                                                Text='<%# Eval("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDetailsViewBuildingAddress" runat="server"
                                                Text='<%# Bind("Address") %>' Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidatorBuildingAddress" runat="server"
                                                ControlToValidate="txtDetailsViewBuildingAddress"
                                                ErrorMessage="Address is a required field.">
                                            </asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="txtDetailsViewBuildingAddress" runat="server"
                                                Text='<%# Bind("Address") %>' Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidatorBuildingAddress" runat="server"
                                                ControlToValidate="txtDetailsViewBuildingAddress"
                                                ErrorMessage="Address is a required field.">
                                            </asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Building Type:">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDetailsViewBuildingType" runat="server"
                                                Text='<%# Eval("Type") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlBuildingType" runat="server"
                                                DataSourceID="SqlDataSourceTypesDdl"
                                                DataTextField="Type" DataValueField="Type"
                                                SelectedValue='<%# Bind("Type") %>' Width="130px">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlBuildingType" runat="server"
                                                DataSourceID="SqlDataSourceTypesDdl"
                                                DataTextField="Type" DataValueField="Type"
                                                SelectedValue='<%# Bind("Type") %>' Width="130px">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Building Alias:">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDetailsViewBuildingAlias" runat="server"
                                                Text='<%# Eval("Alias") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDetailsViewBuildingAlias" runat="server"
                                                Text='<%# Bind("Alias") %>' Width="200px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="txtDetailsViewBuildingAlias" runat="server"
                                                Text='<%# Bind("Alias") %>' Width="200px"></asp:TextBox>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button"
                                        ShowDeleteButton="true"
                                        ShowEditButton="true"
                                        ShowInsertButton="true" />
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
                            SelectCommand="SELECT [Id], [Name], [Address], [Type], [Alias] FROM [Buildings] WHERE ([Id] = @Id)"
                            DeleteCommand="DELETE FROM [Buildings] WHERE [Id] = @Id"
                            InsertCommand="INSERT INTO [Buildings] ([Name], [Address], [Type], [Alias]) VALUES (@Name, @Address, @Type, @Alias)"
                            UpdateCommand="UPDATE [Buildings] SET [Name] = @Name, [Address] = @Address, [Type] = @Type, [Alias] = @Alias WHERE [Id] = @Id">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridViewBuildings" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
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
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>


                        <!-----------------TYPE MAINTENANCE DROP-DOWN DATA---------------->
                        <div id="maintenanceItem" class="item">
                            <asp:SqlDataSource ID="SqlDataSourceTypesDdl" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT type FROM types"></asp:SqlDataSource>
                            <div id="GridViewTypesBox">
                                <asp:GridView ID="GridViewTypes" runat="server" AutoGenerateColumns="False" DataKeyNames="typeId" DataSourceID="SqlDataSourceTypes">
                                    <Columns>
                                        <asp:BoundField DataField="typeId" HeaderText="Type ID" InsertVisible="False" ReadOnly="True" SortExpression="typeId" />
                                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="Type" />
                                        <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="True" ShowHeader="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <asp:SqlDataSource ID="SqlDataSourceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Types] ORDER BY [typeId]" DeleteCommand="DELETE FROM [Types] WHERE [typeId] = @typeId" InsertCommand="INSERT INTO [Types] ([type]) VALUES (@type)" UpdateCommand="UPDATE [Types] SET [type] = @type WHERE [typeId] = @typeId">
                                <DeleteParameters>
                                    <asp:Parameter Name="typeId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="type" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="type" Type="Int32" />
                                    <asp:Parameter Name="typeId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <!-----------------TYPE MAINTENANCE DETAILS LIST---------------->
                            <div id="Box4">
                                <asp:DetailsView ID="DetailsViewTypes" runat="server"
                                    DataSourceID="SqlDataSourceTypesDetails" DataKeyNames="typeId"
                                    AutoGenerateRows="false"
                                    OnItemDeleted="DetailsViewTypes_ItemDeleted"
                                    OnItemInserted="DetailsViewTypes_ItemInserted"
                                    OnItemUpdated="DetailsViewTypes_ItemUpdated">
                                    <Fields>
                                        <asp:TemplateField HeaderText="Type ID:">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDetailsViewTypeId" runat="server"
                                                    Text='<%# Eval("typeId") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="lblDetailsViewTypeId" runat="server"
                                                    Text='<%# Eval("typeId") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:Label ID="lblDetailsViewTypeId" runat="server"
                                                    Text='<%# GetNextId("Types") %>'></asp:Label>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Building Type:">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDetailsViewType" runat="server"
                                                    Text='<%# Eval("type") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDetailsViewType" runat="server"
                                                    Text='<%# Bind("type") %>' Width="200px"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidatorType" runat="server"
                                                    ControlToValidate="txtDetailsViewType"
                                                    ErrorMessage="Type is a required field.">
                                                </asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="txtDetailsViewType" runat="server"
                                                    Text='<%# Bind("type") %>' Width="200px"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidatorType" runat="server"
                                                    ControlToValidate="txtDetailsViewType"
                                                    ErrorMessage="Type is a required field.">
                                                </asp:RequiredFieldValidator>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ButtonType="Button"
                                            ShowDeleteButton="true"
                                            ShowEditButton="true"
                                            ShowInsertButton="true" />
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
                                SelectCommand="SELECT [typeId], [type] FROM [Types] WHERE ([typeId] = @typeId)"
                                DeleteCommand="DELETE FROM [Types] WHERE [typeId] = @typeId"
                                InsertCommand="INSERT INTO [Types] ([type]) VALUES (@type)"
                                UpdateCommand="UPDATE [Types] SET [type] = @type WHERE [typeId] = @typeId">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridViewTypes" Name="typeId" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="typeId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="type" Type="String" />
                                </InsertParameters>
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
                    <asp:GridView ID="GridViewLogin" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="LogId" DataSourceID="SqlDataSourceLogin">
                        <Columns>
                            <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="true" ShowHeader="True" />
                        </Columns>
                    </asp:GridView>
                </div id="GridViewLoginBox">

                <!-----------------LOGIN MAINTENANCE DETAILS LIST---------------->
                <asp:DetailsView ID="DetailsViewLogin" runat="server"
                    DataSourceID="SqlDataSourceLoginDetails" DataKeyNames="LogId"
                    AutoGenerateRows="false"
                    OnItemDeleted="DetailsViewLogin_ItemDeleted"
                    OnItemInserted="DetailsViewLogin_ItemInserted"
                    OnItemUpdated="DetailsViewLogin_ItemUpdated">
                    <Fields>
                        <asp:TemplateField HeaderText="User ID:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewUserId" runat="server"
                                    Text='<%# Eval("LogId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblDetailsViewUserId" runat="server"
                                    Text='<%# Eval("LogId") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:Label ID="lblDetailsViewUserId" runat="server"
                                    Text='<%# GetNextId("Logins") %>'></asp:Label>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Full Name:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewFullName" runat="server"
                                    Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewFullName" runat="server"
                                    Text='<%# Bind("Name") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorFullName" runat="server"
                                    ControlToValidate="txtDetailsViewFullName"
                                    ErrorMessage="Name is a required field.">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewFullName" runat="server"
                                    Text='<%# Bind("Name") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorFullName" runat="server"
                                    ControlToValidate="txtDetailsViewFullName"
                                    ErrorMessage="Name is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Username:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewUserName" runat="server"
                                    Text='<%# Eval("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewUserName" runat="server"
                                    Text='<%# Bind("UserName") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorUserName" runat="server"
                                    ControlToValidate="txtDetailsViewUserName"
                                    ErrorMessage="Username is a required field.">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewUserName" runat="server"
                                    Text='<%# Bind("UserName") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorUserName" runat="server"
                                    ControlToValidate="txtDetailsViewUserName"
                                    ErrorMessage="Username is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Password:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewPassword" runat="server"
                                    Text='<%# Eval("Password") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewPassword" runat="server"
                                    Text='<%# Bind("Password") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorPassword" runat="server"
                                    ControlToValidate="txtDetailsViewPassword"
                                    ErrorMessage="Password is a required field.">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewPassword" runat="server"
                                    Text='<%# Bind("Password") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorPassword" runat="server"
                                    ControlToValidate="txtDetailsViewPassword"
                                    ErrorMessage="Password is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button"
                            ShowDeleteButton="true"
                            ShowEditButton="true"
                            ShowInsertButton="true" />
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
                    SelectCommand="SELECT [LogId], [Name], [UserName], [Password] FROM [Logins] WHERE ([LogId] = @LogId)"
                    DeleteCommand="DELETE FROM [Logins] WHERE [LogId] = @LogId"
                    InsertCommand="INSERT INTO [Logins] ([Name], [UserName], [Password]) VALUES (@Name, @UserName, @Password)"
                    UpdateCommand="UPDATE [Logins] SET [Name] = @Name, [UserName] = @UserName, [Password] = @Password WHERE [LogId] = @LogId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewLogin" Name="LogId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
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

            <!-----------------PICTURES MAINTENANCE DATA---------------->
            <header>Images</header>
            <div id="BottomRowContainer" class="container">
                <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Pictures]" DeleteCommand="DELETE FROM [Pictures] WHERE [picId] = @picId"
                    InsertCommand="INSERT INTO [Pictures] ([buildId], [refLoc]) VALUES (@buildId, @refLoc)"
                    UpdateCommand="UPDATE [Pictures] SET [buildId] = @buildId, [refLoc] = @refLoc WHERE [picId] = @picId">
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
                <div id="GridViewPicsBox">
                    <asp:GridView ID="GridViewPictures" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="picId" DataSourceID="SqlDataSourcePictures">
                        <Columns>
                            <asp:BoundField DataField="picId" HeaderText="picId" InsertVisible="False" ReadOnly="True" SortExpression="picId" />
                            <asp:BoundField DataField="buildId" HeaderText="buildId" SortExpression="buildId" />
                            <asp:BoundField DataField="refLoc" HeaderText="refLoc" SortExpression="refLoc" />
                            <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="True" ShowHeader="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <!-----------------PICTURES MAINTENANCE DETAILS LIST---------------->
                <asp:DetailsView ID="DetailsViewPictures" runat="server"
                    DataSourceID="SqlDataSourcePictureDetails" DataKeyNames="PicId"
                    AutoGenerateRows="false"
                    OnItemDeleted="DetailsViewPictures_ItemDeleted"
                    OnItemInserted="DetailsViewPictures_ItemInserted"
                    OnItemUpdated="DetailsViewPictures_ItemUpdated">
                    <Fields>
                        <asp:TemplateField HeaderText="Photo ID:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewPicId" runat="server"
                                    Text='<%# Eval("picId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblDetailsViewPicId" runat="server"
                                    Text='<%# Eval("picId") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:Label ID="lblDetailsViewPicId" runat="server"
                                    Text='<%# GetNextId("Pictures") %>'></asp:Label>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Building ID:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewBuildID" runat="server"
                                    Text='<%# Eval("buildId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewBuildID" runat="server"
                                    Text='<%# Bind("buildId") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorBuildID" runat="server"
                                    ControlToValidate="txtDetailsViewBuildID"
                                    ErrorMessage="Building ID is a required field.">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewBuildId" runat="server"
                                    Text='<%# Bind("buildId") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorBuildingName" runat="server"
                                    ControlToValidate="txtDetailsViewBuildId"
                                    ErrorMessage="BuildingId is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ref Loc:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewRefLoc" runat="server"
                                    Text='<%# Eval("refLoc") %>'></asp:Label>
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewRefLoc" runat="server"
                                    Text='<%# Bind("refLoc") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorRefLoc" runat="server"
                                    ControlToValidate="txtDetailsViewRefLoc"
                                    ErrorMessage="refLoc is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button"
                            ShowDeleteButton="true"
                            ShowEditButton="true"
                            ShowInsertButton="true" />
                    </Fields>

                    <EmptyDataTemplate>
                        <table cellspacing="0" rules="rows" border="1" id="DetailsViewPictures" style="border-collapse: collapse;">
                            <tr>
                                <td>Picture ID:</td>
                                <td>
                                    <span id="DetailsViewPictures_lblDetailsViewPicId"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Building ID:</td>
                                <td>
                                    <span id="DetailsViewPictures_lblDetailsViewBuildId"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>RefLoc:</td>
                                <td>
                                    <span id="DetailsViewPictures_lblDetailsRefLoc"></span>
                                </td>
                            </tr>
                            <td colspan="2">
                                <asp:Button runat="server" ID="newPicture" Text="New" OnClick="NewPicture_Click" />
                            </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:DetailsView>

                <!-----------------PICTURE MAINTENANCE DATA---------------->
                <asp:SqlDataSource ID="SqlDataSourcePictureDetails" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [picId], [buildId], [refLoc] FROM [Pictures] WHERE ([picId] = @picId)"
                    DeleteCommand="DELETE FROM [Pictures] WHERE [picId] = @picId"
                    InsertCommand="INSERT INTO [Pictures] ([picId], [buildId], [refLoc]) VALUES (@picId, @buildId, @refLoc)"
                    UpdateCommand="UPDATE [Pictures] SET [buildId] = @buildId, [refLoc] = @refLoc WHERE [picId] = @picId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewPictures" Name="PicId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
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

                <p>
                    <asp:Label ID="lblError" runat="server" EnableViewState="false"></asp:Label>
                </p>
            </div id="BottomRowContainer" class="container">
        </div id="MainContainer" class="container">

    </form>
</body>
</html>
