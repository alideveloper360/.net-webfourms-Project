<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorLeadure.aspx.cs" Inherits="SalesApp.VendorLeadure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="sb2-2">
        <div class="sb2-2-2">
            <ul>
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                <li class="active-bre"><a href="#">Add Designation</a>
                </li>
            </ul>
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Add New Designation</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:MultiView ID="MultiView1" runat="server">
                                      
                                        <asp:View ID="View2" runat="server">
                                            <div class="row">
                                                 <div class="input-field col s6">

                                                 <asp:DropDownList onsubmit="required()" ID="ddlCategory" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                     </asp:DropDownList>
                                                         
                                                </div>
                                               
                                            </div>
                                         
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <asp:Button Text="Add" runat="server" ID="btnAddCategory" CssClass="btn btn-large" OnClick="btnAddCategory_Click" />
                                                    <asp:Label Text="" ID="lblEmpAdd" runat="server" />
                                                </div>
                                                <div class="right-align">
                                                    <asp:LinkButton Text="Go To Designation" ID="btnBack" runat="server" OnClick="btnBack_Click" CausesValidation="false" />
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
             $('#ddlCategory').Datatable();
         });
         var prm = Sys.WebForms.PageRequestManager.getInstance();
         var jq = $.noConflict();

         prm.add_endRequest(function () {
             createDataTable();
         });

         createDataTable();

         function createDataTable() {
             jq('#<%= ddlCategory.ClientID %>').DataTable();
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
