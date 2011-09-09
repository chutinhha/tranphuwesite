<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminUploadFile.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminUploadFile" %>
<style type="text/css">
    .style1
    {
        width: 15%;
    }
    .style2
    {
        border:1px solid black;
    }
 

</style>
<div style="color: #000000">
    <h3>
        Upload File đính kèm:</h3>
    <table width="100%">
        <tr>
            <td>
                ID Tin Tức:
            </td>
            <td>
                <%=Request.QueryString["idNews"]%>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Tên File:
            </td>
            <td>
                <asp:TextBox runat="server" ID="FileName" Width="71%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Mô tả:
            </td>
            <td>
                <asp:TextBox runat="server" ID="summaryFile" Width="70%" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
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
                <br />
                <% List<WebPortal.Model.TaiNguyen> list = GetListTaiNguyenAttached(); %>
                <%if (list != null)
                  { %>
                <table width="100%" style="border:1px solid black;background-color:" id="Attack">
                    <thead>
                        <tr style="background-color:silver">
                            <th class="style2">
                                ID
                            </th>
                            <th class="style2">
                                Tên Tài Nguyên
                            </th>
                            <th class="style2">
                                Mô Tả
                            </th>
                            <th class="style2">
                                Path
                            </th>
                            <th class="style2">
                                Edit
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (WebPortal.Model.TaiNguyen tn in list)
                          { %>
                        <tr>
                            <td class="style2">
                                <%=tn.IDTaiNguyen %>
                            </td>
                            <td class="style2">
                                <%=tn.TenTaiNguyen %>
                            </td>
                            <td class="style2">
                                <%=tn.MoTa %>
                            </td>
                            <td class="style2">
                                <%=tn.Path %>
                            </td>
                            <td class="style2">
                                <center>
                                    <a>
                                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                                            alt="" title="Delete" /></a></center>
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
