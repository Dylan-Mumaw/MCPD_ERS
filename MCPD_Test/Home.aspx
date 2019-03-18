<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="HomeStyle.css" />
    <script type="text/javascript" src="https://cdn.rawgit.com/asvd/dragscroll/master/dragscroll.js"></script>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">      
        <div id="LoginDiv" class="div">        
            <asp:Image ID="logoImage" runat="server" ImageUrl="~/StylePhotos/black logo png.png" CssClass="background" />
            <br />
            <asp:Label ID="LabelUsername" runat="server" Text="Username" CssClass="label"></asp:Label><br />
            <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="textbox" Width="421px"></asp:TextBox><br />
            <br />
            <asp:Label ID="LabelPassword" runat="server" Text="Password" CssClass="label"></asp:Label><br />
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="textbox" Width="421px"></asp:TextBox><br />
            <br />
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="button" />
            <asp:SqlDataSource ID="SqlDataSourceLogin" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName] FROM [Logins] WHERE (([UserName] = @UserName) AND ([Password] = @Password))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxUsername" Name="UserName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxPassword" Name="Password" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
