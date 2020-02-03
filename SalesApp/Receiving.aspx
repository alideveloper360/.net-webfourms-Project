<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receiving.aspx.cs" Inherits="SalesApp.Receiving" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sb2-2">
        <div class="sb2-2-2">
          
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Product Receive</h4>
                        </div>
                        <div class="tab-inn">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                     <asp:Label id="p1" runat="server" />
                                            <asp:Label id="p2" runat="server" />
                                    <asp:MultiView ID="MultiView1" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            
                                            <br />
                                            <%--<div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:TextBox ID="txtsrc" runat="server" type="text" class="form-control" onkeyup="return KeyUp(this, '#ContentPlaceHolder1_gvEmployee');" placeholder="Search. . . " />
                                                </div>
                                            </div>--%>
                                            <div class="row">
                                                <asp:Button Text="Add Bill" ID="txtAddBill" CssClass="btn-large" runat="server" OnClick="txtAddBill_Click" />
                                            </div>
                                              <div class="row">
                                               
                                               <div class="input-field col s4">
                                                   <label for="lblGrn">GRN</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtGRN"  />
                                                    
                                                </div>
                                                <div class="col s4">
                                                    <label for="ddlVendor">Vendor</label>
                                                    <asp:DropDownList ID="ddlVendor" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                  <div class="input-field col s4">
                                                      
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtDate" TextMode="Date" />
                                                 </div>
                                              
                                            </div>
                                            <asp:Label id="lblmagerror" runat="server" ForeColor="Red" Font-Bold="true" />
                                            <asp:GridView ID="gvCategory" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                              
                                                 <Columns>
                                                  
                                                      <asp:TemplateField HeaderText="" HeaderStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" Text="."/>  
                                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Required" ClientValidationFunction = "ValidateCheckBox"></asp:CustomValidator>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label Text='<%#Container.DataItemIndex+1 %>' runat="server" ID="lblEmpId" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Product Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("Name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Category">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCode" runat="server" Text='<%#Eval("Category") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCode" runat="server" Text='<%#Eval("Category") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Product SKU">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSKU" runat="server" Text='<%#Eval("SKU") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtSKU" runat="server" Text='<%#Eval("SKU") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Meter/Yard">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="value" runat="server" CssClass="form-control">
                                                                <asp:ListItem Text="Meter" />
                                                                <asp:ListItem Text="Yard" />
                                                            </asp:DropDownList>
                                                          
                                                        
                                                        </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Total Meter/Yard" ItemStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:TextBox Id="txtreceive" runat="server" CssClass="tpMeters" Width="90%"  ForeColor="Black"/>  
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="T.p">
                                                        <ItemTemplate>
                                                            <asp:TextBox Id="txtTP" runat="server"  ForeColor="Black" Width="90%" CssClass="tpText" />  
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="R.P.">
                                                        <ItemTemplate>
                                                            <asp:TextBox Id="txtRP" runat="server"  ForeColor="Black" Width="90%" CssClass="RpText"/>  
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Total T.P.">
                                                        <ItemTemplate>
                                                            <asp:Label Id="txtTotalTP" runat="server"  ForeColor="Black" CssClass="totalTpText" />  
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Total R.P.">
                                                        <ItemTemplate>
                                                            <asp:Label Id="txtTotalRP" runat="server"  ForeColor="Black" CssClass="totalRpText"  />  
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

                                             <div class="row">
                                                <div class="input-field col s10">
                                                    <asp:Label ID="lblDate_info" runat="server" ForeColor="Red" Font-Bold="true"/>
                                                    <asp:Label Text="" ID="Label1" runat="server" ForeColor="Green" Font-Bold="true"/>
                                                    
                                                </div>
                                                <div class="input-field col s2">

                                                    <asp:Button Text="Submit" runat="server" ID="Button1" CssClass="btn btn-large" OnClick="btnAddCategory_Click" />
                                                    
                                                </div>
                                            </div>
                                           
                                               </asp:View>
                                     



                                         <asp:View ID="View2" runat="server">
                                             <div class="row">
                                             <div class="col s5">
                                                    <label for="ddlVendor">Vendor</label>
                                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                             
                                             </div>

                                             <div class="row">
                                             <div class="input-field col s5">
                                                   <label for="lblGrn">GRN</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtGRN1"  />
                                                    
                                                </div>
                                                 <div class="input-field col s5">
                                                   <label for="lblGrn">Amount</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtAmount1"  />
                                                    
                                                </div>
                                          
                                              </div>
                                             <div class="row">
                                                <div class="input-field col s5">
                                                   <label for="lblGrn">Date</label>
                                                    <asp:TextBox runat="server" CssClass="validate" TextMode="Date" ID="txtDate1"  />
                                                    
                                                </div>
                                                <div class="input-field col s5">
                                                   <label for="lblGrn">Description</label>
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtDescription1"  />
                                                    
                                                </div>
                                             </div>
                                             <div class="row">
                                             
                                                 <div class="col-sm-5">
                                                 <asp:Button Text="Submit" ID="btnsubmit" CssClass="btn-large" runat="server" OnClick="btnsubmit_Click" />
                                              </div>
                                                 <div class="col-sm-5">
                                                     <asp:Label Id="txtmsg" runat="server" ForeColor="Green" Font-Bold="true" /> 
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

             $(".tpText").blur(function (e) {
                 console.log("hellow");
             });

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
         $(".tpText").blur(function (e) {
             var meters = $(this).parent('td').parent('tr').find('.tpMeters').val();
             var tp = $(this).val();
             console.log(meters);
             var num = isNaN(parseInt(meters * tp)) ? 0 : parseInt(meters * tp);
             console.log(num);
             $(this).parent('td').parent('tr').find('.totalTpText').text(num);
             
         });
         $(".RpText").blur(function (e) {
             var meters = $(this).parent('td').parent('tr').find('.tpMeters').val();
             var tp = $(this).val();
             var num = isNaN(parseInt(meters * tp)) ? 0 : parseInt(meters * tp);
             $(this).parent('td').parent('tr').find('.totalRpText').text(num);

         });



    </script>
</asp:Content>
