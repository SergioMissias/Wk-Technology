unit untProcuraCliente;


interface

   uses System.SysUtils, untClassClientepas;


    type

    TProcCliente = class(Tcliente)
    private

    public


    function ProcuraCliente(ocod : integer):boolean;

    End;

implementation



{ TProcCliente }

uses unDmWkTeste;

function TProcCliente.ProcuraCliente(ocod: integer): boolean;

begin
   with dmWkTeste.fdqCliente do
   begin
      close;
      sql.Clear;
      sql.Add('Select Codigo,Nome,Cidade, UF from Cliente where Codigo=:oCod');
      ParamByName('oCod').AsInteger:=ocod;
      open;
      if RecordCount>0 then
      begin
          Nome:=FieldByName('Nome').AsString;
          Cidade:=FieldByName('Cidade').AsString;
          UF:=FieldByName('UF').AsString;
          Codigo:=FieldByName('Codigo').AsInteger;
          result:=true;
      end
      else
         result:=false;
   end;

end;

end.
