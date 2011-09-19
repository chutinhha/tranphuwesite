<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminLoaiTinList.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminLoaiTinList" %>
<form method="post" action="../AdminLoaiTinManager.aspx">
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý loại tin</span>
    </p>
    <% List<WebPortal.Model.LoaiTin_Lv1> list = GetAllLoaiTin(); %>
    <table class="style1 datatable">
        <thead>
            <tr>
                <th class="bSortable">
                   <%-- <input type="checkbox" class="checkbox select-all" />--%>
                </th>
                <th>
                    ID Tên Loại Lv1
                </th>
                <th>
                    Tên Loại
                </th>
                <th>
                    Mô Tả
                </th>
                <th>
                </th>
                <th>
                </th>
                <th>
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
                   <%-- <input type="checkbox" class="checkbox" />--%>
                </td>
                <td>
                    <%=loai.IDLoaiTin_Lv1%>
                </td>
                <td>
                    <%=loai.TenLoai %>
                </td>
                <td>
                    <%=loai.MoTa %>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td style="width: 20%; text-align: center">
                    <a href="AdminLoaiTinManager.aspx?id=<%=loai.IDLoaiTin_Lv1 %>&type=deleteLv1">
                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a> <a href="AdminLoaiTinManager.aspx?id=<%=loai.IDLoaiTin_Lv1 %>&type=edit">
                                <img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
                                    alt="" title="Chỉnh sửa" /></a>
                </td>
            </tr>
            <%} %>
            <%} %>
        </tbody>
    </table>
    <input type="button" value="Tạo Mới" class="button" onclick="window.location.href('AdminLoaiTinManager.aspx?id=-1&type=new')" />
</div>
</form>
