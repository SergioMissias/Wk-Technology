unit untPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.ToolWin, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,unDmWkTeste, untProcuraCliente,untProcuraProduto
  , System.UITypes;

type
  TfrmCliente = class(TForm)
    Panel1: TPanel;
    TabControl1: TTabControl;
    Label1: TLabel;
    edtCliente: TEdit;
    Panel2: TPanel;
    edtCodProduto: TEdit;
    edtQuantidade: TEdit;
    edtValorUni: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lbldescricao: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblValorTotal: TLabel;
    btnInserirProd: TBitBtn;
    Panel3: TPanel;
    Label9: TLabel;
    lblValorTotaPedido: TLabel;
    btnGravarPedido: TBitBtn;
    pnlProcPed: TPanel;
    btnPdAntigos: TBitBtn;
    Label11: TLabel;
    edtAchaPedido: TEdit;
    lblNomeCliente: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    btnDeletarPedido: TBitBtn;
    sbProcurarCliente: TSpeedButton;
    dbProdutoPedido: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure sbProcurarClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtValorUniExit(Sender: TObject);
    procedure btnInserirProdClick(Sender: TObject);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure btnPdAntigosClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure dbProdutoPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure dbProdutoPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDeletarPedidoClick(Sender: TObject);
  private
    { Private declarations }

    oProd:TProcuraProd;
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses untGravaProduto, untGravarPedido, untAchaPedido, untAcharProdutoPedido,
  untDeletarPedido;


//uses unDmWkTeste, untProcuraCliente;

procedure TfrmCliente.btnDeletarPedidoClick(Sender: TObject);
var
DeletarPed:TDeletaPedido;
AtualizaGrid:TAchaPedido;
begin
AtualizaGrid:=TAchaPedido.Create;
DeletarPed:=TDeletaPedido.Create;
if DeletarPed.DeletaPedido(strtoint(edtAchaPedido.Text))=True then
   AtualizaGrid.ProcuraPedido(strtoint(edtAchaPedido.Text));

edtAchaPedido.Text:='';
edtAchaPedido.SetFocus;



end;

procedure TfrmCliente.btnGravarPedidoClick(Sender: TObject);
var
OPedido:TGravaPedido;
Total:TgravarItem;
begin
Total:=TgravarItem.Create;

Opedido:=TGravaPedido.Create;
Opedido.Dia:=datetostr(Now);
OPedido.CodCliente:=strtoint(edtCliente.Text);
OPedido.VTotalPedido:=Total.TotalItens;
if OPedido.GravarPedido = false then
begin
  showmessage('pedido nao gravado');
end
else
begin
  dmWkTeste.cdsProdutosPedido.Close;
  dmWkTeste.cdsProdutosPedido.CreateDataSet;
  edtCliente.Text:='';
  pnlProcPed.Visible:=True;
  edtCodProduto.Text:='';
  edtValorUni.Text:='';
  lblValorTotal.Caption:='0,00';
  lbldescricao.Caption:='';
  lblValorTotaPedido.Caption:='0,00';
  edtCliente.SetFocus;
end;



end;

procedure TfrmCliente.btnInserirProdClick(Sender: TObject);
var
GravarProdugo:TgravarItem;
OProd:TProcuraProd;
oProdAlter:TAchaReg;
OPedido:TGravaPedido;
Total:TgravarItem;
begin

   OProd:=TProcuraProd.Create;
   OProd.CodProduto:=strtoint(edtCodProduto.Text);
   OProd.Descricao:=lbldescricao.Caption;
   OProd.PrecoUni:=strtofloat(edtValorUni.Text);
   OProd.quant:=strtoint(edtQuantidade.Text);
if btnInserirProd.tag=0 then
begin
   GravarProdugo:=TgravarItem.Create;

   if GravarProdugo.gravarItem(OProd,strtoint(edtCliente.Text))=False then
   begin
     Showmessage('Erro na Grava??o!!');
   end;
   dbProdutoPedido.Refresh;
   lblValorTotaPedido.Caption:=Formatfloat('###,###0.00',GravarProdugo.TotalItens);
   edtCodProduto.SetFocus;
end
else
begin
    oProdAlter:=Tachareg.Create;
    Total:=TgravarItem.Create;
    GravarProdugo:=TgravarItem.Create;
    OProd:=TProcuraProd.Create;
    oProd.Quant:=StrToInt(edtQuantidade.Text);
    Oprod.PrecoUni:=StrToFloat(edtValorUni.Text);
    if oProdAlter.AcharProdutoPedido('Altera??o', OProd) = false then
    begin
      showmessage('pedido nao gravado');
    end
    else
    begin
         lblValorTotaPedido.Caption:=Formatfloat('###,###0.00',GravarProdugo.TotalItens);
    end;
    oProdAlter:=TAchaReg.Create;
    oProd.PrecoUni:= strtofloat(edtValorUni.Text);
    OProd.Quant:=strtoint(edtQuantidade.Text);
  //  btnInserirProd.Tag:=0;

end;
end;

procedure TfrmCliente.btnPdAntigosClick(Sender: TObject);
 var
 oPedido:TAchaPedido;
begin
if edtAchaPedido.Text<>'' then
  begin
  oPedido:=TAchaPedido.Create;
  if oPedido.ProcuraPedido(strtoint(edtAchaPedido.Text)) =false then
  begin
    showmessage('Pedido n?o encontrado');
    edtAchaPedido.SetFocus;
  end
  else
  begin
    edtCliente.Text:=inttostr(oPedido.CodClie);
    lblNomeCliente.Caption:=oPedido.Nome;
    lblCidade.Caption:=oPedido.Cidade;
    lblUF.Caption:=oPedido.UF;
    lblValorTotaPedido.Caption:=formatFloat('###,##0.00',oPedido.VlTotalPed);
    btnInserirProd.Caption:='Alterar';
    dbProdutoPedido.SetFocus;
    btnGravarPedido.Enabled:=False;
  end;

  end
  else
  edtCliente.SetFocus;
  pnlProcPed.Visible:= True;
