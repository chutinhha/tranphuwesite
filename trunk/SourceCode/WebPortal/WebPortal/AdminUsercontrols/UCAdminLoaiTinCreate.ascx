<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminLoaiTinCreate.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminLoaiTinCreate" %>
<style type="text/css">
    .style1
    {
        width: 20%;
        height: 40px;
        color: Black;
        font-weight: bold;
    }
</style>
<div id="data-table" style="visibility: visible">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Tạo mới loại tin
            mức 1</span>
    </p>
    <div>
        <form method="post" action="#">
        <table width="97%">
            <tr>
                <td class="style1">
                    Tên Loại Tin Mức 1:
                </td>
                <td class="style2">
                    <asp:TextBox ID="Name" Width="100%" runat="server" Text=" "></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Mô Tả:
                </td>
                <td class="style2" style="height: 60px;">
                    <asp:TextBox ID="Summary" Width="100%" runat="server" TextMode="MultiLine" Height="40px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2" style="text-align:center">
                    <asp:Button ID="Save" Text="Save" runat="server" OnClick="Save_Click"/>
                    &nbsp;
                    <asp:Button ID="Back" Text="List Loai Tin Muc 1" runat="server" 
                        onclick="Back_Click" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="text-align:center">
                    <asp:Button ID="CreatChild" Text="Tạo Loại Tin Muc 2" runat="server" OnClick="CreatChild_Click" /> &nbsp;
                    <asp:Button ID="Back1" Text="List Loai Tin Muc 2" runat="server" 
                        onclick="Back1_Click" />
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
