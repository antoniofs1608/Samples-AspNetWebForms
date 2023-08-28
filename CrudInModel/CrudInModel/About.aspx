<%@ Page Title="Moda Pop-up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CrudInModel.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table{
            border-collapse:collapse;
            width:100%;
        }
        th,td
        {
            text-align:left;
            padding:8px;
        }
        th{
            background-color:#4CAF50;
            color:white;
        }
        tr:nth-child(even)
        {
            background-color:#f2f2f2;

        }
        tr.separator{
            border-top:1px solid #ddd;
            border-bottom:1px solid;
        }
    </style>

    <div class="container">
        <div class="modal fade" id="mymodal" data-backdrop="false" role="dialog">
            <div class=" modal-dialog modal-dailog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Adicionar Novo Registro</h4>
                        <asp:Label ID="lblmsg" Text="" runat="server" />
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <label>Name</label>
                        <asp:TextBox ID="txtname" CssClass="form-control" placeholder="Nome" runat="server" />
                        <label>Email</label>
                        <asp:TextBox ID="txtmail" CssClass="form-control" placeholder="Email" runat="server" />
                        <label>Contact</label>
                        <asp:TextBox ID="txtcontact" CssClass="form-control" placeholder="Contato" runat="server" />
                        <label>Address</label>
                        <asp:TextBox ID="txtaddress" CssClass="form-control" placeholder="Endereço" runat="server" />
                     <asp:HiddenField  ID="hdid"  runat="server"/>
                        <label>Status</label>
                        <asp:DropDownList ID="dllstatus" CssClass="form-control" runat="server">
                            <asp:ListItem Value="">Select Status</asp:ListItem>
                            <asp:ListItem Text="Active" />
                            <asp:ListItem Text="Inactive" />
                        </asp:DropDownList>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                        <asp:Button ID="btnsave" CssClass="btn btn-primary" OnClick="btnsave_Click" Text="Salvar" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div> 

    <section Id="section">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                         <asp:Button Text="Open Modal" ID="modal" CssClass="btn btn-primary" OnClick="modal_Click" runat="server" />
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 col-12">
                                    <table>
                                        <asp:Repeater ID="rptr1" DataSourceID="ds1" runat="server">
                                            <HeaderTemplate>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Nome</th>
                                                    <th>Email</th>
                                                    <th>Contato</th>
                                                    <th>Endereço</th>
                                                    <th>Status</th>
                                                    <th>Ação</th>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="separator">
                                                    <td> <%# Eval("t_id") %></td>
                                                    <td> <%# Eval("name_") %></td>
                                                    <td> <%# Eval("email") %></td>
                                                    <td> <%# Eval("contact") %></td>
                                                    <td> <%# Eval("address_") %></td>
                                                    <td> <%# Eval("status_") %></td>
                                                    <td>
                                                         <asp:LinkButton ID="btnupdate" CommandName="Update" OnCommand="btnupdate_Command" CommandArgument='<%#Eval("t_id") %>' CssClass="btn btn-sm brn-primary"  runat="server" ><i  class="glyphicon glyphicon-pencil"></i></asp:LinkButton>
                                                        <asp:LinkButton CommandName="Delete" ID="btndlt" CommandArgument='<%#Eval("t_id") %>' 
                                                            OnClientClick="return confirm('Tem certeza de que deseja excluir !');"
                                                            OnCommand="btndlt_Command" CssClass="btn btn-sm brn-danger" runat="server" ><i  class="glyphicon glyphicon-trash"></i></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <asp:SqlDataSource ID="ds1"
       ConnectionString="<%$ConnectionStrings:connection_ %>"  runat="server"
        SelectCommand="select * from test"
        />
</asp:Content>
