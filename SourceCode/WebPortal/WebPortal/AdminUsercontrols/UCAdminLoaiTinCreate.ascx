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
<form method="post" action="../AdminLoaiTinManager.aspx">
<%if (Request.Form["SaveLoaiTin"] != null)
  {
      if (SaveLoaiTin())
      {
%>
<!-- NOTIFICATIONS (Thong bao)-->
<div class="notification note-success">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>Lưu loại tin mới thành công!</strong></p>
</div>
<%}
      else
      {%>
<!-- NOTIFICATIONS (Thong bao)-->
<div class="notification note-error">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>Quá trình lưu xảy ra lỗi! Vui lòng thử lại</strong></p>
</div>
<%}
  }
%>
<div id="data-table" style="visibility: visible">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Tạo mới loại tin
            mức 1</span>
    </p>
    <div>
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
                <td class="style2" style="text-align: center">
                    <input type="submit" name="SaveLoaiTin" value="Lưu" style="width: 152px" class="button" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="text-align: center">
                    <input type="button" name="DSLoaiTinLv1" value="Danh sách loại tin mức 1" onclick="window.location.href='AdminLoaiTinManager.aspx'" class="button"/>
                    <input type="button" name="CreateLaoiTinLv2" value="Tạo loại tin mức 2" onclick="window.location.href='AdminLoaiTinManager.aspx?id=-1&type=createChild'" class="button"/>
                    <input type="button" name="DSLoaiTinLv2" value="Danh sách loại tin mức 2" onclick="window.location.href='AdminLoaiTinManager.aspx?id=-1&type=listChild'" class="button"/>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2">
                    <asp:Label Text="" ID="SaveChange" runat="server" Visible="false"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</div>
</form>
