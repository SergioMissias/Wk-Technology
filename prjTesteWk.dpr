program prjTesteWk;

uses
  Vcl.Forms,
  untPedidos in 'untPedidos.pas' {frmCliente},
  unDmWkTeste in 'unDmWkTeste.pas' {dmWkTeste: TDataModule},
  untClassClientepas in 'untClassClientepas.pas',
  untProcuraCliente in 'untProcuraCliente.pas',
  untClassProduto in 'untClassProduto.pas',
  untProcuraProduto in 'untProcuraProduto.pas',
  untGravaProduto in 'untGravaProduto.pas',
  untGravarPedido in 'untGravarPedido.pas',
  untAchaPedido in 'untAchaPedido.pas',
  untDeletarPedido in 'untDeletarPedido.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCliente, frmCliente);
  Application.CreateForm(TdmWkTeste, dmWkTeste);
  Application.Run;
end.
