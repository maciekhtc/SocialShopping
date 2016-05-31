<%@ Page Title="Niespłacone Paragony" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Bills.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" DataKeyNames="id_bill" AllowSorting="True" EmptyDataText="Brak wpisów.">
        <Columns>
            <asp:BoundField DataField="id_bill" HeaderText="Nr" InsertVisible="False" ReadOnly="True" ShowHeader="False" SortExpression="id_bill" Visible="False">
            <ItemStyle Width="0%" />
            </asp:BoundField>
            <asp:BoundField DataField="description" HeaderText="Opis zakupu" SortExpression="description">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle Width="50%" />
            </asp:BoundField>
            <asp:BoundField DataField="total_cost" HeaderText="Wartość" SortExpression="total_cost" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="timestamp" HeaderText="Data" SortExpression="timestamp">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle Width="30%" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id_bill" DataNavigateUrlFormatString="BillDetails.aspx?bill={0}" Text="Szczegóły" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT description, total_cost, timestamp, id_bill FROM BILLS WHERE (owner_id = @owner_id
AND id_bill IN (SELECT bill_id FROM USER_BILL WHERE is_paid=0))">
        <SelectParameters>
            <asp:SessionParameter Name="owner_id" SessionField="User_Id" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

