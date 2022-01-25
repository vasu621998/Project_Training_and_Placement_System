<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_schedule.aspx.cs" Inherits="Training_and_Placement_Portal.add_schedule" %>
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
     <style type="text/css">
         .auto-style1 {
             left: -2147483648px;
             top: 0;
         }
     </style>
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
    <div class="row"></div>

    <div class="container">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
        <div class="center">
            <h3>Details for Upcoming Company</h3>
        </div>
        <div class="row">
                <div class="input-field col s3 body-align:center;">
                    <i class="material-icons prefix "></i>
                    <asp:TextBox ID="cid" runat="server"></asp:TextBox><label>Company name</label>
                    <asp:AutoCompleteExtender ID="ex1" runat="server" TargetControlID="cid" ServiceMethod="mymethod" MinimumPrefixLength="2" CompletionSetCount="1"></asp:AutoCompleteExtender>
             
                </div>
        </div> 
        <div class="row">
                <div class="input-field col s3 body-align:center;">
                    <i class="material-icons prefix ">attach_money</i>
                    <asp:TextBox ID="pack" CssClass="validate" runat="server" pattern="^[0-9]{1,2}[.]{1}[0-9]{2}$" title="ex. :3.00, 15.30" required></asp:TextBox>&nbsp;<label>Package (in RS.)</label>
                </div>
         </div>
        <div class="row">
                <div class="input-field col s3 body-align:center;">
                    <i class="material-icons prefix ">date_range</i>
                    <asp:TextBox ID="visit_date" placeholder="dd-mm-yyyy" CssClass="validate" runat="server" required></asp:TextBox>&nbsp;<label>Visit Date</label>
                </div>
         </div> 
        <div class="row">
                <div class="input-field col s3 body-align:center;">
                    <i class="material-icons prefix ">date_range</i>
                    <asp:TextBox ID="deadline" placeholder="dd-mm-yyyy" CssClass="validate" runat="server" required></asp:TextBox>&nbsp;<label>Deadline For Registration</label>
                </div>
         </div>
        <div class="row">
                <div class="input-field col s3 body-align:center;">
                    <i class="material-icons prefix ">filter_none</i>
                    <asp:TextBox ID="min_cpi" placeholder="9.99" CssClass="validate" runat="server" pattern="^[0-9]{1}[.]{1}[0-9]{2}$" title="ex. :7.00, 8.30" required></asp:TextBox>&nbsp;<label>Minimum CPI required</label>
                </div>
         </div> 
        &nbsp;<label>Allow Backlog ?</label>
        <asp:RadioButtonList ID="backlog" runat="server">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
           <div class="row">
                <div class="input-field col s3 body-align:center;">
                    <i class="material-icons prefix "></i>
                    <asp:TextBox ID="vac" CssClass="validate" runat="server"></asp:TextBox>&nbsp;<label>Vacancy</label>
                </div>
         </div>         
         <div class="row">
                <div class="input-field col s4 body-align:center;">
                    <i class="material-icons prefix ">filter_none</i>
                    <asp:TextBox ID="hrname" CssClass="validate" runat="server"></asp:TextBox>&nbsp;<label>HR Name</label>
                </div>
         </div> 
        <div class="row">
                <div class="input-field col s5 body-align:center;">
                    <i class="material-icons prefix ">description</i>
                    <asp:TextBox ID="des" CssClass="validate" runat="server" TextMode="MultiLine" Height="200" Rows="10"></asp:TextBox>&nbsp;<label>Description</label>
                </div>
         </div>
        <div class="row">
   			<div class="input-field col s12 body-align:center;">
                   <div class="input-field col s3 white-text">
               	       <asp:Button ID="submit" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Next" OnClick="submit_Click"/>
	                 </div>
            <div class="input-field col s3 white-text">
                  	<asp:Button ID="reset" class="btn waves-effect waves-light grey darken-2" Visible="false" runat="server" Text="Reset"/>
            </div>
          </div>
            </div>
    </form>
        </div>
</body>
</html>
