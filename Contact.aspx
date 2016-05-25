<%@ Page Title="Kontakt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Moja strona kontaktowa</h2>
    </hgroup>

    <section class="contact">
        <header>
            <h3>Telefon:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            <span>787995###</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Wsparcie:</span>
            <span><a href="mailto:bjfbjf@wp.pl">bjfbjf@wp.pl</a></span>
        </p>
        <p>
            <span class="label">Ogólny:</span>
            <span><a href="mailto:bjfbjf@wp.pl">bjfbjf@wp.pl</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Adres:</h3>
        </header>
        <p>
            Polska, Elbląg 82-300<br />
            ul. ########## ##/#
        </p>
    </section>
</asp:Content>