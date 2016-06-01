<%@ Page Title="Zmiana Hasła" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyCOntent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1>Edycja hasła:</h1>
    </hgroup>
    
    <section id="loginForm"> 
    <p>
        <asp:Label ID="passwordNotValid" runat="server" Visible="false" Text="Hasło nieprawidłowe!" ForeColor="Red"></asp:Label>
    </p> 
    <p>
        Obecne Hasło: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="password0TextBox" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Musisz podac Hasło!" ControlToValidate="password0TextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </p>
    <p>
        Nowe Hasło: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="password1TextBox" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Musisz podac nowe Hasło!" ControlToValidate="password1TextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="password1TextBox" Display="Dynamic" ErrorMessage="Hasło musi się składać z conajmniej 8 znaków i musi rozpoczynać się wielką literą!" ForeColor="Red" ValidationExpression="[A-Z]([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])+"></asp:RegularExpressionValidator>
    </p>
    <p>
        Powtórz Hasło: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="password2TextBox" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Musisz Powtórzyć Hasło!" ControlToValidate="password2TextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password1TextBox" ControlToValidate="password2TextBox" ErrorMessage="Powtórzone Hasło musi być zgodne z pierwotnym!" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Anuluj" OnClick="Button2_Click" CausesValidation="false" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT [password] FROM [USERS] WHERE (([id_user] = @id_user) AND ([password] = @password))" UpdateCommand="UPDATE USERS SET password = @password WHERE (id_user = @id_user)">
            <SelectParameters>
                <asp:SessionParameter Name="id_user" SessionField="User_Id" Type="Int64" />
                <asp:ControlParameter ControlID="password0TextBox" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="password1TextBox" Name="password" PropertyName="Text" />
                <asp:SessionParameter Name="id_user" SessionField="User_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    </section>
    <section id="Section1">
        <img src="../reklama.png"/>
    </section>
</asp:Content>

