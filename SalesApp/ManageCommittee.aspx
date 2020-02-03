﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCommittee.aspx.cs" Inherits="SalesApp.ManageCommittee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Manage Committee</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Add Committee</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            <asp:Button Text="Add New" style="margin-bottom:15px" runat="server" ID="btnAddnewEmp" CssClass="btn btn-large" OnClick="btnAddnewEmp_Click" CausesValidation="false" />
                                            <br />
                                       <%--     <div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:TextBox ID="txtsrc" runat="server" type="text" class="form-control" onkeyup="return KeyUp(this, '#ContentPlaceHolder1_gvCommittee');" placeholder="Search. . . " />
                                                </div>
                                            </div>--%>
                                            <asp:GridView ID="gvCommittee" CssClass="table table-condensed compact table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false"
                                                OnRowCancelingEdit="gvCommittee_RowCancelingEdit" OnRowDataBound="gvCommittee_RowDataBound"  OnRowEditing="gvCommittee_RowEditing" OnRowUpdating="gvCommittee_RowUpdating" OnRowDeleting="gvCommittee_RowDeleting">
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

                                               
                                                       <asp:TemplateField HeaderText="Start Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStartDate" runat="server" Text='<%#Eval("StartDate") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <EditItemTemplate>
                                                            <asp:TextBox ID="txtStartDate" runat="server" Text='<%#Eval("StartDate") %>' TextMode="Date"></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="End Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEndDate" runat="server" Text='<%#Eval("EndDate") %>'></asp:Label>
                                                        </ItemTemplate>
                                                       <EditItemTemplate>
                                                            <asp:TextBox ID="txtEndDate" runat="server" Text='<%#Eval("EndDate") %>' TextMode="Date"></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotalAmount" runat="server" Text='<%#Eval("TotalAmount") %>'></asp:Label>
                                                        </ItemTemplate>
                                                          <EditItemTemplate>
                                                            <asp:TextBox ID="txtTotalAmount" runat="server" Text='<%#Eval("TotalAmount") %>'></asp:TextBox>
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
                                                <div class="col s6">
                                                      <label for="txtName"> Name</label>
                                                    <asp:TextBox runat="server" ID="txtName" CssClass="validate" />
                                                    <asp:RequiredFieldValidator ID="rv15" runat="server" ControlToValidate="txtName" ErrorMessage="*Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>


                                                </div>
                                                <!------
                                                <div class="col s6">
                                                    <label for="txtMonths">Months</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtMonths" />
                                                    <asp:RequiredFieldValidator ID="rv16" runat="server" ControlToValidate="txtMonths" ErrorMessage="*Please Enter Months" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            ----->
                                            
                                                   <div class="col s6">
                                                       <label for="txtStartDate">Start Date</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtStartDate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStartDate" ErrorMessage="*Please Enter Start Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>

                                                 <!----  <div class="col s6">
                                                        <label for="txtEndDate">End Date</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtEndDate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEndDate" ErrorMessage="*Please Enter End Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>----->

                                            </div>
                                            <div class="row">
                                                <div class="col s6">
                                                       <label for="txtStartDate">End Date</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtEndDateCommittee" TextMode="Date" />
                                                    
                                                </div>
                                                <div class="col s6">
                                                       <label for="txtStartDate">Total Amount</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtTotalAmount" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTotalAmount" ErrorMessage="*Please Enter Amount" ForeColor="Red"></asp:RequiredFieldValidator>
                                                 <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                                                    ControlToValidate="txtTotalAmount" ErrorMessage="Please only type number" />
                                                </div>
                                            </div>
                                            <!-----
                                           <div class="row">
                                                   <div class="col s6">
                                                       <label for="txtAmount">Amount</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtAmount" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAmount" ErrorMessage="*Please Enter Amount" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>----->
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Add Committee" runat="server" ID="btnAddCommitee" CssClass="btn btn-large" OnClick="btnAddCommitee_Click" />
                                                    <asp:Label Text="" ID="lblEmpAdd" runat="server" />
                                                </div>
                                                <div class="right-align">
                                                    <asp:LinkButton Text="Go To Categories" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
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
