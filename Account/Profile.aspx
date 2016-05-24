<%@ Page Title="Profil" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1>Twój profil:</h1>
    </hgroup>
    
    <section id="loginForm">
        <p>
            Login:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="loginLabel" runat="server"></asp:Label>
        </p>
        <p>
            Imię:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="imieLabel" runat="server"></asp:Label>
        </p>
        <p>
            Nazwisko:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="nazwiskoLabel" runat="server"></asp:Label>
        </p>
        <p>
            Adres e-mail:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="emailLabel" runat="server"></asp:Label>
        </p>
        <p>
            Data rejestracji:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="dataLabel" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Edytuj Profil" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Zmień Hasło" OnClick="Button2_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT [nickname], [first_name], [last_name], [join_timestamp], [email] FROM [USERS] WHERE ([id_user] = @id_user)">
                <SelectParameters>
                    <asp:SessionParameter Name="id_user" SessionField="User_Id" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        
    </section>
    <section id="Section1">
        cos bedzie
    </section>
</asp:Content>

