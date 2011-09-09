<%@ Page Title="" Language="C#" MasterPageFile="~/FontendSite.Master" AutoEventWireup="true"
    CodeBehind="ToChuc.aspx.cs" Inherits="WebPortal.ToChuc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titleBox">
        <div class="title">
            <div class="titleGrad">
                <%=tc.TenTC%></div>
        </div>
        <div class="danhSachTin">
            <%
                foreach (WebPortal.Model.ToChuc_GiaoVien tcgv in list)
              {
                  int count = 0;
                  string chucvu = "";
                  WebPortal.GiaoVien appgv = new WebPortal.GiaoVien();
                  WebPortal.ChucVu_GiaoVien appChucVuGV = new WebPortal.ChucVu_GiaoVien();
                  WebPortal.ChucVu appChucVu = new WebPortal.ChucVu();
                  WebPortal.Model.GiaoVien gv;
                 List<WebPortal.Model.ChucVu_GiaoVien> cvGV=new List<WebPortal.Model.ChucVu_GiaoVien>();
                  WebPortal.Model.ChucVu cv;
                  gv = appgv.Single(Convert.ToInt32(tcgv.IDGiaoVien));


                  cvGV = appChucVuGV.chucvu(Convert.ToInt32(tcgv.IDGiaoVien));
                  foreach (WebPortal.Model.ChucVu_GiaoVien gv1 in cvGV)
                  {
                      count++;
                      WebPortal.Model.ChucVu cVu = appChucVu.Single(Convert.ToInt32(gv1.IDChucVu));
                      if(count==cvGV.Count)
                     chucvu+= cVu.TenCV.ToString();
                      else
                      chucvu += cVu.TenCV.ToString() + "_ ";
                      
                  }
                
                  
            %>
            <div class="avatar">
                <div class="hinhAvatar">
                    <img alt="" height="239" src="images/<%=gv.AnhDaiDien %>" width="165" />
                </div>
            </div>
            <!--end avatar-->
            <div class="thongTinCaNhan">
                <table style="width: 450px">
                    <tr>
                        <td class="tieuDeTTCaNhan">
                            Chức vụ :
                        </td>
                        <td>
                            <%=chucvu%>
                        </td>
                    </tr>
                    <tr>
                        <td class="tieuDeTTCaNhan">
                            Họ và tên :
                        </td>
                        <td>
                            <%=gv.HoGV+gv.TenGV %>
                        </td>
                    </tr>
                    <tr>
                        <td class="tieuDeTTCaNhan">
                            Bộ môn :
                        </td>
                        <td>
                            <%=gv.BoMon %>
                        </td>
                    </tr>
                    <tr>
                        <td class="tieuDeTTCaNhan" style="height: 20px">
                            Số điện thoại:&nbsp;&nbsp;
                        </td>
                        <td style="height: 20px">
                            <%=gv.DienThoai %>
                        </td>
                    </tr>
                    <tr>
                        <td class="tieuDeTTCaNhan">
                            Địa chỉ:
                        </td>
                        <td>
                            <%=gv.DiaChi %>
                        </td>
                    </tr>
                    <tr>
                        <td class="tieuDeTTCaNhan">
                            Email:
                        </td>
                        <td>
                            <%=gv.Email %>
                        </td>
                    </tr>
                    <tr>
                        <td class="tieuDeTTCaNhan">
                            Ngày sinh:
                        </td>
                        <td>
                            <%=gv.NgaySinh %>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear">
            </div>
            <hr />
            <%} %>
        </div>
        <!--end nội dung-->
    </div>
</asp:Content>
