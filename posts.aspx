<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="posts.aspx.cs" Inherits="Training_and_Placement_Portal.viewposts" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
     
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      
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
           <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
        <div>
        </div>
        <div class="row-center">
            <div class="col s6 center">
                <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
            </div>
           </div>
        <div class="row">
        </div>
        <asp:UpdatePanel ID="upanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col s5 right">
                        <asp:HyperLink ID="writepost" class="btn waves-effect waves-light grey darken-2" NavigateUrl="~/write_post.aspx" Visible="false" runat="server">Write POst</asp:HyperLink>
                    </div>
                </div>
                <div class="row">
                    <div class="col s7">

                    
                    <asp:GridView ID="posts" runat="server" AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="ViewPostsDS" OnRowDataBound="posts_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="pid" HeaderText="Post ID" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
                             <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                            <asp:TemplateField HeaderText="Post By" SortExpression="uuid">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("uuid") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="postby" runat="server" Text='<%# Bind("uuid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="description" HeaderText="Description" Visible="false" SortExpression="description" />
                            <asp:BoundField DataField="post_date" HeaderText="Published Date" SortExpression="post_date" />
                           
                            <asp:HyperLinkField DataNavigateUrlFields="pid" DataNavigateUrlFormatString="?postid={0}" HeaderText="View Post" Text="View" />
                           
                        </Columns>
                        <HeaderStyle BackColor="#616161" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ViewPostsDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Post] ORDER BY [post_date] DESC"></asp:SqlDataSource>
               </div>
                    
               </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="row">
            <div class="col s9">
                <asp:FormView ID="postdetails" runat="server" DataKeyNames="pid" DataSourceID="PostDetailsDS">
                    <EditItemTemplate>
                        Post ID :
                        <asp:Label ID="pidLabel1" runat="server" Text='<%# Eval("pid") %>' />
                        <br />
                        Title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        User ID :
                        <asp:TextBox ID="uuidTextBox" runat="server" Enabled="false" Text='<%# Bind("uuid") %>' />
                        <br />
                        Description :
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' Height="200px" Rows="10" TextMode="MultiLine" />
                        <br />
                        <asp:HtmlEditorExtender ID="ex1" TargetControlID="descriptionTextBox" runat="server">
                             <Toolbar>
                                <asp:Bold />
                                  <asp:Italic />
                <asp:UnderLine />
                                
                <asp:Undo />
                <asp:Redo />
                <asp:Cut />
                <asp:Copy />
                <asp:Paste />
                <asp:ForeColorSelector />
                <asp:FontNameSelector />
             
            </Toolbar>
          </asp:HtmlEditorExtender>
                        Posted On :
                        <asp:TextBox ID="post_dateTextBox" runat="server" Enabled="false" Text='<%# Bind("post_date") %>' />
                        <br />
                        
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn waves-effect waves-light grey darken-2" />
                        &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn waves-effect waves-light grey darken-2" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        uuid:
                        <asp:TextBox ID="uuidTextBox" runat="server" Text='<%# Bind("uuid") %>' />
                        <br />
                        description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                        <br />
                        post_date:
                        <asp:TextBox ID="post_dateTextBox" runat="server" Text='<%# Bind("post_date") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
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
                            
                            Post ID :
                            <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                            <br />
                            <br />
                            <span class="card-title">
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' Font-Bold="True" Font-Size="X-Large" />
                            </span>
                            <br />
                            <div class="divider"></div>
                            <table>
                                <tr>
                                    <td><b>Posted By :</b><asp:Label ID="uuidLabel" Font-Italic="true" runat="server" Text='<%# Bind("uuid") %>' /></td>
                                    <td><b>On :</b><asp:Label ID="post_dateLabel" Font-Italic="true"  runat="server" Text='<%# Bind("post_date") %>' /></td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2"><asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' /></td>
                                </tr>
                            </table>
                            
                            
                           
                        </div>
                        <div class="card-action">
                             <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Visible='<%# isAllow((string)Session["user_role"]) %>' CssClass="btn waves-effect waves-light grey darken-2" />
                             &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" Visible='<%# isAllow((string)Session["user_role"]) %>' CssClass="btn waves-effect waves-light grey darken-2" />
                             &nbsp;
                        </div>
                        </div>
                    </div>
                </div>
                <!--end-->
               
                        
                       
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="PostDetailsDS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Post] WHERE [pid] = @original_pid AND (([uuid] = @original_uuid) OR ([uuid] IS NULL AND @original_uuid IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([post_date] = @original_post_date) OR ([post_date] IS NULL AND @original_post_date IS NULL)) AND (([title] = @original_title) OR ([title] IS NULL AND @original_title IS NULL))" InsertCommand="INSERT INTO [Post] ([uuid], [description], [post_date], [title]) VALUES (@uuid, @description, @post_date, @title)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Post] WHERE ([pid] = @pid)" UpdateCommand="UPDATE [Post] SET [uuid] = @uuid, [description] = @description, [post_date] = @post_date, [title] = @title WHERE [pid] = @original_pid AND (([uuid] = @original_uuid) OR ([uuid] IS NULL AND @original_uuid IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([post_date] = @original_post_date) OR ([post_date] IS NULL AND @original_post_date IS NULL)) AND (([title] = @original_title) OR ([title] IS NULL AND @original_title IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_pid" Type="Int32" />
                        <asp:Parameter Name="original_uuid" Type="String" />
                        <asp:Parameter Name="original_description" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_post_date" />
                        <asp:Parameter Name="original_title" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="uuid" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter DbType="Date" Name="post_date" />
                        <asp:Parameter Name="title" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="pid" QueryStringField="postid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="uuid" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter DbType="Date" Name="post_date" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="original_pid" Type="Int32" />
                        <asp:Parameter Name="original_uuid" Type="String" />
                        <asp:Parameter Name="original_description" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_post_date" />
                        <asp:Parameter Name="original_title" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
