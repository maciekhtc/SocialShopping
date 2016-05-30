<%@ Page Title="Strona Główna" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <%--<h1>Strona domowa.</h1>--%>
                <h2>Nigdy nie przejmuj się oddawaniem pieniędzy za wspólne zakupy!</h2>
            </hgroup>
            <p>
                Zarządzaj wspólnymi płatnościami z łatwością
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <ol class="round">
        <li class="one">
            <h5>Zarejestruj</h5>
            Stwórz swoje własne konto i rozliczaj się ze znajomymi już dziś!
        </li>
        <li class="two">
            <h5>Zaloguj</h5>
            Odwiedź serwis, aby wyświetlić zalegających z płatnościami znajomych lub swoje własne zobowiązania.
        </li>
        <li class="three">
            <h5>Dodaj</h5>
            Zgłoś wspólną zapłatę przy użyciu specjalnego formularza.
        </li>
        <li class="four">
            <h5>Rozlicz</h5>
            Odznacz dowolną osobę przy rachunku, gdy otrzymasz zapłatę.
        </li>
    </ol>
</asp:Content>