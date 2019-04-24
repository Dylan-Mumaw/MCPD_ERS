<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="App_Themes/HomeStyle.css" />
<%--    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />--%>
    <title>Login</title>
</head>
<body>

    <div id="FormContainer" class="formcontainer">
        <form id="form1" runat="server">

            <div id="LoginContainer" class="maincontainer">

                <div id="ImageItem" class="imageitem">
                    <asp:Image ID="logoImage" runat="server" ImageUrl="~/StylePhotos/FixedLogo.png" CssClass="background" />
                </div>

                <div class="usernameitem" id="UsernameItem">
                    <asp:Label ID="lblUserName" runat="server" CssClass="lblUserName" Visible="false" Text="label"></asp:Label>
                    <asp:Label ID="LabelUsername" runat="server" CssClass="label" Text="Username"></asp:Label><br />
                    <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="textbox"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="validateLogin"
                        runat="server" ControlToValidate="TextBoxUserName"
                        ErrorMessage="Required"
                        InitialValue="" CssClass="validatestyle"></asp:RequiredFieldValidator>
                </div>

                <div id="PasswordItem" class="passworditem">
                    <asp:Label ID="LabelPassword" runat="server" Text="Password" CssClass="label"></asp:Label><br />
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="validatePass"
                        runat="server" ControlToValidate="TextBoxPassword"
                        ErrorMessage="Required"
                        InitialValue="" CssClass="validatestyle"></asp:RequiredFieldValidator>
                </div>

                <div id="ButtonItem" class="buttonitem">
                    <asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="button" OnClick="ButtonLogin_Click" />
                    <asp:Button ID="ButtonCreate" runat="server" Text="Create Account" CssClass="button" CausesValidation="false" OnClick="ButtonCreate_Click" />
                    <asp:Button ID="ButtonDisplay" runat="server" Text="Go To Display Page" CssClass="button" OnClick="ButtonDisplay_Click" Visible="false" />
                    <asp:Button ID="ButtonMaintenance" runat="server" Text="Go To Maintenance" CausesValidation="false" PostBackUrl="~/Maintenance.aspx" CssClass="button" />
                    <asp:Button ID="ButtonLogout" runat="server" Text="Logout" CssClass="button" OnClick="ButtonLogout_Click" Visible="false" />
                </div>

                <div id="LabelItem" class="labelitem">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>

            </div>

        </form>
    </div>
</body>
</html>
