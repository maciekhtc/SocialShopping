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
    <section id="loginForm"> 
    <ol class="round">
        <li class="one">
            <h5><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/Register.aspx">Zarejestruj</asp:HyperLink></h5>
            Stwórz swoje własne konto i rozliczaj się ze znajomymi już dziś!
        </li>
        <li class="two">
            <h5><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Account/Login.aspx">Zaloguj</asp:HyperLink></h5>
            Wyświetl zalegających z płatnościami oraz własne zobowiązania.
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
    </section>
    <section id="Section1">
        <img src="reklama.png"/>
    </section>
</asp:Content>