<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tmp.aspx.cs" Inherits="Training_and_Placement_Portal.tmp" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
    <title>Home</title>
     <style type="text/css">
         .auto-style1 {
             margin-right: 323px;
         }
              </style>
</head>
<body>
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
     <form id="form1" runat="server">
          <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
         <asp:Image ID="cap" runat="server" />     
         <asp:LinkButton ID="recap" runat="server" OnClick="recap_Click">recap</asp:LinkButton>
     </form>
</body>
</html>
