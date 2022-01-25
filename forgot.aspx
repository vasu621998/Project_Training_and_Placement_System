<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="Training_and_Placement_Portal.forgot" %>

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
   


    <form id="form1" runat="server">
        <div class="row">
            <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
        </div>
        <div class="row">
            <asp:RadioButtonList ID="select" runat="server" AutoPostBack="true" OnSelectedIndexChanged="select_SelectedIndexChanged">
                <asp:ListItem>UserID</asp:ListItem>
                <asp:ListItem>Password</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <asp:Panel ID="userid" Visible="false" runat="server">
            <div class="row">
                <div class="input-field col s4 body-align:center;">
                    	<i class="material-icons prefix ">email</i>
                        <asp:TextBox ID="email" class="validate" runat="server"></asp:TextBox>&nbsp;<label>Email</label>
                	</div>
            </div>
             <div class="row">
                <div class="input-field col s3">
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
                  <div class="input-field col s3">
                      <asp:TextBox ID="ans" runat="server"></asp:TextBox>&nbsp;<label for="ans">Answer</label>
                  </div>
              </div>
            </div>
             <div class="row">
           	
                <div class="input-field col s3 white-text">
                    <asp:Button ID="getid" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Get UserID" OnClick="getid_Click"/>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="password" Visible="false" runat="server">
            <div class="row">
                <div class="input-field col s3 body-align:center;">
                    	<i class="material-icons prefix ">perm_identity</i>
                        <asp:TextBox ID="uid" class="validate" runat="server"></asp:TextBox>&nbsp;<label>User ID</label>
                	</div>
            </div>
             <div class="row">
                <div class="input-field col s3">
                <i class="material-icons prefix">lock</i>
                    
                <asp:DropDownList ID="secque" runat="server">
                    <asp:ListItem Value="1">What is your favorite colour?</asp:ListItem>
                    <asp:ListItem Value="2">Which is your first car?</asp:ListItem>
                    <asp:ListItem Value="3">Who is your favorite actor?</asp:ListItem>
                    <asp:ListItem Value="4">What is your favorite book?</asp:ListItem>
                </asp:DropDownList>
                <label >
                  
                  Security Question</label>
              </div>
              <div class="row">
                  <div class="input-field col s3">
                      <asp:TextBox ID="secans" runat="server"></asp:TextBox>&nbsp;<label for="ans">Answer</label>
                  </div>
              </div>
            </div>
            <div class="row">
           	
                <div class="input-field col s3 white-text">
                    <asp:Button ID="change" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Change password" OnClick="change_Click"/>
                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
