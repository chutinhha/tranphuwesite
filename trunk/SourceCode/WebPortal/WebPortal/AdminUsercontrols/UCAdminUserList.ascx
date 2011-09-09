<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminUserList.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminUserList" %>
<!-- TABLE -->
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý tài khoản</span>
    </p>
    <form method="post" action="#">
    <% List<WebPortal.Model.User> list = GetAllUsers();
        %>
    <table class="style1 datatable">
        <thead>
            <tr>
                <th class="bSortable">
                   <%-- <input type="checkbox" class="checkbox select-all" />--%> ID
                </th>
                <th>
                    Username
                </th>
                <th>
                    Email
                </th>
                <th>
                    Ngày đăng nhập cuối
                </th>
                <th>
                    Ngày tạo
                </th>
                <th>
                    Nhóm
                </th>
                <th>
                    Thao tác
                </th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (list != null)
                {
                    foreach (var user in list)
                    {%>
            <tr>
                <td>
                    <%=user.UserID %>
                </td>
                <td>
                    <%=user.UserName %>
                </td>
                <td>
                    <%=user.Email %>
                </td>
                <td>
                    <%=user.LastLoginDate.ToString() %>
                </td>
                <td>
                    <%=user.DateCreate.ToString() %>
                </td>
                <td>
                    <%=user.Type %>
                </td>
                <td>
                    <a href="AdminUserManager.aspx?id=<%=user.UserID %>&type=delete" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng có mã <%=user.UserID %>?')">
                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a> <a href="AdminUserManager.aspx?id=<%=user.UserID %>&type=edit">
                                <img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
                                    alt="" title="Chỉnh sửa profile" /></a>
                </td>
            </tr>
            <%} %>
            <%} %>
        </tbody>
    </table>
    <a href="AdminUserManager.aspx?type=new" class="button green fl-space">Tạo mới</a>
    </form>
</div>
<!-- /#table -->
