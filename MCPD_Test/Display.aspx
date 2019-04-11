<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Display.aspx.cs" Inherits="Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="App_Themes/DisplayStyle.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="dragscroll.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>Michigan City First Responders</title>

    <!-----------------ZOOM JAVASCRIPT FUNCTION---------------->
    <script type="text/javascript">
        window.onload = function () {
            PageMethods.GetPossibleResults(onSuccess, onFailure);
        }

        function zoomin() {
            var myImg = document.getElementById("bigImage");
            var currWidth = myImg.clientWidth;
            var currHeight = myImg.clientHeight;

            if (currWidth >= 2500) {
                document.getElementById("TestTextbox").value = "Width was outside 2500; Value was " + currWidth;
                return false;
            }
            else {
                myImg.style.width = (currWidth + 50) + "px";
                document.getElementById("TestTextbox").value = "Width was within 2500; Value was " + currWidth;
            }
        }
        function zoomout() {
            var myImg = document.getElementById("bigImage");

            var currWidth = myImg.clientWidth;
            var currHeight = myImg.clientHeight;
            if (currWidth <= 100) {
                document.getElementById("TestTextbox").value = "Width was outside 100; Value was " + currWidth;
                return false;
            }
            else {
                myImg.style.width = (currWidth - 50) + "px";
                document.getElementById("TestTextbox").value = "Width was within 100; Value was " + currWidth;
            }
        }

        //<!-----------------ZOOM JAVASCRIPT FUNCTION---------------->
        function GetPossibleResultsClient(test) {
            $("#TextBoxSearch").autocomplete({
                source: possibleResults
            });
        }

        function onSuccess(result) {
            $("#TextBoxSearch").autocomplete({
                source: result
            });
        }

        function onFailure(error) {
            alert(error);
        }

    </script>

    <script runat="server">
        void test()
        {
            TestTextbox.Value = "Tested";
        }
    </script>

    <style type="text/css">
        #TestTextbox {
            width: 236px;
        }
    </style>
</head>
<body>
    <form id="searchForm" runat="server">
        <asp:ScriptManager ID="smPageMethods" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div style="" id="MainContainer" class="container">

            <!-----------------BUILDING SEARCH AND GRIDVIEW---------------->
            <div id="LeftContainer" class="item leftContainer">
                <asp:Panel ID="ButtonContainer" runat="server" CssClass="buttonContainer"></asp:Panel>
                <asp:Button ID="searchButton" runat="server" Style="display: none;" />
                <asp:Button ID="ButtonMaintenance" runat="server" Text="Go To Maintenance"
                    CausesValidation="false" UseSubmitBehavior="false" PostBackUrl="~/Maintenance.aspx" CssClass="button" />
                <div id="LabelSearchItem" class="labelSearchItem">
                    <asp:Label ID="LabelSearch" runat="server" CssClass="label" Text="Search"></asp:Label>

                </div>

                <asp:TextBox ID="TextBoxSearch" CssClass="textbox" runat="server" Width="400px" OnTextChanged="TextBoxSearch_TextChanged"></asp:TextBox>&nbsp<br />
                <div id="GridViewBuildingListContainer">
                    <asp:GridView ID="GridViewBuildingList" CssClass="blueTable" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" OnSelectedIndexChanged="GridViewBuildingList_SelectedIndexChanged" OnPageIndexChanging="GridViewBuildingList_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true" SortExpression="Name" />
                            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="true" SortExpression="Address" />
                            <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="true" SortExpression="Type" />
                            <asp:BoundField DataField="Alias" HeaderText="Alias" ReadOnly="true" SortExpression="Alias" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <!-----------------BUILDING PHOTO GALLERY---------------->
                <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [refLoc], [picId] FROM [Pictures] WHERE ([buildId] = @buildId)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewBuildingList" Name="buildId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <div id="GalleryContainer" class="gallery">
                    <asp:GridView ID="GridViewGallery" runat="server" CssClass="blueTable" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGallery" OnSelectedIndexChanged="GridViewGallery_SelectedIndexChanged" DataKeyNames="picId">
                        <Columns>
                            <asp:ImageField DataImageUrlField="refLoc" HeaderText="Image">
                            </asp:ImageField>
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-----------------CONTACT INFO---------------->
            <div id="RightContainer" class="item rightContainer">
                <div id="currentPicture">
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

                <!-----------------SELECTED IMAGE---------------->
                <div id="BigImageContainer">
                    <div id="bigImageZoom" runat="server" style="display: none;" class="dragscroll">
                        <asp:Image ID="bigImage" CssClass="grabbable" runat="server" Width="500px" ResizeMode="Fit" />
                    </div>
                </div>
                <div id="ZoomButtonContainer">
                    <input id="ZoomIn" type="button" value="Zoom In" onclick="zoomin()" class="button" />
                    <input id="ZoomOut" type="button" value="Zoom Out" onclick="zoomout()" class="button" />
                    <input id="TestTextbox" class="textbox" type="text" runat="server" />
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSourceContactDdl" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FullName FROM Contacts"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buildings]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
