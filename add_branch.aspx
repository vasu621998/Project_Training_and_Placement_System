<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_branch.aspx.cs" Inherits="Training_and_Placement_Portal.add_branch" %>

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
    
 
     
    <form id="form1" runat="server">
        <div><br /></div>
        <div class="center">
            <h3>Add Branch</h3>
        </div>
        <div class="center">
            <asp:Label ID="msg" runat="server" ForeColor="#ff0000" Font-Italic="true" Text=""></asp:Label>
        </div>
        <div class="row">
            <div class="col s4"></div>
			<div class="input-field col s3">
				<i class="material-icons prefix">language</i>
				<asp:TextBox ID="bname" CssClass="validate" placeholder="example: CE for computer branch" runat="server"></asp:TextBox>&nbsp;<label for="uname">Branch Name</label>
			</div>
		</div>
        <div class="row">
            <div class="col s4"></div>
			<div class="input-field col s3">
				<i class="material-icons prefix">perm_identity</i>
				<asp:TextBox ID="hod" CssClass="validate" placeholder="only initial" runat="server"></asp:TextBox>&nbsp;<label for="uname">Head of Department</label>
			</div>
		</div>
        <div class="row">
            <div class="col s5"></div>
           	<div class="input-field col s7 body-align:center;">
               <div class="input-field col s3 white-text">
                    <asp:LinkButton class="btn waves-effect waves-light grey darken-2" ID="add" runat="server" OnClick="add_Click">Add</asp:LinkButton>
                </div>
                
            </div>
        </div>
    </form>
         
</body>
</html>
