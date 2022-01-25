<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Training_and_Placement_Portal.profile" %>

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
    
   
        <form id="form1" runat="server">
        <div>
        </div>
        <div class="row">
            <div class="col s12">
                <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
            </div>
            <div class="col s12">
                <asp:Label ID="mes" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
            </div>
            
        </div>
        <div class="row">
            <div class="col s12">
                <asp:Label ID="placedmes" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
             <asp:Panel ID="student" runat="server">
                <div class="col s9">
                <asp:FormView ID="details" runat="server" CellPadding="4" DataKeyNames="uuid" DataSourceID="ProfileDS" ForeColor="#333333" OnDataBound="details_DataBound">
                    <EditItemTemplate>
                       
                        User ID :
                        <asp:Label ID="uuidLabel1" runat="server" Text='<%# Eval("uuid") %>' Font-Bold="True" Font-Size="X-Large" />
                        <br />
                        <div class="row">
                            <div class="input-field col s3  body-align:center;">
                                <i class="material-icons prefix ">perm_identity</i>
                                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />&nbsp;<label for="icon_prefix">First Name</label>
                            </div> 
                            <div class="input-field col s3">   
        	                    <asp:TextBox ID="mnameTextBox" runat="server" Text='<%# Bind("mname") %>' />&nbsp;<label  for="icon_prefix">Middle Name</label>
                            </div> 
                            <div class="input-field col s3">  
                 	            <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />&nbsp;<label for="icon_prefix">Last Name</label>
                            </div>
                        </div>
                        <div class="row">
                	            <div class="input-field col s3  body-align:center;">
                    	            <i class="material-icons prefix ">contact_phone</i>
                                    <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />&nbsp;<label >Mobile</label>
                	            </div>
                        </div>
                        <div class="row">
                	        <div class="input-field col s5 body-align:center;">
                    	        <i class="material-icons prefix ">email</i>
                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />&nbsp;<label>Email</label>
                	        </div>
            	        </div> 
                       <div class="row">
                            <div class="input-field col s3  body-align:center;">
                            <i class="material-icons prefix ">today</i>
                                 <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                            &nbsp;<label  for="icon_prefix">Birthdate</label>
			                </div>
                        </div>
                        <div class="row">
                	      
                            <div class="input-field col s1">
                    	
                               <asp:TextBox ID="rollnoTextBox" runat="server" Text='<%# Bind("rollno") %>' />&nbsp;<label>Roll No</label>
                	        </div>
            	        </div>
                       <div class="row">
                	        <div class="input-field col s1">
                    	
                            <asp:TextBox ID="cpiTextBox" runat="server" Text='<%# Bind("cpi") %>' />&nbsp;<label >CPI</label>
                	        </div>
                            <div class="col s1"></div>
                	        <div class="input-field col s3">
                                <asp:TextBox ID="backlogTextBox" runat="server" ToolTip="yes or no" Enabled="false" Text='<%# Bind("backlog") %>' />
                                <label class="center">Any Backlog</label>	
                                
                	        </div>
                        </div>
                        <div class="row">
                	        <div class="input-field col s5 body-align:center;">
                    	        <i class="material-icons prefix ">Address</i>
                               <asp:TextBox ID="addressTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("address") %>' Rows="3" />&nbsp;<label>Address</label>
                	        </div>
            	        </div> 
                        <div class="row">
           		               <div class="input-field col s12 body-align:center;">
                                    <div class="input-field col s3 white-text">
                                    <asp:LinkButton ID="UpdateButton" runat="server" class="btn waves-effect waves-light grey darken-2" CausesValidation="True" CommandName="Update" Text="Update" />
                                    </div>
                                    <div class="input-field col s3 white-text">
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" class="btn waves-effect waves-light grey darken-2" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </div>
                                </div>
                        </div>
                        <br />
                        
       
                    </EditItemTemplate>
                   
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    
                    <ItemTemplate>
                                    <!--start-->
                    <div class="row">
                    <div class="col s12">
                    <div class="card white">
                        <div class="card-content ">
                            <table class="bordered">
                                <tr>
                                    <td><b>User ID :</b></td>
                                    <td><asp:Label ID="uuidLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("uuid") %>' /></td>
                                </tr>
                                <tr>
                                    <td><b>Name :</b></td>
                                    <td>  <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                                          &nbsp;<asp:Label ID="mnameLabel" runat="server" Text='<%# Bind("mname") %>' />
                                          &nbsp;<asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Contact :</b></td>
                                    <td><asp:Label ID="mobileLabel" runat="server" Text='<%# Bind("mobile") %>' /></td>
                                </tr>
                                <tr>
                                    <td><b>Date of birth :</b></td>
                                    <td><asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' />
                                    </td>
                                </tr>
                                <tr>    
                                    <td><b>Email :</b></td>
                                    <td> <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td><b>Roll number :</b></td>
                                    <td><asp:Label ID="Label13" runat="server" Text='<%# Bind("rollno") %>' /></td>
                                </tr>
                                <tr>
                                    <td><b>CPI :</b></td>
                                    <td><asp:Label ID="cpiLabel" runat="server" Text='<%# Bind("cpi") %>' /></td>
                                </tr> 
                                <tr>
                                    <td><b>Any Backlog :</b></td>
                                    <td><asp:Label ID="backlogLabel" runat="server" Text='<%# Bind("backlog") %>' /></td>
                                </tr>
                                <tr>
                                    <td><b>Address :</b></td>
                                    <td><asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' /></td>
                                </tr>                
                                             
                                <tr>
                                    <td><b>Batch:</b></td>
                                    <td><asp:Label ID="batchLabel" runat="server" Text='<%# Bind("batch") %>' /></td>
                                </tr>                
                            </table>
                            <div class="card-action">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Visible='<%# isAllow() %>' CssClass="btn waves-effect waves-light grey darken-2" Text="Edit" />
                            </div>
                               
                        </div>
                        </div>
                    </div>
                </div>
                                <!--end-->
                    
                        
                        
                        
                    </ItemTemplate>
                    
                    
                </asp:FormView>
                <asp:SqlDataSource ID="ProfileDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [User] WHERE ([uuid] = @uuid)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [User] WHERE [uuid] = @original_uuid AND [uid] = @original_uid AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL)) AND (([mname] = @original_mname) OR ([mname] IS NULL AND @original_mname IS NULL)) AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([imageurl] = @original_imageurl) OR ([imageurl] IS NULL AND @original_imageurl IS NULL)) AND (([mobile] = @original_mobile) OR ([mobile] IS NULL AND @original_mobile IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([dob] = @original_dob) OR ([dob] IS NULL AND @original_dob IS NULL)) AND [bid] = @original_bid AND (([rollno] = @original_rollno) OR ([rollno] IS NULL AND @original_rollno IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL)) AND (([cpi] = @original_cpi) OR ([cpi] IS NULL AND @original_cpi IS NULL)) AND (([backlog] = @original_backlog) OR ([backlog] IS NULL AND @original_backlog IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([security_q_a] = @original_security_q_a) OR ([security_q_a] IS NULL AND @original_security_q_a IS NULL)) AND (([role] = @original_role) OR ([role] IS NULL AND @original_role IS NULL)) AND (([active] = @original_active) OR ([active] IS NULL AND @original_active IS NULL)) AND (([batch] = @original_batch) OR ([batch] IS NULL AND @original_batch IS NULL))" InsertCommand="INSERT INTO [User] ([uuid], [fname], [mname], [lname], [imageurl], [mobile], [email], [dob], [bid], [rollno], [password], [cpi], [backlog], [address], [security_q_a], [role], [active], [batch]) VALUES (@uuid, @fname, @mname, @lname, @imageurl, @mobile, @email, @dob, @bid, @rollno, @password, @cpi, @backlog, @address, @security_q_a, @role, @active, @batch)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [User] SET [fname] = @fname, [mname] = @mname, [lname] = @lname,[email] = @email,[mobile] = @mobile, [dob] = @dob, [cpi] = @cpi, [rollno]=@rollno,[address] = @address,[backlog]=@backlog WHERE [uuid] = @original_uuid">
                    <DeleteParameters>
                        <asp:Parameter Name="original_uuid" Type="String" />
                        <asp:Parameter Name="original_uid" Type="Int32" />
                        <asp:Parameter Name="original_fname" Type="String" />
                        <asp:Parameter Name="original_mname" Type="String" />
                        <asp:Parameter Name="original_lname" Type="String" />
                        <asp:Parameter Name="original_imageurl" Type="String" />
                        <asp:Parameter Name="original_mobile" Type="String" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_dob" />
                        <asp:Parameter Name="original_bid" Type="Int32" />
                        <asp:Parameter Name="original_rollno" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                        <asp:Parameter Name="original_cpi" Type="Double" />
                        <asp:Parameter Name="original_backlog" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                        <asp:Parameter Name="original_security_q_a" Type="String" />
                        <asp:Parameter Name="original_role" Type="String" />
                        <asp:Parameter Name="original_active" Type="String" />
                        <asp:Parameter Name="original_batch" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="uuid" Type="String" />
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="mname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="imageurl" Type="String" />
                        <asp:Parameter Name="mobile" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter DbType="Date" Name="dob" />
                        <asp:Parameter Name="bid" Type="Int32" />
                        <asp:Parameter Name="rollno" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="cpi" Type="Double" />
                        <asp:Parameter Name="backlog" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="security_q_a" Type="String" />
                        <asp:Parameter Name="role" Type="String" />
                        <asp:Parameter Name="active" Type="String" />
                        <asp:Parameter Name="batch" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="msg" DefaultValue="0" Name="uuid" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="uid" Type="Int32" />
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="mname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="imageurl" Type="String" />
                        <asp:Parameter Name="mobile" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter DbType="Date" Name="dob" />
                        <asp:Parameter Name="bid" Type="Int32" />
                        <asp:Parameter Name="rollno" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="cpi" Type="Double" />
                        <asp:Parameter Name="backlog" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="security_q_a" Type="String" />
                        <asp:Parameter Name="role" Type="String" />
                        <asp:Parameter Name="active" Type="String" />
                        <asp:Parameter Name="batch" Type="String" />
                        <asp:Parameter Name="original_uuid" Type="String" />
                        <asp:Parameter Name="original_uid" Type="Int32" />
                        <asp:Parameter Name="original_fname" Type="String" />
                        <asp:Parameter Name="original_mname" Type="String" />
                        <asp:Parameter Name="original_lname" Type="String" />
                        <asp:Parameter Name="original_imageurl" Type="String" />
                        <asp:Parameter Name="original_mobile" Type="String" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_dob" />
                        <asp:Parameter Name="original_bid" Type="Int32" />
                        <asp:Parameter Name="original_rollno" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                        <asp:Parameter Name="original_cpi" Type="Double" />
                        <asp:Parameter Name="original_backlog" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                        <asp:Parameter Name="original_security_q_a" Type="String" />
                        <asp:Parameter Name="original_role" Type="String" />
                        <asp:Parameter Name="original_active" Type="String" />
                        <asp:Parameter Name="original_batch" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
             </asp:Panel>
             <asp:Panel ID="admin" runat="server">
                   <div class="col s9">
                       <asp:FormView ID="FormView1" runat="server" DataKeyNames="uuid" DataSourceID="AdminDS" OnDataBound="FormView1_DataBound">
                           <EditItemTemplate>
                               Admin ID :
                               <asp:Label ID="uuidLabel1" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("uuid") %>' />
                               <br />
                               <div class="row">
                            <div class="input-field col s3  body-align:center;">
                                <i class="material-icons prefix ">perm_identity</i>
                                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />&nbsp;<label for="icon_prefix">First Name</label>
                            </div> 
                            <div class="input-field col s3">   
        	                    <asp:TextBox ID="mnameTextBox" runat="server" Text='<%# Bind("mname") %>' />&nbsp;<label  for="icon_prefix">Middle Name</label>
                            </div> 
                            <div class="input-field col s3">  
                 	            <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />&nbsp;<label for="icon_prefix">Last Name</label>
                            </div>
                        </div>
                        <div class="row">
                	            <div class="input-field col s3  body-align:center;">
                    	            <i class="material-icons prefix ">contact_phone</i>
                                    <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />&nbsp;<label >Mobile</label>
                	            </div>
                        </div>
                        <div class="row">
                	        <div class="input-field col s5 body-align:center;">
                    	        <i class="material-icons prefix ">email</i>
                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />&nbsp;<label>Email</label>
                	        </div>
            	        </div> 
                       <div class="row">
                            <div class="input-field col s3  body-align:center;">
                            <i class="material-icons prefix ">today</i>
                                 <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                            &nbsp;<label  for="icon_prefix">Birthdate</label>
			                </div>
                        </div>
                               <br />
                               <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn waves-effect waves-light grey darken-2" Text="Update" />
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn waves-effect waves-light grey darken-2" Text="Cancel" />
                           </EditItemTemplate>
                           
                           <ItemTemplate>
                                <!--start-->
                    <div class="row">
                    <div class="col s12">
                    <div class="card white">
                        <div class="card-content ">
                            <table class="bordered">
                                <tr>
                                    <td><b>Admin ID :</b></td>
                                    <td><asp:Label ID="uuidLabel" runat="server" Text='<%# Eval("uuid") %>' />
                                </td>
                                </tr>
                                <tr>
                                    <td><b>Name :</b></td>
                                    <td><asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                                        &nbsp;<asp:Label ID="mnameLabel" runat="server" Text='<%# Bind("mname") %>' />
                                        &nbsp;<asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Contact :</b></td>
                                    <td><asp:Label ID="mobileLabel" runat="server" Text='<%# Bind("mobile") %>' />
                               </td>
                                </tr>
                                <tr>
                                    <td><b>Date of birth :</b></td>
                                    <td><asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' />
                                    </td>
                                </tr>
                                <tr>    
                                    <td><b>Email :</b></td>
                                    <td><asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                               </td>
                                </tr>
                         
                            </table>
                            
                            <div class="card-action">
                            <br />     <asp:LinkButton ID="EditButton" runat="server" CssClass="btn waves-effect waves-light grey darken-2" CausesValidation="False" Visible='<%# isAllow() %>' CommandName="Edit"  Text="Edit" />
                            </div>
                               
                        </div>
                        </div>
                    </div>
                </div>
                                <!--end-->
                           </ItemTemplate>
                       </asp:FormView>
                       <asp:SqlDataSource ID="AdminDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [uuid] = @uuid" InsertCommand="INSERT INTO [User] ([uuid], [fname], [mname], [lname], [mobile], [dob], [email]) VALUES (@uuid, @fname, @mname, @lname, @mobile, @dob, @email)" SelectCommand="SELECT [uuid], [fname], [mname], [lname], [mobile], [dob], [email] FROM [User] WHERE ([uuid] = @uuid)" UpdateCommand="UPDATE [User] SET [fname] = @fname, [mname] = @mname, [lname] = @lname, [mobile] = @mobile, [dob] = @dob, [email] = @email WHERE [uuid] = @uuid">
                           <DeleteParameters>
                               <asp:Parameter Name="uuid" Type="String" />
                           </DeleteParameters>
                           <InsertParameters>
                               <asp:Parameter Name="uuid" Type="String" />
                               <asp:Parameter Name="fname" Type="String" />
                               <asp:Parameter Name="mname" Type="String" />
                               <asp:Parameter Name="lname" Type="String" />
                               <asp:Parameter Name="mobile" Type="String" />
                               <asp:Parameter DbType="Date" Name="dob" />
                               <asp:Parameter Name="email" Type="String" />
                           </InsertParameters>
                           <SelectParameters>
                               <asp:ControlParameter ControlID="msg" DefaultValue="0" Name="uuid" PropertyName="Text" Type="String" />
                           </SelectParameters>
                           <UpdateParameters>
                               <asp:Parameter Name="fname" Type="String" />
                               <asp:Parameter Name="mname" Type="String" />
                               <asp:Parameter Name="lname" Type="String" />
                               <asp:Parameter Name="mobile" Type="String" />
                               <asp:Parameter DbType="Date" Name="dob" />
                               <asp:Parameter Name="email" Type="String" />
                               <asp:Parameter Name="uuid" Type="String" />
                           </UpdateParameters>
                       </asp:SqlDataSource>
                   </div> 
            </asp:Panel>
            
            <div class="col s3">
                        <div class="row"></div>
                        <div class="row">
                            <asp:HyperLink ID="change" CssClass="btn waves-effect waves-light grey darken-2" NavigateUrl="~/changepassword.aspx" runat="server">Change Password</asp:HyperLink>
                       </div>
       
                        <div class="row">
                            <asp:Image ID="profileimage" Height="200px" Width="200px" runat="server" />
                        </div>
                        <div class="row"></div>
                        <div class="row">
                            <asp:FileUpload ID="newimage" runat="server" /> <div class="row"><br />
                                <asp:LinkButton ID="upload" runat="server" class="btn waves-effect waves-light grey darken-2" OnClick="upload_Click">Upload</asp:LinkButton></div> 
                        </div>
                    <div class="row">
                        <asp:LinkButton ID="postby" runat="server" OnClick="postby_Click">Posts by this user</asp:LinkButton>
                    </div>
                <asp:Panel ID="view" runat="server">
                    <div class="row">
                        <asp:HyperLink ID="viewregistered" NavigateUrl="~/myregistered.aspx" runat="server">View Registered Company</asp:HyperLink>
                    </div>
                    </asp:Panel>
                               
            </div>
                
                
        </div>
           
       
    </form>    
  

    
</body>
</html>
