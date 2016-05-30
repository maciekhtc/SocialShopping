<%@ Page Title="Szczegóły Paragonu" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BillDetails.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    <p>
        Właściciel: <asp:Label ID="owner" runat="server" Text=""></asp:Label> 
        &nbsp;Łączna wartość: <asp:Label ID="price" runat="server" Text=""></asp:Label> 
        &nbsp;Data: <asp:Label ID="timestamp" runat="server" Text=""></asp:Label>
    </p>
    <p>
        Opis:
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="description" runat="server" Text=""></asp:Label>
    </p>
    <p>
        <asp:Label ID="userNotOwner" runat="server" Visible="false" Text="Nie jesteś właścicielem tego paragonu, nie możesz zatwierdzać spłat!" ForeColor="Red"></asp:Label>
    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="450px" EmptyDataText="Brak wpisów.">
        <Columns>
            <asp:BoundField DataField="nickname" HeaderText="Uczestnik " SortExpression="nickname">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle Width="45%" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="is_paid" HeaderText="Spłacono" SortExpression="is_paid">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CommandField SelectText="Potwierdź spłatę" ShowSelectButton="True">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle Width="35%" HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:HyperLinkField DataNavigateUrlFields="nickname" DataNavigateUrlFormatString="UserDetails.aspx?nickname={0}" ShowHeader="False" Text="Kontakt" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT USERS.nickname, USER_BILL.is_paid FROM USER_BILL INNER JOIN USERS ON USER_BILL.participant_id = USERS.id_user
WHERE ([USER_BILL].bill_id = @bill_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="bill_id" QueryStringField="bill" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT id_bill FROM BILLS WHERE (id_bill = @id_bill) AND (owner_id = @owner_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_bill" QueryStringField="bill" />
            <asp:SessionParameter Name="owner_id" SessionField="User_Id" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT USERS.nickname, BILLS.total_cost, BILLS.timestamp, BILLS.description FROM BILLS INNER JOIN USERS ON BILLS.owner_id = USERS.id_user WHERE (BILLS.id_bill = @id_bill)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_bill" QueryStringField="bill" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

