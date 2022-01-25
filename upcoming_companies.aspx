<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upcoming_companies.aspx.cs" Inherits="Training_and_Placement_Portal.register_for_company" %>
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
    
        <form id="form1" runat="server">
        <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
        <div>
        </div>
        <div>
            <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
        </div>
        <div class="row">
            

               <div class="input-field col s3 white-text">
                   <asp:HyperLink ID="click" runat="server" class="btn waves-effect waves-light grey darken-2" NavigateUrl="~/add_schedule.aspx">Add Schedule</asp:HyperLink>
                </div>
            
        </div>
        <div class="row">
            <div class="col s7">        
                <asp:UpdatePanel ID="upanel1" runat="server">
            <ContentTemplate>
              <asp:GridView ID="upcoming" runat="server" AutoGenerateColumns="False" DataKeyNames="cid,sid" DataSourceID="ViewScheduleDS" Width="100%" OnRowDataBound="upcoming_RowDataBound">
            <Columns>
                <asp:BoundField DataField="cid" HeaderText="cid" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="cid" />
                <asp:BoundField DataField="cname" HeaderText="Company Name" SortExpression="cname" />
                <asp:BoundField DataField="sid" HeaderText="sid" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="sid" />
                <asp:BoundField DataField="visit_date" HeaderText="Visit Date" SortExpression="visit_date" />
                <asp:BoundField DataField="deadline" HeaderText="Deadline" SortExpression="deadline" />
                <asp:HyperLinkField DataNavigateUrlFields="cid,sid" DataNavigateUrlFormatString="?cid={0}&amp;sid={1}" HeaderText="View Deatails" Text="View Deatails" />
            </Columns>
                  <HeaderStyle BackColor="#616161" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="ViewScheduleDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Company.cid, Company.cname, Schedule.sid, Schedule.visit_date, Schedule.deadline FROM Company INNER JOIN Schedule ON Company.cid = Schedule.cid"></asp:SqlDataSource>
        
            </ContentTemplate>
        

        </asp:UpdatePanel>
            </div>
            <asp:Panel ID="deatailspanel" runat="server">
            <div class="col s5">
                <div class="card white">
                    <div class="card-content">
                        <asp:UpdatePanel ID="upanel2" runat="server">
            <ContentTemplate>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="cid" DataSourceID="CompanyDetailsDS">
                    <EditItemTemplate>
                        cid:
                        <asp:Label ID="cidLabel1" runat="server" Text='<%# Eval("cid") %>' />
                        <br />
                        cname:
                        <asp:TextBox ID="cnameTextBox" runat="server" Text='<%# Bind("cname") %>' />
                        <br />
                        phone:
                        <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        <br />
                        email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        website:
                        <asp:TextBox ID="websiteTextBox" runat="server" Text='<%# Bind("website") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        cname:
                        <asp:TextBox ID="cnameTextBox" runat="server" Text='<%# Bind("cname") %>' />
                        <br />
                        phone:
                        <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        <br />
                        email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        website:
                        <asp:TextBox ID="websiteTextBox" runat="server" Text='<%# Bind("website") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table class="bordered">
                            <tr>
                                <td><b>Company ID :</b></td>
                                <td> <asp:Label ID="cidLabel" runat="server" Text='<%# Eval("cid") %>' Font-Bold="True" Font-Overline="False" Font-Size="X-Large" /></td>
                            </tr>
                            <tr>
                                <td><b>Company Name :</b></td>
                                <td><asp:Label ID="cnameLabel" runat="server" Text='<%# Bind("cname") %>' Font-Bold="True" Font-Size="X-Large" />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Contact :</b></td>
                                <td><asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' /></td>
                            </tr>
                            <tr>
                                <td><b> E-mail :</b></td>
                                <td><asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' /></td>
                            </tr>
                            <tr>
                                <td><b>Website :</b></td>
                                <td><asp:Label ID="websiteLabel" runat="server" Text='<%# Bind("website") %>' /></td>
                            </tr>

                        </table>
                     
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="CompanyDetailsDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Company] WHERE ([cid] = @cid)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="cid" QueryStringField="cid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </ContentTemplate>
        </asp:UpdatePanel>
                        <asp:FormView ID="FormView2" runat="server" DataKeyNames="sid" DataSourceID="ScheduleDetailsDS">
            <EditItemTemplate>
                
                <b>Package:</b>
                <asp:TextBox ID="packageTextBox" runat="server" Text='<%# Bind("package") %>' />
                <br />
                <b>Visit Date:</b>
                <asp:TextBox ID="visit_dateTextBox" runat="server" Text='<%# Bind("visit_date") %>' />
                <br />
                <b>Deadline for registration:</b>
                <asp:TextBox ID="deadlineTextBox" runat="server" Text='<%# Bind("deadline") %>' />
                <br />
                <b>Min CPI:</b>
                <asp:TextBox ID="min_cpiTextBox" runat="server" Text='<%# Bind("min_cpi") %>' />
                <br />
                <b>Allow backlog:</b>
                <asp:TextBox ID="backlogTextBox" runat="server" Text='<%# Bind("backlog") %>' />
                <br />
                <b>Vacancy:</b>
                <asp:TextBox ID="vacancyTextBox" runat="server" Text='<%# Bind("vacancy") %>' />
                <br />
               
                <asp:TextBox Visible="false" ID="hrnameTextBox" runat="server" Text='<%# Bind("hrname") %>' />
                <br />
                <b>Description:</b>
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                <br />
                <br />
                <asp:LinkButton ID="UpdateButton" CssClass="btn waves-effect waves-light grey darken-2" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" CssClass="btn waves-effect waves-light grey darken-2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            
            <ItemTemplate>
                <table class="bordered">
                    <tr>
                        <td><b>Package :</b></td>
                        <td><asp:Label ID="packageLabel" runat="server" Text='<%# Bind("package") %>' /></td>
                    </tr>
                    <tr>
                        <td><b>Visit Date :</b></td>
                        <td><asp:Label ID="visit_dateLabel" runat="server" Text='<%# Bind("visit_date") %>' /></td>
                    </tr>
                    <tr>
                        <td><b>Deadline :</b></td>
                        <td><asp:Label ID="deadlineLabel" runat="server" Text='<%# Bind("deadline") %>' /></td>
                    </tr>
                    <tr>
                        <td><b>Min CPI :</b></td>
                        <td><asp:Label ID="min_cpiLabel" runat="server" Text='<%# Bind("min_cpi") %>' /></td>
                    </tr>
                    <tr>
                        <td><b>Allow Backlog :</b></td>
                        <td><asp:Label ID="backlogLabel" runat="server" Text='<%# Bind("backlog") %>' /></td>
                    </tr>
                    <tr>
                        <td><b>Vacancy :</b></td>
                        <td><asp:Label ID="vacancyLabel" runat="server" Text='<%# Bind("vacancy") %>' /></td>
                    </tr>
                    <tr>
                        <td><b>Description :</b></td>
                        <td><asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' /></td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CssClass="btn waves-effect waves-light grey darken-2" CausesValidation="False" Visible='<%# isAllow((string)Session["user_role"]) %>' CommandName="Edit" Text="Edit" />
                &nbsp;
            </ItemTemplate>
        </asp:FormView>
                        <asp:SqlDataSource ID="ScheduleDetailsDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Schedule] WHERE [sid] = @sid" InsertCommand="INSERT INTO [Schedule] ([cid], [package], [visit_date], [deadline], [min_cpi], [backlog], [vacancy], [hrname], [description]) VALUES (@cid, @package, @visit_date, @deadline, @min_cpi, @backlog, @vacancy, @hrname, @description)" SelectCommand="SELECT * FROM [Schedule] WHERE ([sid] = @sid)" UpdateCommand="UPDATE [Schedule] SET [package] = @package, [visit_date] = @visit_date, [deadline] = @deadline, [min_cpi] = @min_cpi, [backlog] = @backlog, [vacancy] = @vacancy, [hrname] = @hrname, [description] = @description WHERE [sid] = @sid">
            <DeleteParameters>
                <asp:Parameter Name="sid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cid" Type="Int32" />
                <asp:Parameter Name="package" Type="Double" />
                <asp:Parameter DbType="Date" Name="visit_date" />
                <asp:Parameter DbType="Date" Name="deadline" />
                <asp:Parameter Name="min_cpi" Type="Double" />
                <asp:Parameter Name="backlog" Type="String" />
                <asp:Parameter Name="vacancy" Type="Int32" />
                <asp:Parameter Name="hrname" Type="String" />
                <asp:Parameter Name="description" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="sid" QueryStringField="sid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="cid" Type="Int32" />
                <asp:Parameter Name="package" Type="Double" />
                <asp:Parameter DbType="Date" Name="visit_date" />
                <asp:Parameter DbType="Date" Name="deadline" />
                <asp:Parameter Name="min_cpi" Type="Double" />
                <asp:Parameter Name="backlog" Type="String" />
                <asp:Parameter Name="vacancy" Type="Int32" />
                <asp:Parameter Name="hrname" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="sid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                        <asp:Panel ID="capcap" runat="server">
                        <div class="row">
                            <div class="col s3">
                                <asp:Image ID="cap" runat="server" />
                            </div>
                            <div class="col s1">
                                <asp:LinkButton ID="recap" runat="server" ForeColor="#616161" OnClick="recap_Click"><i class="material-icons">autorenew</i></asp:LinkButton>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s6">
                                <asp:TextBox ID="hiscap" placeholder="write captcha here" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        </asp:Panel>
                    </div>  
                    <div class="card-action">
                        <div class="row">
           	                <div class="input-field col s12 body-align:center;">
                                <div class="input-field col s3 white-text">
                                    <asp:LinkButton class="btn waves-effect waves-light grey darken-2" ID="register" runat="server" Visible="false" OnClick="register_Click">Register for interview</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>
            </asp:Panel>
        </div>    
    </form>
    
</body>
</html>
