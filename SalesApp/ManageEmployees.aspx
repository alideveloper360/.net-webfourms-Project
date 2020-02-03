<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEmployees.aspx.cs" Inherits="SalesApp.ManageEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Add Employee</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Add New Employee</h4>
                            <p>Add New Employees to the System</p>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            <asp:Button Text="Add New" style="margin-bottom:15px" runat="server" ID="btnAddnewEmp" CssClass="btn btn-large" OnClick="btnAddnewEmp_Click" CausesValidation="false" />
                                            <br />
                                            <%--<div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:TextBox ID="txtsrc" runat="server" type="text" class="form-control" onkeyup="return KeyUp(this, '#ContentPlaceHolder1_gvEmployee');" placeholder="Search. . . " />
                                                </div>
                                            </div>--%>
                                            <asp:Label id="lblmsg" runat="server" Font-Bold="true" ForeColor="red" />
                                            <asp:GridView ID="gvEmployee" CssClass="table table-condensed compact table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false"
                                                OnRowCancelingEdit="gvEmployee_RowCancelingEdit" OnRowEditing="gvEmployee_RowEditing" OnRowUpdating="gvEmployee_RowUpdating" OnRowDeleting="gvEmployee_RowDeleting" OnRowDataBound="gvEmployee_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("ne_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%#Container.DataItemIndex+1 %>' runat="server" ID="lblEmpId" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("strName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("strName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>



                                                     <asp:TemplateField HeaderText="Designation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDesignation" runat="server" Text='<%#Eval("designation") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridDesignation" runat="server" Text='<%#Eval("designation") %>'></asp:TextBox>
                                                            
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>



                                                    
                                                    <asp:TemplateField HeaderText="CNIC">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCnic" runat="server" Text='<%#Eval("strCNIC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCNIC" runat="server" Text='<%#Eval("strCNIC") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cell No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCellNo" runat="server" Text='<%#Eval("strCellNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCellNo" runat="server" Text='<%#Eval("strCellNo") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Salary">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSalary" runat="server" Text='<%#Eval("nSalary") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtSalary" runat="server" Text='<%#Eval("nSalary") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("strAddress") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtAddress" runat="server" Text='<%#Eval("strAddress") %>'></asp:TextBox>
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
                                                    <asp:TemplateField HeaderText="Edit">
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
                                        </asp:View>
                                        <asp:View ID="View2" runat="server">
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" ID="txtEmpName" CssClass="validate" />
                                                    <label for="txtEmpName">Employee Name</label>
                                                    <asp:RequiredFieldValidator ID="rv15" runat="server" ControlToValidate="txtEmpName" ErrorMessage="*Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                   

                                                </div>
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtCNIC" />
                                                    <label for="txtCNIC">CNIC</label>
                                                    <asp:RequiredFieldValidator ID="rv16" runat="server" ControlToValidate="txtCNIC" ErrorMessage="*Please Enter CNIC" ForeColor="Red"></asp:RequiredFieldValidator>


                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtCell" />
                                                    <label for="txtCell">Cell No</label>
                                                    <asp:RequiredFieldValidator ID="rv18" runat="server" ControlToValidate="txtCell" ErrorMessage="*Please Enter Cell No" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                                                    ControlToValidate="txtCell" ErrorMessage="Please only type number" />
                                                </div>
                                                    <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtEmpCode" />
                                                    <label for="txtCell">Employee Code</label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmpCode" ErrorMessage="*Please Enter Code" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:Label id="p1" style="color:red" runat="server" />
                                                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                                                    ControlToValidate="txtEmpCode" ErrorMessage="Please only type number" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtSalary" />
                                                    <label for="txtSalary">Salary</label>
                                                    <asp:RequiredFieldValidator ID="rv19" runat="server" ControlToValidate="txtSalary" ErrorMessage="*Please Enter Salary" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </div>
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtAddress" />
                                                    <label for="txtAddress">Address</label>
                                                    <asp:RequiredFieldValidator ID="rv20" runat="server" ControlToValidate="txtAddress" ErrorMessage="*Please Enter Address" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                    

                                            <div class="row">
                                              
                                                <div class="input-field col s6">

                                                 <asp:DropDownList onsubmit="required()" ID="ddlCategory" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                     </asp:DropDownList>
                                                         
                                                </div>

                                            </div>


                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Add Employee" runat="server" ID="btnAddEmployee" CssClass="btn btn-large" OnClick="btnAddEmployee_Click" />
                                                    <asp:Label Text="" ID="lblEmpAdd" runat="server" />
                                                </div>
                                                <div class="right-align">
                                                    <asp:LinkButton Text="Go To Employees" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
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
             $('#gvEmployees').Datatable();
         });

         var prm = Sys.WebForms.PageRequestManager.getInstance();
         var jq = $.noConflict();

         prm.add_endRequest(function () {
             createDataTable();
         });

         createDataTable();

         function createDataTable() {
             jq('#<%= gvEmployee.ClientID %>').DataTable();
         }


       
             $("#btnAddEmployee").click(function () {

                 var books = $('#ddlCategory');
                 if (books.val() === '') {
                     alert("Please select an item from the list and then proceed!");
                     $('#ddlCategory').focus();

                     return false;
                 }
                 else return;
             });

    </script>
   
</asp:Content>
