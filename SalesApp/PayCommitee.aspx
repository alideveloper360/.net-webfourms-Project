<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PayCommitee.aspx.cs" Inherits="SalesApp.PayCommitee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Pay Committee</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Add New Payment</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            <asp:Button Text="Add New" runat="server" ID="btnAddnewEmp" CssClass="btn btn-large" OnClick="btnAddnewEmp_Click" CausesValidation="false" />
                                            <br />
                                            <div class="row" style="margin-bottom:15px">
                                                <div class="input-field col-md-4">
                                                    <asp:DropDownList ID="ddlFilterCommittee" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterCommittee_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                <div class="input-field col-md-8">
                                                    
                                                    <asp:Label runat="server" ID="lblTotal_Amount"/>
                                                    <asp:Label runat="server" ID="lblRemaining_Amount"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col-sm-11"></div>
                                                <div class="input-field col-sm-1">
                                             <asp:ImageButton runat="server" ImageUrl="Images/download.png" CssClass="no-border" ToolTip="Print" name="Submit" Id="SubmitImageButton" Height="35px" Width="35px" OnClientClick="return printpage();"/>  
                                           </div></div>
                                                <asp:Panel ID="Panel1" runat="server">
                                            <asp:GridView ID="gvCategory" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false"
                                                OnRowCancelingEdit="gvCategory_RowCancelingEdit" OnRowDataBound="gvCategory_RowDataBound" OnRowEditing="gvCategory_RowEditing" OnRowUpdating="gvCategory_RowUpdating" OnRowDeleting="gvCategory_RowDeleting" CssClass="table table-condensed compact table-hover table-responsive">
                                                <Columns>
                                                    
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%#Container.DataItemIndex+1 %>' runat="server" ID="lblEmpId" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField> 
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                        </ItemTemplate>
                                                           <EditItemTemplate>
                                                            <asp:TextBox ID="txtAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCode" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Edit" Visible="true">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit"><i class="fa fa-pencil-square-o"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary" />
                                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-primary" />
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnDelete" onClientClick="return confirm('Are you sure you want to delete?');" runat="server" CommandName="Delete"><i class="fa fa-trash-o"></i></asp:LinkButton>
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
                                               </asp:Panel>
                                        </asp:View>
                                        <asp:View ID="View2" runat="server">
                                            <div class="row">
                                                <div class="col s6">
                                                        <label for="ddlCommittee">Committee</label>
                                                    
                                                    <asp:DropDownList onsubmit="required()" ID="ddlCommittee" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                                <div class="col s6">
                                                    <label for="txtDate">Date</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtDate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="rv16" runat="server" ControlToValidate="txtDate" ErrorMessage="*Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                             <div class="col s6">
                                                    <label for="txtDate">Amount</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="TextBox1" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" ErrorMessage="*Please Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                     <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                                                    ControlToValidate="TextBox1" ErrorMessage="Please only type number" />   
                                             </div>
                                            <div class="col s6">
                                                    <label for="txtDate">Total Amount</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtTotalAmount" ReadOnly="true"/>
                                                                                                         
                                             </div>
                                            <asp:Label id="labl1" runat="server" />
                                            <!---- <div class="row">
                                                <div class="col s6">
                                                    <label for="txtDate">Amount</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtAmountCommittee" ReadOnly="true" />
                                                   </div>
                                         </div>----->
                                           <div class="row">
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Add Payment" runat="server" ID="btnAddPayment" CssClass="btn btn-large" OnClick="btnAddPayment_Click" />
                                                    <asp:Label Text="" ID="lblEmpAdd" runat="server" />
                                                </div>
                                                <div class="right-align">
                                                    <asp:LinkButton Text="Go To Payments" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
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
             $('#gvCategory').Datatable();
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
   
             
          function printpage() {
              var getpanel = document.getElementById("<%= Panel1.ClientID%>");
              var MainWindow = window.open('', '', 'height=500,width=800');
              MainWindow.document.write('<html><head><title>Print Page</title>');
              MainWindow.document.write('</head><body>');
              MainWindow.document.write(getpanel.innerHTML);
              MainWindow.document.write('</body></html>');
              MainWindow.document.close();
              setTimeout(function () {
                  MainWindow.print();
              }, 500);
              
              return false;

          }
    </script>
</asp:Content>
