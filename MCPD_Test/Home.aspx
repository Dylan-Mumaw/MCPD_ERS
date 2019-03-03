<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="https://cdn.rawgit.com/asvd/dragscroll/master/dragscroll.js"></script>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LabelUsername" runat="server" Text="Username"></asp:Label><br />
            <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox><br /><br />
            <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label><br />
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox><br /><br />
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" />
            <asp:SqlDataSource ID="SqlDataSourceLogin" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName] FROM [Logins] WHERE (([UserName] = @UserName) AND ([Password] = @Password))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxUsername" Name="UserName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxPassword" Name="Password" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ListBox ID="ListBoxTest" runat="server" DataSourceID="SqlDataSourceLogin" DataTextField="UserName" DataValueField="UserName"></asp:ListBox>
        </div>
    </form>
</body>
</html>