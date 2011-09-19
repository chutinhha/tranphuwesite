<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCToChuc.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCToChuc" %>

<body style="text-align: left">

     <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản Lý Tổ Chức</span>
<table 
    class="style1">
    <tr>
        <td>
            Tên Tổ Chức :
        </td>
        <td>
            <asp:TextBox ID="txttentochuc" runat="server" Width="601px" 
                ontextchanged="txttentochuc_TextChanged" Height="27px"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                BorderColor="#CC0000" ControlToValidate="txttentochuc" 
                ErrorMessage="Bạn hãy điền tên tổ chức" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            
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
<br />
    
        <b>Danh sách các tổ chức :</b>
    <p>
        &nbsp;</p>
   <asp:Repeater ID="Repeater1" runat="server" 
        onitemcommand="Repeater1_ItemCommand">
                <HeaderTemplate>
                    <table  class="style1">
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>
                                Tên tổ chức
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
                       
                            <%#Eval("IDToChuc") %>
                          
                        </td>
                        <td>
                            <%#Eval("TenTC")%>
                        </td>
                        <td>
                            <%#Eval("MoTa")%>
                            
                        </td>
                       
                        <td>
                            <asp:LinkButton ID="Xoa" runat="server" CommandName="Xoa" CommandArgument='<%#Eval("IDToChuc")%>'> <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></asp:LinkButton> 
                            <asp:LinkButton ID="Sưa" runat="server" CommandName="Sua" CommandArgument='<%#Eval("IDToChuc")%>'><img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
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
</body>