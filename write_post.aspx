<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="write_post.aspx.cs" Inherits="Training_and_Placement_Portal.write_post" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
     
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
</head>
<body class="grey lighten-3">
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
     <script>
        $(document).ready(function () {
            $(".button-collapse").sideNav();
        });
</script>
    <%
        string curr_userrole = (string)Session["user_role"];
        if (curr_userrole != "admin")
            Response.WriteFile("~/studentnav.html");
        %>

    <form id="form1" runat="server">
          <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
        <div class="center">
        </div>
         <div class="row">
                <div class="input-field col s3  body-align:center;">
                    <i class="material-icons prefix ">perm_identity</i>
                    <asp:TextBox ID="uuid" CssClass="validate" ReadOnly="true" runat="server"></asp:TextBox>&nbsp;<label >User ID</label>
                </div>
        </div>
        <div class="row">
                <div class="input-field col s6 body-align:center;">
                    <i class="material-icons prefix ">title</i>
                    <asp:TextBox ID="title" CssClass="validate" runat="server"></asp:TextBox>&nbsp;<label>Title</label>
                </div>
        </div>
        <div class="row">
                <div class="input-field col s3 body-align:center;">
                    <i class="material-icons prefix ">today</i>
                    <asp:TextBox ID="post_date" CssClass="validate" ReadOnly="true" runat="server"></asp:TextBox>&nbsp;<label>Date Created</label>
                </div>
            </div> 
        <i class="material-icons prefix ">description</i><label>Description</label>
        <div class="row">
                <div class="input-field col s6 body-align:center;">
                    
                    <asp:TextBox ID="des" CssClass="validate" runat="server" Height="200px" Rows="10" TextMode="MultiLine"></asp:TextBox>&nbsp;
                </div>
            </div>
        <asp:HtmlEditorExtender ID="ex1" TargetControlID="des" runat="server">
            <Toolbar>
                <asp:Bold />
                <asp:Italic />
                <asp:UnderLine />
                <asp:Undo />
                <asp:Redo />
                <asp:Cut />
                <asp:Copy />
                <asp:Paste />
                <asp:ForeColorSelector />
                <asp:FontNameSelector />
             
            </Toolbar>
          </asp:HtmlEditorExtender>
        <div class="row">
   			<div class="input-field col s12">
                   <div class="input-field col s3 white-text">
               	       <asp:Button ID="submit" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Post" OnClick="submit_Click" />
	                 </div>
                 
                    <div class="input-field col s3 white-text">
                  	    <asp:Button ID="dismiss" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Dismiss" OnClick="dismiss_Click"/>
                    </div>
           </div>
            </div>
    </form>
</body>
</html>
