<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myregistered.aspx.cs" Inherits="Training_and_Placement_Portal.myregistered" %>

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
<body>
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  


    <form id="form1" runat="server">
        <div>
        </div>
         <div class="row-center">
            <div class="col s6 center">
                <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
            </div>
           </div>
        <div class="row"></div>
        <div class="row">
            <div class="col s7">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="rid" DataSourceID="ShowRegisteredDS" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="rid" HeaderText="Registered ID" InsertVisible="False" ReadOnly="True" SortExpression="rid" />
                        <asp:BoundField DataField="uuid" HeaderText="uuid" Visible="false" SortExpression="uuid" />
                        <asp:BoundField DataField="Expr2" HeaderText="Expr2" Visible="false" SortExpression="Expr2" />
                       
                        <asp:BoundField DataField="Expr3" HeaderText="Expr3" Visible="false" SortExpression="Expr3" />
                        <asp:BoundField DataField="cname" HeaderText="Company Name" SortExpression="cname" />
                        <asp:BoundField DataField="visit_date" HeaderText="Visit Date" SortExpression="visit_date" />
                         <asp:BoundField DataField="active" HeaderText="Active" SortExpression="active" />
                        <asp:HyperLinkField DataNavigateUrlFields="rid" DataNavigateUrlFormatString="?rid={0}" HeaderText="VIew" Text="View" />
                    </Columns>
                    <HeaderStyle BackColor="#616161" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="ShowRegisteredDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Registers.rid, Registers.uuid, Registers.sid AS Expr2, Registers.active, Schedule.cid AS Expr3, Company.cname, Schedule.visit_date FROM Registers INNER JOIN Schedule ON Registers.sid = Schedule.sid INNER JOIN Company ON Schedule.cid = Company.cid"></asp:SqlDataSource>

            </div>
            <div class="col s5">
                <asp:Panel ID="view" runat="server">
                <div class="card white">
                    <div class="card-content">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="rid" DataSourceID="ViewDetailsDS" OnDataBound="FormView1_DataBound" OnItemDeleted="FormView1_ItemDeleted">
                    <EditItemTemplate>
                        cname:
                        <asp:TextBox ID="cnameTextBox" runat="server" Text='<%# Bind("cname") %>' />
                        <br />
                        phone:
                        <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        <br />
                        email:
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        rid:
                        <asp:Label ID="ridLabel1" runat="server" Text='<%# Eval("rid") %>' />
                        <br />
                        uuid:
                        <asp:TextBox ID="uuidTextBox" runat="server" Text='<%# Bind("uuid") %>' />
                        <br />
                        sid:
                        <asp:TextBox ID="sidTextBox" runat="server" Text='<%# Bind("sid") %>' />
                        <br />
                        cid:
                        <asp:TextBox ID="cidTextBox" runat="server" Text='<%# Bind("cid") %>' />
                        <br />
                        package:
                        <asp:TextBox ID="packageTextBox" runat="server" Text='<%# Bind("package") %>' />
                        <br />
                        visit_date:
                        <asp:TextBox ID="visit_dateTextBox" runat="server" Text='<%# Bind("visit_date") %>' />
                        <br />
                        deadline:
                        <asp:TextBox ID="deadlineTextBox" runat="server" Text='<%# Bind("deadline") %>' />
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

                        uuid:
                        <asp:TextBox ID="uuidTextBox" runat="server" Text='<%# Bind("uuid") %>' />
                        <br />
                        sid:
                        <asp:TextBox ID="sidTextBox" runat="server" Text='<%# Bind("sid") %>' />
                        <br />
                        cid:
                        <asp:TextBox ID="cidTextBox" runat="server" Text='<%# Bind("cid") %>' />
                        <br />
                        package:
                        <asp:TextBox ID="packageTextBox" runat="server" Text='<%# Bind("package") %>' />
                        <br />
                        visit_date:
                        <asp:TextBox ID="visit_dateTextBox" runat="server" Text='<%# Bind("visit_date") %>' />
                        <br />
                        deadline:
                        <asp:TextBox ID="deadlineTextBox" runat="server" Text='<%# Bind("deadline") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table class="bordered">
                            <tr>
                                <td><b>Company Name :</b></td>
                                <td><asp:Label ID="cnameLabel" runat="server" Text='<%# Bind("cname") %>' /></td>
                            </tr>
                            <tr>
                                <td><b>Contact :</b></td>
                                <td><asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' /></td>
                            </tr>
                            <tr>
                                <td><b>Email :</b></td>
                                <td><asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' /></td>
                            </tr>
                            <tr>
                                <td><b>Package :</b></td>
                                <td><asp:Label ID="packageLabel" runat="server" Text='<%# Bind("package") %>' /></td>
                              </tr>
                                <tr>
                                <td><b>Visit Date :</b></td>
                                <td><asp:Label ID="visit_dateLabel" runat="server" Text='<%# Bind("visit_date") %>' /></td>
                            </tr>
                                

                            
                        </table>
                        <br />
                        <asp:LinkButton ID="DeleteButton" runat="server" class="btn waves-effect waves-light grey darken-2" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="ViewDetailsDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Registers WHERE (rid = @rid)" SelectCommand="SELECT Company.cname, Company.phone, Company.email, Registers.rid, Registers.uuid, Registers.sid, Schedule.cid, Schedule.package, Schedule.visit_date, Schedule.deadline FROM Company INNER JOIN Schedule ON Company.cid = Schedule.cid INNER JOIN Registers ON Schedule.sid = Registers.sid WHERE (Registers.rid = @rid)">
                    <DeleteParameters>
                        <asp:Parameter Name="rid" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="rid" QueryStringField="rid" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        </div>
                    </div>
                    </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
