<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminNewsList.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminNewsList" %>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý tin tức</span>
    </p>
    <form method="post" action="#">
    <% List<WebPortal.Model.TinTuc> list = GetAllNews(); %>
    <table class="style1 datatable">
        <thead>
            <tr>
                <th class="bSortable">
                    <input type="checkbox" class="checkbox select-all" />
                </th>
                <th style="width:5%;">
                    ID Tin Tuc
                </th>
                <th style="width:25%;">
                    Tên Tin Tức
                </th>
                <th style="width:15%;">
                    Ngày Dăng
                </th>
                <th style="width:15%;">
                    Người Dăng
                </th>
                <th style="width:20%;">
                    Hình ảnh
                </th>
                <th style="width:20%;">
                    Edit
                </th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (list != null)
                {
                    foreach (var news in list)
                    { %>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox" />
                </td>
                <td style="width:5%;">
                    <%=news.IDTinTuc %>
                </td>
                <td style="width:25%;">
                    <%=news.TenTinTuc %>
                </td>
                <td style="width:15%;">
                    <% 
                        string str = news.NgayDang.ToString();
                        if (str != "")
                        {
                            int po = str.IndexOf(' ');
                            str = str.Substring(0, po);
                        }                    
                     
                    %>
                    <%=str %>
                </td>
                 <td style="width:15%;">
                    <%=news.NguoiDang %>
                </td>
                <td style="width:20%;">
                    <img src='<%=news.HinhAnh%>' />
                </td>
                <td style="width:20%;">
                    <a href="AdminNewsManager.aspx?id=<%=news.IDTinTuc%>&type=new">
                        <img src="images/ico_edit_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Tạo mới" /></a> 
                    <a href="AdminNewsManager.aspx?id=<%=news.IDTinTuc %>&type=delete">
                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a>
                    <a href="AdminNewsManager.aspx?id=<%=news.IDTinTuc %>&type=edit">
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