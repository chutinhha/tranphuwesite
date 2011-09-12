<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminPermissionDetail.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.AdminPermissionDetail" %>
<form method="post" action="../AdminPermissionManager.aspx">
<p>
    <%if (Request.QueryString["type"].ToString() == "edit")
      { %>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Sửa thông tin
        Permisison</span>
    <%}
      else if (Request.QueryString["type"].ToString() == "delete")
      { %>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Bạn có muốn xóa
        thông tin của Permission này không?</span>
    <%}
      else
      {%>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Nhập thông tin
        để tạo Permission mới</span>
    <%} %>
</p>
<table class="style1">
    <%WebPortal.Repository.Permission permissionDA = new WebPortal.Repository.Permission(); %>
    <thead>
        <tr>
            <th>
                Thông số
            </th>
            <th class="full">
                Giá trị
            </th>
        </tr>
    </thead>
    <%  WebPortal.Model.Permission permission = permissionDA.Single(int.Parse(Request.QueryString["id"]));
        if (permission != null)
        {
            if (Request.QueryString["type"].ToString() == "edit")
            {
    %>
    <tbody>
        <tr>
            <th>
                Permission ID
            </th>
            <td>
                <input readonly="readonly" name="permissionID" type="text" value="<%=permission.PermissionID%>" />
            </td>
        </tr>
        <tr>
            <th>
                Name
            </th>
            <td>
                <input style="width:50%;" name="name" type="text" value="<%=permission.Name%>" />
            </td>
        </tr>
        <tr>
            <th>
                Description
            </th>
            <td>
                <input style="width:50%;" name="description" type="text" value="<%=permission.Descritption%>" />
            </td>
        </tr>
        <tr>
            <th>
               Permission ToString
            </th>
            <td>
                <input style="width:50%;" name="permissionToString" type="text" value="<%=permission.Permission_ToString%>" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <%if (permission.Active == true)
                  { %>
                <input name="active" type="checkbox" checked="checked" value="True" />
                <%}
                  else
                  {%>
                <input name="active" type="checkbox" value="False" />
                <%} %>
            </td>
        </tr>
    </tbody>
    <%}
            else if (Request.QueryString["type"].ToString() == "delete")
            {
    %>
    <tbody>
        <tr>
            <th>
                Permission ID
            </th>
            <td>
                <input readonly="readonly" name="permissionID" type="text" value="<%=permission.PermissionID%>" />
            </td>
        </tr>
        <tr>
            <th>
                Name
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="name" type="text" value="<%=permission.Name%>" />
            </td>
        </tr>
        <tr>
            <th>
                Description
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="description" type="text" value="<%=permission.Descritption%>" />
            </td>
        </tr>
        <tr>
            <th>
                Permission ToString
            </th>
            <td>
                <input style="width:50%;" disabled="disabled" name="permissionToString" type="text" value="<%=permission.Permission_ToString%>" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <%if (permission.Active == true)
                  { %>
                <input disabled="disabled" name="active" type="checkbox" checked="checked" />
                <%}
                  else
                  {%>
                <input disabled="disabled" name="active" type="checkbox" />
                <%} %>
            </td>
        </tr>
    </tbody>
    <%}
        }
        else if (Request.QueryString["type"].ToString() == "new")
        {
    %>
    <tbody>
        <tr>
            <th>
                Name
            </th>
            <td>
                <input style="width:50%;" name="name" type="text" />
            </td>
        </tr>
        <tr>
            <th>
                Description
            </th>
            <td>
                <input style="width:50%;" name="description" type="text" style="width: 50%" />
            </td>
        </tr>
        <tr>
            <th>
                Permission ToString
            </th>
            <td>
                <input style="width:50%;" name="permissionToString" type="text" style="width: 50%" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <input name="active" type="checkbox" checked="checked" value="True" />
            </td>
        </tr>
    </tbody>
    <%}%>
</table>
<div class="tab-footer clear">
    <div class="fr">
        <% if (Request.QueryString["type"].ToString() == "edit")
           {%>
        <input type="submit" value="Lưu thay đổi" id="save" name="save" class="button" />
        <%} %>
        <% else if (Request.QueryString["type"].ToString() == "new")
            {%>
        <input type="submit" value="Tạo mới" id="create" name="new" class="button" />
        <%}
            else
            { %>
        <input type="submit" value="Xóa" id="delete" name="delete" class="button" />
        <%} %>
        <input type="submit" value="Quay về trang chính" id="back" name="back" class="button" />
    </div>
</div>
<% if (Request.Form["save"] != null)
   {
       WebPortal.Model.Permission p = new WebPortal.Model.Permission();
       int isSuccess = 1;
       try
       {
           p.PermissionID = int.Parse(Request.Form["permissionID"]);
           p.Name = Request.Form["name"];
           p.Descritption = Request.Form["description"];
           p.Permission_ToString = Request.Form["permissionToString"];
           if (Request.Form["active"] != null)
           {
               p.Active = true;
           }
           else
               p.Active = false;
       }
       catch
       {
           isSuccess = 0;
       }
       if (isSuccess > 0)
           permissionDA.Update(p);
       Response.Redirect("AdminPermissionManager.aspx");
%>
<%}
   else if (Request.Form["back"] != null)
   {
       Response.Redirect("AdminPermissionManager.aspx");
   }
   else if (Request.Form["delete"] != null)
   {
       int permissionID = int.Parse(Request.Form["permissionID"]);
       permissionDA.Delete(permissionID);
       Response.Redirect("AdminPermissionManager.aspx");
   } if (Request.Form["new"] != null)
   {
       WebPortal.Model.Permission newP = new WebPortal.Model.Permission();

       try
       {
           newP.Name = Request.Form["name"];
           newP.Descritption = Request.Form["description"];
           newP.Permission_ToString = Request.Form["permissionToString"];
           if (Request.Form["active"] != null)
           {
               newP.Active = true;
           }
           else
               newP.Active = false;
           permissionDA.Add(newP);
       }
       catch
       {

           Response.Redirect("AdminPermissionManager.aspx");
       }
       Response.Redirect("AdminPermissionManager.aspx");
   }
%>
</form>
