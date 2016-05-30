<%@ Page Title="Menu Możliwości" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    <section id="loginForm"> 
        <ol class="round">
            <li class="one">
                <h5><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddBill.aspx">Dodaj paragon</asp:HyperLink></h5>
                Wpisz opis i koszt oraz dodaj osoby, które będą musiały spłacić paragon.
            </li>
            <li class="two">
                <h5><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Bills.aspx">Lista Twoich Paragonów</asp:HyperLink></h5>
                Sprawdź listę paragonów, które nie zostały Ci spłacone przez wszystkie osoby.
            </li>
            <li class="three">
                <h5><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/BillsParticipated.aspx">Lista Cudzych Paragonów</asp:HyperLink></h5>
                Sprawdź listę paragonów, w których uczestniczyłeś i jeszcze ich nie spłaciłeś.
            </li>
            <li class="four">
                <h5><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/BillsHistory.aspx">Historia Paragonów</asp:HyperLink></h5>
                Przeglądaj listę swoich paragonów oraz cudzych, w których uczestniczyłeś.
            </li>
        </ol>
    </section>
    <section id="Section1">
        cos bedzie
    </section>
</asp:Content>

