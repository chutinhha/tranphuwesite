<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminTaiNguyenList.ascx.cs"
    Inherits="WebPortal.UCAdminTaiNguyenList" %>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý tài nguyên</span>
    </p>
    <form method="post" action="#">
    <% List<WebPortal.Model.TaiNguyen> list = GetAll(); %>
    <table class="style1 datatable">
        <thead>
            <tr>
                <th style="width: 5%;">
                    ID
                </th>
                <th style="width: 25%;">
                    Tên tài nguyên
                </th>
                <th style="width: 20%;">
                    Path
                </th>
                <th style="width: 20%;">
                    Delete
                </th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (list != null)
                {
                    foreach (var taiNguyen in list)
                    { %>
            <tr>
                <td style="width: 5%;">
                    <%=taiNguyen.IDTaiNguyen%>
                </td>
                <td style="width: 25%;">
                    <%=taiNguyen.TenTaiNguyen%>
                </td>
                <td style="width: 20%;">
                    <%=taiNguyen.Path%>
                </td>
                <td style="width: 20%;">
                 <a href="../AdminTaiNguyen.aspx?id=<%=taiNguyen.IDTaiNguyen%>&type=delete" onclick='return confirm("Bạn có muốn xóa không?")' >
                    <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a>
                </td>
            </tr>
            <%} %>
            <%} %>
        </tbody>
    </table>
    </form>
    <a href="../AdminTaiNguyen.aspx?id=-1&type=new">
        <input type="button" value="Tạo Mới" class="button" /></a>
</div>
