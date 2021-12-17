unit untProcuraProduto;

interface
uses untClassProduto;

type
   TProcuraProd = class(TProduto)
     private


     Public
   //  total:double;

     function ProcuraProduto(oCod:integer):Boolean;



   end;

implementation

{ TProcuraProd }

uses unDmWkTeste;

function TProcuraProd.ProcuraProduto(oCod: integer): Boolean;
begin
   with dmWkTeste.fdqprocuraProduto do
   begin
      close;
      sql.Clear;
      sql.Add('Select CodProduto,Descricao,PrecoUnitario from Produtos where CodProduto=:oCod');
      ParamByName('oCod').AsInteger:=ocod;
      open;
      if RecordCount>0 then
      begin
          CodProduto:=FieldByName('CodProduto').asinteger;
          Descricao:=FieldByName('Descricao').AsString;
          precoUni:=FieldByName('PrecoUnitario').asfloat;
          Result:=true;
      end
      else
         result:=false;
   end;
end;

end.
