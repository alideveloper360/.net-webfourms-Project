<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AattendanceRecord.aspx.cs" Inherits="SalesApp.AattendanceRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sb2-2">
        
        <div class="sb2-2-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Show Employee Attendance Record</h4>
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
                                            <asp:Label id="lb1" runat="server" />
                                            <asp:Label id="lb2" runat="server" />
                                            <asp:GridView ID="gvCategory" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                              
                                                 <Columns>
                                                  
                                                    
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
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtStatus" runat="server" Text='<%#Eval("status") %>'></asp:TextBox>
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
                                                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("Date") %>'></asp:TextBox>
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
                                             <div class="row">
                                                <div class="input-field col s10"></div>
                                                <div class="input-field col s2">
                                                   
                                                    <asp:Button Text="BtnSubmit" runat="server" ID="RecordSubmit" CssClass="btn btn-large" OnClick="RecordSubmit_Click"/>
                                                   
                                                </div>
                                                 <asp:Label ID="lbl1" runat="server" ForeColor="Green"/>
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
</asp:Content>
