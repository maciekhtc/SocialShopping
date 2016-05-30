<%@ Page Title="Historia Paragonów" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BillsHistory.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>

    <h2>Twoje Paragony</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="505px" DataKeyNames="id_bill" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="id_bill" HeaderText="Nr" InsertVisible="False" ReadOnly="True" ShowHeader="False" SortExpression="id_bill" Visible="False">
            <ItemStyle Width="0%" />
            </asp:BoundField>
            <asp:BoundField DataField="description" HeaderText="Opis zakupu" SortExpression="description">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:BoundField DataField="total_cost" HeaderText="Wartość" SortExpression="total_cost" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id_bill" DataNavigateUrlFormatString="BillDetails.aspx?bill={0}" Text="Szczegóły" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>

    <h2>Cudze Paragony</h2>
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT description, total_cost, timestamp, id_bill FROM BILLS WHERE (owner_id = @owner_id)">
        <SelectParameters>
            <asp:SessionParameter Name="owner_id" SessionField="User_Id" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT DISTINCT BILLS.id_bill, BILLS.description, BILLS.total_cost, USERS.nickname, BILLS.timestamp FROM BILLS INNER JOIN USERS ON BILLS.owner_id = USERS.id_user INNER JOIN USER_BILL ON BILLS.id_bill = USER_BILL.bill_id WHERE (USER_BILL.participant_id = @user_id)">
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="User_Id" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

