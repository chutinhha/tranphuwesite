<%@ Page Title="" Language="C#" MasterPageFile="~/FontendSite.Master" AutoEventWireup="true"
    CodeBehind="TrangChu.aspx.cs" Inherits="WebPortal.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        int id = Convert.ToInt32(Request.QueryString["idLTLV1"]);
        WebPortal.LoaiTin appLoaiTin = new WebPortal.LoaiTin();
        StringBuilder sb = new StringBuilder();
        List<WebPortal.Model.LoaiTin> listLoaiTin = appLoaiTin.ListNews(id);
        int rowperPage = 2;
        int totalrow = listLoaiTin.Count();
        int page = 1;
        if (Request.QueryString["page"] != null)
        {
            int output;
            if (int.TryParse(Request.QueryString["page"], out output))
            {
                page = output;
            }
        }


        listLoaiTin = appLoaiTin.Paging(page * rowperPage - rowperPage, rowperPage);

        double numOfPage = Math.Ceiling((double)totalrow / rowperPage);
        for (int i = 1; i <= numOfPage; i++)
        {
           
            sb.AppendFormat("<a href='TrangChu.aspx?idLTLV1=" + id + "&&page={0}'>{1}---</a>", i, i);
            //
        }
        //Libs.LibPager.GenerateLink(listLoaiTin.Count(),2, 1, 1, "TrangChu.aspx?idLTLV1='" + id + "'");
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
              int count = 0;
              foreach (WebPortal.Model.TinTuc tt in listtintuc)
              {
                  count++;
                  if (count == listLoaiTin.Count())
                  {
            %>
            <div class="tinTuc noneBorder">
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
                      else
                      { %>
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
                  } %>
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
    <%    Response.Write(sb.ToString());            %>
</asp:Content>
