<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Contato.aspx.cs" Inherits="Empresa_X.Contato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlTb_contato" runat="server" Width="100%">
        <asp:Table ID="Tabela_Contato" runat="server" Width="70%" HorizontalAlign="Left">
            <asp:TableRow Height="12px">
                <asp:TableCell>
                    <asp:Label ID="lbEmail" runat="server" Text="E-mail"></asp:Label><br />
                    <asp:TextBox ID="txtEmail" runat="server" Width="70%"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="left">
                    <asp:Label ID="lbNome" runat="server" Text="Nome"></asp:Label><br />
                    <asp:TextBox ID="txtNome" runat="server" Width="60%"></asp:TextBox>
                </asp:TableCell>
                
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbMensagem" runat="server" Text="Mensagem"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtMensagem" runat="server" Height="200px" Width="160%"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Table ID="tb_Contato_imagens" runat="server" Width="50%" HorizontalAlign="Right">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Image ID="imgIcon" runat="server" ImageUrl="~/Imagens/mapicon_marrom.png" Width="50px" Height="50px" /><br />
                    <br />
                    <asp:Label ID="lbTituloLocalizacao" runat="server" Text="Nosso Escritório Principal" Font-Bold="true" Font-Size="18px"></asp:Label><br />
                    <asp:Label ID="Endereco" runat="server" Text="SoHo 94, Broadway St New York, NY 1001" Width="160px"></asp:Label><br />
                    <br />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Imagens/Phone.png" Width="50px" Height="50px" /><br />
                    <br />
                    <asp:Label ID="lbTituloTelefone" runat="server" Text="Número de Telefone" Font-Bold="true" Font-Size="18px"></asp:Label><br />
                    <asp:Label ID="lbTelefone" runat="server" Text="234-9876-5400 888-0123-4567 (Ligação Gratuita)" Width="120px"></asp:Label><br />
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Imagens/Fax.png" Width="50px" Height="50px" /><br />
                    <br />
                    <asp:Label ID="lbTituloFax" runat="server" Text="Fax" Font-Bold="true" Font-Size="18px"></asp:Label><br />
                    <asp:Label ID="lbFax" runat="server" Text="1-234-567-8900"></asp:Label><br />
                    <br />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Imagens/Email.png" Width="50px" Height="50px" /><br />
                    <br />
                    <asp:Label ID="lbTituloEmail" runat="server" Text="Email" Font-Bold="true" Font-Size="18px"></asp:Label><br />
                    <asp:Label ID="lb_Email" runat="server" Text="email@example.com"></asp:Label><br />
                    <br />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
    </asp:Panel>
    <br />
    <asp:Button ID="btEnviar" runat="server" Text="Enviar" />
</asp:Content>
