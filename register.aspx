<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Training_and_Placement_Portal.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Register User</title>
    </head>
<body class="grey lighten-3">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
		$(document).ready(function(){
			$('select').material_select();
		});
	</script>
   
	
	
   
	<div class="container">	
        <div class="row">
            <div class="col s3">
                    If Already User then..<a href="index.aspx" class="left" style="color:green;">Click here..!</a>
            </div>
        </div>
    <form id="form1" runat="server">
        <div class="center">
            	<h4>Register</h4>
        </div>
        <div class="row">
            <asp:Label ID="msg" runat="server" Font-Italic="true" ForeColor="Red" Text=""></asp:Label>
        </div>
			<div class="grey darken-2 white-text">
			<p style="padding:1px;">&nbsp;Fill the Form:</p>
			</div>
        <div class="row"></div>
        <div class="row">
                <div class="input-field col s3  body-align:center;">
                    <i class="material-icons prefix ">perm_identity</i>
                    <asp:TextBox ID="fname" class="validate" runat="server" pattern="[A-Za-z]{3,12}" title="Only alphabate length(3-12)" required></asp:TextBox>&nbsp;<label for="icon_prefix">First Name</label>
                </div> 
                <div class="input-field col s3">   
        	        <asp:TextBox ID="mname" class="validate" runat="server" pattern="[A-Za-z]{3,12}" title="Only alphabate length(3-12)" required></asp:TextBox>&nbsp;<label  for="icon_prefix">Middle Name</label>
                </div> 
                <div class="input-field col s3">  
                 	<asp:TextBox ID="lname" class="validate" runat="server" pattern="[A-Za-z]{3,12}" title="Only alphabate length(3-12)" required></asp:TextBox>&nbsp;<label for="icon_prefix">Last Name</label>
                </div>
           </div>
            <div class="row">
					<div class="input-field col s6  body-align:center;">
                    
     					 
        						<label>Profile image</label>
                                <asp:FileUpload ID="image" runat="server" />
                            &nbsp;

                        </div>
      						
              </div>
            <div class="row">
                	<div class="input-field col s3  body-align:center;">
                    	<i class="material-icons prefix ">contact_phone</i>
                        <asp:TextBox ID="mobile" class="validate" runat="server" pattern="[987]{1}[0-9]{9}" title="Invalid format" required></asp:TextBox>&nbsp;<label >Mobile</label>
                	</div>
                	
            </div>
            	<div class="row">
                	<div class="input-field col s5 body-align:center;">
                    	<i class="material-icons prefix ">email</i>
                        <asp:TextBox ID="email" class="validate" AutoPostBack="true" OnTextChanged="email_TextChanged" runat="server"  pattern="^([a-zA-Z0-9_\-\.]+)@((gmail.com)|(yahoo.com))$" title="Only alphabate length(3-12)" required></asp:TextBox>&nbsp;<label>Email</label>
                	</div>
                    <div class="input-field col s2 body-align:center;">
                        <asp:TextBox ID="otp" placeholder="enter received OTP on email" MaxLength="4" class="validate" runat="server"></asp:TextBox>&nbsp;<label>OTP</label>
                	</div>
            	</div> 
        <div class="row">
                <div class="input-field col s3  body-align:center;">
                    <i class="material-icons prefix ">today</i>
                    <asp:TextBox ID="dob" ToolTip="dd-mm-yyyy" placeholder="dd-mm-yyyy" runat="server" required></asp:TextBox>
                    &nbsp;<label  for="icon_prefix">Birthdate</label>
			   </div>
            </div>
        <div class="row">
                	<div class="input-field col s1 body-align:center;">
                    	
                        <asp:DropDownList ID="batch" runat="server">
                        </asp:DropDownList>
                        &nbsp;<label>Batch</label>
                	</div>
                   <div class="col s1"></div>
                    <div class="input-field col s1 body-align:center;">
                    	
                        <asp:DropDownList ID="branch" runat="server">
                        </asp:DropDownList>
                        &nbsp;<label>Branch</label>
                	</div><div class="col s1"></div>
                <div class="input-field col s1">
                    	
                        <asp:TextBox ID="rollno" class="validate" runat="server" pattern="^[A-Z]{2}\d{3}$" title="ex. :CE001" required></asp:TextBox>&nbsp;<label>Roll No</label>
                	</div>
            	</div> 
        
       
        <div class="row">
                	<div class="input-field col s1">
                    	
                        <asp:TextBox ID="cpi" class="validate" runat="server"  title="ex. :7.00, 8.30" required></asp:TextBox>&nbsp;<label >CPI</label>
                	</div>
            <div class="col s1"></div>
                	<div class="col s3">
                            <label class="center">Any Backlog</label>	
                     <asp:RadioButtonList ID="backlog" runat="server">
	               
	                     <asp:ListItem>Yes</asp:ListItem>

	                  <asp:ListItem>No</asp:ListItem>
                   
                    </asp:RadioButtonList>
                	</div>
            </div>
        
                    

        <div class="row">
              <div class="input-field col s4">
                <i class="material-icons prefix">vpn_key</i>
                  <asp:TextBox ID="pwd" CssClass="validate" TextMode="Password" runat="server" pattern="[A-Za-z0-9~!@#$%^&*()_+]{8,15}" title="Length 8 to 10 , valid from alphanumeric and some special characters" required></asp:TextBox>&nbsp;<label for="pwd">Password</label>
              </div>
              <div class="input-field col s4">
                  <asp:TextBox ID="pwd1" CssClass="validate" TextMode="Password" runat="server"></asp:TextBox>&nbsp;<label for="pwd">Re-enter Password</label>
              </div>
             </div>
            <div class="row">
              <div class="input-field col s4">
                <i class="material-icons prefix">lock</i>
                    
                <asp:DropDownList ID="que" runat="server">
                    <asp:ListItem Value="1">What is your favorite colour?</asp:ListItem>
                    <asp:ListItem Value="2">Which is your first car?</asp:ListItem>
                    <asp:ListItem Value="3">Who is your favorite actor?</asp:ListItem>
                    <asp:ListItem Value="4">What is your favorite book?</asp:ListItem>
                </asp:DropDownList>
                <label >
                  
                  Security Question</label>
              </div>
              <div class="row">
                  <div class="input-field col s4">
                      <asp:TextBox ID="ans" runat="server"></asp:TextBox>&nbsp;<label for="ans">Answer</label>
                  </div>
              </div>
            </div>
        <div class="row">
           		<div class="input-field col s12 body-align:center;">
                <div class="input-field col s3 white-text">
                    <asp:Button ID="reg" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Register" OnClick="res_Click" />
                </div>
                 
            </div>
            </div>
    </form>
        </div>
               
       
</body>
</html>
