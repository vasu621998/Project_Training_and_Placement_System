<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Training_and_Placement_Portal.adminhome" %>
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
    <div></div>
    <div class="row-center">
        <div class="col s6 center">
            <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
        </div>
    </div>
    
        <asp:TextBox ID="today" Visible="false" Text='<%# Eval("myDate", "{0:dd/MM/yyyy}") %>' runat="server"></asp:TextBox>
        <br />
        
                <div class="row">
                    <div class="col s2 right">
                        <asp:HyperLink ID="addnotice" class="btn waves-effect waves-light grey darken-2" NavigateUrl="~/add_notice.aspx" runat="server">Add Notice</asp:HyperLink>
                    </div>
                  
                </div>
                
                <div class="row">
                    <div class="col s9" style="width: 56%">
                </div>
                   <div class="col s3 offset-l2">
                    <div class="card grey lighten-3">
                        <div class="card-content">
                            <div class="row">
                                <div class="col s9">
                                     <asp:TextBox ID="search" placeholder="Search" runat="server"></asp:TextBox>
         <asp:AutoCompleteExtender ID="ex1" runat="server" TargetControlID="search" ServiceMethod="mymethod" MinimumPrefixLength="2" CompletionSetCount="1"></asp:AutoCompleteExtender>
                           
                                    </div>
                                <div class="col s1">
                                    <asp:LinkButton ID="findit" runat="server" OnClick="findit_Click"><i class="material-icons">search</i></asp:LinkButton>
                                    </div>
                                </div>
                            <div class="row">
                                <div class="col s9">
                                    <asp:GridView ID="result" runat="server" AutoGenerateColumns="False" DataKeyNames="uuid" DataSourceID="SearchResultDS" Width="222px" OnRowDataBound="result_RowDataBound">
                                        <Columns>
                                             <asp:TemplateField HeaderText="Image">
                                                 <ItemTemplate>
                                                     <asp:Image ID="profileimage" Height="30px" Width="30px" runat="server" />
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="uuid" SortExpression="uuid" Visible="False">
                                                 <EditItemTemplate>
                                                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("uuid") %>'></asp:Label>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("uuid") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Name" SortExpression="fname">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField SortExpression="mname">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mname") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label3" runat="server" Text='<%# Bind("mname") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField SortExpression="lname">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label4" runat="server" Text='<%# Bind("lname") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                           
                                             <asp:HyperLinkField DataNavigateUrlFields="uuid" DataNavigateUrlFormatString="profile.aspx?whichuser={0}" HeaderText="View" Text="View" />
                                           
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SearchResultDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [uuid], [fname], [mname], [lname] FROM [User]"></asp:SqlDataSource>
                                </div>
                            </div>
                            </div>
                         </div>
                     </div>
                        </div>
            
       
        
        <div class="row">
            <div class="col s9">
                <asp:SqlDataSource ID="GetPostDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [uuid], [notice_date], [description], [title], [nid], [exp_date] FROM [Notice] ORDER BY [notice_date] DESC" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Notice] WHERE [nid] = @original_nid AND (([uuid] = @original_uuid) OR ([uuid] IS NULL AND @original_uuid IS NULL)) AND (([notice_date] = @original_notice_date) OR ([notice_date] IS NULL AND @original_notice_date IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([title] = @original_title) OR ([title] IS NULL AND @original_title IS NULL)) AND (([exp_date] = @original_exp_date) OR ([exp_date] IS NULL AND @original_exp_date IS NULL))" InsertCommand="INSERT INTO [Notice] ([uuid], [notice_date], [description], [title], [exp_date]) VALUES (@uuid, @notice_date, @description, @title, @exp_date)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Notice] SET [uuid] = @uuid, [notice_date] = @notice_date, [description] = @description, [title] = @title, [exp_date] = @exp_date WHERE [nid] = @original_nid AND (([uuid] = @original_uuid) OR ([uuid] IS NULL AND @original_uuid IS NULL)) AND (([notice_date] = @original_notice_date) OR ([notice_date] IS NULL AND @original_notice_date IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([title] = @original_title) OR ([title] IS NULL AND @original_title IS NULL)) AND (([exp_date] = @original_exp_date) OR ([exp_date] IS NULL AND @original_exp_date IS NULL))">
                    <DeleteParameters>
                    <asp:Parameter Name="original_nid" Type="Int32" />
                    <asp:Parameter Name="original_uuid" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_notice_date" />
                    <asp:Parameter Name="original_description" Type="String" />
                    <asp:Parameter Name="original_title" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_exp_date" />
                </DeleteParameters>
                    <InsertParameters>
                    <asp:Parameter Name="uuid" Type="String" />
                    <asp:Parameter DbType="Date" Name="notice_date" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter DbType="Date" Name="exp_date" />
                </InsertParameters>
                    <UpdateParameters>
                    <asp:Parameter Name="uuid" Type="String" />
                    <asp:Parameter DbType="Date" Name="notice_date" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="exp_date" DbType="Date" />
                    <asp:Parameter Name="original_nid" Type="Int32" />
                    <asp:Parameter Name="original_uuid" Type="String" />
                    <asp:Parameter Name="original_notice_date" DbType="Date" />
                    <asp:Parameter Name="original_description" Type="String" />
                    <asp:Parameter Name="original_title" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_exp_date" />
                </UpdateParameters>
                    </asp:SqlDataSource>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="nid" DataSourceID="ViewPostDS" Height="160px" CssClass="auto-style1" Width="959px">
                    <EditItemTemplate>
                        nid:
                        <asp:Label ID="nidLabel1" runat="server" Text='<%# Eval("nid") %>' />
                        <br />
                        Title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        User ID:
                        <asp:TextBox ID="uuidTextBox" ReadOnly="true" runat="server" Text='<%# Bind("uuid") %>' />
                        <br />
                        Date Created:
                        <asp:TextBox ID="notice_dateTextBox" ReadOnly="true" runat="server" Text='<%# Bind("notice_date") %>' />
                        <br />
                        Description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' Height="200px" Rows="10" TextMode="MultiLine" />
                        <br />
                        <asp:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" TargetControlID="descriptionTextBox">
                                <Toolbar>
                            <asp:Bold />
                            <asp:Italic />
                            <asp:Underline />
                            <asp:Undo />
                            <asp:Redo />
                            <asp:Cut />
                            <asp:Copy />
                            <asp:Paste />
                            <asp:FontNameSelector />
                            <asp:ForeColorSelector />
                        </Toolbar>
                        </asp:HtmlEditorExtender>
                        Expiry Date:
                        <asp:TextBox ID="exp_dateTextBox" runat="server" Text='<%# Bind("exp_date") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    uuid:
                    <asp:TextBox ID="uuidTextBox" runat="server" Text='<%# Bind("uuid") %>' />
                    <br />
                    notice_date:
                    <asp:TextBox ID="notice_dateTextBox" runat="server" Text='<%# Bind("notice_date") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    exp_date:
                    <asp:TextBox ID="exp_dateTextBox" runat="server" Text='<%# Bind("exp_date") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                    <ItemTemplate>
                <!--start-->
                <div class="row">
                    <div class="col s10 offset-s3">
                    <div class="card white">
                        <div class="card-content">
                            <span class="card-title">
                                <asp:Label ID="titleLabel" Font-Bold="true" Font-Size="Large" runat="server" Text='<%# Bind("title") %>' />
                            </span>
                            <br />
                            <table>
                                <tr>
                                    <td><b>Posted By :</b>  <asp:Label ID="uuidLabel" runat="server" Font-Italic="true" Text='<%# Bind("uuid") %>' /></td>
                                    <td><b>On :</b><asp:Label ID="notice_dateLabel" runat="server" Font-Italic="true" Text='<%# Bind("notice_date") %>' /></td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2"><asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' /></td>
                                </tr>
                            </table>
                          
                        </div>
                        <div class="card-action">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" Visible='<%# isAllow((string)Session["user_role"]) %>'  CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" Visible='<%# isAllow((string)Session["user_role"]) %>' CommandName="Delete" Text="Delete" />
                            &nbsp;<!--<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"  Text="New" />-->
                        </div>
                        </div>
                    </div>
                </div>
                <!--end-->
                </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="ViewPostDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Notice] WHERE ([nid] = @nid)" DeleteCommand="DELETE FROM [Notice] WHERE [nid] = @original_nid" InsertCommand="INSERT INTO [Notice] ([uuid], [notice_date], [description], [title], [exp_date]) VALUES (@uuid, @notice_date, @description, @title, @exp_date)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Notice] SET [uuid] = @uuid, [notice_date] = @notice_date, [description] = @description, [title] = @title, [exp_date] = @exp_date WHERE [nid] = @original_nid" OnSelecting="ViewPostDS_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="original_nid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="uuid" Type="String" />
                        <asp:Parameter DbType="Date" Name="notice_date" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter DbType="Date" Name="exp_date" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="nid" QueryStringField="noticeid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="uuid" Type="String" />
                        <asp:Parameter DbType="Date" Name="notice_date" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter DbType="Date" Name="exp_date" />
                        <asp:Parameter Name="original_nid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GetPostDS" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="nid" Width="1040px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                            <asp:BoundField DataField="uuid" HeaderText="User ID" SortExpression="uuid" />
                            <asp:BoundField DataField="notice_date" HeaderText="Date Created" SortExpression="notice_date" />
                            <asp:BoundField DataField="description" Visible="false" HeaderText="Description" SortExpression="description" />
                    
                            <asp:BoundField DataField="nid" Visible="false" HeaderText="nid" InsertVisible="False" ReadOnly="True" SortExpression="nid" />
                            <asp:BoundField DataField="exp_date" Visible="false" HeaderText="exp_date" SortExpression="exp_date" />
                            <asp:HyperLinkField DataNavigateUrlFields="nid" DataNavigateUrlFormatString="?noticeid={0}" HeaderText="View Notice" Text="View Notice" />
                        </Columns>
                        <HeaderStyle BackColor="#616161" ForeColor="White" />
                    </asp:GridView>
        </div>
        
</form>
    
</body>
</html>
