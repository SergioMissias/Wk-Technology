unit untGravarPedido;


interface

uses untClassClientepas,System.SysUtils,Vcl.Dialogs;

type
  TGravaPedido =Class

  private

    FCodCliente: integer;
    FVTotalPedido: double;
    FNumeroPedido: integer;
    Fdia: String;
    procedure setCodCliente(const Value: integer);
    procedure setDia(const Value: String);
    procedure SetNumeroPedido(const Value: integer);
    procedure setTotalPedido(const Value: double);

  public



  property NumeroPedido:integer read FNumeroPedido write SetNumeroPedido ;
  property Dia:String read Fdia write setDia;
  property CodCliente : integer read FCodCliente write setCodCliente ;
  property VTotalPedido : double read FVTotalPedido Write setTotalPedido;

  function GravarPedido :boolean;
  Function AlterarPedido(oId:integer): Boolean;
End;

implementation



{ TGravaPedido }

uses unDmWkTeste;

function TGravaPedido.AlterarPedido(oId:integer): Boolean;

begin
   with dmWkTeste.fdqGravaPedido do
   begin
     close;
     sql.Clear;

     sql.Add('update pedidosgeral set ValorTotal= :vtotal where numeropedido= :id');
     ParamByName('id').asinteger:=oId;
     ParamByName('vtotal').AsFloat:=VTotalPedido;
     Prepare;
     ExecSQL;
//     close;
//     sql.clear;
//     sql.add('SELECT max(NumeroPedido) as idped from pedidosgeral');
//     open;
//     idpedido:=FieldByName('idped').Value;
   end;


end;

function TGravaPedido.GravarPedido: boolean;
var
idpedido:integer;
begin
try
   with dmWkTeste.fdqGravaPedido do
   begin
     close;
     sql.Clear;

     sql.Add('Insert into pedidosgeral (CodCliente,DiaPedido,ValorTotal) Values(:Cod , :dias, :vtotal)');

     ParamByName('Cod').asinteger:=CodCliente;
     ParamByName('dias').AsDate:=Date;
     ParamByName('vtotal').AsFloat:=VTotalPedido;
     Prepare;
     ExecSQL;
     close;
     sql.clear;
     sql.add('SELECT max(NumeroPedido) as idped from pedidosgeral');
     open;
     idpedido:=FieldByName('idped').Value;
   end;
   dmWkTeste.cdsProdutosPedido.first;
   while dmWkTeste.cdsProdutosPedido.Eof=false do
   begin
      dmWkTeste.fdqGravaProdutosGeral.Close;
      dmWkTeste.fdqGravaProdutosGeral.sql.Clear;
      with dmWkTeste.fdqGravaProdutosGeral do
      begin
         sql.add('insert into Pedidosproduto (CodProduto,numeropedido,Quantidade,ValorTotal,ValorUni) Values(:Codp , :idped , :qt , :Vtot , :Vuni )');
         ParamByName('Codp').AsInteger:=dmWkTeste.cdsProdutosPedidoCodProduto.AsInteger;
         ParamByName('idped').AsInteger:=idpedido;
         ParamByName('qt').Asfloat:=dmWkTeste.cdsProdutosPedidoQuantidade.AsFloat;
         ParamByName('VTot').AsFloat:=dmWkTeste.cdsProdutosPedidoValorTotal.AsFloat;
         ParamByName('Vuni').AsFloat:=dmWkTeste.cdsProdutosPedidoValorUni.AsFloat;
         prepare;
         ExecSQL;
      end;
      dmWkTeste.cdsProdutosPedido.Next;
   end;
   Result:=True;
Except
  on E: Exception do
  begin
  showmessage('Erro: ' + E.Message );
  result:=False;
  exit;
  end;

end;
end;

procedure TGravaPedido.setCodCliente(const Value: integer);
begin
  FCodCliente := Value;
end;

procedure TGravaPedido.setDia(const Value: String);
begin
  Fdia := Value;
end;

procedure TGravaPedido.SetNumeroPedido(const Value: integer);
begin
  FNumeroPedido := Value;
end;

procedure TGravaPedido.setTotalPedido(const Value: double);
begin
  FVTotalPedido := Value;
end;

end.
