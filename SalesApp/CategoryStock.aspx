<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryStock.aspx.cs" Inherits="SalesApp.CategoryStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sb2-2">
        
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Show Stock</h4>
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
                                           
                                            <asp:Label id="lb1" runat="server" />
                                            <asp:Label id="lb2" runat="server" />
                                            
                                                    <div class="row">
                                                        <div class="input-field col s10"></div>
                                                  <div class="input-field col s1">
                                              
                                              <!--  <asp:Button Text="Print form" OnClientClick="return printpage();" CssClass="" runat="server" />--->
                                                        </div>
                                                        </div>
                                            <div class="row">
                                             <div class=" col-sm-5">
                                                    <asp:DropDownList ID="ddlFilterCommittee" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterCommittee_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                                <div class="col-sm-5 ">
                                                    <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" CssClass="form-control" runat="server">
                                                       <asp:ListItem>---Select Meter/yard----</asp:ListItem>
                                                        <asp:ListItem>Meter</asp:ListItem>
                                                        <asp:ListItem>Yard</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                </div>
                                            <br />
                                            <br />
                                                <asp:Panel ID="Panel1" runat="server">
                                                  
                                                    <asp:Label ID="txtPaid_Date" runat="server" BackColor="LightGray" ForeColor="Black"/> 
                                                    <asp:Label ID="shadow" runat="server" Visible="false" />
                                                     <asp:Label Id="txtTotalTP" runat="server"  ForeColor="Black" CssClass="totalTpText" /> 
                                                  <div class="row">
                                                      <div class="col-sm-5">
                                                          <label for="Date">Date</label>
                                                      <asp:TextBox runat="server" ID="txtDatee" TextMode="Date" />  
                                                        </div>
                                                  </div>
                                                      <asp:GridView ID="gvCategory" ShowFooter="true" FooterStyle-ForeColor="Yellow" CssClass="table table-condensed compact table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                              
                                                 <Columns>
                                                  
                                                    
                                                    <asp:TemplateField HeaderText="Category Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("CategoryName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("CategoryName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Product Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCode" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCode" runat="server" Text='<%#Eval("ProductName") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="P. SKU">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSKU" runat="server" Text='<%#Eval("ProductSKU") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtSKU" runat="server" Text='<%#Eval("ProductSKU") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Meter/Yard">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Value") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtStatus" runat="server" Text='<%#Eval("Value") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Quntity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblValue" runat="server" CssClass="tpMeters" Text='<%#Eval("receiveMY") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("receiveMY") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtstock" runat="server" CssClass="tpText">
                                                          
                                                        </asp:TextBox>
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
                                            <div class="row">
                                                <div class="col-sm-9">
                                                    <asp:Label ID="lblmsg" runat="server" ForeColor="Green" Font-Bold="true" />
                                                </div>
                                                <div class="col-sm-2">
                                            <asp:Button Text="Send to shop" CssClass="btn btn-large" OnClick="Unnamed_Click" runat="server" />
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


          <script>
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
              $(".tpText").blur(function (e) {

                  var meters = $(this).parent('td').parent('tr').find('.tpMeters').val();
                  var tp = $(this).val();
                  console.log(meters);
                  if (meter < tp) {
                      var num = isNaN(parseInt(meters * tp)) ? 0 : parseInt(meters * tp);
                      console.log(num);
                      $(this).parent('td').parent('tr').find('.totalTpText').text(num);
                  }
              });
    </script>
</asp:Content>
