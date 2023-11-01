<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="PagProdutos.aspx.cs" Inherits="Empresa_X.PagProdutos" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

    <%--Panel Grid_Cadastro_Produtos--%>

    <asp:Panel ID="pnlGridCadastroProdutos" runat="server">
        <asp:Label ID="lbNovoUsuario" runat="server" Text="Para cadastrar um novo produto clique aqui!"></asp:Label><br />
        <asp:Button ID="btNovoCadastro" runat="server" Text="Cadastrar" OnClick="btNovoCadastro_Click" /><br />
        <br />
        <asp:Label ID="lbCadastroNovaCategoria" runat="server" Text="Para cadastrar uma nova categoria clique aqui!"></asp:Label><br />
        <asp:Button ID="btNovaCategoria" runat="server" Text="Cadastrar" OnClick="btNovaCategoria_Click" />
        <br />
        <br />

        <telerik:RadGrid
            ID="Grid_Produtos"
            runat="server"
            OnNeedDataSource="Grid_Produtos_NeedDataSource"
            OnItemCommand="Grid_Produtos_ItemCommand"
            AutoGenerateColumns="false">

            <GroupingSettings CollapseAllTooltip="Collapse all Columns" />
            <MasterTableView DataKeyNames="ID_Produto, ID_Categoria">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="OP" AllowFiltering="false">

                        <%--Botoes ItemCommand--%>

                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" CommandName="opEditar">Editar</asp:LinkButton>&nbsp
                            <asp:LinkButton ID="lnkExcluir" runat="server" CommandName="opExcluir">Excluir</asp:LinkButton>
                        </ItemTemplate>

                        <%--Colunas Grid--%>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn UniqueName="Coluna_ID_Produto" DataField="ID_Produto" HeaderText="Código Produto"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Produto" DataField="Produto" HeaderText="Produtos"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_ID_Categoria" DataField="ID_Categoria" HeaderText="Código Categoria"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Categoria" DataField="Categoria" HeaderText="Categoria"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Coluna_Descrição" DataField="Descricao_Produto" HeaderText="Descrição"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </asp:Panel>

    <%--Panel Cadastro de Produtos--%>

    <asp:Panel ID="pnlCadastro_Produtos" runat="server" Visible="false">

        <asp:Table ID="tabela_Produtos" runat="server">

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbProduto" runat="server" Text="Produto"></asp:Label><br />
                    <asp:TextBox ID="txtProduto" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>

                <asp:TableCell>
                    <asp:Label ID="lbSelecaoCategoria" runat="server" Text="Selecione a Categoria"></asp:Label><br />
                    <telerik:RadComboBox ID="ddlID_Categoria" runat="server" DataTextField="Categoria" DataValueField="Categoria" OnItemChecked="ddlID_Categoria_ItemChecked"></telerik:RadComboBox>
                </asp:TableCell>

            </asp:TableRow>

            <asp:TableRow>

                <asp:TableCell>
                    <asp:Label ID="lbID_Categoria" runat="server" Text="Código Categoria"></asp:Label><br />
                    <asp:TextBox ID="txtID_Categoria" runat="server"></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell>
                    <asp:Label ID="lbCategoria" runat="server" Text="Categoria"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtCategoria" runat="server"></asp:TextBox>
                </asp:TableCell>

            </asp:TableRow>

            <%-- <asp:TableCell>
                    <asp:HiddenField ID="hdfID_Categoria" runat="server"/>
                    <asp:HiddenField ID="hdfCategoria" runat="server" />
                </asp:TableCell>--%>



            <asp:TableRow>

                <asp:TableCell>
                    <asp:Label ID="lbDescricaoProduto" runat="server" Text="Descrição do Produto"></asp:Label><br />
                    <asp:TextBox ID="txtDescricaoProduto" runat="server"></asp:TextBox>
                </asp:TableCell>

            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Button ID="btSalvarProduto" runat="server" Text="Salvar" OnClick="btSalvarProduto_Click" />&nbsp
        <asp:Button ID="btCancelarProduto" runat="server" Text="Cancelar" OnClick="btCancelarProduto_Click" />
    </asp:Panel>

    <%--Cadastro de Categoria--%>

    <asp:Panel ID="pnlCadastroCategoria" runat="server" Visible="false">
        <asp:Label ID="lbNovaCategoria" runat="server" Text="Nome Categoria"></asp:Label><br />
        <asp:TextBox ID="txtNovaCategoria" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btSalvarCategoria" runat="server" Text="Salvar" OnClick="btSalvarCategoria_Click" />&nbsp
        <asp:Button ID="btCancelarCategoria" runat="server" Text="Cancelar" OnClick="btCancelarCategoria_Click" />
    </asp:Panel>
    <asp:HiddenField ID="hdfID" runat="server" />
</asp:Content>
