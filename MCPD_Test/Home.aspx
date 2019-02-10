<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Michigan City First Responders</title>
</head>
<body>
    <form id="searchForm" runat="server">
        <div style="width: 400px">
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
