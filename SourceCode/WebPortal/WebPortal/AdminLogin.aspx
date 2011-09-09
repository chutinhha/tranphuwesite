<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebPortal.AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="robots" content="ALL,FOLLOW" />
    <meta name="Author" content="AIT" />
    <meta http-equiv="imagetoolbar" content="no" />
    <title>THPT Trần Phú: Trang đăng nhập admin</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css" />
    <link rel="stylesheet" href="css/screen.css" type="text/css" />
    <link rel="stylesheet" href="css/fancybox.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery.ui.css" type="text/css" />
    <link rel="stylesheet" href="css/visualize.css" type="text/css" />
    <link rel="stylesheet" href="css/visualize-light.css" type="text/css" />
    <!--[if IE 7]>
	<link rel="stylesheet" type="text/css" href="css/ie7.css" />
<![endif]-->
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#form1").validate({
                 rules: {
                     username: {
                         required: true
                     },
                     password: {
                         required: true
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
                                ĐĂNG NHẬP</p>
                            <span class="text">TranPhu.com</span> </span>
                    </div>
                </div>
                <form id="form1" action="" method="post">
                <div class="login-inside">
                    <div class="login-data">
                        <div class="row clear">
                            <label for="user">
                                Tài khoản:</label>
                            <% if (Libs.LibCookie.Get(Libs.Constants.COOKIE_USERNAME) != null)
                               {
                           
                            %>
                            <input name="username" type="text" value="<%=Libs.LibCookie.Get(Libs.Constants.COOKIE_USERNAME) %>"
                                size="25" class="text" id="user" />
                            <%}
                               else
                               { %>
                            <input name="username" type="text" size="25" class="text" id="Text1" />
                            <%} %>
                        </div>
                        <div class="row clear">
                            <label for="password">
                                Mật khẩu:</label>
                            <% if (Libs.LibCookie.Get(Libs.Constants.COOKIE_USERPASS) != null)
                               {%>
                            <input name="password" type="password" value="<%=Libs.LibCookie.Get(Libs.Constants.COOKIE_USERPASS)%>"
                                size="25" class="text" id="password" />
                            <%}
                               else 
                               { %>
                            <input name="password" type="password" size="25" class="text" id="password1" />
                            <%} %>
                        </div>
                        <input name="login" type="submit" class="button" value="Đăng nhập" />
                    </div>
                </div>
                <div class="login-footer clear">
                    <span class="remember">
                        <input type="checkbox" class="checkbox" checked="checked" name="remember" />
                        <label for="remember">
                            Nhớ mật khẩu</label>
                    </span>
                </div>
                </form>
            </div>
        </div>
        <% if (Request.Form["username"] != null && Request.Form["password"] != null)
           {
               if (Request.Form["remember"].ToString() == "on")
               {
                   if (CheckLoginInfo(Request.Form["username"], Request.Form["password"], true))
                   {
                       Response.Redirect("AdminHomepage.aspx");
                   }
                   else if (CheckLoginInfo(Request.Form["username"], Request.Form["password"], false))
                   {%>
        <div class="notification note-error">
            <a href="#" class="close" title="Close notification">close</a>
            <p>
                <strong>Tên đăng nhập hoặc mật khẩu không đúng, xin vui lòng thử lại</strong></p>
        </div>
        <%}
                       }
        %>
        <%} %>

        <%if (Request.QueryString["logout"] == "1")
          {
              LogOut();
        } %>
    </div>
    <div class="login-links">
        <p>
            <strong>&copy; 2010 Copyright by <a href="">Groups from ITDLU</a></strong> All rights
            reserved.</p>
    </div>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.visualize.js"></script>
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
