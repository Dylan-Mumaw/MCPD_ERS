<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="App_Themes/RegistrationStyle.css" rel="stylesheet" type="text/css" />
    <title>User Registration</title>
</head>
<body>
    <form id="registrationForm" runat="server">
        <div id="registration" class="registrationDiv">
            <asp:Label ID="LabelFirstName" runat="server" Text="First Name:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validateFirst"
                runat="server" ControlToValidate="TextBoxFirstName"
                ErrorMessage="Required"
                InitialValue=""> 
            </asp:RequiredFieldValidator>

            <asp:Label ID="LabelLastName" runat="server" Text="Last Name:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBoxLastName" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validateLast"
                runat="server" ControlToValidate="TextBoxLastName"
                ErrorMessage="Required"
                InitialValue=""> 
            </asp:RequiredFieldValidator>

            <asp:Label ID="LabelEmployeeLevel" runat="server" Text="Employee Level:" CssClass="label"></asp:Label>
            <asp:RadioButtonList ID="RadioEmployeeLevel" runat="server">
                <asp:ListItem>Staff</asp:ListItem>
                <asp:ListItem>Officer</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:RadioButtonList>
           
            <asp:RequiredFieldValidator ID="validateLevel"
                runat="server" ControlToValidate="RadioEmployeeLevel"
                ErrorMessage="Required"
                InitialValue=""> 
            </asp:RequiredFieldValidator>

            <asp:Label ID="LabelID" runat="server" Text="Employee/Badge ID#:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBoxID" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validateID"
                runat="server" ControlToValidate="TextBoxID"
                ErrorMessage="Required"
                InitialValue=""> 
            </asp:RequiredFieldValidator>

            <asp:Label ID="LabelPhone" runat="server" Text="Phone Number:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="textbox" Text="(___) ___-____"></asp:TextBox>

            <asp:Label ID="LabelAddress" runat="server" Text="Address:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validateAddress"
                runat="server" ControlToValidate="TextBoxAddress"
                ErrorMessage="Required"
                InitialValue=""> 
            </asp:RequiredFieldValidator>


            <asp:Label ID="LabelEmail" runat="server" Text="Email:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validateEmail"
                runat="server" ControlToValidate="TextBoxEmail"
                ErrorMessage="Required"
                InitialValue=""> 
            </asp:RequiredFieldValidator>

            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="button" OnClick="ButtonSubmit_Click" />

            <asp:Label ID="TestLabel" runat="server" Text="" />
        </div>
    </form>
</body>
</html>
