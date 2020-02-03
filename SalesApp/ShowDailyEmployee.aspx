<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowDailyEmployee.aspx.cs" Inherits="SalesApp.ShowDailyEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sb2-2">
        
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Show Payment Record</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                     <asp:Label id="p1" runat="server" />
                                            <asp:Label id="p2" runat="server" />
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            
                                            <br />
                                            <%--<div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:TextBox ID="txtsrc" runat="server" type="text" class="form-control" onkeyup="return KeyUp(this, '#ContentPlaceHolder1_gvEmployee');" placeholder="Search. . . " />
                                                </div>
                                            </div>--%>
                                            <div class="row">
                                               
                                               <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtDate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="rv18" runat="server" ValidationGroup="load" ControlToValidate="txtDate" ErrorMessage="*Please select date" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </div>
                                                <div class="row">
                                              <div class="input-field col s6">
                                                        <asp:Button ID="btnLoad"  CssClass="btn btn-large" runat="server" Text="Load" ValidationGroup="load" OnClick="btnLoad_Click" />
                                                </div>
                                            </div>
                                            <asp:Label id="lb1" runat="server" />
                                            <asp:Label id="lb2" runat="server" />
                                            
                                                    <div class="row">
                                                        <div class="input-field col s10"></div>
                                                  <div class="input-field col s1">
                                                <asp:ImageButton runat="server" Visible="false" ImageUrl="Images/download.png" CssClass="no-border" ToolTip="Print" name="Submit" Id="SubmitImageButton" Height="35px" Width="35px" OnClientClick="return printpage();"/>  
                                              <!--  <asp:Button Text="Print form" OnClientClick="return printpage();" CssClass="" runat="server" />--->
                                                        </div>
                                                        </div>

                                                <asp:Panel ID="Panel1" runat="server">
                                                  
                                                            <asp:Label ID="txtPaid_Date" runat="server" BackColor="LightGray" ForeColor="Black"/> 
                                            
                                                <asp:GridView ID="gvCategory" ShowFooter="true" FooterStyle-ForeColor="Yellow" CssClass="table table-condensed compact table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                              
                                                 <Columns>
                                                  
                                                    
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("strName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("strName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCode" runat="server" Text='<%#Eval("strCode") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCode" runat="server" Text='<%#Eval("strCode") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtStatus" runat="server" Text='<%#Eval("status") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Time">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("Time") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("Time") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("Pay").ToString()==""?"0":Eval("pay").ToString()%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("Pay") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                      

                                                </Columns>
                                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                <RowStyle ForeColor="#000066" />
                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                            </asp:GridView>
                                             </asp:Panel>
                                           
                                               </asp:View>
                                     
                                    </asp:MultiView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


        <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src=" https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
     <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
          <script>

                       $(document).ready(function () {
                           $('#gvCategory').Datatable({
                               dom: 'Bfrtip',
                               buttons: [
                                      'print'
                               ]
                           });
                           $(".buttons-print").addClass("btn");
         });
         var prm = Sys.WebForms.PageRequestManager.getInstance();
         var jq = $.noConflict();

         prm.add_endRequest(function () {
             createDataTable();
         });

         createDataTable();

         function createDataTable() {
             jq('#<%= gvCategory.ClientID %>').DataTable({
                 dom: 'Bfrtip',
                 buttons: [
                        'print'
                 ]
             });
             $(".buttons-print").addClass("btn");
         }

    </script>
</asp:Content>
