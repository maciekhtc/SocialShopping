<%@ Page Title="Dodaj Paragon" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddBill.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    <section id="loginForm">
    <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
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
    <h3>Uczestnicy</h3>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="Brak wpisów." Width="320px" BorderStyle="Dashed" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="nickname" HeaderText="Nazwa Użytkownika" SortExpression="nickname" />
            </Columns>
        </asp:GridView>
    </p>
    <h3>Dodaj Uczestnika</h3>
    <p>
            <asp:Label ID="Label2" runat="server" Visible="false" Text="Nieprawidłowy Login lub Hasło!" ForeColor="Red"></asp:Label>
        </p>
        <p>
            Login Uczestnika:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Musisz podać Login!" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Hasło Uczestnika:<br />
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Musisz podać Hasło!" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Dodaj" OnClick="Button1_Click" />
        <asp:Button ID="Button3" runat="server" Text="Zakończ" CausesValidation="false" OnClick="Button3_Click" />
        <asp:Button ID="Button2" runat="server" Text="Anuluj" CausesValidation="false" OnClick="Button2_Click" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" InsertCommand="INSERT INTO BILLS(owner_id, total_cost, description, timestamp) VALUES (@owner_id, @total_cost, @description, CURRENT_TIMESTAMP)
 SET @newId=SCOPE_IDENTITY()" SelectCommand="SELECT USERS.nickname FROM USER_BILL INNER JOIN USERS ON USER_BILL.participant_id = USERS.id_user
WHERE ([USER_BILL].bill_id = CAST(@bill_id AS BIGINT))" OnInserted="SqlDataSource1_Inserted" DeleteCommand="DELETE FROM BILLS WHERE id_bill=@bill_id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="Label1" Name="bill_id" PropertyName="Text" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="owner_id" SessionField="User_Id" />
                <asp:ControlParameter ControlID="totalcostTextBox" Name="total_cost" PropertyName="Text" />
                <asp:ControlParameter ControlID="descriptionTextBox" Name="description" PropertyName="Text" />
                <asp:Parameter DbType="Int32" DefaultValue="0" Direction="Output" Name="newId" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="bill_id" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT [id_user] FROM [USERS] WHERE (([nickname] = @nickname) AND ([password] = @password))" DeleteCommand="DELETE FROM USER_BILL WHERE bill_id=@bill_id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="Label1" Name="bill_id" PropertyName="Text" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="nickname" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    </section>
    <section id="Section1">
        <img src="reklama.png"/>
    </section>
</asp:Content>

