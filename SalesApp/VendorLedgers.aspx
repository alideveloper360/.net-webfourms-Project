<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorLedgers.aspx.cs" Inherits="SalesApp.VendorLedgers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Vendor Ledgers</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Vendor Ledgers</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                              <div class="row">
                                                <div class="col s6">
                                                    <label>Vendor</label>
                                                    <asp:DropDownList ID="ddlVendors" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlVendors_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                             
                                            </div>
                                           
                                            <div class="row">
                                                  <div class="col s6">
                                                       <label for="lblRetailPrice">Total Price:</label>
                                                    <asp:Label runat="server" ID="lblRetailPrice" />
                                                </div>
                                            </div>
                                            <div class="row">
                                               <div class="col s6">
                                                       <label for="lblPayable">Total Payable:</label>
                                                    <asp:Label runat="server" ID="lblPayable" />
                                                </div>
                                            </div>
                                              <div class="row">
                                               <div class="col s6">
                                                       <label for="lblPaid">Total Paid:</label>
                                                    <asp:Label runat="server" ID="lblPaid" />
                                                </div>
                                            </div>
                                            
                                              <div class="row">
                                        <asp:Button Text="Add Payment for Vendor" runat="server" ID="btnPayTOVendor" CssClass="btn btn-small" OnClick="btnPayTOVendor_Click" CausesValidation="false" />
                                         </div>
                                        <asp:Label id="Label1" runat="server" />
                                
                                        </asp:View>
                                        <asp:View ID="View2" runat="server">
                                              <div class="row">
                                                <div class="col s6">
                                                    <label>Select Vendor</label>
                                                    <asp:DropDownList ID="ddlPayVendor" AutoPostBack="true" OnSelectedIndexChanged="ddlPayVendor_SelectedIndexChanged" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col s6">
                                                    <label>Date</label>
                                                    <asp:TextBox class="input-field" runat="server" ID="txtDate" CssClass="validate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="rv15" runat="server" ControlToValidate="txtDate" ErrorMessage="*Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>


                                                </div>
                                                <div class="col s6">
                                                       <label for="txtAmount">Amount</label>
                                                  
                                                    <asp:TextBox  class="input-field" runat="server" CssClass="validate" ID="txtAmount" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAmount" ErrorMessage="*Please Enter Amount" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                           <div class="row">
                                                <div class="col s6">
                                                   <label for="txtDescription">Description</label>
                                                    <asp:TextBox  class="form-control" runat="server" CssClass="validate" ID="txtDescription" TextMode="MultiLine" />
                                                   </div>
                                                      <div class="col s6">
                                                   <label for="lblTotalPayableAmount">Total Payable</label>
                                                    <asp:Label runat="server"  ID="lblTotalPayableAmount" />
                                            </div>
                                           </div>
                                            <div class="row">
                                                 <div class="col s6">
                                                      <asp:Button Text="Payment To Vendor" runat="server" ID="btnPayment" CssClass="btn btn-large" OnClick="btnPayment_Click" />
                                    
                                                 </div>
                                                 <div class="col s6">
                                                     <asp:Label ID="lblEmpAdd" runat="server" Text=""></asp:Label>
                                                 </div>
                                            </div>
                                       </asp:View>
                                     <asp:View id="View3" runat="server">
               <%--                 <asp:GridView ID="grdRecords" runat="server" CssClass="table table-condensed compact table-hover table-responsive"  BackColor="White" BorderColor="#CCCCCC" EmptyDataText="No records found!" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
            
                   <Columns>
                       <asp:BoundField DataField="Date"  HeaderText="Date" />
                       <asp:BoundField DataField="Amount"  HeaderText="Amount" />
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
                        </asp:GridView>--%>
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
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />
     <script type="text/javascript">
         //var prm = Sys.WebForms.PageRequestManager.getInstance();
         //var jq = $.noConflict();

         //prm.add_endRequest(function () {
         //    createDataTable();
         //});

         //createDataTable();
      
         
</script>
</asp:Content>
