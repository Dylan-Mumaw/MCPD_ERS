<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="App_Themes/RegistrationStyle.css"/>
    <title>User Registration</title>
</head>
<body>
    <form id="registrationForm" runat="server">
        <div id="registration" class="registrationDiv">
            <asp:Label ID="LabelFirstName" runat="server" Text="First Name:"></asp:Label>
            <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>

            <asp:Label ID="LabelLastName" runat="server" Text="Last Name:"></asp:Label>
            <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
            <asp:Label ID="LabelEmployeeLevel" runat="server" Text="Employee Level:"></asp:Label>
            <%--<asp:TextBox ID="TextBoxEmployeeLevel" runat="server"></asp:TextBox>--%>
            <asp:DropDownList ID="DropDownEmployeeLevel" runat="server">
                <asp:ListItem>Staff</asp:ListItem>
                <asp:ListItem>Officer</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>

            </asp:DropDownList>
            <asp:Label ID="LabelID" runat="server" Text="Employee/Badge ID#:"></asp:Label>
            <asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox>
            <asp:Label ID="LabelPhone" runat="server" Text="Phone Number:"></asp:Label>
            <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>

            <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>

            <asp:Label ID="LabelAddress" runat="server" Text="Address:"></asp:Label>
            <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>

            <asp:Label ID="LabelEmail" runat="server" Text="Email:"></asp:Label>
        </div>
    </form>
</body>
</html>
