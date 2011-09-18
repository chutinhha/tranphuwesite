<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminGiaoVienList.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminGiaoVienList" %>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý thông
            tin Giáo viên</span>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Tạo mới" CssClass="button" 
            onclick="Button1_Click" />
    </p>
    <form method="post" action="#">
    <% 
        WebPortal.GiaoVien gvDA = new WebPortal.GiaoVien();
        List<WebPortal.Model.GiaoVien> list = gvDA.All();
    %>
    <table class="style1 datatable">
        <thead>
            <tr class="bSortable">
                <th>
                </th>
                <th>
                    ID
                </th>
                <th>
                    Họ 
                </th>
                <th>
                    Tên
                </th>
                <th>
                    Email
                </th>
                <th>
                    Điện thoại
                </th>
                <th>
                    Ảnh đại diện
                </th>
                <th>
                    Active
                </th>
                <th style="width: 150px">
                    Tool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (list != null)
                {
                    foreach (var gv in list)
                    { %>
            <tr>
                <td>
                </td>
                <td>
                    <%=gv.IDGiaoVien%>
                </td>
                <td>
                    <%=gv.HoGV%>
                </td>
                <td>
                    <%=gv.TenGV%>
                </td>
                <td>
                    <%=gv.Email%>
                </td>
                 <td>
                    <%=gv.DienThoai%>
                </td>
                <td>
                <%if (gv.AnhDaiDien != null)
                  {%>
                     <a href="<%= gv.AnhDaiDien %>"" title="preview" rel="group1">
                        <img src="<%= gv.AnhDaiDien %>" alt="" class="thumb size64 fl-space" />
                        </a>
                    <%}
                  else
                  {
                       %>
                        <a href="images/default_image.png" title="preview" rel="group1">
                        <img src="images/default_image.png" alt="" class="thumb size64 fl-space" />
                        </a>
                       <%} %>
                </td>
                <td>
                    <%=gv.Active.ToString()%>
                </td>
                <td>
                    <a href="AdminGiaoVienManager.aspx?id=<%=gv.IDGiaoVien %>&type=delete">
                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a> <a href="AdminGiaoVienManager.aspx?id=<%=gv.IDGiaoVien%>&type=edit">
                                <img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
                                    alt="" title="Chỉnh sửa" /></a>
                </td>
            </tr>
            <%} %>
            <%} %>
        </tbody>
    </table>
    </form>
</div>
