<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminNewsList.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminNewsList" %>
<%--<script type="text/javascript">
    function DeleteClick(str) {
        var xmlhttp1;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp1 = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp1 = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp1.onreadystatechange = function () {
            if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200) {
                kq = xmlhttp1.responseText;
                alert(kq);
                window.location.href = "AdminNewsManager.aspx";
            }
        }
        xmlhttp1.open("GET", str, true);
        xmlhttp1.send();
    }
</script>--%>

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
                    ID
                </th>
                <th style="width:25%;">
                    Tên tin tức
                </th>
                <th style="width:15%;">
                    Ngày đăng
                </th>
                <th style="width:15%;">
                    Người đăng
                </th>
                <th style="width:20%;">
                    Hình ảnh
                </th>
                <th style="width:20%;">
                    Chỉnh sửa
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
                    <img src='<%=news.HinhAnh%>' alt="" class="thumb size64 fl-space"/>
                </td>
                <td style="width:20%;">
                    <a href="AdminNewsManager.aspx?id=<%=news.IDTinTuc %>&type=delete" >
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
    <a href="AdminNewsManager.aspx?id=-1&type=new">
    <input type="button" value="Tạo Mới" class="button"/></a>  
</div>
﻿
