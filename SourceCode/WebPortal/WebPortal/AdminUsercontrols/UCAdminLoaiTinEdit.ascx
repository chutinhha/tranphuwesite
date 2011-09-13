<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminLoaiTinEdit.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminLoaiTinEdit" %>
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
        text-align:center;   
    }
    .style2
    {
        height: 40px;
    }
</style>
<div id="data-table" style="visibility: visible">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Chỉnh sửa loại tin
            mức 1</span>
    </p>
    <div>
        <form method="post" action="#">
        <table width="97%" >
            <tr>
                <td class="style1">
                    Tên Loại Tin Mức 1:
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
                <td class="style2">
                    <asp:Button ID="Save" Text="Lưu" runat="server" OnClick="Save_Click" CssClass="button" />
                    &nbsp;
                    <asp:Button ID="Back" Text="Danh sách loại tin mức 1" runat="server" 
                        onclick="Back_Click" CssClass="button" />
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
