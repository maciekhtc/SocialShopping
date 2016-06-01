<%@ Page Title="Informacje o użytkowniku" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyCOntent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1><%: Title %>:</h1>
        <h2><asp:Label ID="nickLabel" runat="server" Text=""></asp:Label></h2>
    </hgroup>
    <section id="loginForm">
    <p>
        Imię: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="imieLabel" runat="server" Text=""></asp:Label>
    </p>
    <p>
        Nazwisko: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="nazwiskoLabel" runat="server" Text=""></asp:Label>
    </p>
    <p>
        Data rejestracji: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="joinDateLabel" runat="server" Text=""></asp:Label>
    </p>
    <p>
        Adres e-mail: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="emailHyperlink" runat="server"><asp:Label ID="emailLabel" runat="server" Text=""></asp:Label></asp:HyperLink>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT [nickname], [first_name], [last_name], [join_timestamp], [email] FROM [USERS] WHERE ([nickname] = @nickname)">
        <SelectParameters>
            <asp:QueryStringParameter Name="nickname" QueryStringField="nickname" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </section>
    <section id="Section1">
        <img src="reklama.png"/>
    </section>
</asp:Content>

