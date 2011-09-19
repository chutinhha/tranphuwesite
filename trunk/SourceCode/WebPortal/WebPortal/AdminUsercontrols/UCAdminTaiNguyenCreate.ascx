<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminTaiNguyenCreate.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminTaiNguyenCreate" %>

<style type="text/css">
    .style1
    {
        width: 10px;
    }
</style>

<div id="data-table" style="visibility:visible">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Thêm tài nguyên</span>
    </p>
 
    <div>
        <table width="97%">
                <tr>
                <td class="style1">
                    Tên tài nguyên:
                    </td>
                <td class="style2"> 
                    <asp:TextBox ID="txtTenTN" Width="98%" runat="server" 
                        Text=""></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtTenTN" ForeColor="Red" 
                        Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="style1">
                    Mô Tả:
                    </td>
                <td class="style2" style="height:60px;"> 
                    <asp:TextBox ID="txtMoTa" Width="97%" runat="server" TextMode="MultiLine" 
                        Height="40px"></asp:TextBox>
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtMoTa" ForeColor="Red" 
                        Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
                <tr>
                <td class="style1">
                    File upload:
                    </td>
                <td class="style2"> 
                    <table>
                        <tr>
                            <td style="width:50%">
                                <asp:FileUpload id="FileUploadControl" runat="server" />
                                <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
                                <br /><br />
                                <asp:Label runat="server" ID="PathLabel" Text="" Visible="false" />
                                <br />
                                <asp:Label runat="server" ID="lblThongBao" Text="" ForeColor="Red" Font-Bold="true"/>
                            </td>
                           
                            <td>
                                <asp:Image Width=300px Height=150px runat="server" id="ImageUpLoad" 
                                    ImageUrl="#" />
                            </td>
                        </tr>
                    </table>                       
                </td>

            </tr>
        </table>
    </div>
</div>
<div>
    <asp:Button ID="btnLuu" Text="Lưu" runat="server"  CssClass="button" 
        onclick="btnLuu_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="btnHuy" runat="server" onclick="btnHuy_Click" Text="Hủy" CssClass="button" />
    <br /><br />
    <asp:Label runat="server" ID="lblIDTN" Text="" Visible="false"/>
    <br />
    <asp:Label runat="server" ID="lblLuu" Text="" ForeColor="Red" Font-Bold="true"/>
</div>