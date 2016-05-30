<%@ Page Title="Zarządzanie Kontem" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Management.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1>Edycja profilu:</h1>
    </hgroup>
    
    <section id="loginForm">  
    <p>
        Imię: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="imieTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Musisz podac Imię!" ControlToValidate="imieTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </p>
    <p>
        Nazwisko: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="nazwiskoTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Musisz podac Nazwisko!" ControlToValidate="nazwiskoTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    </p>
    <p>
        Adres e-mail: <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="emailTextBox" runat="server" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Musisz podac Adres e-mail!" ControlToValidate="emailTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ControlToValidate="emailTextBox" ErrorMessage="Podany e-mail nie jest prawidłowy!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Anuluj" OnClick="Button2_Click" CausesValidation="false" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT [first_name], [last_name], [email] FROM [USERS] WHERE ([id_user] = @id_user)" UpdateCommand="UPDATE USERS SET first_name = @first_name, last_name = @last_name, email = @email WHERE (id_user = @id_user)">
            <SelectParameters>
                <asp:SessionParameter Name="id_user" SessionField="User_Id" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="imieTextBox" Name="first_name" PropertyName="Text" />
                <asp:ControlParameter ControlID="nazwiskoTextBox" Name="last_name" PropertyName="Text" />
                <asp:ControlParameter ControlID="emailTextBox" Name="email" PropertyName="Text" />
                <asp:SessionParameter Name="id_user" SessionField="User_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    </section>
    <section id="Section1">
        cos bedzie
    </section>
</asp:Content>

