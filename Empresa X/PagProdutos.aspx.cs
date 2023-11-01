using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Empresa_X.Útil;


namespace Empresa_X
{
    public partial class PagProdutos : System.Web.UI.Page
    {
        //Método

        protected void AtualizaGrid(string Query)
        {
            Grid_Produtos.DataSource = Framework.GetDataTable("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                                                              "FROM tb_Produtos " +
                                                              "INNER JOIN tb_Categorias " +
                                                              "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                                                              "WHERE tb_Produtos.Deleted = 0");
            Grid_Produtos.DataBind();
        }

        protected void EscondePaineis()
        {
            pnlCadastro_Produtos.Visible = false;
            pnlGridCadastroProdutos.Visible = false;
            pnlCadastroCategoria.Visible = false;
        }

        protected void LimpaCampos()
        {
            txtProduto.Text =
            txtDescricaoProduto.Text =
            hdfID.Value =
            string.Empty;
        }

        protected void PopulaCampos(int _cdID)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                int cdID = _cdID;
                hdfID.Value = _cdID.ToString();

                tb_Produtos Produto = new tb_Produtos();

                var Query = (from objProduto in ctx.tb_Produtos where objProduto.ID_Produto == cdID select objProduto).FirstOrDefault();

                txtProduto.Text = Query.Produto;
                ddlID_Categoria.Text = Query.ID_Categoria.ToString();
                txtDescricaoProduto.Text = Query.Descricao;

            }
        }

        public void PopulaDdlID_Categoria()
        {
            ddlID_Categoria.DataSource = Framework.GetDataTable("SELECT CAST(ID_Categoria AS VARCHAR) + ' - ' + Categoria AS Categoria FROM tb_Categorias");
            ddlID_Categoria.DataBind();
            //ddlID_Categoria.Items.Insert(0, new ListItem("- Selecione -", "0"));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            PopulaDdlID_Categoria();
        }

        protected void Grid_Produtos_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            Grid_Produtos.DataSource = Framework.GetDataTable("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                                                              "FROM tb_Produtos " +
                                                              "INNER JOIN tb_Categorias " +
                                                              "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                                                              "WHERE tb_Produtos.Deleted = 0");
        }

        protected void Grid_Produtos_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                int cdID = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID_Produto"]);

                switch (e.CommandName)
                {
                    case "opEditar":
                        EscondePaineis();
                        LimpaCampos();
                        PopulaCampos(cdID);
                        pnlCadastro_Produtos.Visible = true;
                        break;

                    case "opExcluir":
                        using (EmpresaXEntities ctx = new EmpresaXEntities())
                        {
                            tb_Produtos Produto = new tb_Produtos();
                            int _ID = cdID;

                            var Query = (from objProduto in ctx.tb_Produtos where objProduto.ID_Produto == cdID select objProduto).FirstOrDefault();

                            Query.Deleted = 1;
                            AtualizaGrid("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                                         "FROM tb_Produtos " +
                                         "INNER JOIN tb_Categorias " +
                                         "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                                         "WHERE tb_Produtos.Deleted = 0");
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                Response.Write("Erro, " + ex.Message);
            }
        }

        protected void btNovoCadastro_Click(object sender, EventArgs e)
        {
            EscondePaineis();
            LimpaCampos();
            pnlCadastro_Produtos.Visible = true;
        }

        protected void btNovaCategoria_Click(object sender, EventArgs e)
        {
            EscondePaineis();
            LimpaCampos();
            pnlCadastroCategoria.Visible = true;
        }

        protected void btSalvarCategoria_Click(object sender, EventArgs e)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Categorias Categoria = new tb_Categorias();
                try
                {
                    if (!string.IsNullOrEmpty(hdfID.Value))
                    {
                        int _id = Convert.ToInt32(hdfID.Value);

                        var Query = (from objCategoria in ctx.tb_Categorias select objCategoria);

                        Categoria = Query.FirstOrDefault();
                    }
                    else
                    {
                        Categoria.Categoria = txtNovaCategoria.Text;
                        Categoria.Deleted = 0;

                        if (string.IsNullOrEmpty(hdfID.Value))
                        {
                            ctx.tb_Categorias.Add(Categoria);
                        }
                        ctx.SaveChanges();
                        EscondePaineis();
                        pnlGridCadastroProdutos.Visible = true;

                        AtualizaGrid("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                                         "FROM tb_Produtos " +
                                         "INNER JOIN tb_Categorias " +
                                         "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                                         "WHERE tb_Produtos.Deleted = 0");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Erro, " + ex.Message);
                }
            }
        }

        protected void btCancelarCategoria_Click(object sender, EventArgs e)
        {
            EscondePaineis();
            AtualizaGrid("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                         "FROM tb_Produtos " +
                         "INNER JOIN tb_Categorias " +
                         "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                         "WHERE tb_Produtos.Deleted = 0");
            pnlGridCadastroProdutos.Visible = true;
        }

        protected void btSalvarProduto_Click(object sender, EventArgs e)
        {
            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                tb_Produtos Produto = new tb_Produtos();
                try
                {
                    if (!string.IsNullOrEmpty(hdfID.Value))
                    {
                        int _id = Convert.ToInt32(hdfID.Value);

                        var Query = (from objProduto in ctx.tb_Produtos select objProduto);

                        Produto = Query.FirstOrDefault();
                    }
                    else
                    {
                        Produto.Produto = txtProduto.Text;
                        Produto.ID_Categoria = Convert.ToInt32(ddlID_Categoria.Text);
                        Produto.Descricao = txtDescricaoProduto.Text;
                        Produto.Deleted = 0;

                        if (string.IsNullOrEmpty(hdfID.Value))
                        {
                            ctx.tb_Produtos.Add(Produto);
                        }
                        ctx.SaveChanges();
                        EscondePaineis();
                        pnlGridCadastroProdutos.Visible = true;

                        AtualizaGrid("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                                     "FROM tb_Produtos " +
                                     "INNER JOIN tb_Categorias " +
                                     "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                                     "WHERE tb_Produtos.Deleted = 0");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Erro, " + ex.Message);
                }
            }
        }

        protected void btCancelarProduto_Click(object sender, EventArgs e)
        {
            EscondePaineis();
            AtualizaGrid("SELECT tb_Produtos.ID_Produto, tb_Produtos.Produto, tb_Categorias.ID_Categoria, tb_Categorias.Categoria, tb_Produtos.Descricao " +
                         "FROM tb_Produtos " +
                         "INNER JOIN tb_Categorias " +
                         "ON tb_Produtos.ID_Categoria = tb_Categorias.ID_Categoria " +
                         "WHERE tb_Produtos.Deleted = 0");
            pnlGridCadastroProdutos.Visible = true;
        }

        protected void ddlID_Categoria_ItemChecked(object sender, Telerik.Web.UI.RadComboBoxItemEventArgs e)
        {

            using (EmpresaXEntities ctx = new EmpresaXEntities())
            {
                int ID = ddlID_Categoria.SelectedIndex;
                hdfID.Value = ID.ToString();

                tb_Produtos Produto = new tb_Produtos();

                var Query = (from objProduto in ctx.tb_Produtos where objProduto.ID_Produto == ID select objProduto).FirstOrDefault();

                using (EmpresaXEntities ctx2 = new EmpresaXEntities())
                {
                    tb_Categorias Categoria = new tb_Categorias();

                    var Query2 = (from objCategoria in ctx2.tb_Categorias where objCategoria.ID_Categoria == ID select objCategoria).FirstOrDefault();

                    txtCategoria.Text = Query2.Categoria;

                }
            }

        }
    }
}