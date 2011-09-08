<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminUserDetail.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminUserEdit" %>
<form id="form1" method="post" action="../AdminUserManager.aspx">
<table class="style1">
    <!-- Edit User -->
    <% WebPortal.Model.User user = null; %>
    <% if (Request.QueryString["type"].ToString() == "edit")
       { %>
    <% user = GetUserByID(Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0)); %>
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
                <input name="active" type="checkbox" checked="checked" />
                <% }
                   else
                   {%>
                <input name="active" type="checkbox" />
                <%} %>
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
    </tbody>
    <!-- // Edit User -->
    <%} %>
    <%}
       else if (Request.QueryString["type"].ToString() == "new")
       { %>
    <!-- New User -->
    <tbody>
        <tr>
            <th>
                Tên đăng nhập
            </th>
            <td>
                <input name="username" type="text" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Mật khẩu
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
                <input name="email" type="text" />
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
                <input name="user-string" type="text" />
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
                <input name="description" type="text" />
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
                <input name="active" type="checkbox" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
    </tbody>
    <!-- // New User -->
    <%} %>
</table>
<% if (Request.QueryString["type"].ToString() == "edit")
   {
       if (user != null)
       {
           System.Collections.Generic.List<WebPortal.Model.Profile> profileList = profileRepository.AllByUserID(user.UserID);
%>
<p>
    Danh sách profile</p>
<table class="style1 datatable">
    <thead>
        <tr>
            <th>
                ID
            </th>
            <th>
                Họ và tên
            </th>
            <th>
                Giới tính
            </th>
            <th>
                Hình ảnh
            </th>
            <th>
                Địa chỉ
            </th>
            <th>
                Trạng thái
            </th>
            <th>
                Thao tác
            </th>
        </tr>
    </thead>
    <tbody>
        <% 
            if (profileList != null)
            {
                foreach (var profile in profileList)
                { %>
        <tr>
            <td>
                <%=profile.ProfileID %>
            </td>
            <td>
                <%=profile.LastName+" "+profile.FirstName %>
            </td>
            <td>
                <%=profile.Genre%>
            </td>
            <td>
                <img src="<%=profile.Image%>" style="max-height: 100px; max-width: 100px; border: 1px solid #ccc" />
            </td>
            <td>
                <%=profile.Address%>
            </td>
            <td>
                <%if (profile.Active != null)
                  {
                      if (profile.Active.Value)
                      {
                %>
                Active
                <%}
                  }
                  else
                  { %>
                No Active
                <%} %>
            </td>
            <td>
                <a href="AdminUserManager.aspx?id=<%=user.UserID %>&type=deleteprofile">
                    <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                        alt="" title="Xóa profile" /></a> <a href="AdminUserManager.aspx?id=<%=profile.ProfileID %>&type=editprofile">
                            <img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
                                alt="" title="Chỉnh sửa profile" /></a>
            </td>
        </tr>
        <%} %>
        <%} %>
    </tbody>
</table>
<a href="AdminUserManager.aspx?id=<%=user.UserID %>&&type=newprofile" class="button green fl-space">
    Thêm profile</a><br />
<%} %>
<%} %>
<div class="tab-footer clear">
    <div class="fr">
        <% if (Request.QueryString["type"].ToString() == "edit")
           {%>
        <input type="submit" value="Lưu thay đổi" id="save" name="save" class="button" />
        <%} %>
        <% else if (Request.QueryString["type"].ToString() == "new")
            {%>
        <input type="submit" value="Tạo mới" id="new" name="new" class="button" />
        <%} %>
        <input value="Quay về trang chính" id="back" class="button" />
    </div>
</div>
<% string notificatedMessage = string.Empty; %>
<% if (Request.Form["save"] != null)
   {
       if (Request.QueryString["id"] != null)
       {
           if (UpdateUser(ref notificatedMessage))
           {
               
%>
<!-- NOTIFICATIONS (Thong bao)-->
<div class="notification note-success">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>
            <%=notificatedMessage %></strong></p>
</div>
<%
}
           else
           {
%>
<div class="notification note-error">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>
            <%=notificatedMessage %></strong>.</p>
</div>
<%} %>
<%} %>
<%} %>
<% else if (Request.Form["new"] != null)
    {
        if (InsertUser(ref notificatedMessage))
        {
               
%>
<!-- NOTIFICATIONS (Thong bao)-->
<div class="notification note-success">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>
            <%=notificatedMessage %></strong></p>
</div>
<%
}
        else
        {
%>
<div class="notification note-error">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>
            <%=notificatedMessage %></strong>.</p>
</div>
<%} %>
<%}

    else if (Request.QueryString["type"].ToString() == "delete")
    {
        if (Request.QueryString["id"] != null)
        {
            int id = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
            if (DeleteUser(id, ref notificatedMessage))
            { %>
<!-- NOTIFICATIONS (Thong bao)-->
<div class="notification note-success">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>
            <%=notificatedMessage%></strong></p>
</div>
<%
}
        }
        else
        {
%>
<div class="notification note-error">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>
            <%=notificatedMessage%></strong>.</p>
</div>
<%} %>
<%} %>
</form>
