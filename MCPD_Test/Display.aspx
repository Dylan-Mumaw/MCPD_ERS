<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Display.aspx.cs" Inherits="Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="App_Themes/DisplayStyle.css" />
    <%--<link rel="stylesheet" href="App_Themes/FontStyles.css" />--%>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />

    <%--Search Auto-Suggest and Style--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="DisplayPageFunctions.js"></script>

    <title>Michigan City First Responders</title>
</head>
<body>
    <form id="searchForm" runat="server">

        <asp:ScriptManager ID="smPageMethods" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div style="" id="MainContainer" class="container">

            <!-----------------BUILDING SEARCH AND GRIDVIEW---------------->
            <div id="LeftContainer" class="item leftContainer">
                <asp:Panel ID="ButtonContainer" runat="server" CssClass="buttonContainer"></asp:Panel>
                <asp:Button ID="searchButton" runat="server" Style="display: none;" OnClick="SearchButton_Click" />
                <div id="ButtonContainer_Bottom" class="buttonContainerBelow">
                    <asp:Button ID="ButtonHome" runat="server" Text="Home Page"
                        CausesValidation="false" OnClick="ButtonHome_Click" CssClass="button" />
                </div>
                <div id="LabelSearchItem" class="labelSearchItem">
                    <%-- <asp:Label ID="LabelSearch" runat="server" CssClass="label" Text="Search"></asp:Label>--%>
                    <asp:TextBox ID="TextBoxSearch" CssClass="textbox" runat="server" Placeholder="Search"></asp:TextBox>&nbsp<br />
                </div>

                <div id="GridViewBuildingListContainer" class="bordercontainer">
                    <asp:GridView ID="GridViewBuildingList" CssClass="blueTable" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" OnSelectedIndexChanged="GridViewBuildingList_SelectedIndexChanged" OnPageIndexChanging="GridViewBuildingList_PageIndexChanging" OnRowDataBound="GridViewBuildingList_RowDataBound" BorderStyle="NotSet" GridLines="Both">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true" SortExpression="Name" />
                            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="true" SortExpression="Address" />
                            <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="true" SortExpression="Type" />
                            <asp:BoundField DataField="Alias" HeaderText="Alias" ReadOnly="true" SortExpression="Alias" />
                            <asp:CommandField ShowSelectButton="true" ItemStyle-CssClass="hiddencolumn" HeaderStyle-CssClass="hiddencolumn" />
                        </Columns>
                        <PagerStyle HorizontalAlign="center" CssClass="pagination-ys" />
                    </asp:GridView>
                    <asp:Label ID="lblNoResults" runat="server" Text="No results." Visible="false"></asp:Label>
                </div>

                <!-----------------CONTACT INFO---------------->
                <div id="currentPicture" class="currentPicItem bordercontainer">
                    <asp:GridView ID="GridViewCurrentContact" DataKeyNames="ContactId" CssClass="blueTable" runat="server" AutoGenerateColumns="false" OnRowCreated="GridViewCurrentContact_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Building" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />

                            <asp:TemplateField HeaderText="Contact Name">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlContactName" runat="server"
                                        DataTextField="FullName" DataValueField="ContactId" AutoPostBack="true" Width="130px">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblContactNumber" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="lblContactTitle" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <!-----------------BUILDING PHOTO GALLERY---------------->
                <div id="GalleryContainer" runat="server" class="gallery bordercontainer">
                   
                </div>
            </div>

            <!-----------------SELECTED IMAGE---------------->
            <div id="RightContainer" class="item rightContainer">
                
                    <div id="BigImageContainer" class="bigImageContainer">
                        <div id="bigImageZoom" runat="server" style="display: none;" class="dragscroll">
                            <asp:Image ID="bigImage" CssClass="grabbable" runat="server" Width="500px" ResizeMode="Fit" />
                        </div>
                    </div>
                    <div id="ZoomButtonContainer" class="zoomButtonContainer">
                        <input id="ZoomIn" type="button" value="Zoom In" onclick="zoomin()" class="button zoomButton" />
                        <input id="ZoomOut" type="button" value="Zoom Out" onclick="zoomout()" class="button zoomButton" />
                    </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSourceContactDdl" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FullName FROM Contacts"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buildings]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>