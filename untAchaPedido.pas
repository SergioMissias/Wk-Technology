unit untAchaPedido;

interface

type

  TAchaPedido = class

  private


    FCidade:string;
    FDiapedi:string;
    FNome:string;
    FNPedido:integer;
    FUF:string;
    FVlTotalPed:Double;
    FCodClie:integer;

    function getCidade: string;
    function getDiapedi: string;
    function getNome: string;
    function getNpedido: integer;
    function getUF: string;
    function getVlTotalPed: double;
    procedure setDiaPedi(const Value: string);
    procedure setNpedido(const Value: integer);
    procedure setVlTotalPed(const Value: double);
    function gerCodClie: integer;

  public
  property NPedido:integer read getNpedido  write setNpedido;
  property CodClie:integer read gerCodClie;
  property DiaPedi:string  read getDiapedi  write setDiaPedi;
  property VlTotalPed:double  read getVlTotalPed  write setVlTotalPed;
  property Cidade :string  read getCidade;
  property UF     :string  read getUF;
  property Nome   :string  read getNome;

  function ProcuraPedido(oPed:integer):Boolean;
  end;

implementation

{ TAchaPedido }

uses unDmWkTeste;

function TAchaPedido.gerCodClie: integer;
begin
  result:=FcodClie;
end;

function TAchaPedido.getCidade: string;
begin
result:=Fcidade;
end;

function TAchaPedido.getDiapedi: string;
begin
result:=FDiaPedi;
end;

function TAchaPedido.getNome: string;
begin
result:=FNome;
end;

function TAchaPedido.getNpedido: integer;
begin
result:=FNpedido;
end;

function TAchaPedido.getUF: string;
begin
result:=FUF;
end;

function TAchaPedido.getVlTotalPed: double;
begin
result:=FVlTotalPed;
end;

function TAchaPedido.ProcuraPedido(oPed: integer): Boolean;
begin
   with dmWkTeste.fdqAchaPedido do
   begin
      close;
      sql.Clear;
      sql.Add('Select Codcliente,DiaPedido,NumeroPedido,ValorTotal,Cidade,Codigo,Nome,UF from pedidosgeral pg ');
      sql.Add(' inner join cliente cl on cl.Codigo=CodCliente where numeroPedido= :idped');
      //PrecoUnitario from Produtos where CodProduto=:oCod');
      ParamByName('idped').AsInteger:=oPed;
      open;
      if RecordCount>0 then
      begin
        FCidade:=FieldByName('Cidade').AsString;
        FDiapedi:=FieldByName('DiaPedido').value;
        FNome:=FieldByName('Nome').asstring;
        FNPedido:=FieldByName('NumeroPedido').AsInteger;
        FUF:=FieldByName('UF').AsString;
        FVlTotalPed:=FieldByName('ValorTotal').AsFloat;
        FCodClie:=FieldByName('Codcliente').asinteger;
      end
   end;
   dmWkTeste.cdsProdutosPedido.close;
 //  dmWkTeste.cdsProdutosPedido.FieldDefs.Clear;
   dmWkTeste.cdsProdutosPedido.CreateDataSet;
   dmWkTeste.fdqAchaItensPedido.Close;
   dmWkTeste.fdqAchaItensPedido.SQL.Clear;
   dmWkTeste.fdqAchaItensPedido.SQL.Add('SELECT pp.Autoincrem,pp.Codproduto,numeropedido,quantidade,valortotal,valoruni,p.Descricao from pedidosproduto pp ');
   dmWkTeste.fdqAchaItensPedido.SQL.Add('inner join produtos p on p.CodProduto=pp.CodProduto where NumeroPedido=:idped');
//   SELECT Codproduto,numeropedido,quantidade,valortotal,valoruni from pedidosproduto where NumeroPedido=:idped ');
   dmWkTeste.fdqAchaItensPedido.ParamByName('idped').AsInteger:=oPed;
   dmWkTeste.fdqAchaItensPedido.open;
   dmWkTeste.fdqAchaItensPedido.First;
   dmWkTeste.cdsProdutosPedido.Open;
   while dmWkTeste.fdqAchaItensPedido.Eof=false  do
   begin
     dmWkTeste.cdsProdutosPedido.Append;
     dmWkTeste.cdsProdutosPedidoCodProduto.AsInteger:=dmWkTeste.fdqAchaItensPedido.FieldByName('CodProduto').AsInteger;
     dmWkTeste.cdsProdutosPedidoDescricao.AsString:=dmWkTeste.fdqAchaItensPedido.FieldByName('Descricao').Asstring;
     dmWkTeste.cdsProdutosPedidoQuantidade.AsFloat:=dmWkTeste.fdqAchaItensPedido.FieldByName('quantidade').AsFloat;
     dmWkTeste.cdsProdutosPedidoNumeroPedido.Asinteger:=dmWkTeste.fdqAchaItensPedido.FieldByName('NumeroPedido').AsInteger;
     dmWkTeste.cdsProdutosPedidoValorUni.AsFloat:=dmWkTeste.fdqAchaItensPedido.FieldByName('valoruni').AsFloat;
     dmWkTeste.cdsProdutosPedidoValorTotal.AsFloat:=dmWkTeste.fdqAchaItensPedido.FieldByName('valortotal').Asfloat;
     dmWkTeste.cdsProdutosPedidoAutoincrem.AsInteger:= dmWkTeste.fdqAchaItensPedido.FieldByName('Autoincrem').Asinteger;
     dmWkTeste.cdsProdutosPedido.Post;
     dmWkTeste.fdqAchaItensPedido.Next;
   end;
   if dmWkTeste.fdqAchaPedido.RecordCount=0 then
       Result:=False
   else
   Result:=True;

end;

procedure TAchaPedido.setDiaPedi(const Value: string);
begin
FDiaPedi:= Value;
end;

procedure TAchaPedido.setNpedido(const Value: integer);
begin
 FNpedido:=value;
end;

procedure TAchaPedido.setVlTotalPed(const Value: double);
begin
 FVlTotalPed:=value;
end;

end.
