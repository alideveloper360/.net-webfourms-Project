<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="SalesApp.ok" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a>
                </li>
                <li class="active-bre"><a href="#">Manage Product</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Add Product</h4>
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
                                            <asp:Label ID="p1" runat="server" Visible="false" />
                                            <asp:Label ID="lblmsgerror" runat="server" ForeColor="Red" Font-Bold="true" />
                                            <asp:GridView ID="gvCommittee" CssClass="table table-condensed compact table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false"
                                            OnRowCommand="gvCommittee_RowCommand"    OnRowCancelingEdit="gvLoans_RowCancelingEdit" OnRowDataBound="gvLoans_RowDataBound" OnRowEditing="gvLoans_RowEditing" OnRowUpdating="gvLoans_RowUpdating" OnRowDeleting="gvLoans_RowDeleting">
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

                                                    <asp:TemplateField HeaderText="Product code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDuration" runat="server" Text='<%#Eval("Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtGridDuration" runat="server" Text='<%#Eval("Code") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="SKU">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSKU" runat="server" Text='<%#Eval("SKU") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtSKU" runat="server" Enabled="false" Text='<%#Eval("SKU") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                      
                                                      <asp:TemplateField HeaderText="BarCode">
                                                        <ItemTemplate>
                                                       <asp:Button Text="Barcodes" CssClass="btn btn-large" runat="server" CommandName="GenerateBarcodes" CommandArgument="<%# Container.DataItemIndex %>" />
                                                    
                                                        </ItemTemplate>
                                                       
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

                                                 <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                     </asp:DropDownList>

                                                </div>
                                                <div class="col s6">

                                                    <label>Product Name</label>
                                                    <asp:TextBox class="input-field" runat="server" ID="txtProdName" CssClass="validate" />
                                                    <asp:RequiredFieldValidator ID="rv15" runat="server" ControlToValidate="txtProdName" ErrorMessage="*Please Enter Product" ForeColor="Red"></asp:RequiredFieldValidator>


                                                </div>
                                               
                                            </div>
                                           
                                            <div class="row">
                                               <div class="col s6">
                                                       <label for="txtProductCode">Product Code</label>
                                                  
                                                    <asp:TextBox  class="input-field" AutoPostBack="true" runat="server" CssClass="tpText" ID="txtProductCode" OnTextChanged="txtProductCode_TextChanged" />
                                                  <asp:Label Id="lblerrormsg" runat="server" ForeColor="Red" />
                                                    
                                                </div>
                                                
                                                  <div class="input-field col s6">
                                                    <asp:TextBox runat="server" ID="txtSKU" ReadOnly="true" />
                                                    <label for="txtSKU"></label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Add Product" runat="server" ID="btnAddProduct" CssClass="btn btn-large" OnClick="btnAddProduct_Click" />
                                                    <asp:Label Text="" ID="lblEmpAdd" runat="server" />
                                                </div>
                                                <div class="right-align">
                                                    <asp:LinkButton Text="Go To Products" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
                                                </div>
                                            </div>
                                        <asp:Label id="Label1" runat="server" />
                                       </asp:View>
                                     <asp:View id="View3" runat="server">
                                        <div class="row">
                                            <div class="col-xs-6" style="text-align: center;">
                                                <asp:Label id="val_label" runat="server" visible="false"/>
                                                <asp:TextBox ID="txtnop" runat="server" placeholder="Enter print number"></asp:TextBox>
                                                <asp:Button Text="add" CssClass="btn btn-large" OnClick="btngotoprint_Click" runat="server" />
                                                
                                                <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                                                </asp:PlaceHolder>
                                                
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
