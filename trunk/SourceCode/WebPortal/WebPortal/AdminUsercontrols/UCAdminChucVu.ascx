<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminChucVu.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminChucVu" %>
<style type="text/css">
   
    .style1
    {
        font-weight: bold;
    }
    .style2
    {
        font-weight: bold;
        font-size: large;
        text-align: center;
    }
</style>
<body style="text-align: left">
<div class="style2">
    Quản lý chức vụ</div>
<table 
    class="style1">
    <tr>
        <td>
            Tên 
            chức vụ :
        </td>
        <td>
            <asp:TextBox ID="txttenchucvu" runat="server" Width="601px" 
                 Height="27px"></asp:TextBox>
            
        </td>
        
    </tr>
    <tr>
        <td>
            Mô Tả :
        </td>
        <td>
            <asp:TextBox ID="txtmota" runat="server" Height="84px" Width="603px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan=2>
           
            <asp:Button ID="btnThem" runat="server" Text="Thêm" 
                style="text-align: center" onclick="btnThem_Click" Height="31px" 
                Width="98px" />
           
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                ID="btncapnhat" runat="server" Height="31px" Text="Cập nhật" Width="77px" 
                onclick="btncapnhat_Click" Visible="False" />
            &nbsp;&nbsp;
            <asp:Label ID="lbthongbao" runat="server" Text="Label" style="color: #FF0000" 
                Visible="False"></asp:Label>
           
        </td>
        
    </tr>
</table>
<br /><b>Danh sách các chức vụ :</b><p>
    &nbsp;</p>

   <asp:Repeater ID="Repeater1" runat="server" 
        onitemcommand="Repeater1_ItemCommand">
                <HeaderTemplate>
                    <table  class="style1 datatable">
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>
                                Tên chức vụ
                            </th>
                            <th>
                                Mô tả
                            </th>
                            <th>
                                Xử lý
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
               
                    <tr style=" text-align:left; height:28px;">
                        <td>
                       
                            <%#Eval("IDCV") %>
                          
                        </td>
                        <td>
                            <%#Eval("TenCV")%>
                        </td>
                        <td>
                            <%#Eval("MoTa")%>
                            
                        </td>
                       
                        <td>
                            <asp:LinkButton ID="Xoa" runat="server" CommandName="Xoa" CommandArgument='<%#Eval("IDCV")%>'> <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></asp:LinkButton> 
                            <asp:LinkButton ID="Sưa" runat="server" CommandName="Sua" CommandArgument='<%#Eval("IDCV")%>'><img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Chỉnh sửa" /></asp:LinkButton>
                          
                        </td>
                    </tr>  
                    <%--<%} %>--%>
                </ItemTemplate>
               
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

    <br />
    <asp:Label ID="Label1" runat="server" style="color: #FF0000" Text="Label" 
        Visible="False"></asp:Label>

<asp:HiddenField ID="idAn" runat="server" />

   