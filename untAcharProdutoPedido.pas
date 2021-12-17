unit untAcharProdutoPedido;

interface
uses Vcl.Dialogs,untGravaProduto, untClassProduto,System.SysUtils,Vcl.Forms,untGravarPedido,untProcuraProduto;
type
   TAchaReg = class(TProcuraProd)
     private

     public

       function AcharProdutoPedido(Oper:string; Oprodcp:TProcuraProd):boolean;
   end;

implementation

{ TAchaReg }

uses unDmWkTeste;

function TAchaReg.AcharProdutoPedido(Oper: string; Oprodcp:TProcuraProd): boolean;
var
Oproduto:TgravarItem;
oPedido:TGravaPedido;

xid:integer;
xidped:integer;
begin
     xid:= dmWkTeste.cdsProdutosPedidoAutoincrem.AsInteger;
     xidped:= dmWkTeste.cdsProdutosPedidoNumeroPedido.AsInteger;
if Oper='Alteração' then
begin
   Oproduto:=TgravarItem.Create;
   if MessageDlg('Confirme '+Oper,mtConfirmation,[mbYes, mbNo], 0 )=6 then
   begin
     try

     if Oper='Alteração' then
     begin
       dmWkTeste.cdsProdutosPedido.Edit;
       dmWkTeste.cdsProdutosPedidoQuantidade.Asinteger:=OProdcp.quant;
       dmWkTeste.cdsProdutosPedidoValorUni.AsFloat:=OProdcp.PrecoUni;
       dmWkTeste.cdsProdutosPedido.Post;

       dmWkTeste.fdqAchaItensPedido.Close;
       dmWkTeste.fdqAchaItensPedido.SQL.Clear;
       dmWkTeste.fdqAchaItensPedido.SQL.Add('SELECT  pp.Autoincrem,pp.Codproduto,numeropedido,quantidade,valortotal,valoruni,p.Descricao from pedidosproduto pp ');
       dmWkTeste.fdqAchaItensPedido.SQL.Add('inner join produtos p on p.CodProduto=pp.CodProduto where pp.Autoincrem=:id');
       dmWkTeste.fdqAchaItensPedido.ParamByName('id').AsInteger:=xid;
       dmWkTeste.fdqAchaItensPedido.open;

         with dmWkTeste.fdqmodificaprod do
         begin
           close;
           sql.Clear;
           sql.Add('Update pedidosproduto set quantidade=:qt, ValorUni=:vuni, ValorTotal= :Vtot where AutoIncrem=:id');
           ParamByName('qt').AsFloat:= Oprodcp.Quant;
           ParamByName('vuni').AsFloat:= Oprodcp.PrecoUni;
           ParamByName('Vtot').AsFloat:= Oproduto.TotalItens;
           ParamByName('id').AsInteger:=xid;
           prepare;
           ExecSQL;
         end;

         oPedido:=TGravaPedido.Create;
         oPedido.VTotalPedido:=Oproduto.TotalItens;
         oPedido.AlterarPedido(xidped);
     end;

       result:=True;
   Except
      on E: Exception do
        begin
        showmessage('Erro: ' + E.Message );
        result:=False;
        exit;
        end;

      end;
   end;
end
else
begin
     if Oper='Exclusão' then
     begin
        if MessageDlg('Confirme '+Oper,mtConfirmation,[mbYes, mbNo], 0 )=6 then
        begin

 //      dmWkTeste.cdsProdutosPedido.edit;
       dmWkTeste.cdsProdutosPedido.Delete;
       with dmWkTeste.fdqmodificaprod do
         begin
           close;
           sql.Clear;
           sql.Add('Delete from pedidosproduto where AutoIncrem=:id');
           ParamByName('id').AsInteger:=xid;
           prepare;
           ExecSQL;
         end;

      end;
         oPedido:=TGravaPedido.Create;
         oPedido.VTotalPedido:=Oproduto.TotalItens;
         oPedido.AlterarPedido(xidped);
      result:=True;
     end
     else
     result:=False;
end;

//   dmWkTeste.fdqAchaItensPedido.First;
end;

end.
