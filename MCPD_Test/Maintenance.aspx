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
                    <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="True" ShowHeader="True" />
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

            <asp:DetailsView ID="DetailsViewBuildings" runat="server"
                DataSourceID="SqlDataSourceBuildingsDetails" DataKeyNames="Id"
                AutoGenerateRows="false"
                OnItemDeleted="DetailsViewBuildings_ItemDeleted"
                OnItemInserted="DetailsViewBuildings_ItemInserted"
                OnItemUpdated="DetailsViewBuildings_ItemUpdated"
                >
                <Fields>
                    <asp:TemplateField HeaderText="Building ID:" >
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
                        <table cellspacing="0" rules="rows" border="1" id="DetailsViewBuildings" style="border-collapse:collapse;" >
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
                                    <asp:Button runat="server" ID="newBuilding" Text="New" OnClick="newBuilding_Click" />
                                </td>
                            </tr>
                        </table>
                </EmptyDataTemplate>
            </asp:DetailsView>
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

            <asp:SqlDataSource ID="SqlDataSourceTypesDdl" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT type FROM types">
            </asp:SqlDataSource>

            <asp:GridView ID="GridViewTypes" runat="server" AutoGenerateColumns="False" DataKeyNames="typeId" DataSourceID="SqlDataSourceTypes">
                <Columns>
                    <asp:BoundField DataField="typeId" HeaderText="Type ID" InsertVisible="False" ReadOnly="True" SortExpression="typeId" />
                    <asp:BoundField DataField="type" HeaderText="Type" SortExpression="Type" />
                    <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>

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

            <asp:DetailsView ID="DetailsViewTypes" runat="server"
                DataSourceID="SqlDataSourceTypesDetails" DataKeyNames="typeId"
                AutoGenerateRows="false"
                OnItemDeleted="DetailsViewTypes_ItemDeleted"
                OnItemInserted="DetailsViewTypes_ItemInserted"
                OnItemUpdated="DetailsViewTypes_ItemUpdated"
                >
                <Fields>
                    <asp:TemplateField HeaderText="Type ID:" >
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
                    <table cellspacing="0" rules="rows" border="1" id="DetailsViewTypes" style="border-collapse:collapse;">
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
                                <asp:Button runat="server" ID="newBuilding" Text="New" OnClick="newType_Click" />
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:DetailsView>

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
            <p>
                <asp:Label ID="lblError" runat="server" EnableViewState="false"></asp:Label>
            </p>
        </div>
    </form>
</body>
</html>
