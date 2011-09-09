<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminApplicationDetail.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminApplicationDetail" %>
<form method="post" action="../AdminApplicationManager.aspx">
<p>
    <%if (Request.QueryString["type"].ToString() == "edit")
      { %>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Sửa thông tin
        Application</span>
    <%}
      else if (Request.QueryString["type"].ToString() == "delete")
      { %>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Bạn có muốn xóa
        thông tin của Application này không?</span>
    <%}
      else
      {%>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Nhập thông tin
        để tạo Application mới</span>
    <%} %>
</p>
<table class="style1">
    <%WebPortal.Repository.Application applicationDA = new WebPortal.Repository.Application(); %>
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
    <%  WebPortal.Model.Application application = applicationDA.Single(int.Parse(Request.QueryString["id"]));
        if (application != null)
        {
            if (Request.QueryString["type"].ToString() == "edit")
            {
    %>
    <tbody>
        <tr>
            <th>
              ID
            </th>
            <td>
                <input readonly="readonly" name="applicationID" type="text" value="<%=application.ApplicationID%>" />
            </td>
        </tr>
        <tr>
            <th>
                Name
            </th>
            <td>
                <input name="name" type="text" value="<%=application.Application_Name%>" />
            </td>
        </tr>
        <tr>
            <th>
                Description
            </th>
            <td>
                <input name="description" type="text" value="<%=application.Application_Description%>" />
            </td>
        </tr>
        <tr>
            <th>
               FilePath
            </th>
            <td>
                <input name="filePath" type="text" value="<%=application.Application_FilePath%>" />
            </td>
        </tr>
        <tr>
            <th>
                Image
            </th>
            <td>
           <img src="<%=application.Application_Image%>" alt="" class="thumb size64 fl-space" />
            <input type="file" name="inputFile" runat="server"/>
            </td>
        </tr>
        <tr>
            <th>
               ToString
            </th>
            <td>
                <input name="applicationToString" type="text" value="<%=application.Application_ToString%>" />
            </td>
        </tr>
        <tr>
            <th>
               DataCreate
            </th>
            <td>
                <input name="dateCreate" type="text" value="<%=application.Application_DateCreate%>" />
            </td>
        </tr>
        <tr>
            <th>
               Parent ID
            </th>
            <td>
               <select name="slParentID">
                <%
                    List<string> lstName = new List<string>();
                    List<int> lstID = new List<int>();
                    applicationDA.GetAll_ApplicationID_Name(ref lstName,ref lstID);
                    for (int i = 0; i < lstName.Count; i++)
                    {
                        if (application.Parent_Id == lstID[i])
                        {
                      %>
                       <option selected="selected" id="<%= lstID[i]%>" value="<%= lstID[i]%>"><%= lstName[i]%></option>
                    <%}
                        else
                        { %>
                            <option id="<%= lstID[i]%>" value="<%= lstID[i]%>"><%= lstName[i]%></option>
                      <%  }
                    }
                     %>
                </select>
            </td>
        </tr>
        <tr>
            <th>
               Order
            </th>
            <td>
                <input name="order" type="text" value="<%=application.Order%>" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <%if (application.Active == true)
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
              ID
            </th>
            <td>
                <input readonly="readonly" name="applicationID" type="text" value="<%=application.ApplicationID%>" />
            </td>
        </tr>
        <tr>
            <th>
                Name
            </th>
            <td>
                <input disabled="disabled" name="name" type="text" value="<%=application.Application_Name%>" />
            </td>
        </tr>
        <tr>
            <th>
                Description
            </th>
            <td>
                <input disabled="disabled" name="description" type="text" value="<%=application.Application_Description%>" />
            </td>
        </tr>
        <tr>
            <th>
               FilePath
            </th>
            <td>
                <input disabled="disabled" name="filePath" type="text" value="<%=application.Application_FilePath%>" />
            </td>
        </tr>
        <tr>
            <th>
               Image
            </th>
            <td>
                <img src="<%=application.Application_Image%>" alt="" class="thumb size64 fl-space""/>
            </td>
        </tr>
        <tr>
            <th>
               DataCreate
            </th>
            <td>
                <input disabled="disabled" name="dateCreate" type="text" value="<%=application.Application_DateCreate%>" />
            </td>
        </tr>
        <tr>
            <th>
               ToString
            </th>
            <td>
                <input disabled="disabled" name="applicationToString" type="text" value="<%=application.Application_ToString%>" />
            </td>
        </tr>
         <tr>
            <th>
               Parent ID
            </th>
            <td>
               <select disabled="disabled" name="slParentID">
                <%
                    List<string> lstName = new List<string>();
                    List<int> lstID = new List<int>();
                    applicationDA.GetAll_ApplicationID_Name(ref lstName,ref lstID);
                    for (int i = 0; i < lstName.Count; i++)
                    {
                        if (application.Parent_Id == lstID[i])
                        {
                      %>
                       <option selected="selected" id="Option1" value="<%= lstID[i]%>"><%= lstName[i]%></option>
                    <%}
                        else
                        { %>
                            <option id="Option2" value="<%= lstID[i]%>"><%= lstName[i]%></option>
                      <%  }
                    }
                     %>
                </select>
            </td>
        </tr>
        <tr>
            <th>
               Order
            </th>
            <td>
                <input disabled="disabled" name="order" type="text" value="<%=application.Order%>" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <%if (application.Active == true)
                  { %>
                <input disabled="disabled" name="active" type="checkbox" checked="checked" value="True" />
                <%}
                  else
                  {%>
                <input disabled="disabled" name="active" type="checkbox" value="False" />
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
                <input name="name" type="text" value=""/>
            </td>
        </tr>
        <tr>
            <th>
                Description
            </th>
            <td>
                <input name="description" type="text" value="" />
            </td>
        </tr>
        <tr>
            <th>
               FilePath
            </th>
            <td>
                <input name="filePath" type="text" value="" />
            </td>
        </tr>
        <tr>
            <th>
                Image
            </th>
            <td>
            <input type="file" name="inputFile" value=""/>
            </td>
        </tr>
        <tr>
            <th>
               ToString
            </th>
            <td>
                <input name="applicationToString" type="text" value="" />
            </td>
        </tr>
         <tr>
            <th>
               Parent ID
            </th>
            <td>
               <select name="slParentID">
                <%
                    List<string> lstName = new List<string>();
                    List<int> lstID = new List<int>();
                    applicationDA.GetAll_ApplicationID_Name(ref lstName,ref lstID);
                    for (int i = 0; i < lstName.Count; i++)
                    {%>
                       <option id="<%= lstID[i]%>" value="<%= lstID[i]%>"><%= lstName[i]%></option>
                    <%
                    }
                     %>
                </select>
            </td>
        </tr>
        <tr>
            <th>
               Order
            </th>
            <td>
                <input name="order" type="text" value="" />
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
       string mess = "";
        UpdateApplication(ref mess); 
       Response.Redirect("AdminapplicationManager.aspx");
%>
<%}
   else if (Request.Form["back"] != null)
   {
       Response.Redirect("AdminapplicationManager.aspx");
   }
   else if (Request.Form["delete"] != null)
   {
       string note = "";
       DeleteApplication(ref note);
       Response.Redirect("AdminapplicationManager.aspx");
   } if (Request.Form["new"] != null)
   {
       WebPortal.Model.Application newP = new WebPortal.Model.Application();

       try
       {
           newP.Application_Name = Request.Form["name"];
           newP.Application_Name = Request.Form["description"];
           newP.Application_ToString = Request.Form["applicationToString"];
           if (Request.Form["active"] != null)
           {
               newP.Active = true;
           }
           else
               newP.Active = false;
           applicationDA.Add(newP);
       }
       catch
       {

           Response.Redirect("AdminapplicationManager.aspx");
       }
       Response.Redirect("AdminapplicationManager.aspx");
   }
%>
</form>