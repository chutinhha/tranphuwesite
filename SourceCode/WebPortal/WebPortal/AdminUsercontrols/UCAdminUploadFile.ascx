<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminUploadFile.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminUploadFile" %>
<style type="text/css">
    .style4
    {
        width: 15%;
        height: 30px;
    }
 
</style>
<script type="text/javascript">
    function DeleteTaiNguyen(idTaiNguyen, idTinTuc) {
        window.location.href = "AdminNewsManager.aspx?idNews=" + idTinTuc + "&idTaiNguyen=" + idTaiNguyen;
    }
</script>
<div style="font-weight: bold; color: Black">
    <h3>
        Upload File đính kèm:</h3>
    <table width="100%">
        <tr>
            <td class="style4">
                ID Tin Tức:
            </td>
            <td>
                <%=Request.QueryString["idNews"]%>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Tên File:
            </td>
            <td>
                <asp:TextBox runat="server" ID="FileName" Width="71%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Mô tả:
            </td>
            <td style="height: 70px">
                <asp:TextBox runat="server" ID="summaryFile" Width="70%" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Upload File:
            </td>
            <td>
                <table>
                    <tr>
                        <td style="width: 50%">
                            <asp:FileUpload ID="FileUploadControl" runat="server" />
                            <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadFile_Click" />
                            <br />
                            <br />
                            <asp:Label runat="server" ID="StatusLabel" Text="" ForeColor="Red" Font-Bold="true" />
                            <asp:Label runat="server" ID="FileNameAttach" Text="" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:Button runat="server" ID="Add" Text="Sumit" OnClick="AddTaiNguyen_Click" />
                            <br />
                            <br />
                            <asp:Label runat="server" ID="StatusSaveChange" Text="" ForeColor="Red" Font-Bold="true" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <p>
                    <asp:Label ID="DeleteStatus" runat="server" Text="" Visible="false"></asp:Label>
                </p>
                <%if (DeleteStatus.Text == "Xóa thành công")
                  {%>
                <!-- NOTIFICATIONS (Thong bao)-->
                <div class="notification note-success">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>Xóa thành công</strong></p>
                </div>
                <%}
                  else if (DeleteStatus.Text == "Quá trình lưu xảy ra lỗi! Vui lòng thử lại.")
                  {%>
                <!-- NOTIFICATIONS (Thong bao)-->
                <div class="notification note-error">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>Lỗi xảy ra khi xóa! Vui lòng thử lại.</strong></p>
                </div>
                <%}
                %>
                <% List<WebPortal.Model.TaiNguyen> list = GetListTaiNguyenAttached(); %>
                <%if (list.Count > 0)
                  { %>
                <p style="text-align: center">
                    Danh sách các file đã Upload:</p>
                <table width="800px" class="style1">
                    <thead>
                        <tr>
                            <th style="width: 5%">
                                ID
                            </th>
                            <th style="width: 20%">
                                Tên Tài Nguyên
                            </th>
                            <th style="width: 25%">
                                Mô Tả
                            </th>
                            <th style="width:45%">
                                Path
                            </th>
                            <th style="width: 5%">
                                Xóa
                            </th>
                        </tr>
                    </thead>
                    <tbody style="font-weight: normal;">
                        <%foreach (WebPortal.Model.TaiNguyen tn in list)
                          { %>
                        <tr>
                            <td style="text-align: center;width:5%">
                                <%=tn.IDTaiNguyen %>
                            </td>
                            <td style="width: 20%">
                                <%=tn.TenTaiNguyen %>
                            </td>
                            <td style="width: 25%">
                                <%=tn.MoTa %>
                            </td>
                            <td style="width: 45%">
                                <%=tn.Path %>
                            </td>
                            <td style="width: 5%">
                                <% int idTaiNguyen = tn.IDTaiNguyen;
                                   string idTinTuc = Request.QueryString["idNews"];
                                %>
                                <a href="AdminNewsManager.aspx?type=attach&idNews=<%=idTinTuc %>&idTaiNguyen=<%=idTaiNguyen%>">
                                    <img alt="" src="../images/ico_delete_16.png" onclick="return confirm('Bạn có chắc chắn muốn xóa tin tài nguyên có mã <%=idTaiNguyen %>?')" /></a>
                            </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                <%} %>
            </td>
        </tr>
    </table>
</div>
