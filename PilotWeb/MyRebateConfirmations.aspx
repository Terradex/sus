<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="MyRebateConfirmations.aspx.cs" Inherits="MyRebateConfirmations" Title="Pilot Product Display > My Rebate Confirmations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lbl1" runat="server" Text="My Rebate Confirmations"></asp:Label>
    <br />
    <br />
    <br />
    <asp:GridView ID="gvConfirmations" runat="server" AutoGenerateColumns="False"  
        CellPadding="4" DataSourceID="ObjectDataSource_Confirmations" ShowHeader="False" 
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="linkConfirmationID" runat="server" Text='<%# Eval("ConfirmationID") %>' ></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Label ID="lblRebate" runat="server" Text='<%# Eval("RebateAmount") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("UpdateDate") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource_Confirmations" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMyConfirmations" 
        TypeName="PilotDL.MiscTableAdapters.sp_053_list_confirmationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1000" Name="UserID" 
                QueryStringField="userid" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

