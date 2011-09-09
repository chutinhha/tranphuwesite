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


          listtintuc = apptintuc.Paging(page * rowperPage - rowperPage, rowperPage);

          double numOfPage = Math.Ceiling((double)totalrow / rowperPage);
          for (int i = 1; i <= numOfPage; i++)
          {

              sb.AppendFormat("<a href='News2.aspx?idLoaiTin="+idlt+"&&page={0}'>{1}---</a>", i, i);
              //
          }
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
                <img alt="" height="64" src="images/<%=tt.HinhAnh%>" width="102" /></div>
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
        <%--<div class="tinTuc noneBorder">
						<div class="tieuDe">Nullam tellus pede, eleifend posuere</div>
						<div class="timePost">Post by Admin 7:02 AM</div>
						<div class="hinhAnh">
						</div>
						<div class="noiDungTin">
							Nullam tellus pede, eleifend posuere, dignissim id, euismod vitae, tortor. Pellentesque vel mauris. 
							Phasellus dictum rutrum lectus. Vestibulum a risus at orci egestas condimentum. Morbi in turpis vel
							ante feugiat placerat. Vestibulum justo lacus.
							Phasellus dictum rutrum lectus. Vestibulum a risus at 
							ante feugiat placerat. Vestibulum justo lacus.

						</div>
						<div class="readmore"><a href="#">Xem tiếp</a></div>
					</div>		--%>
    </div>
    <!--end nội dung-->
    </div>
    <%} %>
</asp:Content>
