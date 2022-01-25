<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_status.aspx.cs" Inherits="Training_and_Placement_Portal.update_satus" %>
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
        <div class="center">
            <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label></div>
        <asp:UpdatePanel ID="upanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="visited" runat="server" OnRowDataBound="visited_RowDataBound" AutoGenerateColumns="False" DataKeyNames="cid,sid" DataSourceID="VisitedCompanyDS" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="cid" HeaderText="Company ID" InsertVisible="False" ReadOnly="True" SortExpression="cid" />
                        <asp:TemplateField HeaderText="Schedule ID" InsertVisible="False" SortExpression="sid">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("sid") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="sid" runat="server" Text='<%# Bind("sid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="cname" HeaderText="Company Name" SortExpression="cname" />
                        <asp:BoundField DataField="visit_date" HeaderText="Visit Date" SortExpression="visit_date" />
                        <asp:HyperLinkField DataNavigateUrlFields="sid" DataNavigateUrlFormatString="?sid={0}" HeaderText="Update" Text="Update" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="#616161" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="VisitedCompanyDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Company.cid, Schedule.sid, Company.cname, Schedule.visit_date FROM Company INNER JOIN Schedule ON Company.cid = Schedule.cid"></asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="row">
            <div class="col s12">

            </div>

        </div>
        <div class="divider"></div>
        <div class="row">
            <div class="col s12">

            </div>

        </div>
        <asp:UpdatePanel ID="upanel2" runat="server">
            <ContentTemplate>
                <asp:GridView ID="StudentList" runat="server" AutoGenerateColumns="False" DataSourceID="StudentListDS" DataKeyNames="uuid" OnRowDataBound="StudentList_RowDataBound" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <Columns>
                        <asp:TemplateField HeaderText="User ID" SortExpression="uuid">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("uuid") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="uname" runat="server" Text='<%# Bind("uuid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                        <asp:BoundField DataField="mname" HeaderText="Middle Name" SortExpression="mname" />
                        <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                        <asp:BoundField DataField="rollno" HeaderText="Roll Number" SortExpression="rollno" />
                        <asp:BoundField DataField="active" Visible="false" HeaderText="Active" SortExpression="active" />
                        <asp:TemplateField HeaderText="Placed">
                            <ItemTemplate>
                                <asp:CheckBoxList ID="isplaced" runat="server">
                                    <asp:ListItem>Yes</asp:ListItem>
                                </asp:CheckBoxList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Package">
                            <ItemTemplate>
                                <asp:TextBox ID="package" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="#616161" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="StudentListDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [uuid], [fname], [mname], [lname], [rollno], [active] FROM [MyView] WHERE (([active] = @active) AND ([sid] = @sid))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="yes" Name="active" Type="String" />
                        <asp:QueryStringParameter DefaultValue="0" Name="sid" QueryStringField="sid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:CheckBox ID="final" runat="server" Text="Rest are updated as not placed" />
         <div class="row">
           	<div class="input-field col s12 body-align:center;">
               <div class="input-field col s3 white-text">
                    <asp:LinkButton class="btn waves-effect waves-light grey darken-2" ID="update" runat="server" OnClick="update_Click">Update</asp:LinkButton>
                </div>
                 
                <br />
                <br />
                <br />
                 
            </div>
                    <asp:LinkButton class="btn waves-effect waves-light grey darken-2" ID="export" runat="server" OnClick="export_Click">Export as Excel File</asp:LinkButton>
        </div>
    </form>
</body>
</html>
