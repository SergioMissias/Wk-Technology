unit untDeletarPedido;

interface
uses untAchaPedido, System.SysUtils, Vcl.Dialogs;


type
  TDeletaPedido= class(TAchaPedido)
  private


  Public

  function DeletaPedido(id:integer):boolean;
  end;

implementation


{ TDeletaPedido }

uses unDmWkTeste;

function TDeletaPedido.DeletaPedido(id: integer): boolean;
begin
   if MessageDlg('Confirme Exclusão Pedido No.'+inttostr(id),mtConfirmation,[mbYes, mbNo], 0 )=6 then
   begin
   Try
      dmWkTeste.fdqdeletaPedidoST.close;
      dmWkTeste.fdqDeletaPedidoST.SQL.Clear;
      dmWkTeste.fdqDeletaPedidoST.SQL.Add('call pr_DeletarPedido(:id) ') ;
      dmWkTeste.fdqDeletaPedidoST.ParamByName('id').AsInteger:=id;
      dmWkTeste.fdqDeletaPedidoST.Prepare;
      dmWkTeste.fdqDeletaPedidoST.ExecSQL;
      result:=True;


  Except
      on E: Exception do
        begin
        showmessage('Erro: ' + E.Message );
        result:=False;
        exit;
        end;


   End;
   end
   else
   result:=False;


end;

end.
