﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FontendSite.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="WebPortal.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%  int idtin = Libs.LibConvert.ConvertToInt(Request.QueryString["idTinTuc"],1);

        WebPortal.TinTuc app = new WebPortal.TinTuc();
        List<WebPortal.Model.TinTuc> listtintuc = new List<WebPortal.Model.TinTuc>();

        if (idtin != null)
        {
    %>
    <div class="titleBox">
        <%
WebPortal.Model.TinTuc tt = new WebPortal.Model.TinTuc();
tt = app.Single(idtin);
listtintuc = app.ListNews(tt.IDLoaiTin);
        %>
        <div class="title">
            <div class="titleGrad">
                <%
WebPortal.LoaiTin apploaitin = new WebPortal.LoaiTin();
WebPortal.Model.LoaiTin loaitin = apploaitin.Single(tt.IDLoaiTin);
Response.Write(loaitin.TenLoai);
                %>
            </div>
        </div>
        <div class="trangTin">
            <div class="tinTuc">
                <div class="tieuDe">
                    <%=tt.TenTinTuc %></div>
                <div style="margin-bottom: 40px;">
                    <div class="timePost">
                        Người gửi :<%= tt.NguoiDang+tt.NgayDang %></div>
                    
                </div>
                <div class="clear">
                </div>
                <%if (tt.HinhAnh != null)
                  { %>
                <div class="hinhAnh">
                    <img alt="" height="64px" src="<%=tt.HinhAnh%>" width="102px" /></div>
                <% } %>
                <div class="noiDungTin">
                <i><b><%=tt.MoTaTinTuc %></b></i>
                <br />
                    <%=tt.NoiDung %>
                </div>
               
            </div>
            <%
                List<WebPortal.Model.TaiNguyen_TinTuc> listTT = LayTaiNguyen_TinTuc(tt.IDTinTuc);
                if (listTT.Count > 0)
                { %>
            <div>
                Download file tại đây:<br />
                <%
                    foreach (WebPortal.Model.TaiNguyen_TinTuc tT in listTT)
                    {
                        WebPortal.Model.TaiNguyen taiNguyen = LayTaiNguyenTheoID(int.Parse(tT.IDTaiNguyen.ToString()));%>
                <div>
                    <%=taiNguyen.TenTaiNguyen %><br />
                    <%=taiNguyen.MoTa %><br />
                    <%=taiNguyen.Path %>
                </div>
                <p>
                </p>
                <% } %>
            </div>
            <% } %> <%} %>
            <div class="clear">
            </div>
            <div class="cacTinKhac">
                <div>
                    Các tin khác:</div>
                <ul>
                    <% foreach (WebPortal.Model.TinTuc tt in listtintuc)
                       { %>
                    <li><a href="News.aspx?idTinTuc=<%=tt.IDTinTuc %>">
                        <%=tt.TenTinTuc %></a></li>
                    <%} %>
                </ul>
            </div>
        </div>
        <!--end nội dung-->
    </div>

</asp:Content>
