<%@ Page Title="" Language="C#" MasterPageFile="~/FontendSite.Master" AutoEventWireup="true"
    CodeBehind="News2.aspx.cs" Inherits="WebPortal.News2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titleBox">
        <% int idlt = int.Parse(Request.QueryString["idLoaiTin"]);
            
           if (idlt != null)
           {
               WebPortal.LoaiTin appLoaiTin = new WebPortal.LoaiTin();
               WebPortal.Model.LoaiTin lt = appLoaiTin.Single(idlt);
               
        %>
        <div class="title">
            <div class="titleGrad">
                
                    <%Response.Write(lt.TenLoai); %>
        </div>
    </div>
    <div class="noiDung">
        <%WebPortal.TinTuc apptintuc = new WebPortal.TinTuc();
          List<WebPortal.Model.TinTuc> listtintuc = apptintuc.ListNews(lt.IDLoaiTin);
          StringBuilder sb = new StringBuilder();
          int rowperPage = 2;
          int totalrow = listtintuc.Count();
          int page = 1;
          if (Request.QueryString["page"] != null)
          {
              int output;
              if (int.TryParse(Request.QueryString["page"], out output))
              {
                  page = output;
              }
          }


          List<WebPortal.Model.TinTuc> listTT = apptintuc.Paging(page * rowperPage - rowperPage, rowperPage, listtintuc);

          double numOfPage = Math.Ceiling((double)totalrow / rowperPage);
          for (int i = 1; i <= numOfPage; i++)
          {

              sb.AppendFormat("<a href='News2.aspx?idLoaiTin="+idlt+"&&page={0}'>{1}---</a>", i, i);
              //
          }
          foreach (WebPortal.Model.TinTuc tt in listTT)
          {
        %>
        <div class="tinTuc">
            <div class="tieuDe">
                <a href="News.aspx?idTinTuc=<%=tt.IDTinTuc.ToString()%>">
                    <% Response.Write(tt.TenTinTuc); %></a>
            </div>
            <div class="timePost">
                người đăng:<%Response.Write(tt.NguoiDang + "  " + tt.NgayDang); %></div>
                 <%if (tt.HinhAnh != null)
                   { %>
            <div class="hinhAnh">
                <img alt="" height="64" src="Resources/Images/<%=tt.HinhAnh%>" width="102" /></div><%} %>
            <div class="noiDungTin">
                <%Response.Write(tt.MoTaTinTuc);%>
            </div>
            <div class="readmore">
                <a href="News.aspx?idTinTuc=<%=tt.IDTinTuc.ToString()%>">Xem tiếp</a></div>
            <div style="clear: both">
            </div>
        </div>
        <%}
            Response.Write(sb.ToString()); %>
      
    </div>
    <!--end nội dung-->
    </div>
    <%} %>
</asp:Content>
