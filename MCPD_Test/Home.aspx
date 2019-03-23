<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="App_Themes/HomeStyle.css" />
    <script type="text/javascript" src="https://cdn.rawgit.com/asvd/dragscroll/master/dragscroll.js"></script>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">      
        <div id="LoginDiv" class="div">        
            <asp:Image ID="logoImage" runat="server" ImageUrl="~/StylePhotos/black logo png.png" CssClass="background" />
            <br />
            <asp:Label ID="LabelUsername" runat="server" Text="Username" CssClass="label"></asp:Label><br />
            <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="textbox" Width="300px"></asp:TextBox><br />
            <br />
            <asp:Label ID="LabelPassword" runat="server" Text="Password" CssClass="label"></asp:Label><br />
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="textbox" Width="300px"></asp:TextBox><br />
            <br />
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="button" OnClick="ButtonLogin_Click" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>