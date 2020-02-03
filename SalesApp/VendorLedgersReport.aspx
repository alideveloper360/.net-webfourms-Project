<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorLedgersReport.aspx.cs" Inherits="SalesApp.VendorLedgersReport" %>
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
                                           <hr />

<table class="table table-condensed compact table-hover table-responsive" cellspacing="0" cellpadding="3" rules="all" id="ContentPlaceHolder1_gvCategory" style="background-color:White;border-color:#CCCCCC;border-width:1px;border-style:None;border-collapse:collapse;">
				<thead>
					<tr style="color:White;background-color:#006699;font-weight:bold;">
						<th scope="col">Total</th><th scope="col">Paid</th><th scope="col">Remaining</th><th scope="col"></th>
                        <th scope="col"></th>
					</tr>
				</thead>
    <tbody>
      <tr style="color:#000066;">
						<td>
                             <asp:Label runat="server" ID="lblRetailPrice" />
                                               
                                                        </td>
          <td>
                <asp:Label runat="server" ID="lblPaid" />
                                                           
                                                        </td>
          <td>
                  <asp:Label runat="server" ID="lblPayable" />
                                                        </td>
            <td>
                <asp:Button ID="btnReceived" CssClass="btn btn-small" runat="server" Text="View Received" OnClick="btnReceived_Click" />
                                                        </td>
            <td>
                 <asp:Button ID="btnPaid" CssClass="btn btn-small" runat="server" Text="View Paid"  OnClick="btnPaid_Click"/>
                                                        </td>
					</tr>
    </tbody>
    </table>

        <asp:GridView ID="grdReceivedRecords" Visible="false" runat="server" CssClass="table table-condensed compact table-hover table-responsive"  BackColor="White" BorderColor="#CCCCCC" EmptyDataText="No records found!" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
            
                   <Columns>
                       <asp:BoundField DataField="Date"  HeaderText="Date" />
                       <asp:BoundField DataField="TotalTP"  HeaderText="Amount" />
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
     <asp:GridView ID="grdSentRecords" Visible="false" runat="server" CssClass="table table-condensed compact table-hover table-responsive"  BackColor="White" BorderColor="#CCCCCC" EmptyDataText="No records found!" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
            
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
