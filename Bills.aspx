<%@ Page Title="Paragony" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Bills.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="505px" DataKeyNames="id_bill">
        <Columns>
            <asp:BoundField DataField="id_bill" HeaderText="Nr" InsertVisible="False" ReadOnly="True" ShowHeader="False" SortExpression="id_bill">
            <ItemStyle Width="0%" />
            </asp:BoundField>
            <asp:BoundField DataField="description" HeaderText="Opis zakupu" SortExpression="description">
            <ItemStyle Width="60%" />
            </asp:BoundField>
            <asp:BoundField DataField="total_cost" HeaderText="Wartość" SortExpression="total_cost" />
            <asp:CommandField SelectText="Szczegóły" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sieradzkiConnectionString %>" SelectCommand="SELECT description, total_cost, timestamp, id_bill FROM BILLS WHERE (owner_id = @owner_id)">
        <SelectParameters>
            <asp:SessionParameter Name="owner_id" SessionField="User_Id" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

