unit unDmWkTeste;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdmWkTeste = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    fdtCliente: TFDTable;
    fdtClienteCodigo: TFDAutoIncField;
    fdtClienteNome: TStringField;
    fdtClienteCidade: TStringField;
    fdtClienteUF: TStringField;
    fdqCliente: TFDQuery;
    fdqProcuraProduto: TFDQuery;
    dsProdutoPedido: TDataSource;
    fdqGravaPedido: TFDQuery;
    fdqGravaProdutosGeral: TFDQuery;
    fdqAchaPedido: TFDQuery;
    fdqAchaItensPedido: TFDQuery;
    fdqmodificaprod: TFDQuery;
    cdsProdutosPedido: TClientDataSet;
    cdsProdutosPedidoAutoincrem: TIntegerField;
    cdsProdutosPedidoCodProduto: TIntegerField;
    cdsProdutosPedidoNumeroPedido: TIntegerField;
    cdsProdutosPedidoQuantidade: TFloatField;
    cdsProdutosPedidoValorUni: TCurrencyField;
    cdsProdutosPedidoValorTotal: TCurrencyField;
    cdsProdutosPedidoDescricao: TStringField;
    fdqDeletaPedidoST: TFDQuery;
    procedure cdsProdutosPedidoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmWkTeste: TdmWkTeste;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmWkTeste.cdsProdutosPedidoCalcFields(DataSet: TDataSet);
begin
cdsProdutosPedidoValorTotal.AsFloat:=cdsProdutosPedidoValorUni.AsFloat*cdsProdutosPedidoQuantidade.AsInteger;
end;

end.
