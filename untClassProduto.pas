unit untClassProduto;

interface

type

   TProduto = class
   private
     FCodProduto:integer;
     FDescricao:string;
     FprecoUni:Double;
     FQuant:Integer;

    function getCodProduto: integer;
    function getDescricao: string;
    function getPrecoUni: Double;
    procedure setCodProduto(const Value: integer);
    procedure setDescricao(const Value: string);
    procedure setPrecoUni(const Value: Double);
    function GetQuant: integer;
    procedure SetQuant(const Value: integer);

   public

//   quant:integer;


   property CodProduto:integer read getCodProduto write setCodProduto;
   property Descricao:string read getDescricao write setDescricao;
   property PrecoUni:Double read getPrecoUni write setPrecoUni;
   property Quant:integer read GetQuant write SetQuant;



   end;

implementation

{ TProduto }

function TProduto.getCodProduto: integer;
begin
Result:=FCodProduto;
end;

function TProduto.getDescricao: string;
begin
 result:=FDescricao;
end;

function TProduto.getPrecoUni: Double;
begin
result:=FprecoUni;

end;

function TProduto.GetQuant: integer;
begin
result:=Fquant;
end;

procedure TProduto.setCodProduto(const Value: integer);
begin
 FCodProduto:=Value;
end;

procedure TProduto.setDescricao(const Value: string);
begin
 FDescricao:=Value;
end;

procedure TProduto.setPrecoUni(const Value: Double);
begin
  FprecoUni:=Value;
end;

procedure TProduto.SetQuant(const Value: integer);
begin
   Fquant:=Value;

end;

end.
