<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminResetPass.aspx.cs" Inherits="WebPortal.AdminResetPass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="description"  content=""/>
<meta name="keywords" content=""/>
<meta name="robots" content="ALL,FOLLOW"/>
<meta name="Author" content="AIT"/>
<meta http-equiv="imagetoolbar" content="no"/>
<title>Khôi phục mật khẩu</title>

<link rel="stylesheet" href="css/reset.css" type="text/css"/>
<link rel="stylesheet" href="css/screen.css" type="text/css"/>
<link rel="stylesheet" href="css/fancybox.css" type="text/css"/>
<link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css"/>
<link rel="stylesheet" href="css/jquery.ui.css" type="text/css"/>
<link rel="stylesheet" href="css/visualize.css" type="text/css"/>
<link rel="stylesheet" href="css/visualize-light.css" type="text/css"/>
<!--[if IE 7]>
	<link rel="stylesheet" type="text/css" href="css/ie7.css" />
<![endif]-->
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    }
                }
            });
        });
    </script>	
</head>

<body class="login">

<div class="login-box">
<div class="login-border">
<div class="login-style">
                <div class="login-header">
                    <div class="logo clear">
                        <img src="images/logo_earth_bw.png" alt="" class="picture" />
                        <span class="textlogo">
                            <p style="color: White; font-family: Arial; font-size: 20px; font-weight: bold;">
                                Trang khôi phục mật khẩu/p>
                            <span class="text">TranPhu.com</span> </span>
                    </div>
                </div>
	<form action="AdminResetPass.aspx" method="post">
		
		<div class="login-inside">
			<div class="login-data" style="padding:5px;">
				<div class="row clear">
					<label for="user">Email:</label>
    					<input type="text" value="" size="45" class="text" name="email"/>
    				</div>
				<input type="submit" class="button" value="Khôi phục mật khẩu" />
			</div>
		</div>
		<div class="login-footer clear">
			<a href="#" class="button green fr-space">Back to Page</a>
		</div>
            <% if (Request.Form["email"] != null)
       {
           string notificatedMess = string.Empty;
           if (ResetPassword(Request.Form["email"].ToString(), ref notificatedMess))
           { %>
    <div class="notification note-success">
        <a href="#" class="close" title="Close notification">close</a>
        <p>
            <strong>
                <%=notificatedMess%></strong></p>
    </div>
    <%}
           else
           {%> 
                <div class="notification note-error">
        <a href="#" class="close" title="Close notification">close</a>
        <p>
            <strong>
                <%=notificatedMess%></strong></p>
    </div>
           <%}
       }%>
	</form>

</div>
</div>
</div>

<div class="login-links">
	<p><strong>&copy; 2010 Copyright by <a href="http://www.zonemafia.info/">ZONEMAFIA.INFO</a></strong> All rights reserved.</p> 
</div>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.visualize.js"></script>
<script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="js/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript" src="js/jquery.fancybox.js"></script>
<script type="text/javascript" src="js/jquery.idtabs.js"></script>
<script type="text/javascript" src="js/jquery.datatables.js"></script>
<script type="text/javascript" src="js/jquery.jeditable.js"></script>
<script type="text/javascript" src="js/jquery.ui.js"></script>
<script type="text/javascript" src="js/jquery.jcarousel.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>

<script type="text/javascript" src="js/excanvas.js"></script>
<script type="text/javascript" src="js/cufon.js"></script>
<script type="text/javascript" src="js/Zurich_Condensed_Lt_Bd.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-12958851-8']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>

</body>
</html>

