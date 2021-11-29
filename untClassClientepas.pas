unit untClassClientepas;

interface
   type

     TCliente = class

     private
       FCidade:string;
       FNome:string;
       FUF:string;
       FCodigo :integer;

       function getCidade: string;
       function getCodigo: integer;
       function getNome: string;
       function getUF: string;
       procedure setCidade(const Value: string);
       procedure setCodigo(const Value: integer);
       procedure setnome(const Value: string);
       procedure setUF(const Value: string);

     public


       property Codigo:integer read getCodigo write setCodigo;
       property Nome  :string  read getNome   write setnome;
       property Cidade:string  read getCidade write setCidade;
       property UF    :string  read getUF     write setUF;
   end;


implementation

{ TCliente }

function TCliente.getCidade: string;
begin
result:=Fcidade;
end;

function TCliente.getCodigo: integer;
begin
result:=FCodigo;
end;

function TCliente.getNome: string;
begin
result:=FNome;
end;

function TCliente.getUF: string;
begin
 result:=FUF;
end;

procedure TCliente.setCidade(const Value: string);
begin
 FCidade:=Value;
end;

procedure TCliente.setCodigo(const Value: integer);
begin
FCodigo:=Value;
end;

procedure TCliente.setnome(const Value: string);
begin
 FNome:=Value;
end;

procedure TCliente.setUF(const Value: string);
begin
  FUF:=Value;
end;

end.
