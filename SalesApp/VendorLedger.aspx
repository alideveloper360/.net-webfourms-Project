<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorLedger.aspx.cs" Inherits="SalesApp.VendorLedger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sb2-2">
        <div class="sb2-2-2">
          
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Product Receive</h4>
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
                                               
                                             
                                                <div class="col s4">
                                                    <label for="ddlVendor">Vendor</label>
                                                    <asp:DropDownList ID="ddlVendor" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                  
                                              
                                            </div>
                                            <asp:Label id="po" runat="server" />
                                               </asp:View>
                                     










































                                         <asp:View ID="View2" runat="server">
                                            
                                            <br />
                                            <%--<div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:TextBox ID="txtsrc" runat="server" type="text" class="form-control" onkeyup="return KeyUp(this, '#ContentPlaceHolder1_gvEmployee');" placeholder="Search. . . " />
                                                </div>
                                            </div>--%>
                                            
                                              <div class="row">
                                               
                                                  
                                              <div class="input-field col s6">
                                                        <asp:Button ID="Button2" CssClass="btn btn-large" runat="server" Text="Load" ValidationGroup="load" OnClick="btnLoad_Click" />
                                                </div>
                                            </div>
                                            <asp:GridView ID="GridView1" CssClass="table table-condensed compact table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                              
                                                 <Columns>
                                                  
                                                    <asp:TemplateField HeaderText="S.No" Visible="false">
                                                       
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                       
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Code">
                                                        
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status">
                                                       
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Time">
                                                       
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount">
                                                       
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
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
      
     <script type="text/javascript">
         $(document).ready(function () {
             $('#gvCategory').Datatable();

             $(".tpText").blur(function (e) {
                 console.log("hellow");
             });

         });
     
     var prm = Sys.WebForms.PageRequestManager.getInstance();
         var jq = $.noConflict();

         prm.add_endRequest(function () {
             createDataTable();
         });

         createDataTable();

         function createDataTable() {
             jq('#<%= gvCategory.ClientID %>').DataTable();
             
         }
         $(".tpText").blur(function (e) {
             var meters = $(this).parent('td').parent('tr').find('.tpMeters').val();
             var tp = $(this).val();
             console.log(meters);
             var num = isNaN(parseInt(meters * tp)) ? 0 : parseInt(meters * tp);
             console.log(num);
             $(this).parent('td').parent('tr').find('.totalTpText').text(num);
             
         });
         $(".RpText").blur(function (e) {
             var meters = $(this).parent('td').parent('tr').find('.tpMeters').val();
             var tp = $(this).val();
             var num = isNaN(parseInt(meters * tp)) ? 0 : parseInt(meters * tp);
             $(this).parent('td').parent('tr').find('.totalRpText').text(num);

         });



    </script>
</asp:Content>
