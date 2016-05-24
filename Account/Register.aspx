<%@ Page Title="Rejestracja" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Rejestracja</h1>
        <h2>Wypełnij poniższy formularz:</h2>
    </hgroup>
    <section id="loginForm"> 
    <p>
        <asp:Label ID="loginNotValid" runat="server" Visible="false" Text="Login jest już zajęty!" ForeColor="Red"></asp:Label>
    </p>
    <p>
        Login: <br />
        <asp:TextBox ID="loginTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Musisz podac Login!" ControlToValidate="loginTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </p>
    <p>
        Hasło: <br />
        <asp:TextBox ID="password1TextBox" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Musisz podac Hasło!" ControlToValidate="password1TextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="password1TextBox" Display="Dynamic" ErrorMessage="Hasło musi się składać z conajmniej 8 znaków i musi rozpoczynać się wielką literą!" ForeColor="Red" ValidationExpression="[A-Z]([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])([A-z]|[0-9])+"></asp:RegularExpressionValidator>
    </p>
    <p>
        Powtórz Hasło: <br />
        <asp:TextBox ID="password2TextBox" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Musisz Powtórzyć Hasło!" ControlToValidate="password2TextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password1TextBox" ControlToValidate="password2TextBox" ErrorMessage="Powtórzone Hasło musi być zgodne z pierwotnym!" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
    </p>
    <p>
        Imię: <br />
        <asp:TextBox ID="imieTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Musisz podac Imię!" ControlToValidate="imieTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </p>
    <p>
        Nazwisko: <br />
        <asp:TextBox ID="nazwiskoTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Musisz podac Nazwisko!" ControlToValidate="nazwiskoTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </p>
    <p>
        Adres e-mail: <br />
        <asp:TextBox ID="emailTextBox" runat="server" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Musisz podac Adres e-mail!" ControlToValidate="emailTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ControlToValidate="emailTextBox" ErrorMessage="Podany e-mail nie jest prawidłowy!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Zarejestruj" OnClick="Button1_Click" />
    </p>
    <p>
        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" NavigateUrl="~/Account/Login.aspx">Zaloguj</asp:HyperLink>
        się jeśli posiadasz już konto.
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT [nickname] FROM [USERS] WHERE ([nickname] = @nickname)" InsertCommand="INSERT INTO USERS(nickname, password, first_name, last_name, email) VALUES (@nickname, @password, @first_name, @last_name, @email)">
        <InsertParameters>
            <asp:ControlParameter ControlID="loginTextBox" Name="nickname" PropertyName="Text" />
            <asp:ControlParameter ControlID="password1TextBox" Name="password" PropertyName="Text" />
            <asp:ControlParameter ControlID="imieTextBox" Name="first_name" PropertyName="Text" />
            <asp:ControlParameter ControlID="nazwiskoTextBox" Name="last_name" PropertyName="Text" />
            <asp:ControlParameter ControlID="emailTextBox" Name="email" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="loginTextBox" Name="nickname" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </section>
    <section id="Section1">
        cos bedzie
    </section>
</asp:Content>