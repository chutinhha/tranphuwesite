<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminLoaiTinEditChild.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminLoaiTinEditChild" %>
<style type="text/css">
    .style1
    {
        width: 20%;
        height: 40px;
        color: Black;
        font-weight: bold;
    }
    #ListLoaiTin th, #ListLoaiTin td
    {
        border: 1px #ccc solid;
    }
    #ListLoaiTin td
    {
    }
    td.editColumn, td.idLoaiTin
    {
        text-align: center;
    }
    .style2
    {
        height: 40px;
    }
</style>
<div id="data-table" style="visibility: visible">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Edit loại tin
            mức 2</span>
    </p>
    <div>
        <form method="post" action="#">
        <table width="97%">
            <tr>
                <td class="style1">
                    Tên Loại Tin Mức 1:
                </td>
                <td class="style2">
                    <asp:DropDownList ID="ListLoaiTin" runat="server" Width="30%">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Tên Loại Tin Mức 2:
                </td>
                <td class="style2">
                    <asp:TextBox ID="Name" Width="90%" runat="server" Text=" "></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Mô Tả:
                </td>
                <td class="style2" style="height: 60px;">
                    <asp:TextBox ID="Summary" Width="89%" runat="server" TextMode="MultiLine" Height="40px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2" style="text-align: center">
                    <asp:Button ID="Save" Text="Save" runat="server" OnClick="Save_Click" />
                    &nbsp;
                    <asp:Button ID="Back" Text="List Loai Tin Lv2" runat="server" OnClick="Back_Click" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2" style="text-align: center">
                    &nbsp;
                    <asp:Button ID="Back1" Text="List Loai Tin Lv1" runat="server" OnClick="Back1_Click" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2">
                    <asp:Label Text="" ID="SaveChange" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        </form>
    </div>
</div>
