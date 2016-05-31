<%@ Page Title="Dodaj Paragon" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddBill.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <p>
        Opis:
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="descriptionTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Musisz wprowadzić opis!" ControlToValidate="descriptionTextBox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
    </p>
    <p>
        Wartość:
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="totalcostTextBox" runat="server" TextMode="SingleLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Musisz podać wartość!" ControlToValidate="totalcostTextBox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wartość musi być kwotą podaną liczbowo!" ControlToValidate="totalcostTextBox" Display="Dynamic" ForeColor="Red" ValidationExpression="\d+(?:,\d{1,2})?"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Dodaj" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Anuluj" CausesValidation="false" />
        &nbsp;

    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" InsertCommand="INSERT INTO BILLS(owner_id, total_cost, description, timestamp) VALUES (@owner_id, @total_cost, @description, CURRENT_TIMESTAMP)
 SET @newId=SCOPE_IDENTITY()" SelectCommand="SELECT * FROM [USER_BILL]" OnInserted="SqlDataSource1_Inserted">
            <InsertParameters>
                <asp:SessionParameter Name="owner_id" SessionField="User_Id" />
                <asp:ControlParameter ControlID="totalcostTextBox" Name="total_cost" PropertyName="Text" />
                <asp:ControlParameter ControlID="descriptionTextBox" Name="description" PropertyName="Text" />
                <asp:Parameter DbType="Int32" DefaultValue="0" Direction="Output" Name="newId" />
            </InsertParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

