﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Display.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="https://cdn.rawgit.com/asvd/dragscroll/master/dragscroll.js"></script>
    <title>Michigan City First Responders</title>

    <script>
        function zoomin() {
            var myImg = document.getElementById("Image1");
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
        function zoomout(){
            var myImg = document.getElementById("Image1");
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
            <asp:Button ID="schoolButton" runat="server" Text="Schools" OnClick="schoolButton_Click" />
            <asp:Button ID="govButton" runat="server" Text="Government" OnClick="govButton_Click" />
            <asp:Button ID ="medButton" runat ="server" Text="Medical Facilities" OnClick="medButton_Click" />
            <asp:Button ID ="bankButton" runat="server" Text="Banks" OnClick="bankButton_Click"/>
            <asp:Button ID="ButtonTest" runat="server" Text="Select All" OnClick="ButtonTest_Click" />
            <br />
            <asp:Label ID="LabelSearch" runat="server" Text="Search"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxSearch" runat="server" Width="400px" OnTextChanged="TextBoxSearch_TextChanged" ></asp:TextBox>&nbsp<br />
            <asp:GridView ID="GridViewList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [refLoc] FROM [Pictures] WHERE ([buildId] = @buildId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewList" Name="buildId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewGallery" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGallery">
                <Columns>
                    <asp:BoundField DataField="refLoc" HeaderText="refLoc" SortExpression="refLoc" />
                </Columns>
            </asp:GridView>
            <div id="imageZoom" style="width:817px;height:626px;overflow:scroll" class="dragscroll" >
                <asp:Image ID="Image1" runat="server" AlternateText="Test Image" style="width:800px;height:605px;" />
            </div>
            <input id="ZoomIn" type="button" value="Zoom In" onclick="zoomin()"/>
            <input id="ZoomOut" type="button" value="Zoom Out" onclick="zoomout()"/>
            <input id="TestTextbox" type="text" />
        </div>
        <!--<div id="divGallery" style="width: 400px">
            <asp:GridView ID="GridViewPictures" runat="server" DataSourceID="SqlDataSourcePictures" OnSelectedIndexChanged="GridViewPictures_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="ALIAS" HeaderText="ALIAS" SortExpression="ALIAS" />
                </Columns>
            </asp:GridView>-->
            <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buildings]"></asp:SqlDataSource>
        </div>
        <div id="divPicture">
            I need to CS to get the two divs to right left >.<
        </div>
    </form>
</body>
</html>