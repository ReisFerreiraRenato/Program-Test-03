program PDVTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestuntClasses in 'TestuntClasses.pas',
  untClasses in '..\untClasses.pas',
  untInterfaces in '..\untInterfaces.pas',
  frmDataModulo in '..\frmDataModulo.pas' {dmPrincipal: TDataModule},
  Funcoes in '..\Funcoes.pas',
  frmCadastrarProduto in '..\frmCadastrarProduto.pas' {frmCadastrarProdutos},
  frmCliente in '..\frmCliente.pas' {frmClientes},
  frmProduto in '..\frmProduto.pas' {frmProdutos},
  frmConsultarVenda in '..\frmConsultarVenda.pas' {frmConsultarVendas},
  ConsultarItensVendas in '..\ConsultarItensVendas.pas' {frmConsultarItensVendas};

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

