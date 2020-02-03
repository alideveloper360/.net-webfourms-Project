<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorLeadureReport.aspx.cs" Inherits="SalesApp.VendorLeadureReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Vendor Leadure Report</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4> Vendor Leadure Report</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            <asp:Label id="txtyear" runat="server" Visible="false"/>
                                            <asp:Label id="sha1" runat="server" Visible="false"/>
                                            <asp:Button Text="Add New" Visible="false" style="margin-bottom:15px" runat="server" ID="btnAddnewEmp" CssClass="btn btn-large" OnClick="btnAddnewEmp_Click" CausesValidation="false" />
                                            <div class="row">
                                            <div class=" col-sm-5">
                                                    <asp:DropDownList ID="ddlFilterCommittee" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterCommittee_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                
                                                </div>
                                             <br />
                                            <div class="row">
                                                        <div class="input-field col s11"></div>
                                                  <div class="input-field col s1">
                                                <asp:ImageButton runat="server" Visible="false" ImageUrl="Images/download.png" CssClass="no-border" ToolTip="Print" name="Submit" Id="SubmitImageButton" Height="35px" Width="35px" OnClientClick="return printpage();"/>  
                                              <!--  <asp:Button Text="Print form" OnClientClick="return printpage();" CssClass="" runat="server" />--->
                                                        </div>
                                                        </div>
                                            <asp:Panel ID="Panel1" runat="server">

                                            <asp:GridView ID="gvCommittee" runat="server" ShowFooter="true" CssClass="table table-condensed compact table-hover table-responsive" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false"
                                                OnRowCancelingEdit="gvLoans_RowCancelingEdit" OnRowDataBound="gvLoans_RowDataBound" OnRowEditing="gvLoans_RowEditing" OnRowUpdating="gvLoans_RowUpdating" OnRowDeleting="gvLoans_RowDeleting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%#Container.DataItemIndex+1 %>' runat="server" ID="lblEmpId" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Vendor Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("strName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("strName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="GRN">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("GRN") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("GRN") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Bill Amounts">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDuration" runat="server" Text='<%#Eval("TotalTP").ToString()==""?"0":Eval("TotalTP").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridDuration" runat="server" Text='<%#Eval("TotalTP") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Paid Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("PaidAmount").ToString()==""?"0":Eval("PaidAmount").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridAmount" runat="server" Text='<%#Eval("PaidAmount") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remaining">
                                                        <ItemTemplate>

                                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("payable").ToString()==""?"0":Eval("payable").ToString() %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridAmount" runat="server" Text='<%#Eval("payable") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                   
                                                    <asp:TemplateField HeaderText="Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridAmount" runat="server" Text='<%#Eval("Date") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                 
                                                    
                                                    <asp:TemplateField HeaderText="Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridAmount" runat="server" Text='<%#Eval("Description") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                     </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="black" ForeColor="#000066" />
                                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                <RowStyle ForeColor="#000066" />
                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                            </asp:GridView>
                                                <asp:Label Text="Hello" runat="server" />
                                                </asp:Panel>
                                        </asp:View>
                                        <asp:View ID="View2" runat="server">
                                            <div class="row">
                                                <div class="input-field col s6">

                                                 <asp:DropDownList onsubmit="required()" ID="ddlCategory" runat="server" AutoPostBack="true" CssClass="form-control"  OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                     </asp:DropDownList>
                                                         
                                                </div>
                                                <div class="col s6">
                                                    
                                                    <label for="txtAmount">Amount</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtAmount" />
                                                    <asp:RequiredFieldValidator ID="rv16" runat="server" ControlToValidate="txtAmount" ErrorMessage="*Please Enter Amount" ForeColor="Red"></asp:RequiredFieldValidator>
                                                     <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                                                    ControlToValidate="txtAmount" ErrorMessage="Please only type number" /> 
                                                </div>
                                            </div>
                                            <div class="row">
                                                   
                                                   <div class="col s6">
                                                        <label for="txtLoanDate">Date</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtLoanDate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLoanDate" ErrorMessage="*Please Enter Loan Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                               

                                            </div>
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Add Loan" runat="server" ID="btnAddLoan" CssClass="btn btn-large" OnClick="btnAddLoan_Click" />
                                                    <asp:Label Text="" ID="lblEmpAdd" runat="server" />
                                                </div>
                                                <div class="right-align">
                                                    <asp:LinkButton Text="Go To Advance Salary" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
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
    <script type="text/javascript" src=" https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
     <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
          <script>

                       $(document).ready(function () {
                           $('#gvCommittee').Datatable({
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
             jq('#<%= gvCommittee.ClientID %>').DataTable({
                 dom: 'Bfrtip',
                 buttons: [
                        'print'
                 ]
             });
             $(".buttons-print").addClass("btn");
         }

    </script>
</asp:Content>
