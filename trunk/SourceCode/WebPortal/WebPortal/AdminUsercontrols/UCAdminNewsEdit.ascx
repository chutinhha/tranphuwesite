<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminNewsEdit.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminNewsEdit" %>
<style type="text/css">
    .style1
    {
        width: 10%;
        height:40px;
        color:Black;
        font-weight:bold;
    }
    .style2
    {
        width: 90%;
    }
</style>
<script type="text/javascript" src="../js/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript">
        // Default skin
        tinyMCE.init({
            // General options
            mode: "exact",
            elements: "elm1",
            theme: "advanced",
            plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",

            // Theme options
            theme_advanced_buttons1: "newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
            theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
            theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: false,

            // Example content CSS (should be your site CSS)
            content_css: "css/content.css",

            // Drop lists for link/image/media/template dialogs
            template_external_list_url: "lists/template_list.js",
            external_link_list_url: "lists/link_list.js",
            external_image_list_url: "lists/image_list.js",
            media_external_list_url: "lists/media_list.js",

            // Replace values for the template plugin
            template_replace_values: {
                username: "Some User",
                staffid: "991234"
            }
        });
    </script>

    <!-- /TinyMCE -->
    <script type="text/javascript">
        function Visible_AttachFiles() {
            document.getElementById('AttachFiles').style.visibility = 'visible';
            document.getElementById('data-table').style.visibility = 'hidden';
        }
    </script>
<div id="data-table" style="visibility:visible">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Chỉnh sửa tin tức</span>
    </p>
 
    <div>
        <table width="97%">
            <tr>
                <td class="style1">
                    Loại Tin:
                    </td>
                <td class="style2"> 
                    &nbsp;<asp:DropDownList ID="dropDownListLoaiTin" runat="server" ></asp:DropDownList>
                </td>
            </tr>
                <tr>
                <td class="style1">
                    Tiêu Đề:
                    </td>
                <td class="style2"> 
                    <asp:TextBox ID="titleNews" Width="100%" runat="server" 
                        Text="Tiêu Để Của Tin Tức "></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Mô Tả:
                    </td>
                <td class="style2" style="height:60px;"> 
                    <asp:TextBox ID="summary" Width="100%" runat="server" TextMode="MultiLine" 
                        Height="40px"></asp:TextBox>
                </td>
            </tr>
                <tr>
                <td class="style1">
                    Hình Ảnh:
                    </td>
                <td class="style2"> 
                    <table>
                        <tr>
                            <td style="width:50%">
                                <asp:FileUpload id="FileUploadControl" runat="server" />
                                <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
                                <br /><br />
                                <asp:Label runat="server" id="StatusLabel" text="Upload status: " Font-Bold="true" ForeColor="Red"/>
                                <asp:Label runat="server" ID="PathLabel" Text="Path Image: " Visible="false" />
                            </td>
                            <td>
                                <asp:Image runat="server" id="ImageUpLoad" ImageUrl="#" />
                            </td>
                        </tr>
                    </table>                       
                </td>
            </tr>
        </table>
    </div>
</div>
<div>    
    <form method="post" action="UCAdminNewsCreate.ascx">  
	    <div style="width: 100%">			
            <textarea id="elm1" name="elm1" rows="15" cols="80" style="width: 100%;height:500px;">
                <%=LoadNoiDungTin()%>
		    </textarea>
		</div>
		<br />
  </form>
</div>
<div>
    <asp:Button ID="Save" Text="Lưu" runat="server" CssClass="button" onclick="Save_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="AttachFiles" Text="Chỉnh sửa đính kèm files" runat="server" CssClass="button"
        onclick="AttachFiles_Click"/>
    <br /><br />
    <asp:Label runat="server" ID="IDTinTuc" Text="" Visible="false"/>
    <br />
    <asp:Label runat="server" ID="SaveNews" Text="" ForeColor="Red" Font-Bold="true"/>
</div>
