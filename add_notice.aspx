<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_notice.aspx.cs" Inherits="Training_and_Placement_Portal.add_notice" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
</head>
<body class="grey lighten-3">
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
		$(document).ready(function(){
			$('select').material_select();
		});
	</script>
    <script>
        $(document).ready(function () {
            $(".button-collapse").sideNav();
        });
</script>
   <% 
        Response.WriteFile("~/adminnav.html");
    %>


    <div class="container">
    <form id="form1" runat="server">
         <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
        <div class="center">
            <h3>Create Notice</h3>
        </div>
        <div class="row">
                <div class="input-field col s3  body-align:center;">
                    <i class="material-icons prefix ">perm_identity</i>
                    <asp:TextBox ID="uuid" CssClass="validate" ReadOnly="true" runat="server"></asp:TextBox>&nbsp;<label >User ID</label>
                </div>
        </div>
        <div class="row">
                <div class="input-field col s12 body-align:center;">
                    <i class="material-icons prefix ">title</i>
                    <asp:TextBox ID="title" CssClass="validate" runat="server"></asp:TextBox>&nbsp;<label>Title</label>
                </div>
        </div>
        <div class="row">
                <div class="input-field col s12 body-align:center;">
                    <i class="material-icons prefix ">today</i>
                    <asp:TextBox ID="notice_date" CssClass="validate" ReadOnly="true" runat="server"></asp:TextBox>&nbsp;<label>Date Created</label>
                </div>
            </div> 
        <i class="material-icons prefix ">description</i><label>Description</label>
        <div class="row">
                <div class="input-field col s12 body-align:center;">
                    
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
                <div class="input-field col s12 body-align:center;">
                    <i class="material-icons prefix ">today</i>
                    <asp:TextBox ID="exp_date" CssClass="validate" runat="server"></asp:TextBox>
                    &nbsp;<label>Expiry Date</label>
                </div>
            </div>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" Width="285px">
            <asp:ListItem>Send as mail</asp:ListItem>
        </asp:CheckBoxList>
        <label>Select Batch for sending mail</label>
        <asp:CheckBoxList ID="batch" runat="server"></asp:CheckBoxList> 
         <div class="row">
   			<div class="input-field col s12">
                   <div class="input-field col s3 white-text">
               	       <asp:Button ID="submit" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Submit" OnClick="submit_Click" />
	                 </div>
                 
                    <div class="input-field col s3 white-text">
                        <asp:HyperLink ID="cancel" class="btn waves-effect waves-light grey darken-2" NavigateUrl="~/home.aspx" runat="server">Cancel</asp:HyperLink>
                    </div>
           </div>
            </div>
    </form>
        </div>
</body>
</html>
