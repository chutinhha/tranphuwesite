<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminGiaoVienDetail.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminGiaoVienDetail" %>
<form id="form1" method="post" action="../AdminGiaoVienManager.aspx">
<p>
    <%if (Request.QueryString["type"].ToString() == "edit")
      { %>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Sửa thông tin
        giáo viên</span>
    <%}
      else if (Request.QueryString["type"].ToString() == "delete")
      { %>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Bạn có muốn xóa
        thông tin của giáo viên này không?</span>
    <%}
      else
      {%>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Nhập thông tin
        để tạo giáo viên mới</span>
    <%} %>
</p>
<table class="style1">
    <%WebPortal.GiaoVien giaoVienDA = new WebPortal.GiaoVien(); %>
    <thead>
        <tr>
            <th>
                Thông số
            </th>
            <th class="full">
                Giá trị
            </th>
        </tr>
    </thead>
    <%  WebPortal.Model.GiaoVien giaoVien = giaoVienDA.Single(Libs.LibConvert.ConvertToInt(Request.QueryString["id"],0));
        if (giaoVien != null)
        {
            if (Request.QueryString["type"].ToString() == "edit")
            {
                
    %>
    <tbody>
        <tr>
            <th>
                ID
            </th>
            <td>
                <input style="width:50%;" readonly="readonly" name="giaoVienID" type="text" value="<%=giaoVien.IDGiaoVien%>" />
            </td>
        </tr>
        <tr>
            <th>
                Họ
            </th>
            <td>
                <input style="width:50%;" name="hoGV" type="text" value="<%=giaoVien.HoGV%>" />
            </td>
        </tr>
        <tr>
            <th>
                Tên
            </th>
            <td>
                <input style="width:50%;" name="tenGV" type="text" value="<%=giaoVien.TenGV%>" />
            </td>
        </tr>
        <tr>
            <th>
                Email
            </th>
            <td>
                <input style="width:50%;" name="email" type="text" value="<%=giaoVien.Email%>" />
            </td>
        </tr>
        <tr>
            <th>
                Điện thoại
            </th>
            <td>
                <input style="width:50%;" name="dienThoai" type="text" value="<%=giaoVien.DienThoai%>" />
            </td>
        </tr>
        <tr>
            <th>
                Bộ môn
            </th>
            <td>
                <input style="width:50%;" name="boMon" type="text" value="<%=giaoVien.BoMon%>" />
            </td>
        </tr>
        <tr>
            <th>
                Ngày Sinh
            </th>
            <td>
                <input style="width:50%;" name="ngaySinh" type="text" value="<%=Libs.LibConvert.ConvertToShortDateTime(giaoVien.NgaySinh)%>" />
            </td>
        </tr>
        <tr>
            <th>
                Ảnh đại diện
            </th>
            <td>
                <img src="<%=giaoVien.AnhDaiDien%>" alt="" class="thumb size64 fl-space" />
                <input style="width:50%;" id="File1" type="file" name="inputFile" runat="server" />
            </td>
        </tr>
        <tr>
            <th>
                Địa Chỉ
            </th>
            <td>
                <input style="width:50%;" name="diaChi" type="text" value="<%=giaoVien.DiaChi%>" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <%if (giaoVien.Active == true)
                  { %>
                <input name="active" type="checkbox" checked="checked" value="True" />
                <%}
                  else
                  {%>
                <input name="active" type="checkbox" value="False" />
                <%} %>
            </td>
        </tr>
    </tbody>
    <%}
            else if (Request.QueryString["type"].ToString() == "delete")
            {
    %>
    <tbody>
        <tr>
            <th>
                ID
            </th>
            <td>
                <input style="width:50%;" readonly="readonly" name="giaoVienID" type="text" value="<%=giaoVien.IDGiaoVien%>" />
            </td>
        </tr>
        <tr>
            <th>
                Họ
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="hoGV" type="text" value="<%=giaoVien.HoGV%>" />
            </td>
        </tr>
        <tr>
            <th>
                Tên
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="tenGV" type="text" value="<%=giaoVien.TenGV%>" />
            </td>
        </tr>
        <tr>
            <th>
                Email
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="email" type="text" value="<%=giaoVien.Email%>" />
            </td>
        </tr>
        <tr>
            <th>
                Điện thoại
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="dienThoai" type="text" value="<%=giaoVien.DienThoai%>" />
            </td>
        </tr>
        <tr>
            <th>
                Bộ môn
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="boMon" type="text" value="<%=giaoVien.BoMon%>" />
            </td>
        </tr>
        <tr>
            <th>
                Ngày Sinh
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="ngaySinh" type="text" value="<%=Libs.LibConvert.ConvertToShortDateTime(giaoVien.NgaySinh)%>" />
            </td>
        </tr>
        <tr>
            <th>
                Ảnh đại diện
            </th>
            <td>
                <img src="<%=giaoVien.AnhDaiDien%>" alt="" class="thumb size64 fl-space" />
            </td>
        </tr>
        <tr>
            <th>
                Địa Chỉ
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="diaChi" type="text" value="<%=giaoVien.DiaChi%>" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <%if (giaoVien.Active == true)
                  { %>
                <input disabled="disabled"  name="active" type="checkbox" checked="checked" value="True" />
                <%}
                  else
                  {%>
                <input disabled="disabled" name="active" type="checkbox" value="False" />
                <%} %>
            </td>
        </tr>
    </tbody>
    <%}
        }
        else if (Request.QueryString["type"].ToString() == "new")
        {
    %>
       <tbody>
        <tr>
            <th>
                Họ
            </th>
            <td>
                <input style="width:50%;" name="hoGV" type="text" value="" />
            </td>
        </tr>
        <tr>
            <th>
                Tên
            </th>
            <td>
                <input style="width:50%;" name="tenGV" type="text" value="" />
            </td>
        </tr>
        <tr>
            <th>
               Email
            </th>
            <td>
                <input style="width:50%;" name="email" type="text" value="" />
            </td>
        </tr>
          <tr>
            <th>
               Điện thoại
            </th>
            <td>
                <input style="width:50%;" name="dienThoai" type="text" value="" />
            </td>
        </tr>
         <tr>
            <th>
               Bộ môn
            </th>
            <td>
                <input style="width:50%;" name="boMon" type="text" value="" />
            </td>
        </tr>
         <tr>
            <th>
               Ngày Sinh
            </th>
            <td>
                <input style="width:50%;" name="ngaySinh" type="text" value="" />
            </td>
        </tr>
        <tr>
            <th>
                Ảnh đại diện
            </th>
            <td>
           <img src="" alt="" class="thumb size64 fl-space" />
            <input style="width:50%;" id="File2" type="file" name="inputFile" runat="server"/>
            </td>
        </tr>
        <tr>
            <th>
               Địa Chỉ
            </th>
            <td>
                <input style="width:50%;" name="diaChi" type="text" value="" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <input name="active" type="checkbox" value="False" />
            </td>
        </tr>
    </tbody>
    <%}%>
