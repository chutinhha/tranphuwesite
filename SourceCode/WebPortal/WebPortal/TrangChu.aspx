<%@ Page Title="" Language="C#" MasterPageFile="~/FontendSite.Master" AutoEventWireup="true"
    CodeBehind="TrangChu.aspx.cs" Inherits="WebPortal.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
       
        WebPortal.LoaiTin appLoaiTin = new WebPortal.LoaiTin();       
        List<WebPortal.Model.LoaiTin> listLoaiTin = new List<WebPortal.Model.LoaiTin>();
        int rowperPage = 3;
        int page = 1;       
        listLoaiTin = appLoaiTin.Paging(page * rowperPage - rowperPage, rowperPage);       
        foreach (WebPortal.Model.LoaiTin lt in listLoaiTin)
        {%>
    <div class="titleBox">
        <div class="title">
            <div class="titleGrad">
                <a href="News2.aspx?idLoaiTin=<%=lt.IDLoaiTin.ToString()%>">
                    <%Response.Write(lt.TenLoai); %></a></div>
        </div>
        <div class="noiDung">
            <%WebPortal.TinTuc apptintuc = new WebPortal.TinTuc();
              List<WebPortal.Model.TinTuc> listtintuc = apptintuc.ListNews(lt.IDLoaiTin);
              int rowperPage2 = 2;
              int page2 = 1;
              listtintuc = apptintuc.Paging(page2 * rowperPage2 - rowperPage2, rowperPage2);  
              foreach (WebPortal.Model.TinTuc tt in listtintuc)
              {
                  
            %>
            <div class="tinTuc">
                <div class="tieuDe">
                    <a href="News.aspx?idTinTuc=<%=tt.IDTinTuc.ToString()%>">
                        <% Response.Write(tt.TenTinTuc); %></a>
                </div>
                <div class="timePost">
                    người đăng:<%Response.Write(tt.NguoiDang + "  " + tt.NgayDang); %></div>
                <div class="hinhAnh">
                    <img alt="" height="64" src="<%=tt.HinhAnh%>" width="102" /></div>
                <div class="noiDungTin">
                    <%Response.Write(tt.MoTaTinTuc);%>
                </div>
                <div class="readmore">
                    <a href="News.aspx?idTinTuc=<%=tt.IDTinTuc.ToString()%>">Xem tiếp</a></div>
                <div style="clear: both">
                </div>
            </div>
            <%
              }%>
                    
           
        </div>
        <!--end nội dung-->
    </div>
    <%} %>
   
</asp:Content>
