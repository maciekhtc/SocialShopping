<%@ Page Title="O Aplikacji" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Dodatkowe informacje.</h2>
    </hgroup>

    <article>
        <p>        
            Aplikacja internetowa SocialShopping to projekt zaliczeniowy przedmiotu Aplikacje Internetowe 2.
            Ideą aplikacji jest wspomaganie zakupów grupowych poprzez udostępnienie narzędzia do zarządzania wspólnymi płatnościami.
        </p>
    </article>

    <aside>
        <h3>Mapa serwisu:</h3>
        <ul>
            <li><a runat="server" href="~/">Strona Główna</a></li>
            <li><a runat="server" href="~/About">O Aplikacji</a></li>
            <li><a runat="server" href="~/Contact">Kontakt</a></li>
        </ul>
    </aside>
</asp:Content>