</table>
<div class="tab-footer clear">
    <div class="fr">
        <% if (Request.QueryString["type"].ToString() == "edit")
           {%>
        <input type="submit" value="Lưu thay đổi" id="save" name="save" class="button" />
        <%} %>
        <% else if (Request.QueryString["type"].ToString() == "new")
            {%>
        <input type="submit" value="Tạo mới" id="create" name="new" class="button" />
        <%}
            else
            { %>
        <input type="submit" value="Xóa" id="delete" name="delete" class="button" />
        <%} %>
        <input type="button" value="Quay về trang chính" id="back" name="back" class="button" />
    </div>
</div>
<% if (Request.Form["save"] != null)
   {
        string mess = "";
       if (UpdateGiaoVien(ref mess))
       {
            Response.Redirect("AdminGiaoVienManager.aspx");
       }
       else
       { %>
        <div class="notification note-error">
         <a href="#" class="close" title="Close notification">close</a>
         <p>
        <strong>
            <%=mess%></strong></p>
        </div>
       <%}
%>
<%}
   //else if (Request.Form["back"] != null)
   //{
   //    Response.Redirect("AdminGiaoVienManager.aspx");
   //}
   else if (Request.Form["delete"] != null)
   {
       string mess = "";
       if (DeleteGiaoVien(ref mess))
       {
            Response.Redirect("AdminGiaoVienManager.aspx");
       }
       else
       { %>
        <div class="notification note-error">
         <a href="#" class="close" title="Close notification">close</a>
         <p>
        <strong>
            <%=mess%></strong></p>
        </div>
       <%}
%>
<%
   } if (Request.Form["new"] != null)
   {
        string mess = "";
       if (AddGiaoVien(ref mess))
       {
            Response.Redirect("AdminGiaoVienManager.aspx");
       }
       else
       { %>
        <div class="notification note-error">
         <a href="#" class="close" title="Close notification">close</a>
         <p>
        <strong>
            <%=mess%></strong></p>
        </div>
       <%}
%>
<%
   }
%>
</form>
