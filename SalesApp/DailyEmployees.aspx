<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DailyEmployees.aspx.cs" Inherits="SalesApp.DailyEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sb2-2">
        <div class="sb2-2-2">
          
        </div>
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Daily Payment Employee</h4>
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
                                               
                                               <div class="input-field col s6">
                                                    <asp:TextBox runat="server" CssClass="validate" ID="txtDate" TextMode="Date" />
                                                    <asp:RequiredFieldValidator ID="rv18" runat="server" ValidationGroup="load" ControlToValidate="txtDate" ErrorMessage="*Please select date" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </div>
                                              <div class="input-field col s6">
                                                      <asp:Button ID="btnLoad" CssClass="btn btn-large" runat="server" Text="Load" ValidationGroup="load" OnClick="btnLoad_Click" />
                                                        
                                              </div>
                                            </div>
                                            <div>
                                                <div class="buttons">
									           <!--- <a title="Icon Title" class="btn" href="#" ><i class="fa fa-print"></i> <span class="text">Print</span></a>
                                                    <asp:Button Text="Print form" OnClientClick="return printpage();" runat="server" />
                                                    ----><asp:Panel ID="Panel1" runat="server">  
                                            <asp:GridView ID="gvCategory" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" CssClass="table table-condensed compact table-hover table-responsive"
                                                 OnRowCancelingEdit="gvEmployee_RowCancelingEdit" OnRowEditing="gvEmployee_RowEditing" OnRowUpdating="gvEmployee_RowUpdating" OnRowDataBound="gvCategory_RowDataBound">
                              
                                                 <Columns>
                                                  
                                                    <asp:TemplateField HeaderText="S.No" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>'></asp:Label>
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
                                                      <asp:TemplateField HeaderText="Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCode" runat="server" Text='<%#Eval("Emp_Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtCode" runat="server" Text='<%#Eval("Emp_Code") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtStatus" runat="server" Text='<%#Eval("Status") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Time">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("Time") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("Time") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtAmount" runat="server">
                                                          
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
                                                <div class="input-field col s10">
                                                    <asp:Label ID="lblDate_info" runat="server" ForeColor="red" Font-Bold="true" />
                                                    <asp:Label ID="lblmsg" runat="server" ForeColor="Green" Font-Bold="true" />
                                                </div>
                                                <div class="input-field col s2">
                                                    <asp:Button Text="Submit" runat="server" ID="Button1" CssClass="btn btn-large" OnClick="btnAddCategory_Click" />
                                                    <asp:Label Text="" ID="Label1" runat="server" />
                                                </div>
                                            </div>
                                           
                                               </asp:View>
                                     










































                                         <asp:View ID="View2" runat="server">
                                            
                                            <br />
                                            <%--<div class="row">
                                                <div class="input-field col-md-4">
                                                    <asp:TextBox ID="txtsrc" runat="server" type="text" class="form-control" onkeyup="return KeyUp(this, '#ContentPlaceHolder1_gvEmployee');" placeholder="Search. . . " />
                                                </div>
                                            </div>--%>
                                            
                                              <div class="row">
                                               
                                              
                                              <div class="input-field col s6">
                                                        <asp:Button ID="Button2" CssClass="btn btn-large" runat="server" Text="Load" ValidationGroup="load" OnClick="btnLoad_Click" />
                                                </div>
                                            </div>
                                            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                              
                                                 <Columns>
                                                  
                                                    <asp:TemplateField HeaderText="S.No" Visible="false">
                                                       
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                       
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Code">
                                                        
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status">
                                                       
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Time">
                                                       
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount">
                                                       
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
    </script>
</asp:Content>
