<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="past.aspx.cs" Inherits="Training_and_Placement_Portal.past" %>
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
    <style>
        .RowStyle {
  height: 50px;
}
.AlternateRowStyle {
  height: 50px;
}
    </style>
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
        <div class="row"></div>
        <div class="row">
              <div class="col s6">
                 <div class="card white">
                     <div class="card-content center">
                 <asp:Panel ID="col" runat="server" Visible="false">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="BranchYearASC_DS" Palette="Grayscale" Width="373px">
                        <Series>
                            <asp:Series Name="Series1" IsValueShownAsLabel="True" LabelToolTip="#LEGENDTEXT" Legend="Legend1" XValueMember="bname" YValueMembers="total"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1" BackColor="DimGray" BorderColor="Transparent" ShadowOffset="15">
                                <Area3DStyle Enable3D="True" Inclination="20" LightStyle="Realistic" PointDepth="65" PointGapDepth="65" WallWidth="5" />
                            </asp:ChartArea>
                        </ChartAreas>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 12pt, style=Bold" ForeColor="DimGray" Name="Title1" Text="Numbers of Student Placed">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </asp:Panel>
                 <asp:Panel ID="pie" runat="server" Visible="false">
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="BranchYearASC_DS" Width="388px">
                        <Series>
                            <asp:Series Name="Series1" ChartType="Doughnut" IsValueShownAsLabel="True" Legend="Legend1" XValueMember="bname" YValueMembers="total" YValuesPerPoint="4"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="True" />
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1">
                            </asp:Legend>
                        </Legends>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 12pt, style=Bold" ForeColor="DimGray" Name="Title1" Text="Number Of Students Placed">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                </asp:Panel>

                     </div>
                     <div class="card-action">
                         <div class="row ">
           <div class="col s4 ">
               Year : <asp:TextBox ID="year" AutoPostBack="true" runat="server" OnTextChanged="year_TextChanged"></asp:TextBox>
           </div>
           <div class="col s4">
                Sort : 
                <asp:RadioButtonList ID="order" runat="server" AutoPostBack="true" OnSelectedIndexChanged="order_SelectedIndexChanged">
                    <asp:ListItem Value="0">Assending</asp:ListItem>
                    <asp:ListItem Value="1">Dessending</asp:ListItem>
                </asp:RadioButtonList>
           </div>
           <div class="col s4">
                Type : 
                <asp:RadioButtonList ID="type" AutoPostBack="true" runat="server" OnSelectedIndexChanged="type_SelectedIndexChanged">
                    <asp:ListItem>Column</asp:ListItem>
                    <asp:ListItem>Doughnut</asp:ListItem>
                </asp:RadioButtonList></div>
           </div>
                     </div>
                </div>
                <asp:SqlDataSource ID="BranchYearASC_DS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [BranchwiseByYearView] WHERE ([batch] = @batch) ORDER BY [total]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="year" DefaultValue="0" Name="batch" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
              <div class="col s6">
                 <div class="card white">
                     <div class="card-content">
                         
                         <div class="row">
                    <div class="col s6">
                        <asp:GridView ID="comdata" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="CompanyYearDS" ForeColor="Black" Width="570px" CssClass="RowStyle" PageSize="5">
                    <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <Columns>
                        <asp:BoundField DataField="cname" HeaderText="Company" SortExpression="cname" />
                        <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                        <asp:BoundField DataField="total" HeaderText="Placed" SortExpression="total" />
                        <asp:BoundField DataField="average_package" HeaderText="Package(Avg)" SortExpression="average_package" />
                    </Columns>
                    <EditRowStyle CssClass="RowStyle" BackColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#616161" Font-Bold="True" ForeColor="White" Height="20px" CssClass="RowStyle" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" Height="20px" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" Height="20px" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                        <asp:SqlDataSource ID="CompanyYearDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [cname], [year], [total], [average_package] FROM [CompanyYearView] WHERE ([cid] = @cid) ORDER BY [total] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hidden" DefaultValue="0" Name="cid" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </div>
                </div>
                     </div>
                     <div class="card-action">
                         <div class="row">
                     <div class="col s2">
                        Company : <asp:TextBox ID="cname" AutoPostBack="true" runat="server" OnTextChanged="cname_TextChanged"></asp:TextBox>
                        <asp:AutoCompleteExtender ID="ex1" runat="server" ServiceMethod="GetCompany" TargetControlID="cname" MinimumPrefixLength="2"></asp:AutoCompleteExtender>
                    </div>
                    <div class="col s2">
                        <asp:TextBox ID="hidden" Visible="false" runat="server"></asp:TextBox>
                    </div>
                </div>
                     </div>
                 </div>
                 
             </div>
        </div>

       
    </form>
   
</body>
</html>
