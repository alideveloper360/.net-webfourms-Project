<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="SalesApp.Attendance" %>
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
                            <h4>Manage Attendance</h4>
                            <p>Mark Attendance</p>
                        </div>
                        <div class="tab-inn">
                           <div class="row">
                                               
                                               <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtDate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="rv18" runat="server" ValidationGroup="load" ControlToValidate="txtDate" ErrorMessage="*Please Enter Cell No" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </div>
                                              <div class="input-field col s6">
                                                        <asp:Button ID="btnLoad" CssClass="btn btn-large" runat="server" Text="Load" ValidationGroup="load" OnClick="btnLoad_Click" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" ID="txtEmpCode" OnTextChanged="txtEmpCode_TextChanged" CssClass="validate" AutoPostBack="true"/>
                                                    <label for="txtEmpCode">Employee Code</label>
                                                    <asp:RequiredFieldValidator ID="rv15" runat="server" ControlToValidate="txtEmpCode"  ErrorMessage="*Please Enter Code" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    
                                                </div>
                                                  <div class="input-field col s6">
                                                      
                                                        <label for="txtName">Name</label>
                                                       <br /> <br />

                                                      <asp:Label style="font-size:medium" id="Emp_Name" runat="server"/>
                                                  </div>
                                            </div>
                                            <div class="row">
                                                 <div class="input-field col s6">
                                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="Present">Present</asp:ListItem>
                                                        <asp:ListItem Value="Absent">Absent</asp:ListItem>
                                                        <asp:ListItem Value="Leave">Leave</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="input-field col s6">
                                         
                                                    <asp:TextBox runat="server" ID="txtTime" CssClass="validate"/>
                                                    <label for="txtEmpCode">Time</label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmpCode"  ErrorMessage="*Please Enter Code" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                              </div>
                                                   
                                           
                               
                            <div class="row"> 
                                  <div class="input-field col s6">
                                                        <asp:Button ID="btnSubmit" CssClass="btn btn-large" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                                </div>
                            </div>
                             <hr />
                        <asp:GridView ID="grdRecords" runat="server" CssClass="table table-condensed compact table-hover table-responsive" OnRowDataBound="grdRecords_RowDataBound" BackColor="White" BorderColor="#CCCCCC" EmptyDataText="No records found!" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
            
                   <Columns>
                       <asp:BoundField DataField="DateAttendance"  HeaderText="Date" />
                          <asp:BoundField DataField="strName"  HeaderText="Employee" />
                       <asp:BoundField DataField="EmpCode"  HeaderText="Code" />
                       <asp:BoundField DataField="Time"  HeaderText="Time" />
                       <asp:BoundField DataField="Status"  HeaderText="Status" />
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
             $('#gvRecords').Datatable();
         });
    
         //var prm = Sys.WebForms.PageRequestManager.getInstance();
         var jq = $.noConflict();

         //prm.add_endRequest(function () {
         //    createDataTable();
         //});

         createDataTable();

         function createDataTable() {
             jq('#<%= grdRecords.ClientID %>').DataTable();
         }
    </script>
   
</asp:Content>
