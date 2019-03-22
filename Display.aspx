<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Display.aspx.cs" Inherits="Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="DisplayStyle.css" />
    <script type="text/javascript" src="https://cdn.rawgit.com/asvd/dragscroll/master/dragscroll.js"></script>
    <title>Michigan City First Responders</title>

    <script>
        function zoomin() {
            //var myImgQuery = document.querySelectorAll('.dragscroll > div > table > tbody > tr > td > img');
            //var myImg = myImgQuery[0];
            var myImg = document.getElementById("bigImage");
            var currWidth = myImg.clientWidth;
            var currHeight = myImg.clientHeight;
            if (currWidth >= 2500) {
                document.getElementById("TestTextbox").value = "Width was outside 2500; Value was " + currWidth;
                return false;
            }
            else {
                myImg.style.width = (currWidth + 50) + "px";
                myImg.style.height = (currHeight + 50) + "px";
                document.getElementById("TestTextbox").value = "Width was within 2500; Value was " + currWidth;
            }
        }
        function zoomout() {
            //var myImgQuery = document.querySelectorAll('.dragscroll > div > table > tbody > tr > td > img');
            //var myImg = myImgQuery[0];
            var myImg = document.getElementById("bigImage");
            var currWidth = myImg.clientWidth;
            var currHeight = myImg.clientHeight;
            if (currWidth <= 100) {
                document.getElementById("TestTextbox").value = "Width was outside 100; Value was " + currWidth;
                return false;
            }
            else {
                myImg.style.width = (currWidth - 50) + "px";
                myImg.style.height = (currHeight - 50) + "px";
                document.getElementById("TestTextbox").value = "Width was within 100; Value was " + currWidth;
            }
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
        <div style="" id="MainContainer" class="container">

            <div id="LeftContainer" class="item">
                <div id="ButtonContainer">
                    <asp:Button ID="schoolButton" runat="server" Text="Schools" OnClick="SchoolButton_Click" CssClass="button" UseSubmitBehavior="False" />
                    <asp:Button ID="govButton" runat="server" Text="Government" OnClick="GovButton_Click" CssClass="button" UseSubmitBehavior="False" />
                    <asp:Button ID="medButton" runat="server" Text="Medical" OnClick="MedButton_Click" CssClass="button" UseSubmitBehavior="False" />
                    <asp:Button ID="bankButton" runat="server" Text="Banks" OnClick="BankButton_Click" CssClass="button" UseSubmitBehavior="False" />
                    <asp:Button ID="privateButton" runat="server" Text="Private/Commercial" OnClick="PrivateButton_Click" CssClass="button" UseSubmitBehavior="False" />
                    <asp:Button ID="ButtonTest" runat="server" Text="Select All" OnClick="ButtonTest_Click" CssClass="button" UseSubmitBehavior="False" />
                </div>
                <asp:Button ID="searchButton" runat="server" Style="display: none;" />
                <br />
                <asp:Label ID="LabelSearch" runat="server" CssClass="label" Text="Search"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxSearch" CssClass="textbox" runat="server" Width="400px" OnTextChanged="TextBoxSearch_TextChanged"></asp:TextBox>&nbsp<br />
                <div id="GridViewListContainer">
                    <asp:GridView ID="GridViewList" CssClass="GridViewList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" OnSelectedIndexChanged="GridViewList_SelectedIndexChanged" OnPageIndexChanging="GridViewList_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true" SortExpression="Name" />
                            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="true" SortExpression="Address" />
                            <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="true" SortExpression="Type" />
                            <asp:BoundField DataField="Alias" HeaderText="Alias" ReadOnly="true" SortExpression="Alias" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [refLoc], [picId] FROM [Pictures] WHERE ([buildId] = @buildId)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewList" Name="buildId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <div id="GalleryContainer" class="gallery">
                <asp:GridView ID="GridViewGallery" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGallery" OnSelectedIndexChanged="GridViewGallery_SelectedIndexChanged" DataKeyNames="picId">
                    <Columns>
                        <asp:ImageField DataImageUrlField="refLoc" HeaderText="Image">
                        </asp:ImageField>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                    </div>
                </div>

                <%--
            <asp:SqlDataSource ID="SqlDataSourceBigPicture" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [refLoc] FROM [Pictures] WHERE ([picId] = @picId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewGallery" Name="picId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div id="bigImageZoom" runat="server" style="width:0px;height:0px;display:none;" class="dragscroll">
                <asp:GridView ID="GridViewBigPicture" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceBigPicture">
                        <Columns>
                            <asp:ImageField DataImageUrlField="refLoc" HeaderText="Image" ItemStyle-Width="500" >
                            </asp:ImageField>
                        </Columns>
                </asp:GridView>
            </div>
                --%>
            <div id="RightContainer" class="item">
                    <div id="BigImageContainer">
                <div id="bigImageZoom" runat="server" style="display: none;" class="dragscroll">
                    <asp:Image ID="bigImage" runat="server" Width="500px" ResizeMode="Fit" />
                </div>
                        </div>

                <div id="ZoomButtonContainer">
                <input id="ZoomIn" type="button" value="Zoom In" onclick="zoomin()" class="button" />
                <input id="ZoomOut" type="button" value="Zoom Out" onclick="zoomout()" class="button" />
                <input id="TestTextbox" class="textbox" type="text" runat="server" />
                    </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buildings]"></asp:SqlDataSource>
    </form>
</body>
</html>