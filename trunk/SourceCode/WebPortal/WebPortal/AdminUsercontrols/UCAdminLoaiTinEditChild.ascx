﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminLoaiTinEditChild.ascx.cs"
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
<form method="post" action="../AdminLoaiTinManager.aspx">
<%if (Request.Form["UpdateLoaiTinLv2"] != null)
  {
      if (UpdateLoaiTinLv2())
      {
%>
<!-- NOTIFICATIONS (Thong bao)-->
<div class="notification note-success">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>Cập nhật thành công!</strong></p>
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
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Chỉnh sửa loại tin
            mức 2</span>
    </p>
    <div>
       
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
                    <input class="button" name="UpdateLoaiTinLv2" style="width: 152px" type="submit" 
                        value="Lưu" />&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2" style="text-align: center">
                    <input class="button" name="DSLoaiTinLv2" 
                        onclick="window.location.href='AdminLoaiTinManager.aspx?id=-1&type=listChild'" type="button" 
                        value="Danh sách loại tin mức 2" />&nbsp;
                    <input class="button" name="DSLoaiTinLv1" 
                        onclick="window.location.href='AdminLoaiTinManager.aspx'" type="button" 
                        value="Danh sách loại tin mức 1" /></td>
            </tr>
            
        </table>
        
    </div>
</div>
</form>

