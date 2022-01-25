<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="Training_and_Placement_Portal.changepassword" %>

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
     <script>
        $(document).ready(function () {
            $(".button-collapse").sideNav();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('select').material_select();
        });
	</script>

    <form id="form1" runat="server">
        <div>
        </div>
        <div class="container">
            <div class="row">
                <asp:Label ID="msg" runat="server" Font-Italic="true" ForeColor="Red" Text=""></asp:Label>
            </div>
            <asp:Panel ID="idnotfound" runat="server">
            <div class="row">
               <div class="input-field col s4">
                   <asp:TextBox ID="currpwd" CssClass="validate" TextMode="Password" runat="server"></asp:TextBox><label>Current Password</label>
               </div>
           </div>
            <div class="row">
              <div class="row">
              </div>
            </div>
                </asp:Panel>
           <div class="row">
               <div class="input-field col s4">
                   <asp:TextBox ID="newpwd1" CssClass="validate" TextMode="Password" runat="server" pattern="[A-Za-z0-9~!@#$%^&*()_+]{8,15}" title="Length 8 to 10 , valid from alphanumeric and some special characters" required></asp:TextBox><label>New Password</label>
                  
               </div>
           </div>
           <div class="row">
               <div class="input-field col s4">
                   <asp:TextBox ID="newpwd2" CssClass="validate" TextMode="Password" runat="server"></asp:TextBox><label>Re-Enter Password</label>
               </div>
           </div>
              <div class="row">
           	
                <div class="input-field col s3 white-text">
                    <asp:Button ID="change" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Change Password" OnClick="change_Click"/>
                </div>
            </div>
       </div>
       
    </form>
</body>
</html>
