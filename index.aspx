<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Training_and_Placement_Portal.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
</head>
<body class="grey lighten-3">
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
        $(document).ready(function () {
            $('select').material_select();
        });
	</script>
     <div class="row grey darken-2">
         <div class="col s12 center white-text">
            <h3>Training and Placement Portal</h3>
        </div>    
     </div>
           
    <div class="center container">
        <div class="row">
            <div class="col s4 offset-s4">
        <form id="form1" runat="server">
            
            <div class="row" >
                <div class="col s12">
				    <h4>Login</h4>
                </div>
		    </div>
		    <div class="row">
                <div class="col s12">
                        <asp:Label ID="msg" runat="server" Font-Italic="True"></asp:Label>
			    </div>
		    </div>
            <div class="row">
            
                <div class="input-field col s12">
				    <i class="material-icons prefix">perm_identity</i>
				    <asp:TextBox ID="uname" CssClass="validate" runat="server" pattern="[A-Za-z0-9]*" title="Only Aphanumeric" required></asp:TextBox>&nbsp;<label >User ID</label>
			    </div>
            </div>
		    <div class="row">
                <div class="input-field col s12">
				    <i class="material-icons prefix">vpn_key</i>
				    <asp:TextBox ID="pwd" CssClass="validate" TextMode="Password" runat="server" required></asp:TextBox>&nbsp;<label for="pwd">Password</label>
			    </div>
            </div>
            <div class="row">
               <div class="input-field col s8 right">
                   <div class="input-field col s3 white-text">
                        <asp:Button class="btn waves-effect waves-light grey darken-2" ID="login" runat="server" Text="Login" OnClick="login_Click" />
                    </div>
                </div> 
                <div class="col s3"></div>
            </div>
            <div class="row">
                <div class="col s12 offset-s1">
                    &nbsp;</div>
              
            </div>
            
            
        </form>
            </div>
        </div>

     </div>
      <footer class="page-footer grey darken-2">
          <div class="footer-copyright">
              <div class="container center">

                  <p class="white-text">
                      copyright © 2018 by Institute.<br />
                All Rights Reserved.<br />
                No of Online User: <%= Application["total_user"].ToString() %>
            </p>
        </div>
    </div>
</footer>
</body>
</html>
