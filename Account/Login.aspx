<%@ Page Title="Logowanie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Zaloguj się:</h1>
    </hgroup>
    
    <section id="loginForm">
            
        <p>
            <asp:Label ID="Label2" runat="server" Visible="false" Text="Nieprawidłowy Login lub Hasło!" ForeColor="Red"></asp:Label>
        </p>
        <p>
            Login:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Musisz podać Login!" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Hasło:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Musisz podać Hasło!" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Zaloguj" />
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT [id_user], [nickname] FROM [USERS] WHERE (([nickname] = @nickname) AND ([password] = @password))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="nickname" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="password" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" NavigateUrl="~/Account/Register.aspx">Zarejestruj</asp:HyperLink>
            się jeśli nie posiadasz konta.</p>
    </section>
    <section id="Section1">
        <img src="../reklama.png"/>
    </section>
</asp:Content>