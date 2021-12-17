unit untGravaProduto;

interface

uses System.SysUtils, untClassProduto,Vcl.Dialogs;

type
   TgravarItem = class

   private

   public

   function gravarItem(Oproduto:TProduto;Ocli:integer):Boolean;
   function TotalItens() : double;


   end;

implementation

{ TgravarItem }

uses unDmWkTeste;

function TgravarItem.gravarItem(Oproduto: TProduto; Ocli:integer): Boolean;
var
 OProd: TProduto;
begin
   OProd:=TProduto.Create;
   OProd:=Oproduto;
   try
     dmWkTeste.cdsProdutosPedido.open;
     dmWkTeste.cdsProdutosPedido.Append;
     dmWkTeste.cdsProdutosPedidoCodProduto.AsInteger:=OProd.CodProduto;
     dmWkTeste.cdsProdutosPedidoDescricao.AsString:=OProd.Descricao;
     dmWkTeste.cdsProdutosPedidoQuantidade.Asinteger:=OProd.quant;
     dmWkTeste.cdsProdutosPedidoValorUni.AsFloat:=OProd.PrecoUni;
     dmWkTeste.cdsProdutosPedido.Post;
     result:=True;
   Except
      on E: Exception do
        begin
        showmessage('Erro: ' + E.Message );
        result:=False;
        end;

   end;
end;

function TgravarItem.TotalItens: double;
var
total:double;
begin
  total:=0;
  dmWkTeste.cdsProdutosPedido.Open;
  dmWkTeste.cdsProdutosPedido.First;
  while dmWkTeste.cdsProdutosPedido.Eof=false do
  begin
    total:=total+dmWkTeste.cdsProdutosPedidoValorTotal.AsFloat  ;
    dmWkTeste.cdsProdutosPedido.Next;

  end;
  result:=total;

end;

end.
