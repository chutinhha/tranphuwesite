<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminGiaoVien_ChucVuManager.aspx.cs" Inherits="WebPortal.AdminGiaoVien_ChucVu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-box">
        <div class="box-body">
            <form method="post">
            <div class="box-header clear">
                <h2>
                    Admin Site</h2>
            </div>
            <div class="box-wrap clear">
                <p>
                    <b>Chọn tổ chức</b>
                    <asp:DropDownList runat="server" ID="ddlCVList" AutoPostBack="true">
                    </asp:DropDownList>
                </p>
                <% List<WebPortal.Model.GiaoVien> currentGVList = null;
                   if (ddlCVList.SelectedItem != null)
                   {
                       int cvID = Libs.LibConvert.ConvertToInt(ddlCVList.SelectedValue, 0);
                       var chucvu = chucvuRepository.Single(cvID);
                       currentGVList = this.giaovienRepository.GetAllGiaoVienBychucvuID(cvID);
                %>
                <table class="style1">
                    <tbody>
                        <tr>
                            <th>
                                Tên chức vụ
                            </th>
                            <td>
                                <%= chucvu.TenCV%>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Mô tả thông tin
                            </th>
                            <td>
                                <%= chucvu.MoTa%>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%}%>
                <div>
                    <%  List<WebPortal.Model.GiaoVien> gvList = giaovienRepository.All();%>
                    <div id="table">
                        <p>
                            <b>Danh sách giáo viên truy cập</b></p>
                        <table class="style1">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" class="checkbox select-all" />
                                    </th>
                                    <th>
                                        Họ và tên
                                    </th>
                                    <th>
                                        Ảnh đại diện
                                    </th>
                                    <th>
                                        Email
                                    </th>
                                    <th>
                                        Điện thoại
                                    </th>
                                    <th>
                                        Bộ môn
                                    </th>
                                    <th>
                                        Địa chỉ
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    foreach (var gv in gvList)
                                    {
                                %>
                                <tr>
                                    <td>
                                        <% if (IsInsideGiaoVienList(gv.IDGiaoVien, currentGVList))
                                           { %>
                                        <input name="gvs" type="checkbox" class="checkbox" value="<%=gv.IDGiaoVien %>" checked="checked" />
                                        <%}
                                           else
                                           { %>
                                        <input name="gvs" type="checkbox" class="checkbox" value="<%=gv.IDGiaoVien %>" />
                                        <%} %>
                                    </td>
                                    <td>
                                        <%=gv.HoGV+ " "+gv.TenGV %>
                                    </td>
                                    <td>
                                        <image src="<%=gv.AnhDaiDien %>" alt="" title="Hình ảnh" style="max-height: 100px;
                                            max-width: 100px; border: 1px solid #ccc" />
                                    </td>
                                    <td>
                                        <%=gv.Email %>
                                    </td>
                                    <td>
                                        <%=gv.DienThoai %>
                                    </td>
                                    <td>
                                        <%=gv.BoMon %>
                                    </td>
                                    <td>
                                        <%=gv.DiaChi %>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                        <div class="tab-footer clear">
                            <div class="fr">
                                <input type="submit" value="Lưu thay đổi" name="save" class="button" />
                            </div>
                        </div>
                    </div>
                    <!-- /#table -->
                </div>
            </div>
            <% if (Request.Form["save"] != null)
               {
                   List<int> gvIDList = new List<int>();
                   if (Request.Form["gvs"] != null)
                   {
                       string[] ids = Request.Form["gvs"].Split(',');
                       foreach (string s in ids)
                       {
                           gvIDList.Add(Libs.LibConvert.ConvertToInt(s, 0));
                       }
                       int cvID = Libs.LibConvert.ConvertToInt(this.ddlCVList.SelectedValue, 0);
                       if (cvgvRepository.DecentralizeChucVuWithGiaoVien(cvID, gvIDList))
                       {%>
            <div class="notification note-success">
                <a href="#" class="close" title="Close notification">close</a>
                <p>
                    <strong>Success notification:</strong> Lưu thay đổi thành công
                </p>
            </div>
            <%}
                       else
                       {%>
            <div class="notification note-error">
                <a href="#" class="close" title="Close notification">close</a>
                <p>
                    <strong>Error notification:</strong> Đã có lỗi xảy ra, vui lòng thử lại</p>
            </div>
            <%}
                   }
                   else
                   {
                       int cvID = Libs.LibConvert.ConvertToInt(this.ddlCVList.SelectedValue, 0);
                       if (cvgvRepository.DecentralizeChucVuWithGiaoVien(cvID, gvIDList))
                       {%>
            <div class="notification note-success">
                <a href="#" class="close" title="Close notification">close</a>
                <p>
                    <strong>Success notification:</strong> Lưu thay đổi thành công
                </p>
            </div>
            <%}
                       else
                       {%>
            <div class="notification note-error">
                <a href="#" class="close" title="Close notification">close</a>
                <p>
                    <strong>Error notification:</strong> Đã có lỗi xảy ra, vui lòng thử lại</p>
            </div>
            <%}
                   }
               }  %>
            </form>
        </div>
    </div>
    <% 
        WebPortal.Repository.Log.WriteLog(Request);
    %>
</asp:Content>
