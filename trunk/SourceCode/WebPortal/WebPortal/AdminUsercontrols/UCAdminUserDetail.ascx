<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminUserDetail.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminUserEdit" %>
<form method="post" action="../AdminUserManager.aspx">
<table class="style1">
    <thead>
        <tr>
            <th>
                Thông số
            </th>
            <th class="full">
                Giá trị
            </th>
            <th>
                Edit
            </th>
        </tr>
    </thead>
    <% if (Request.QueryString["type"].ToString() == "edit")
       { %>
    <% WebPortal.Model.User user = GetUserByID(Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0)); %>
    <% if (user != null)
       { %>
    <tbody>
        <tr>
            <th>
                Tên đăng nhập
            </th>
            <td>
                <input name="username" type="text" value="<% = user.UserName%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Mật khẩu cũ
            </th>
            <td>
                <input name="password" type="password" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Mật khẩu mới
            </th>
            <td>
                <input name="password" type="password" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Email
            </th>
            <td>
                <input name="email" type="text" value="<% = user.Email%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Định danh tương ứng
            </th>
            <td>
                <input name="user-string" type="text" value="<% = user.Email%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Ngày đăng nhập cuối
            </th>
            <td>
                <input name="dateLogin" type="text" value="<% = user.LastLoginDate%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Lần cuối thay đổi password
            </th>
            <td>
                <input name="dateLogin" type="text" value="<% = user.LastLoginDate%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Ngày tạo tài khoản
            </th>
            <td>
                <input name="dateCreate" type="text" value="<% = user.DateCreate%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Ghi chú
            </th>
            <td>
                <input name="description" type="text" value="<% = user.Type%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Trạng thái
            </th>
            <td>
                <% if (user.Active.Value)
                   { %>
                <input name="description" type="checkbox" checked="checked" />
                <% }
                   else
                   {%>
                <input name="description" type="checkbox" />
                <%} %>
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
    </tbody>
    <%} %>
    <%}
       else if (Request.QueryString["type"].ToString() == "new")
       { %>
    <tbody>
        <tr>
            <th>
                Tên đăng nhập
            </th>
            <td>
                <input name="username" type="text" value="<% = user.UserName%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Mật khẩu mới
            </th>
            <td>
                <input name="newpassword" type="password" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Email
            </th>
            <td>
                <input name="email" type="text" value="<% = user.Email%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Định danh tương ứng
            </th>
            <td>
                <input name="user-string" type="text" value="<% = user.Email%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Ngày đăng nhập cuối
            </th>
            <td>
                <input name="dateLogin" type="text" value="<% = user.LastLoginDate%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Lần cuối thay đổi password
            </th>
            <td>
                <input name="dateLogin" type="text" value="<% = user.LastLoginDate%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Ngày tạo tài khoản
            </th>
            <td>
                <input name="dateCreate" type="text" value="<% = user.DateCreate%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Ghi chú
            </th>
            <td>
                <input name="description" type="text" value="<% = user.Type%>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Trạng thái
            </th>
            <td>
                <% if (user.Active.Value)
                   { %>
                <input name="description" type="checkbox" checked="checked" />
                <% }
                   else
                   {%>
                <input name="description" type="checkbox" />
                <%} %>
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
    </tbody>
    <%} %>
</table>
<div class="tab-footer clear">
    <div class="fr">
        <% if (Request.QueryString["type"].ToString() == "edit")
           {%>
        <input type="submit" value="Lưu thay đổi" id="save" name="save" class="button" />
        <%} %>
        <% else if (Request.QueryString["type"].ToString() == "new")
            {%>
        <input type="submit" value="Tạo mới" id="create" class="button" />
        <%} %>
        <input value="Quay về trang chính" id="back" class="button" />
    </div>
</div>
<% if (Request.Form["save"] != null)
   {
       WebPortal.Model.User user = new WebPortal.Model.User();
       if (Request.Form[0] != null)
       {
           user.UserName = Request.Form["username"].ToString();
           user.Email = Request.Form["email"].ToString();
           user.Email = Request.Form["email"].ToString();

       }
%>
<%} %>
</form>
