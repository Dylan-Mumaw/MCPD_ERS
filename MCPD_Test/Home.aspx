﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

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
            if (currWidth >= 2500)
            {
                document.getElementById("TestTextbox").value = "Width was outside 2500; Value was " + currWidth;
                return false;
            }
            else
            {
                myImg.style.width = (currWidth + 50) + "px";
                myImg.style.height = (currHeight + 50) + "px";
                document.getElementById("TestTextbox").value = "Width was within 2500; Value was " + currWidth;
            } 
        }
        function zoomout(){
            var myImg = document.getElementById("Image1");
            var currWidth = myImg.clientWidth;
            var currHeight = myImg.clientHeight;
            if (currWidth <= 100)
            {
                document.getElementById("TestTextbox").value = "Width was outside 100; Value was " + currWidth;
                return false;
            }
            else
            {
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
            <asp:Button ID="schoolButton" runat="server" Text="Schools" />
            <asp:Button ID="govButton" runat="server" Text="Government"  />
            <asp:Button ID ="medButton" runat ="server" Text="Medical Facilities" />
            <asp:Button ID ="bankButton" runat="server" Text="Banks" />
            <asp:Button ID="ButtonTest" runat="server" Text="Select All" OnClick="ButtonTest_Click" /><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [LOCATION]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="LOC_ID"  HeaderText="Id"/>
                    <asp:BoundField DataField="Name" HeaderText="Name"/>
                    <asp:BoundField DataField="Address" HeaderText="Address"/>
                    <asp:BoundField DataField="Alias" HeaderText="Alias"/>
                </Columns>
            </asp:GridView>
            <div ID="ImageZoom" style="width:817px;height:626px;overflow:scroll" class="dragscroll" >
                <asp:Image ID="Image1" runat="server" AlternateText="Test Image" style="width:800px;height:605px;" />
            </div>
            <input id="ZoomIn" type="button" value="Zoom In" onclick="zoomin()"/>
            <input id="ZoomOut" type="button" value="Zoom Out" onclick="zoomout()"/>
            <input id="TestTextbox" type="text" />
        </div>
        <!--<div id="divGallery" style="width: 400px">
            <asp:GridView ID="GridViewPictures" runat="server" DataSourceID="SqlDataSourcePictures" OnSelectedIndexChanged="GridViewPictures_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="LOC_ID">
                <Columns>
                    <asp:BoundField DataField="LOC_ID" HeaderText="LOC_ID" ReadOnly="True" SortExpression="LOC_ID" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="ALIAS" HeaderText="ALIAS" SortExpression="ALIAS" />
                </Columns>
            </asp:GridView>-->
            <asp:SqlDataSource ID="SqlDataSourcePictures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [LOCATION]"></asp:SqlDataSource>
        </div>
        <div id="divPicture">
            I need to CS to get the two divs to right left >.<
        </div>
    </form>
</body>
</html>