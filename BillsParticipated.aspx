<%@ Page Title="Paragony Do Spłacenia" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BillsParticipated.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="505px">
        <Columns>
            <asp:BoundField DataField="id_bill" HeaderText="Nr" InsertVisible="False" ReadOnly="True" SortExpression="id_bill" Visible="False" />
            <asp:BoundField DataField="description" HeaderText="Opis zakupu" SortExpression="description">
            <ItemStyle Width="45%" />
            </asp:BoundField>
            <asp:BoundField DataField="nickname" HeaderText="Właściciel" SortExpression="nickname">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="total_cost" HeaderText="Wartość" SortExpression="total_cost">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id_bill" DataNavigateUrlFormatString="BillDetails.aspx?bill={0}" Text="Szczegóły">
            <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT DISTINCT BILLS.id_bill, BILLS.description, BILLS.total_cost, USERS.nickname, BILLS.timestamp FROM BILLS INNER JOIN USERS ON BILLS.owner_id = USERS.id_user INNER JOIN USER_BILL ON BILLS.id_bill = USER_BILL.bill_id WHERE (USER_BILL.participant_id = @user_id) AND (USER_BILL.is_paid = 0)">
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="User_Id" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

