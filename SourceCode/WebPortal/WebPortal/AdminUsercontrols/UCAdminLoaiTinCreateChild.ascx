<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminLoaiTinCreateChild.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminLoaiTinCreateChild" %>
<style type="text/css">
    .style1
    {
        width: 20%;
        height: 40px;
        color: Black;
        font-weight: bold;
    }
    .style2
    {
        height: 40px;
    }
</style>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Tạo mới loại tin
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
                    <asp:DropDownList ID="ListLoaiTin" runat="server" Width="30%" ></asp:DropDownList>     
                                     
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Tên Loại Tin Mức 2:
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
                    <asp:Button ID="Save" Text="Lưu" runat="server" OnClick="Save_Click" CssClass="button" />
                    &nbsp;
                    <asp:Button ID="Back" Text="Danh sách loại tin mức 2" runat="server" CssClass="button"
                        onclick="Back_Click"/>
                </td>
            </tr>
             <tr>
                <td class="style1">
                </td>
                <td class="style2" style="text-align:center">
                    &nbsp;
                    <asp:Button ID="Back1" Text="Danh sách loại tin mức 1" runat="server" CssClass="button"
                        onclick="Back1_Click" style="height: 26px"  />
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
