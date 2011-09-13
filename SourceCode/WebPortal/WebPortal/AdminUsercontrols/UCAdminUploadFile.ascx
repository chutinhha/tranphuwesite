<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminUploadFile.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminUploadFile" %>

<style type="text/css">
    .style4
    {
        width: 15%;
        height:30px;
    }
  
</style>
<script type="text/javascript">
    function DeleteTaiNguyen(idTaiNguyen, idTinTuc) {
        window.location.href = "AdminNewsManager.aspx?idNews=" + idTinTuc + "&idTaiNguyen=" + idTaiNguyen;
    }
</script>
<div style="color: #000000">
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
            <td style="height:60px">
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
                            <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " ForeColor="Red"
                                Font-Bold="true" />
                            <asp:Label runat="server" ID="FileNameAttach" Text="" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:Button runat="server" ID="Add" Text="Sumit" OnClick="AddTaiNguyen_Click" />
                            <br />
                            <asp:Label runat="server" ID="StatusSaveChange" Text="" ForeColor="Red" Font-Bold="true" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                Danh sách các file đã Upload:
            </td>
            <td>
                <asp:Label ID="DeleteStatus" runat="server" Text="Delete Status:" Visible="true" ForeColor="Red" ></asp:Label>
                <br />
                <br />
                <% List<WebPortal.Model.TaiNguyen> list = GetListTaiNguyenAttached(); %>
                <%if (list != null)
                  { %>
                <table width="100%" id="Attack" class="style1">
                    <thead>
                        <tr style="background-image: url('../images/bg_button.png'); background-repeat: repeat-x;color:White">
                            <th style="width: 5%">
                                ID
                            </th>
                            <th style="width: 20%">
                                Tên Tài Nguyên
                            </th>
                            <th style="width: 25%">
                                Mô Tả
                            </th>
                            <th style="width: 45%">
                            Path
                            </th>
                            <th style="width: 5%">
                                Xóa
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (WebPortal.Model.TaiNguyen tn in list)
                          { %>
                        <tr>
                            <td style="text-align: center">
                                <%=tn.IDTaiNguyen %>
                            </td>
                            <td>
                                <%=tn.TenTaiNguyen %>
                            </td>
                            <td>
                                <%=tn.MoTa %>
                            </td>
                            <td>
                                <%=tn.Path %>
                            </td>
                            <td style="text-align:center">
                                 <% int idTaiNguyen = tn.IDTaiNguyen;
                                    string idTinTuc = Request.QueryString["idNews"];
                                 %>
                                 <img alt="" src="../images/ico_delete_16.png" onclick='DeleteTaiNguyen(<%=idTaiNguyen%>,<%=idTinTuc%>)' />
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
