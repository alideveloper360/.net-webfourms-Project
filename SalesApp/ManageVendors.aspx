dwadwa<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageVendors.aspx.cs" Inherits="SalesApp.ManageVendors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Add Vendor</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Add Vendor</h4>
                            <p>Add your Vendors</p>
                        </div>
                        <div class="tab-inn">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:MultiView runat="server" ID="MultiView1">
                                        <asp:View runat="server" ID="View1">
                                            <asp:Button Text="Add New" style="margin-bottom:15px" runat="server" ID="btnAddVendor" CssClass="btn btn-large" OnClick="btnAddVendor_Click" CausesValidation="false" /><br />
                                            <asp:GridView ID="gvVendors" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false"
                                                OnRowCancelingEdit="gvVendors_RowCancelingEdit" OnRowDataBound="gvVendors_RowDataBound" OnRowEditing="gvVendors_RowEditing" OnRowUpdating="gvVendors_RowUpdating" OnRowDeleting="gvVendors_RowDeleting1" ShowHeader="true" CssClass="table table-condensed compact table-hover table-responsive">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblVendId" runat="server" Text='<%#Eval("nv_Id") %>'></asp:Label>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%#Container.DataItemIndex+1 %>' runat="server" ID="lblEmpId" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("strName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("strName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cell No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_CellNo" runat="server" Text='<%#Eval("strCellNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCellNo" runat="server" Text='<%#Eval("strCellNo") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Address" runat="server" Text='<%#Eval("strAddress") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtAddress" runat="server" Text='<%#Eval("strAddress") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bank Account">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_BankAccount" runat="server" Text='<%#Eval("strBankAccount") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtBankAccount" runat="server" Text='<%#Eval("strBankAccount") %>'></asp:TextBox>
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
                                                    <asp:TextBox runat="server" ID="txtVendName" />
                                                    <label for="txtVendName">Vendor Name</label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ValidateEmp" ErrorMessage="* Please Enter Vendor Name" ForeColor="Red" ControlToValidate="txtVendName"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtAddress" />
                                                    <label for="txtAddress">Address</label>
                                                    <asp:RequiredFieldValidator ID="Rv3" runat="server" ControlToValidate="txtAddress" ValidationGroup="ValidateEmp" ErrorMessage="* Please Enter Addess" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" ID="txtCellNo" />
                                                    <%--<asp:Panel ID="pnlTextBoxes" runat="server"></asp:Panel>--%>
                                                    <label for="txtCellNo">Cell No</label>
                                                    <%--<asp:LinkButton Text="text" runat="server" /> ID="lnkAddCellNo" runat="server" OnClick="lnkAddCellNo_Click"><i class="fa fa-plus-circle"></i></asp:linkbutton>--%>
                                                    <asp:RequiredFieldValidator ID="Rv2" runat="server" ControlToValidate="txtCellNo" ValidationGroup="ValidateEmp" ErrorMessage="* Please Enter CellNo" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                                 <div class="input-field col s6">
                                                    <asp:TextBox runat="server" ID="txtPhoneNumber" />
                                                    <%--<asp:Panel ID="pnlTextBoxes" runat="server"></asp:Panel>--%>
                                                    <label for="txtPhoneNumber">Phone No</label>
                                                    <%--<asp:LinkButton Text="text" runat="server" /> ID="lnkAddCellNo" runat="server" OnClick="lnkAddCellNo_Click"><i class="fa fa-plus-circle"></i></asp:linkbutton>--%>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhoneNumber" ValidationGroup="ValidateEmp" ErrorMessage="* Please Enter Phone No" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtBankAccount" />
                                                    <%--<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>--%>
                                                    <label for="txtBankAccount">Bank Account</label>
                                                    <%--<asp:LinkButton ID="lnkAddTextBox" runat="server" OnClick="lnkAddTextBox_Click"><i class="fa fa-plus-circle"></i></asp:LinkButton>--%>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="Rv4" runat="server" ControlToValidate="txtBankAccount" ValidationGroup="ValidateEmp" ErrorMessage="* Please Enter Bank-Account-no" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Add Vendor" runat="server" ID="btnAddVendors" ValidationGroup="ValidateEmp" CssClass="waves-effect waves-light btn-large" OnClick="btnAddVendors_Click" />
                                                    <asp:Label ID="lblVendorMsg" runat="server" Text=""></asp:Label>
                                                </div>
                                                <div class="right-align">
                                                    <asp:LinkButton Text="Go To Vendors" runat="server" ID="btnBack" CausesValidation="false" OnClick="btnBack_Click1" />
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
             $('#gvVendors').Datatable();
         });
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        var jq = $.noConflict();

        prm.add_endRequest(function () {
            createDataTable();
        });

        createDataTable();

        function createDataTable() {
            jq('#<%= gvVendors.ClientID %>').DataTable();
         }
    </script>
</asp:Content>