end;

procedure TfrmCliente.dbProdutoPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
OProd:TProcuraProd;
oProdAlter:TAchaReg;
GravarProdugo:TgravarItem;
begin
if key = 46 then
begin
    GravarProdugo:=TgravarItem.Create;
    oProdAlter:=Tachareg.Create;
    oProd:=TProcuraProd.Create;
    if oProdAlter.AcharProdutoPedido('Exclus?o', OProd) = false then
    begin
      showmessage('pedido nao Excluido');
    end
    else
    begin
      lblValorTotaPedido.Caption:=Formatfloat('###,###0.00',GravarProdugo.TotalItens);

    end;
end;

end;

procedure TfrmCliente.dbProdutoPedidoKeyPress(Sender: TObject; var Key: Char);
//var

//OProd:TProcuraProd;
//oProdAlter:TAchaReg;
//GravarProdugo:TgravarItem;
begin
if Key = #13 then
begin
  edtCodProduto.Text:=inttostr(dbProdutoPedido.Fields[0].AsInteger);
  edtQuantidade.Text:=FloatToStr(dbProdutoPedido.Fields[2].asfloat);
  edtValorUni.Text:=FloatToStr(dbProdutoPedido.Fields[3].asfloat);
  lbldescricao.Caption:=dbProdutoPedido.Fields[1].asstring;
  lblValorTotal.Caption:=floattostr(dbProdutoPedido.Fields[5].AsFloat);

  btnInserirProd.Caption:='Alterar Item';
  btnInserirProd.Tag:=1;
  edtCodProduto.ReadOnly:=True;
  edtQuantidade.SetFocus;
end;

end;

procedure TfrmCliente.edtClienteChange(Sender: TObject);
begin
  pnlProcPed.Visible:=False;
  btnInserirProd.Caption:='Inserir';
  lblValorTotaPedido.Caption:='0,00';
end;


procedure TfrmCliente.edtCodProdutoExit(Sender: TObject);


begin
if edtCodProduto.Text<>'' then
begin

  oProd:=TProcuraProd.Create;
  if oProd.ProcuraProduto(strtoint(edtCodProduto.Text))=true then
  begin
    lbldescricao.Caption:=oProd.Descricao;
    edtValorUni.Text:=FormatFloat('####0.00',oProd.precoUni);
 //   edtQuantidade.SetFocus;
  end
  else
  begin
   MessageDlg('C?digo de Produto n?o Cadastrado!',mtError,mbOKCancel,0);
   edtCodProduto.SetFocus;

  end;
end
else
begin
  if MessageDlg('C?digo de Produto em Branco! Deseja Sair de digita??o de Produtos',mtConfirmation,[mbYes, mbNo], 0 )=6 then
  begin
    edtCliente.SetFocus;
  end
  else
     edtCodProduto.SetFocus;

end;
end;

procedure TfrmCliente.edtQuantidadeExit(Sender: TObject);
begin
if (edtQuantidade.Text='0') or (edtQuantidade.Text = '')  then
begin

   MessageDlg('Informe um valor maior que 0 para continuar!',mtError,mbOKCancel,0);
   edtQuantidade.SetFocus;
end;
//edtValorUni.SetFocus;
end;

procedure TfrmCliente.edtValorUniExit(Sender: TObject);
begin
btnInserirProd.SetFocus;
edtValorUni.Text:=FormatFloat('####0.00',StrToFloat(edtValorUni.Text));
lblValorTotal.Caption:=FormatFloat('###0.00',strtofloat(edtQuantidade.Text) *StrToFloat(edtValorUni.Text));
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
edtCliente.Text:='';
edtCodProduto.Text:='';
edtQuantidade.Text:='0';
edtValorUni.Text:='0';
end;

procedure TfrmCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{if Key = VK_RETURN then
   begin

   perform(WM_NEXTDLGCTL,0,0);

   end; }
end;

procedure TfrmCliente.FormShow(Sender: TObject);
begin
  edtCliente.SetFocus;
  btnPdAntigos.Visible:=true;
  pnlProcPed.Visible:=True;
end;

procedure TfrmCliente.sbProcurarClienteClick(Sender: TObject);
var
oCli:TProcCliente;
Begin
if edtCliente.Text<>'' then
begin
 oCli:=TprocCliente.create;
 if ocli.ProcuraCliente(strtoint(edtCliente.Text)) = true then
 begin
    lblNomeCliente.Caption:=oCli.Nome;
    lblCidade.Caption:=oCli.Cidade;
    lblUF.Caption:=oCli.UF;
    dmWkTeste.cdsProdutosPedido.close;
    dmWkTeste.cdsProdutosPedido.CreateDataSet;
    edtCodProduto.ReadOnly:=False;
    edtCodProduto.SetFocus;
    btnInserirProd.Caption:='Inserir';
    btnGravarPedido.Enabled:=True;

 end
 else
 Begin
 MessageDlg('C?digo de Cliente n?o Cadastrado!',mtError,mbOKCancel,0);
 edtCliente.SetFocus;
 end;
end
else
begin
  pnlProcPed.Visible:=true;
  edtAchaPedido.SetFocus;
end;





end;

end.
