<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReceivedProduct.aspx.cs" Inherits="SalesApp.ReceivedProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Receive Product</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Receive Product</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            <asp:Button Text="Add New" style="margin-bottom:15px" runat="server" ID="btnAddnewEmp" CssClass="btn btn-large" OnClick="btnAddnewEmp_Click" CausesValidation="false" />
                                            <br />
                                           <%-- <div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:DropDownList ID="ddlFilterCommittee" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterCommittee_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>--%>
                        <asp:GridView ID="gvBills" runat="server" CssClass="table table-condensed compact table-hover table-responsive" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" OnRowCommand="gvBills_RowCommand"  BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBillNo" runat="server" Text='<%#Eval("BillNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%#Container.DataItemIndex+1 %>' runat="server" ID="lblEmpId" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bill Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBill" runat="server" Text='<%#Eval("BillNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                   
                                                      <asp:TemplateField HeaderText="Trade Price">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTradePrice" runat="server" Text='<%#Eval("TradePrice") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                      <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnViewAll" runat="server" CssClass="btn btn-small" OnClick="btnViewAll_Click" Text="View All" CommandArgument="<%# Container.DataItemIndex %>" CommandName="ViewAll" />
                                                        </ItemTemplate>
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
                                        <asp:View ID="View2" runat="server">
                                            <div class="row">
                                             <div class="col s6">
                                                    <label for="txtBill">Bill Number</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtBill" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtBill" ErrorMessage="*Please Enter Bill Number" ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                                </div>
                                                  <div class="col s6">
                                                    <label for="ddlVendor">Vendor</label>
                                                    <asp:DropDownList ID="ddlVendor" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col s6">
                                                    <label for="txtSKU">SKU</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtSKU" AutoPostBack="true" OnTextChanged="txtSKU_TextChanged" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSKU" ErrorMessage="*Please Enter SKU" ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                                </div>
                                                <div class="col s6">
                                                    <label for="txtProdName">Product Name</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtProdName" ReadOnly="true"/>
                                                </div>
                                            </div>
                                             <div class="row">
                                                <div class="col s3">
                                                    <label for="txtDate">Measure Type</label>
                                                    <asp:DropDownList CssClass="form-control" ID="ddlMeasure" runat="server">
                                                        <asp:ListItem Value="Meter">Meter</asp:ListItem>
                                                        <asp:ListItem Value="Yard">Yard</asp:ListItem>
                                                    </asp:DropDownList>
                                                   </div>
                                                  <div class="col s3">
                                                    <label for="txtDate">Quantity</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtQuantity"/>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtQuantity" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>      
                                                  </div>
                                                   <div class="col s3">
                                                    <label for="txtSuits">No of Suits</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtSuits" AutoPostBack="true" OnTextChanged="txtSuits_TextChanged" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSuits" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>      
                                                  </div>
                                                  <div class="col s3">
                                                    <label for="txtCutting">Cutting</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtCutting"/>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCutting" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>      
                                                  </div>
                                         </div>
                                              <div class="row">
                                             <div class="col s3">
                                                    <label for="txtTP">Trade Price</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtTP" AutoPostBack="true" OnTextChanged="txtTP_TextChanged"/>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTP" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>      
                                                  </div>
                                                  <div class="col s3">
                                                    <label for="txtPercentage">Margin Percentage</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtPercentage" ReadOnly="true"/>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ControlToValidate="txtPercentage" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>      
                                                  </div>
                                             
                                                  <div class="col s3">
                                                    <label for="txtCutting">Retail Price</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtRP" AutoPostBack="true" OnTextChanged="txtRP_TextChanged"/>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRP" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>      
                                                  </div>
                                             </div>
                                           <div class="row">
                                                 <div class="col s3">
                                                   <label for="lblTrade">Trade</label>
                                                    <asp:Label runat="server" ID="lblTrade"></asp:Label>
                                                 </div>
                                                <div class="col s3">
                                                    <label for="lblTrade">Retail</label>
                                                    <asp:Label runat="server" ID="lblRetail"></asp:Label>
                                                 </div>
                                               </div>
                                           <div class="row">
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Receive" runat="server" ID="btnReceive" OnClick="btnReceive_Click" CssClass="btn btn-large" />
                                                    <asp:Label Text="" ID="lblEmpAdd" runat="server" />
                                                </div>
                                                <div class="right-align">
                                                   <%-- <asp:LinkButton Text="Go To Payments" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
                                         --%>       

                                                </div>
                                            </div>
                                                  <div class="row">
                                                    <div class="right-align">
                                                    <asp:LinkButton Text="Go To Bills" ID="LinkButton1" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
                                                </div>
    

                                            </div>
                                        </asp:View>
                                        <asp:View ID="View3" runat="server">
                                            <asp:Label style="font-size:16px;background-color:gray;color:white" id="txtBillno" runat="server" />
                                         <asp:GridView ID="grdFullRecords" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"  BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBillNo" runat="server" Text='<%#Eval("BillNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%#Container.DataItemIndex+1 %>' runat="server" ID="lblEmpId" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Product SKU">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBill" runat="server" Text='<%#Eval("ProdSKU") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Trade Price">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTradePrice" runat="server" Text='<%#Eval("TradePrice") %>'></asp:Label>
                                                        </ItemTemplate>
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
                                            <div class="row">
                                                    <div class="right-align">
                                                    <asp:LinkButton Text="Go To Bills" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
                                                </div>
                                            </div>
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
             $('#gvBills').Datatable();
         });
     
     var prm = Sys.WebForms.PageRequestManager.getInstance();
         var jq = $.noConflict();

         prm.add_endRequest(function () {
             createDataTable();
         });

         createDataTable();

         function createDataTable() {
             jq('#<%= gvBills.ClientID %>').DataTable();
         }
     
    </script>
</asp:Content>
