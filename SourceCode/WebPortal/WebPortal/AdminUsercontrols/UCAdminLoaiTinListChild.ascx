﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminLoaiTinListChild.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminLoaiTinLv2List" %>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý loại tin mức 2</span>
    </p>
    <form method="post" action="#">
   <% List<WebPortal.Model.LoaiTin> list = GetAllLoaiTin(); %>
    <table class="style1 datatable">
        <thead>
            <tr>
                <th class="bSortable">
                    <input type="checkbox" class="checkbox select-all" />
                </th>
                <th>
                    ID Tên Loại
                </th>
                <th>
                    Tên Loại
                </th>
                <th >
                    Mô Tả
                </th>
                <th>ID Tên Loại Lv1</th>
                <th></th>
                <th >
                    Edit
                </th>
                
            </tr>
        </thead>
        <tbody>
            <% 
                if (list != null)
                {
                    foreach (var loai in list)
                    { %>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox" />
                </td>
                <td>
                    <%=loai.IDLoaiTin%>
                </td>
                <td>
                    <%=loai.TenLoai %>
                </td>
                 <td>
                    <%=loai.MoTa %>
                </td>
                <td>
                    <%=loai.LoaiTin_Lv1ID %>
                </td>
                <td></td>
                <td style="width:20%;text-align:center">
                    <a href="AdminLoaiTinManager.aspx?id=<%=loai.IDLoaiTin %>&type=deleteChild" >
                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a>
                    <a href="AdminLoaiTinManager.aspx?id=<%=loai.IDLoaiTin %>&type=editChild">
                        <img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Chỉnh sửa" /></a>
                </td>
                
            </tr>
            <%} %>
            <%} %>
        </tbody>
    </table>
    </form>
    <a href="AdminLoaiTinManager.aspx?id=-1&type=createChild">
    <input type="button" value="Tạo Mới" class="button"></a>  
</div>