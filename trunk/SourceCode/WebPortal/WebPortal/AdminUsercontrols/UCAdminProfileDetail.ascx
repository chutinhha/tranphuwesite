<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminProfileDetail.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminUserProfile" %>
<form id="form1" method="post" action="../AdminUserManager.aspx" enctype="multipart/form-data">
<table class="style1">
    <!-- Edit Profile -->
    <% WebPortal.Model.Profile profile = null; %>
    <% if (Request.QueryString["type"].ToString() == "editprofile")
       { %>
    <% profile = profileRepository.Single(Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0)); %>
    <% if (profile != null)
       { %>
    <tbody>
        <tr>
            <th>
                Họ và tên
            </th>
            <td>
                <input name="lastname" type="text" value="<%=profile.LastName %>" />
                <input name="firstname" type="text" value="<%=profile.FirstName %>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Chức vụ
            </th>
            <td>
                <input name="position" type="text" value="<%=profile.Position %>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Hình ảnh
            </th>
            <td>
                <image src="<%=profile.Image %>" alt="" title="Hình ảnh" style="max-height:100px; max-width:100px; border:1px solid #ccc"/>
                <p>
                    Chọn ảnh
                    <input type="file" id="inputFile" runat="server" />
                </p>
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Địa chỉ
            </th>
            <td>
                <input name="address" type="text" value="<%=profile.Address %>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Số điện thoại
            </th>
            <td>
                <input name="phone" type="text" value="<%=profile.Phone %>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Giới tính
            </th>
            <td>
                <% if (!string.IsNullOrWhiteSpace(profile.Genre))
                   {
                       if (profile.Genre.Trim() == "Nam")
                       {
                %>
                Nam
                <input name="genre" type="radio" checked="checked" value="male" />
                Nữ
                <input name="genre" type="radio" value="female" />
                <%}
                       else
                       { %>
                Nam
                <input name="genre" type="radio" value="male" />
                Nữ
                <input name="genre" type="radio" checked="checked" value="female" />
                <%} %>
                <%}
                   else
                   { %>
                Nam
                <input name="genre" type="radio" checked="checked" value="male" />
                Nữ
                <input name="genre" type="radio" value="female" />
                <%} %>
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Dân tộc
            </th>
            <td>
                <input name="ethnic" type="text" value="<%=profile.Ethnic %>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Tôn giáo
            </th>
            <td>
                <input name="religion" type="text" value="<%=profile.Religion %>" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Sinh nhật
            </th>
            <td>
                <input name="birthday" type="text" value="<%=profile.Birdthday %>" />
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
                <% if (profile.Active != null ? profile.Active.Value : false)
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
    <!-- // Edit Profile -->
    <%} %>
    <%}
       else if (Request.QueryString["type"].ToString() == "newprofile")
       { %>
    <!-- New Profile -->
    <tbody>
        <tr>
            <th>
                Họ và tên lót
            </th>
            <td>
                <input name="lastname" type="text" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Tên
            </th>
            <td>
                <input name="firstname" type="text" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Chức vụ
            </th>
            <td>
                <input name="position" type="text" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Hình ảnh
            </th>
            <td>
                <p>
                    Chọn ảnh
                    <input type="file" name="inputFile1"/>
                </p>
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Địa chỉ
            </th>
            <td>
                <input name="address" type="text" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Số điện thoại
            </th>
            <td>
                <input name="phone" type="text" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Giới tính
            </th>
            <td>
                Nam
                <input name="genre" type="radio" checked="checked" value="male" />
                Nữ
                <input name="genre" type="radio" value="female" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Dân tộc
            </th>
            <td>
                <input name="ethnic" type="text" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Tôn giáo
            </th>
            <td>
                <input name="religion" type="text" />
            </td>
            <td>
                <a href="#" class="quick_edit">
                    <img src="images/ico_edit_16.png" alt="" class="icon16 fl" title="Chỉnh sửa nhanh" /></a>
            </td>
        </tr>
        <tr>
            <th>
                Sinh nhật
            </th>
            <td>
                <input name="birthday" type="text" value="<%=DateTime.Now %>" />
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
    <!-- // New Profile -->
    <%} %>
</table>
<br />
<div class="tab-footer clear">
    <div class="fr">
        <% if (Request.QueryString["type"].ToString() == "editprofile")
           {%>
        <input type="submit" value="Lưu thay đổi" id="save" name="save" class="button" />
        <%} %>
        <% else if (Request.QueryString["type"].ToString() == "newprofile")
            {%>
        <input type="submit" value="Tạo mới" id="new" class="button" name="new" />
        <%} %>
        <input value="Quay về" id="back" class="button" />
    </div>
</div>
<% string notificatedMessage = string.Empty; %>
<!-- Update profile -->
<% if (Request.Form["save"] != null)
   {
       if (Request.QueryString["id"] != null)
       {
           if (UpdateProfile(ref notificatedMessage))
           {%>
<!-- NOTIFICATIONS (Thong bao)-->
<div class="notification note-success">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>
            <%=notificatedMessage %></strong></p>
</div>
<%}
           else
           {%>
<div class="notification note-error">
    <a href="#" class="close" title="Close notification">close</a>
    <p>
        <strong>
            <%=notificatedMessage %></strong></p>
</div>
<%} %>
<%} %>
<!-- Insert profile -->
<%}
   else if (Request.Form["new"] != null)
   {
       if (Request.QueryString["id"] != null)
       {
           int userId = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
           if (InsertProfile(userId, ref notificatedMessage))
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
</form>
