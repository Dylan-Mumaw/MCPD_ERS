<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Display.aspx.cs" Inherits="Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="DisplayStyle.css" />
    <script type="text/javascript" src="https://cdn.rawgit.com/asvd/dragscroll/master/dragscroll.js"></script>
    <title>Michigan City First Responders</title>

    <script>
        function zoomin() {

            var myImgQuery = document.querySelectorAll('.dragscroll > div > table > tbody > tr > td > img');
            var myImg = myImgQuery[0];

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

            var myImgQuery = document.querySelectorAll('.dragscroll > div > table > tbody > tr > td > img');
            var myImg = myImgQuery[0];

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
        <div style="width: 500px">
            <asp:Button ID="schoolButton" runat="server" Text="Schools" OnClick="SchoolButton_Click" />
            <asp:Button ID="govButton" runat="server" Text="Government" OnClick="GovButton_Click" />
            <asp:Button ID="medButton" runat="server" Text="Medical" OnClick="MedButton_Click" />
            <asp:Button ID="bankButton" runat="server" Text="Banks" OnClick="BankButton_Click" />
            <asp:Button ID="privateButton" runat="server" Text="Private/Commercial" OnClick="PrivateButton_Click" />
            <asp:Button ID="ButtonTest" runat="server" Text="Select All" OnClick="ButtonTest_Click" />
            <br />
            <asp:Label ID="LabelSearch" runat="server" Text="Search"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxSearch" runat="server" Width="400px" OnTextChanged="TextBoxSearch_TextChanged"></asp:TextBox>&nbsp<br />
            <asp:GridView ID="GridViewList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" OnSelectedIndexChanged="GridViewList_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [refLoc], [picId] FROM [Pictures] WHERE ([buildId] = @buildId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewList" Name="buildId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewGallery" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGallery" OnSelectedIndexChanged="GridViewGallery_SelectedIndexChanged" DataKeyNames="picId">
                <Columns>
                    <asp:ImageField DataImageUrlField="refLoc" HeaderText="Image">
                    </asp:ImageField>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceBigPicture" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [refLoc] FROM [Pictures] WHERE ([picId] = @picId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewGallery" Name="picId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div id="bigImageZoom" style="width: 817px; height: 626px; overflow: scroll" class="dragscroll">
                <asp:GridView ID="GridViewBigPicture" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceBigPicture">
                        <Columns>
                            <asp:ImageField DataImageUrlField="refLoc" HeaderText="Image">

                            </asp:ImageField>
                        </Columns>
                </asp:GridView>
            </div>

           
            <input id="ZoomIn" type="button" value="Zoom In" onclick="zoomin()" />
            <input id="ZoomOut" type="button" value="Zoom Out" onclick="zoomout()" />
            <input id="TestTextbox" type="text" />
        </div>
        <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buildings]"></asp:SqlDataSource>
        <div id="divPicture">
            I need to CS to get the two divs to right left >.<
        </div>
    </form>
</body>
</html>