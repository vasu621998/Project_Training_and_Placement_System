<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_company.aspx.cs" Inherits="Training_and_Placement_Portal.add_company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Add Company Datails</title>
</head>
<body class="grey lighten-3">
    <%
        Response.WriteFile("~/adminnav.html"); %>
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
    
     <div class="row ">
    <div class="container">
    <form id="form1" runat="server">
        
        <div>
			<h3>Add Comapany Details</h3>
		</div>
        <div class="row">
			<div class="input-field col s6">
				<i class="material-icons prefix">perm_identity</i>
				<asp:TextBox ID="cname" CssClass="validate"  runat="server" pattern="^[A-Za-z]{0,30}$" title="invalid format" required></asp:TextBox>&nbsp;<label>Comapany Name</label>
			</div>
		</div>
        <div class="row">
            <div class="input-field col s4  body-align:center;">
              	<i class="material-icons prefix ">contact_phone</i>
                <asp:TextBox ID="phone" runat="server" pattern="^[987]{1}[0-9]{9}$" title="invalid format" required></asp:TextBox>&nbsp;<label>Phone</label>
            </div>
        </div>
        <div class="row">
             <div class="input-field col s5 body-align:center;">
                 <i class="material-icons prefix ">email</i>
               	<asp:TextBox ID="email" CssClass="validate" runat="server" pattern="^([a-zA-Z0-9_\-\.]+)@[a-z]*[.]{1}[a-z]*)$" title="invalid format" required></asp:TextBox>&nbsp;<label>Email id</label>
          	</div>
        </div> 
        <div class="row">
            <div class="input-field col s3 body-align:center;">
                <i class="material-icons prefix ">add_location</i>
                <asp:TextBox ID="add" CssClass="validate" runat="server" required></asp:TextBox>&nbsp;<label>Location</label>
            </div>
            
            <asp:Button ID="adder" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Add" OnClick="adder_Click" />
        
        </div>
            <div class="row">
                	<div class="input-field col s3 body-align:center;">
                    	
                        <asp:DropDownList ID="locations" runat="server">
                        </asp:DropDownList>
                        &nbsp;<label>Batch</label>
                	</div>
            	</div> 
        <div class="row">
            <div class="input-field col s4 body-align:center;">
                <i class="material-icons prefix ">link</i>
               	<asp:TextBox ID="website" CssClass="validate" runat="server"></asp:TextBox>&nbsp;<label>Website</label>
         	</div>
        </div>
        <div class="row">
   			<div class="input-field col s12 body-align:center;">
                   <div class="input-field col s3 white-text">
               	       <asp:Button ID="submit" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Submit" OnClick="submit_Click" />
	                 </div>
            <div class="input-field col s3 white-text">
                  	<asp:Button ID="reset" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Reset" OnClick="reset_Click" />
            </div>
          </div>
            </div>
           
    </form>
    </div>
    </div>
</body>
</html>
