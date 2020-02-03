<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receiving_Report.aspx.cs" Inherits="SalesApp.Receiving_Report" %>
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
                                            <asp:Button Text="Add New" style="margin-bottom:15px" runat="server" ID="btnAddnewEmp" Visible="false" CssClass="btn btn-large" OnClick="btnAddnewEmp_Click" CausesValidation="false" />
                                            <br />
                                           <%-- <div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:DropDownList ID="ddlFilterCommittee" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterCommittee_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>--%>
                                            
                        <asp:GridView ID="gvBills" runat="server" CssClass="table table-condensed compact table-hover table-responsive" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" OnRowCommand="gvBills_RowCommand"  BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                                <Columns>
                                                     <asp:TemplateField HeaderText="Vendor Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("strName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBillNo" runat="server" Text='<%#Eval("GRN") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField HeaderText="GRN Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBill" runat="server" Text='<%#Eval("GRN") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                   
                                                      <asp:TemplateField HeaderText="Total Trade Price">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTradePrice" runat="server" Text='<%#Eval("TP") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Total Retail Price">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRetailPrice" runat="server" Text='<%#Eval("RP") %>'></asp:Label>
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
                                            <div class="row">
                                                <div class="col-sm-11"></div>
                                                <div class="col-sm-1">
                                            <asp:ImageButton runat="server" ImageUrl="Images/download.png" CssClass="no-border" ToolTip="Print" name="Submit" Id="SubmitImageButton" Height="35px" Width="35px" OnClientClick="return printpage();"/>  
                                            </div>
                                                </div>
                                                <asp:Panel ID="Panel1" runat="server">
                                                    <asp:Label Text="Vendor Name : " runat="server" ForeColor="Gray" Font-Bold="true"  />
                                                    <asp:Label ID="lbl_V_Name" runat="server" />
                                                <asp:Label Text="GRN : " style="margin-left:40px" runat="server" ForeColor="Gray" Font-Bold="true" />

                                                <asp:Label ID="lblGRNmsg"  runat="server"  />
                                                    <asp:Label Text="Date : " style="margin-left:40px" runat="server" ForeColor="Gray" Font-Bold="true"  />
                                                 <asp:Label ID="lbl_Date"  runat="server" />
                                           <asp:Label id="lblbill_no" runat="server" Visible="false" />
                                            <asp:Label id="lblv_id" runat="server" Visible="false" />
                                            <asp:Label style="font-size:16px;background-color:gray;color:white" id="txtBillno" runat="server" />
                                         <asp:GridView ID="grdFullRecords" ShowFooter="true" OnRowDataBound="grdFullRecords_RowDataBound" CssClass="table table-condensed compact table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"  BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                                <Columns>
                                                     
                                                  
                                                       
                                                        <asp:TemplateField HeaderText="Product Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPName" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("ProductName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Category Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCName" runat="server" Text='<%#Eval("CategoryName")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("CategoryName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                      
                                                        <asp:TemplateField HeaderText="SKU">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSKU" runat="server" Text='<%#Eval("ProductSKU")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("ProductSKU") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                     
                                                        <asp:TemplateField HeaderText="Meter/Yard">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblValue" runat="server" Text='<%#Eval("Value")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("Value") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                     
                                                       
                                                     <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMY" runat="server" Text='<%#Eval("receiveMY")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("receiveMY") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                         <FooterTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text="Total="></asp:Label>
                                                            <asp:Label ID="lblFooterQuantity" runat="server" Text=""></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Total TradePrice">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotalTP" runat="server" Text='<%#Eval("TotalTP")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("TotalTP") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                   <FooterTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text="Total="></asp:Label>
                                                            <asp:Label ID="lblFooterTrade" runat="server" Text=""></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>                                                     
                                                    <asp:TemplateField HeaderText="Total RetailPrice">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotalRP" runat="server" Text='<%#Eval("TotalRP")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("TotalRP") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="Label5" runat="server" Text="Total="></asp:Label>
                                                            <asp:Label ID="lblFooterRetail" runat="server" Text=""></asp:Label>
                                                        </FooterTemplate>
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
    
     var prm = Sys.WebForms.PageRequestManager.getInstance();
         var jq = $.noConflict();

       

         createDataTable();

         function createDataTable() {
             jq('#<%= gvBills.ClientID %>').DataTable();
            jq('#<%= grdFullRecords.ClientID %>').DataTable();
            
         }
         function createFullDataTable() {
             console.log("Sample sadsa");
             jq('#<%= grdFullRecords.ClientID %>').DataTable();
            
         }
         function createDataTable() {
             jq('#<%= grdFullRecords.ClientID %>').DataTable({
                 dom: 'Bfrtip',
                 buttons: [
                        'print'
                 ]
             });
             $(".buttons-print").addClass("btn");
         }


         $(document).ready(function () {
             $('#grdFullRecords').Datatable({
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
    </script>
</asp:Content>
