<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminNewsDetail.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminNewsDetail" %>

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
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý tin tức</span>
    </p>
    <form method="post" action="../HTMLPage1.htm">
    <% WebPortal.Model.TinTuc news = GetNewsFollowID(Convert.ToInt32(Request.QueryString["id"])); %>
   
    <div>
        <div>
            
        </div>
	    <div>			
            <textarea id="elm1" name="elm1" rows="15" cols="80" style="width: 100%">
				<%=news.NoiDung %>
		    </textarea>
		</div>
		<br />
		<input type="submit" name="save" value="Submit" />
		<input type="reset" name="reset" value="Reset" />
	</div>
    </form>
</div>
