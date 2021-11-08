unit frmConsultarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.StdCtrls;

type
  TfrmConsultarVendas = class(TForm)
    tbNumeroVenda: TEdit;
    DBGrid1: TDBGrid;
    btnBuscar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    tbData: TEdit;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure tbDataExit(Sender: TObject);
    procedure tbDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbNumeroVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarVendas: TfrmConsultarVendas;

implementation

{$R *.dfm}

uses frmDataModulo, frmCadastrarProduto, Funcoes, ConsultarItensVendas,
  untInterfaces, untClasses;

procedure TfrmConsultarVendas.btnBuscarClick(Sender: TObject);
var
  LocData: String;
  LocConsultarVenda: IConsultarVendas;
begin
  LocConsultarVenda := TConsultarVendas.Create();
  LocData := tbData.Text;
  LocData := LocData.Replace('/','');
  if (Trim(LocData) = '') and (tbNumeroVenda.Text = '') then
  begin
    MessageDlg('Favor selecionar um dos parametro de busca',mtConfirmation,[mbOK], 0);
    tbData.SetFocus();
    Exit();
  end;

  if not LocConsultarVenda.Consultar(tbData.Text, tbNumeroVenda.Text) then
  begin
    MessageDlg('Venda(s) n�o encontrada(s)',mtConfirmation,[mbOK], 0);
    tbData.SetFocus();
  end;
end;

procedure TfrmConsultarVendas.Button2Click(Sender: TObject);
begin
  if dmPrincipal.qrConsultarVenda.Active then
    if dmPrincipal.qrConsultarVenda.FieldByName('ItensQTD').AsInteger = 0 then
    begin
      MessageDlg('N�o h� itens na venda para serem mostrados',mtConfirmation,[mbOK], 0);
      Exit();
    end;

  try
    frmConsultarItensVendas := TfrmConsultarItensVendas.Create(nil);
    frmConsultarItensVendas.pbcIDVenda := IntToStr(dmPrincipal.qrConsultarVenda.FieldByName('ID').AsInteger);
    frmConsultarItensVendas.ShowModal();
  finally
    FreeAndNil(frmConsultarItensVendas);
  end;
end;

procedure TfrmConsultarVendas.FormShow(Sender: TObject);
begin
  tbData.Text := DateToStr(date);
  dmPrincipal.qrConsultarVenda.Close();
  dmPrincipal.qrConsultarVenda.ParamByName('prmData').Value := date;
  dmPrincipal.qrConsultarVenda.Open();
  tbData.SetFocus();
end;

procedure TfrmConsultarVendas.tbDataExit(Sender: TObject);
begin
  if (tbData.Text <> '') and (not IsDate(tbData.Text)) then
  begin
    MessageDlg('Favor digitar uma data v�lida',mtConfirmation,[mbOK], 0);
    tbData.SetFocus();
  end;
end;

procedure TfrmConsultarVendas.tbDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Passando para o numero da venda com enter
  if (key = 13) then
    tbNumeroVenda.SetFocus();
end;

procedure TfrmConsultarVendas.tbNumeroVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = 13) then
    btnBuscarClick(nil);
end;

end.
