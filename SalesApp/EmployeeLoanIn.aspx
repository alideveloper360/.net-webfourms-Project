<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeLoanIn.aspx.cs" Inherits="SalesApp.EmployeeLoanIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Loan paid</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Loan Paid</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            <asp:Button Text="Add New" style="margin-bottom:15px" runat="server" ID="btnAddnewEmp" CssClass="btn btn-large" OnClick="btnAddnewEmp_Click" CausesValidation="false" />
                                            <br />
                                          <%--  <div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:TextBox ID="txtsrc" runat="server" type="text" class="form-control" onkeyup="return KeyUp(this, '#ContentPlaceHolder1_gvCommittee');" placeholder="Search. . . " />
                                                </div>
                                            </div>--%>
                                            <asp:GridView ID="gvCommittee" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false"
                                                OnRowCancelingEdit="gvLoans_RowCancelingEdit" OnRowDataBound="gvLoans_RowDataBound" OnRowEditing="gvLoans_RowEditing" OnRowUpdating="gvLoans_RowUpdating" OnRowDeleting="gvLoans_RowDeleting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%#Container.DataItemIndex+1 %>' runat="server" ID="lblEmpId" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("Name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Amount Paid">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDuration" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridDuration" runat="server" Text='<%#Eval("Amount") %>'></asp:TextBox>
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
                                                            <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridDate" runat="server" Text='<%#Eval("Description") %>' TextMode="Date"></asp:TextBox>
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
                                                        <label for="txtLoanDate">Loan Date</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtLoanDate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLoanDate" ErrorMessage="*Please Enter Loan Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col s6">
                                                        <label for="txtLoanDate">Description</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtDescription" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLoanDate" ErrorMessage="*Please Enter Loan Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>

                                            </div>
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Add Loan" runat="server" ID="btnAddLoan" CssClass="btn btn-large" OnClick="btnAddLoan_Click" />
                                                    <asp:Label Text="" ID="lblEmpAdd" runat="server" />
                                                </div>
                                                <div class="right-align">
                                                    <asp:LinkButton Text="Go To Paid Loan" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
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
             $('#gvCommittee').Datatable();
         });

         var prm = Sys.WebForms.PageRequestManager.getInstance();
         var jq = $.noConflict();

         prm.add_endRequest(function () {
             createDataTable();
         });

         createDataTable();
      
         function createDataTable() {
             jq('#<%= gvCommittee.ClientID %>').DataTable();
         }
</script>
    
</asp:Content>
