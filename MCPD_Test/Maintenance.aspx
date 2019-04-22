<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maintenance.aspx.cs" Inherits="Maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="App_Themes/MaintenanceStyle.css" />
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
                            <asp:GridView ID="GridViewBuildings" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceBuildings" AllowSorting="True" OnRowCreated="GridViewBuildings_RowCreated">
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
                        <asp:SqlDataSource ID="SqlDataSourceBuildings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="building"></asp:SqlDataSource>

                        <!-----------------BUILDING MAINTENANCE DETAILS LIST---------------->
                        <div id="DetailsViewBox">
                            <asp:DetailsView ID="DetailsViewBuildings" runat="server"
                                DataSourceID="SqlDataSourceBuildingsDetails" DataKeyNames="Id"
                                AutoGenerateRows="false"
                                OnItemDeleting="DetailsViewBuildings_ItemDeleting"
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
                        </div>
                    </div>
                </div>

                <!-----------------BUILDING MAINTENANCE DETAILS DATA SOURCE---------------->
                <div id="MaintenanceItem">
                    <header id="MaintenanceHeader">Types</header>
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

                            <!-----------------TYPE MAINTENANCE GRIDVIEW---------------->
                            <div id="GridViewTypesBox">
                                <asp:GridView ID="GridViewTypes" runat="server" AutoGenerateColumns="False" DataKeyNames="typeId" DataSourceID="SqlDataSourceTypes" AllowSorting="true" OnRowCreated="GridViewTypes_RowCreated">
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
                            </div>

                            <!-----------------TYPE MAINTENANCE DETAILS DATA---------------->
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

                <!-----------------BUILDING ARCHIVE MAINTENANCE GRIDVIEW---------------->
                <asp:GridView ID="GridViewBuildingsArchive" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceBuildingsArchive" AllowSorting="True" OnRowCreated="GridViewBuildingsArchive_RowCreated">
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
            <asp:SqlDataSource ID="SqlDataSourceBuildingsArchive" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Buildings_Archive]"></asp:SqlDataSource>

            <!-----------------BUILDING ARCHIVE MAINTENANCE DETAILS LIST---------------->
            <asp:DetailsView ID="DetailsViewBuildingsArchive" runat="server"
                DataSourceID="SqlDataSourceBuildingsArchiveDetails" DataKeyNames="Id"
                AutoGenerateRows="false"
                OnItemDeleted="DetailsViewBuildingsArchive_ItemDeleted">
                <Fields>
                    <asp:TemplateField HeaderText="Building ID:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewBuildingId" runat="server"
                                Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Building Name:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewBuildingName" runat="server"
                                Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Building Address:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewBuildingAddress" runat="server"
                                Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Building Type:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewBuildingType" runat="server"
                                Text='<%# Eval("Type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Building Alias:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewBuildingAlias" runat="server"
                                Text='<%# Eval("Alias") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button"
                        ShowDeleteButton="true"
                        ShowEditButton="false"
                        ShowInsertButton="false" />
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
                    </table>
                </EmptyDataTemplate>
            </asp:DetailsView>

            <!-----------------BUILDING ARCHIVE MAINTENANCE DETAILS DATA SOURCE---------------->
            <asp:SqlDataSource ID="SqlDataSourceBuildingsArchiveDetails" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [Id], [Name], [Address], [Type], [Alias] FROM [Buildings_Archive] WHERE ([Id] = @Id)"
                DeleteCommand="DELETE FROM [Buildings_Archive] WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewBuildingsArchive" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>


            <!-----------------LOGIN MAINTENANCE DATA---------------->
            <header>Accounts</header>
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

                <!-----------------LOGIN MAINTENANCE GRIDVIEW---------------->
                <div id="GridViewLoginBox">
                    <asp:GridView ID="GridViewLogin" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="LogId" DataSourceID="SqlDataSourceLogin" AllowSorting="true" OnRowCreated="GridViewLogin_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="Role" HeaderText="Level" SortExpression="Role" />
                            <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="true" ShowHeader="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <!-----------------LOGIN MAINTENANCE DETAILS LIST---------------->
                <asp:DetailsView ID="DetailsViewLogin" runat="server"
                    DataSourceID="SqlDataSourceLoginDetails" DataKeyNames="LogId"
                    AutoGenerateRows="false"
                    OnItemDeleting="DetailsViewLogin_ItemDeleting"
                    OnItemDeleted="DetailsViewLogin_ItemDeleted"
                    OnItemInserted="DetailsViewLogin_ItemInserted"
                    OnItemUpdated="DetailsViewLogin_ItemUpdated">
                    <Fields>
                        <asp:TemplateField HeaderText="User ID:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewUserId" runat="server"
                                    Text='<%# Eval("logId") %>'></asp:Label>
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

                        <asp:TemplateField HeaderText="Level:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewRole" runat="server"
                                    Text='<%# Eval("Role") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewRole" runat="server"
                                    Text='<%# Bind("Role") %>' Width="200px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewRole" runat="server"
                                    Text='<%# Bind("Role") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorRole" runat="server"
                                    ControlToValidate="txtDetailsViewRole"
                                    ErrorMessage="Role is a required field.">
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
                                    <span id="DetailsViewLogin_lblDetailsViewUserName"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td>
                                    <span id="DetailsViewLogin_lblDetailsViewPassword"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Level:</td>
                                <td>
                                    <span id="DetailsViewLogin_lblDetailsViewRole"></span>
                                </td>
                            </tr>
                            <td colspan="2">
                                <asp:Button runat="server" ID="newLogin" Text="New" OnClick="NewLogin_Click" />
                            </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:DetailsView>

                <!-----------------LOGIN MAINTENANCE DETAILS DATA---------------->

                <asp:SqlDataSource ID="SqlDataSourceLoginDetails" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [LogId], [Name], [UserName], [Password], [Role] FROM [Logins] WHERE ([LogId] = @LogId)"
                    DeleteCommand="DELETE FROM [Logins] WHERE [LogId] = @LogId"
                    InsertCommand="INSERT INTO [Logins] ([Name], [UserName], [Password], [Role]) VALUES (@Name, @UserName, @Password, @Role)"
                    UpdateCommand="UPDATE [Logins] SET [Name] = @Name, [UserName] = @UserName, [Password] = @Password, [Role] = @Role WHERE [LogId] = @LogId">
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
                        <asp:Parameter Name="Role" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Role" Type="String" />
                        <asp:Parameter Name="LogId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <!-----------------LOGIN ARCHIVE MAINTENANCE GRIDVIEW---------------->
            <div id="GridViewLoginArchiveBox">
                <header>Accounts Archive</header>
                <asp:GridView ID="GridViewLoginArchive" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="LogId" DataSourceID="SqlDataSourceLoginArchive" AllowSorting="true" OnRowCreated="GridViewLoginArchive_RowCreated">
                    <Columns>
                        <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        <asp:BoundField DataField="Role" HeaderText="Level" SortExpression="Role" />
                        <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="true" ShowHeader="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-----------------LOGIN ARCHIVE MAINTENANCE DATA---------------->
            <asp:SqlDataSource ID="SqlDataSourceLoginArchive" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Logins_Archive]"></asp:SqlDataSource>

            <!-----------------LOGIN ARCHIVE MAINTENANCE DETAILS LIST---------------->
            <asp:DetailsView ID="DetailsViewLoginArchive" runat="server"
                DataSourceID="SqlDataSourceLoginArchiveDetails" DataKeyNames="LogId"
                AutoGenerateRows="false"
                OnItemDeleted="DetailsViewLoginArchive_ItemDeleted">
                <Fields>
                    <asp:TemplateField HeaderText="User ID:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewUserId" runat="server"
                                Text='<%# Eval("logId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Full Name:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewFullName" runat="server"
                                Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Username:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewUserName" runat="server"
                                Text='<%# Eval("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Password:">
                        <ItemTemplate>
                            <asp:Label ID="lblDetailsViewPassword" runat="server"
                                Text='<%# Eval("Password") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button"
                        ShowDeleteButton="true"
                        ShowEditButton="false"
                        ShowInsertButton="false" />
                </Fields>

                <EmptyDataTemplate>
                    <table cellspacing="0" rules="rows" border="1" id="DetailsViewLoginArchive" style="border-collapse: collapse;">
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
                    </table>
                </EmptyDataTemplate>
            </asp:DetailsView>

            <!-----------------LOGIN ARCHIVE MAINTENANCE DETAILS DATA---------------->
            <asp:SqlDataSource ID="SqlDataSourceLoginArchiveDetails" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [LogId], [Name], [UserName], [Password] FROM [Logins_Archive] WHERE ([LogId] = @LogId)"
                DeleteCommand="DELETE FROM [Logins_Archive] WHERE [LogId] = @LogId">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewLoginArchive" Name="LogId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="LogId" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>

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
                    <asp:GridView ID="GridViewPictures" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="picId" DataSourceID="SqlDataSourcePictures" AllowSorting="true" OnRowCreated="GridViewPictures_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="picId" HeaderText="Pic ID" InsertVisible="False" ReadOnly="True" SortExpression="picId" />
                            <asp:BoundField DataField="buildId" HeaderText="Building ID" SortExpression="buildId" />
                            <asp:BoundField DataField="refLoc" HeaderText="RefLoc" SortExpression="refLoc" />
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
                    OnItemUpdating="DetailsViewPictures_ItemUpdating"
                    OnItemUpdated="DetailsViewPictures_ItemUpdated"
                    OnItemInserting="DetailsViewPictures_ItemInserting">
                    <Fields>
                        <asp:TemplateField HeaderText="Photo ID:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewPicId" runat="server"
                                    Text='<%# Eval("picId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblDetailsViewPicId" runat="server"
                                    Text='<%# Bind("picId") %>'></asp:Label>
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
                                <asp:FileUpload ID="UploadPicture" runat="server" accept="image/*" />
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorRefLoc" runat="server"
                                    ControlToValidate="UploadPicture"
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

                <!-----------------PICTURE MAINTENANCE DETAILS DATA---------------->
                <asp:SqlDataSource ID="SqlDataSourcePictureDetails" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [picId], [buildId], [refLoc] FROM [Pictures] WHERE ([picId] = @picId)"
                    DeleteCommand="DELETE FROM [Pictures] WHERE [picId] = @picId"
                    InsertCommand="INSERT INTO [Pictures] ([buildId], [refLoc]) VALUES (@buildId, @refLoc)"
                    UpdateCommand="UPDATE [Pictures] SET [buildId] = @buildId, [refLoc] = @refLoc WHERE [picId] = @picId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewPictures" Name="PicId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="picId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="buildId" Type="Int32" />

                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="buildId" Type="Int32" />
                        <asp:Parameter Name="picId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <p>
                    <asp:Label ID="lblError" runat="server" EnableViewState="false"></asp:Label>
                </p>
            </div>


            <!-----------------CONTACT MAINTENANCE DATA---------------->
            <header>Contacts</header>
            <div id="BottomRowContainer" class="container">
                <asp:SqlDataSource ID="SqlDataSourceContacts" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Contacts]"
                    DeleteCommand="DELETE FROM [Contacts] WHERE [ContactId] = @ContactId"
                    InsertCommand="INSERT INTO [Contacts] ([FullName], [ContactNumber], [Title], [buildID]) VALUES (@FullName, @ContactNumber, @Title, @buildID)"
                    UpdateCommand="UPDATE [Contacts] SET [FullName] = @FullName, [ContactNumber] = @ContactNumber [Title] = @Title, [buildID] = @buildID WHERE [ContactId] = @ContactId">
                    <DeleteParameters>
                        <asp:Parameter Name="ContactId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="ContactNumber" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="buildID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="ContactNumber" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="buildID" Type="Int32" />
                        <asp:Parameter Name="ContactId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <!-----------------CONTACT MAINTENANCE GRIDVIEW---------------->
                <div id="GridViewContactBox">
                    <asp:GridView ID="GridViewContacts" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="ContactId" DataSourceID="SqlDataSourceContacts" AllowSorting="true" OnRowCreated="GridViewContacts_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="ContactId" HeaderText="Contact ID" InsertVisible="False" ReadOnly="True" SortExpression="ContactId" />
                            <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                            <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" SortExpression="ContactNumber" />
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                            <asp:BoundField DataField="buildID" HeaderText="Building ID" SortExpression="buildID" />
                            <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="true" ShowHeader="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <!-----------------CONTACT MAINTENANCE DETAILSLIST---------------->
                <asp:DetailsView ID="DetailsViewContacts" runat="server"
                    DataSourceID="SqlDataSourceContactDetails" DataKeyNames="ContactId"
                    AutoGenerateRows="false"
                    OnItemDeleted="DetailsViewContacts_ItemDeleted"
                    OnItemInserted="DetailsViewContacts_ItemInserted"
                    OnItemUpdated="DetailsViewContacts_ItemUpdated">
                    <Fields>
                        <asp:TemplateField HeaderText="Contact ID:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewContactId" runat="server"
                                    Text='<%# Eval("ContactId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblDetailsViewContactId" runat="server"
                                    Text='<%# Eval("ContactId") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:Label ID="lblDetailsViewContactId" runat="server"
                                    Text='<%# GetNextId("Contacts") %>'></asp:Label>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Full Name:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewFullName" runat="server"
                                    Text='<%# Eval("FullName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewFullName" runat="server"
                                    Text='<%# Bind("FullName") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorFullName" runat="server"
                                    ControlToValidate="txtDetailsViewFullName"
                                    ErrorMessage="Name is a required field.">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewFullName" runat="server"
                                    Text='<%# Bind("FullName") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorFullName" runat="server"
                                    ControlToValidate="txtDetailsViewFullName"
                                    ErrorMessage="Name is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contact Number:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewContactNumber" runat="server"
                                    Text='<%# Eval("ContactNumber") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewContactNumber" runat="server"
                                    Text='<%# Bind("ContactNumber") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorContactNumber" runat="server"
                                    ControlToValidate="txtDetailsViewContactNumber"
                                    ErrorMessage="Username is a required field.">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewContactNumber" runat="server"
                                    Text='<%# Bind("ContactNumber") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorContactNumber" runat="server"
                                    ControlToValidate="txtDetailsViewContactNumber"
                                    ErrorMessage="ContactNumber is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Title:">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewTitle" runat="server"
                                    Text='<%# Eval("Title") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewTitle" runat="server"
                                    Text='<%# Bind("Title") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorTitle" runat="server"
                                    ControlToValidate="txtDetailsViewTitle"
                                    ErrorMessage="Title is a required field.">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewTitle" runat="server"
                                    Text='<%# Bind("Title") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorTitle" runat="server"
                                    ControlToValidate="txtDetailsViewTitle"
                                    ErrorMessage="Title is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Building ID::">
                            <ItemTemplate>
                                <asp:Label ID="lblDetailsViewbuildID" runat="server"
                                    Text='<%# Eval("buildID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetailsViewbuildID" runat="server"
                                    Text='<%# Bind("buildID") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorbuildID" runat="server"
                                    ControlToValidate="txtDetailsViewbuildID"
                                    ErrorMessage="buildID is a required field.">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDetailsViewbuildID" runat="server"
                                    Text='<%# Bind("buildID") %>' Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidatorbuildID" runat="server"
                                    ControlToValidate="txtDetailsViewbuildID"
                                    ErrorMessage="buildID is a required field.">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button"
                            ShowDeleteButton="true"
                            ShowEditButton="true"
                            ShowInsertButton="true" />
                    </Fields>

                    <EmptyDataTemplate>
                        <table cellspacing="0" rules="rows" border="1" id="DetailsViewContacts" style="border-collapse: collapse;">
                            <tr>
                                <td>Contact ID:</td>
                                <td>
                                    <span id="DetailsViewContacts_lblDetailsViewContactId"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Full Name:</td>
                                <td>
                                    <span id="DetailsViewContacts_lblDetailsViewFullName"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>ContactNumber:</td>
                                <td>
                                    <span id="DetailsViewContacts_lblDetailsViewContactNumber"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Title:</td>
                                <td>
                                    <span id="DetailsViewContacts_lblDetailsViewTitle"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Building ID:</td>
                                <td>
                                    <span id="DetailsViewContacts_lblDetailsViewBuildingID"></span>
                                </td>
                            </tr>
                            <td colspan="2">
                                <asp:Button runat="server" ID="newContact" Text="New" OnClick="NewContact_Click" />
                            </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:DetailsView>

                <!-----------------CONTACT MAINTENANCE DETAILS DATA---------------->
                <asp:SqlDataSource ID="SqlDataSourceContactDetails" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [ContactId], [FullName], [ContactNumber], [Title], [buildID] FROM [Contacts] WHERE ([ContactId] = @ContactId)"
                    DeleteCommand="DELETE FROM [Contacts] WHERE [ContactId] = @ContactId"
                    InsertCommand="INSERT INTO [Contacts] ([FullName], [ContactNumber], [Title], buildID) VALUES (@FullName, @ContactNumber, @Title, @buildID)"
                    UpdateCommand="UPDATE [Contacts] SET [FullName] = @FullName, [ContactNumber] = @ContactNumber, [Title] = @Title, [buildID] = @buildID WHERE [ContactId] = @ContactId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewContacts" Name="ContactId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="ContactId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="ContactNumber" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="buildID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="ContactNumber" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="buildID" Type="Int32" />
                        <asp:Parameter Name="ContactId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
