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
            <div class="item">
                <asp:Label ID="LabelFirstName" runat="server" Text="First Name:" CssClass="label"></asp:Label>
                <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validateFirst"
                    runat="server" ControlToValidate="TextBoxFirstName"
                    ErrorMessage="Required"
                    InitialValue=""> 
                </asp:RequiredFieldValidator>
            </div>

            <div class="item">
                <asp:Label ID="LabelLastName" runat="server" Text="Last Name:" CssClass="label"></asp:Label>
                <asp:TextBox ID="TextBoxLastName" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validateLast"
                    runat="server" ControlToValidate="TextBoxLastName"
                    ErrorMessage="Required"
                    InitialValue=""> 
                </asp:RequiredFieldValidator>
            </div>

            <div class="item">
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
            </div>

            <div class="item">
                <asp:Label ID="LabelID" runat="server" Text="Employee/Badge ID#:" CssClass="label"></asp:Label>
                <asp:TextBox ID="TextBoxID" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validateID"
                    runat="server" ControlToValidate="TextBoxID"
                    ErrorMessage="Required"
                    InitialValue=""> 
                </asp:RequiredFieldValidator>
            </div>

            <div class="item">
                <asp:Label ID="LabelPhone" runat="server" Text="Phone Number:" CssClass="label"></asp:Label>
                <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="textbox" placeholder="(___) ___-____"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validatePhone"
                    runat="server" ControlToValidate="TextBoxPhone"
                    ErrorMessage="Required"
                    InitialValue=""> 
                </asp:RequiredFieldValidator>
            </div>

            <div class="item">
                <asp:Label ID="LabelCity" runat="server" Text="City: " CssClass="label"></asp:Label>
                <asp:TextBox ID="TextBoxCity" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="City"
                    runat="server" ControlToValidate="TextBoxAddress"
                    ErrorMessage="Required"
                    InitialValue=""> 
                </asp:RequiredFieldValidator>
            </div>

            <div class="item">
                <asp:Label ID="stateLabel" runat="server" Text="State:" CssClass="label"></asp:Label>
                <asp:DropDownList ID="DropDownListState" runat="server">
                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                    <asp:ListItem Value="CA">California</asp:ListItem>
                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                    <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
                    <asp:ListItem Value="FL">Florida</asp:ListItem>
                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                    <asp:ListItem Value="ME">Maine</asp:ListItem>
                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
                    <asp:ListItem Value="MT">Montana</asp:ListItem>
                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                    <asp:ListItem Value="NY">New York</asp:ListItem>
                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                    <asp:ListItem Value="UT">Utah</asp:ListItem>
                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
                    <asp:ListItem Value="WA">Washington</asp:ListItem>
                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="item">
                <asp:Label ID="LabelAddress" runat="server" Text="Address:" CssClass="label"></asp:Label>
                <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validateAddress"
                    runat="server" ControlToValidate="TextBoxAddress"
                    ErrorMessage="Required"
                    InitialValue=""> 
                </asp:RequiredFieldValidator>
            </div>

            <div class="item">
                <asp:Label ID="LabelZIP" runat="server" Text="ZIP: " CssClass="label"></asp:Label>
                <asp:TextBox ID="TextBoxZIP" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validateZIP"
                    runat="server" ControlToValidate="TextBoxZIP"
                    ErrorMessage="Required"
                    InitialValue=""> 
                </asp:RequiredFieldValidator>
            </div>

            <div class="item">
                <asp:Label ID="LabelEmail" runat="server" Text="Email:" CssClass="label"></asp:Label>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validateEmail"
                    runat="server" ControlToValidate="TextBoxEmail"
                    ErrorMessage="Required"
                    InitialValue=""> 
                </asp:RequiredFieldValidator>
            </div>

            <div class="bottomitem">
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="button" OnClick="ButtonSubmit_Click" />
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" CssClass="button" OnClick="ButtonCancel_Click" CausesValidation="false" />
            </div>

            <asp:Label ID="TestLabel" runat="server" Text="" />
        </div>
    </form>
</body>
</html>
