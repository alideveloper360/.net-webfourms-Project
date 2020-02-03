<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="SalesApp.Stock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sb2-2">
        
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Receiving by vendor Report</h4>
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
                                           
                                            <asp:Label id="lb1" runat="server" />
                                            <asp:Label id="lb2" runat="server" />
                                            
                                                    <div class="row">
                                                        <div class="input-field col s10"></div>
                                                  <div class="input-field col s1">
                                              
                                              <!--  <asp:Button Text="Print form" OnClientClick="return printpage();" CssClass="" runat="server" />--->
                                                        </div>
                                                        </div>

                                                <asp:Panel ID="Panel1" runat="server">
                                                  
                                                            <asp:Label ID="txtPaid_Date" runat="server" BackColor="LightGray" ForeColor="Black"/> 
                                           <div class="row">
                                                    <div class=" col-sm-5">
                                                    <asp:DropDownList ID="ddlFilterCommittee" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterCommittee_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                <br />
                                               <br />
                                           </div>
                                                     <br />
                                               
                                                    <div class="row">
                                               
                                             <div class="col-md-5">
                                                   <label for="txtProductCode">Date From</label>
                                                   <asp:TextBox ID="txtdate1" TextMode="Date" runat="server" /> 
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdate1" ErrorMessage="*Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>
  
                                               </div>
                                               <div class="col-md-5">
                                                   <label for="txtProductCode">Date To</label>
                                                   <asp:TextBox ID="txtdate2" TextMode="Date" runat="server" AutoPostBack="true" OnTextChanged="txtdate2_TextChanged" />  
                                                   <asp:RequiredFieldValidator ID="rv19" runat="server" ControlToValidate="txtdate2" ErrorMessage="*Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>
 
                                               </div>
                                               <br />
                                               <br />
                                              
                                               </div>
                                                <asp:GridView ID="gvCategory" ShowFooter="true" FooterStyle-ForeColor="Yellow" CssClass="table table-condensed compact table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                              
                                                 <Columns>
                                                  
                                                    
                                                    <asp:TemplateField HeaderText="Category Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("CategoryName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("CategoryName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Product Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCode" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCode" runat="server" Text='<%#Eval("ProductName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="P. SKU">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("ProductSKU") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtStatus" runat="server" Text='<%#Eval("ProductSKU") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Meter/Yard">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblvalue" runat="server" Text='<%#Eval("Value") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtvalue" runat="server" Text='<%#Eval("Value") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Quntity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("receiveMY") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("receiveMY") %>'></asp:TextBox>
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
