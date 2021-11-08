unit frmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmClientes = class(TForm)
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnLimpar: TBitBtn;
    btnSair: TBitBtn;
    Cliente: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    tbNomeCliente: TEdit;
    tbEndereco: TEdit;
    tbDataCadastro: TMaskEdit;
    DBGrid1: TDBGrid;
    tbDataNascimento: TMaskEdit;
    btnAdicionarClienteVenda: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure tbNomeClienteChange(Sender: TObject);
    procedure LimparEdits();
    procedure btnLimparClick(Sender: TObject);
    procedure ControlaBotoes(prmEnable: Boolean);
    procedure ControlaEdits(prmEnable: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarClienteVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pbcIDCliente, pbcIDVenda: Integer;
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses frmDataModulo, Funcoes, untInterfaces, untClasses;

procedure TfrmClientes.btnAdicionarClienteVendaClick(Sender: TObject);
begin

  if not dmPrincipal.qrCliente.Active then
  begin
    MessageDlg('Favor buscar cliente!',mtConfirmation,[mbOK], 0);
    tbNomeCliente.SetFocus;
    Exit();
  end;

  if dmPrincipal.qrCliente.RecordCount = 0 then
  begin
    MessageDlg('Cliente inexistente ou não selecionado!',mtConfirmation,[mbOK], 0);
    tbNomeCliente.SetFocus;
    Exit();
  end;

  if pbcIDVenda = 0 then
  begin
    MessageDlg('Venda não iniciada, impossível adicionar cliente!',mtConfirmation,[mbOK], 0);
    Exit();
  end;

  pbcIDCliente := dmPrincipal.qrCliente.FieldByName('ID').AsInteger;
  Close();
end;

procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  LimparEdits();
  ControlaBotoes(true);
  ControlaEdits(false);
  tbNomeCliente.SetFocus();
end;

procedure TfrmClientes.btnLimparClick(Sender: TObject);
begin
  ControlaBotoes(true);
  ControlaEdits(false);
  LimparEdits();
  tbNomeCliente.SetFocus();
  dmPrincipal.qrCliente.Close();
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  ControlaBotoes(false);
  ControlaEdits(true);
  tbDataCadastro.Text := DateToStr(date);
  dmPrincipal.qrCliente.Close();
  tbNomeCliente.SetFocus();
end;

procedure TfrmClientes.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
var
  LocDataNascimento: String;
  LocAdicionarCliente: IAdicionarCliente;
begin
  try
    LocAdicionarCliente := TAdicionarCliente.Create();
    if tbNomeCliente.Text = '' then //Testando nome vazio
    begin
      MessageDlg('Favor digitar o nome do cliente!',mtConfirmation,[mbOK], 0);
      tbNomeCliente.SetFocus;
      Exit();
    end;

    if tbEndereco.Text = '' then //Testando endereço vazio
    begin
      MessageDlg('Favor digitar o endereço do cliente!',mtConfirmation,[mbOK], 0);
      tbEndereco.SetFocus;
      Exit();
    end;

    LocDataNascimento := tbDataNAscimento.Text;
    LocDataNascimento := Trim(LocDataNascimento.Replace('/',''));
    if LocDataNascimento = '' then
    begin
      MessageDlg('Favor digitar a data de nascimento do cliente!',mtConfirmation,[mbOK], 0);
      tbDataNAscimento.SetFocus;
      Exit();
    end;

    if not IsDate(tbDataNascimento.Text) then
    begin
      MessageDlg('Favor digitar uma data de nascimento válida!',mtConfirmation,[mbOK], 0);
      tbDataNAscimento.SetFocus;
      Exit();
    end;

    if not LocAdicionarCliente.ADD(tbNomeCliente.Text, tbEndereco.Text, tbDataNascimento.Text, tbDataCadastro.Text) then
    begin
      MessageDlg('Erro ao salvar Cliente!',mtConfirmation,[mbOK], 0);
      Exit();
    end;

    if MessageDlg('Cliente '+tbNomeCliente.Text+' salvo com sucesso!'+#13+
              'Deseja adicionar o cliente na venda?', mtConfirmation,[mbYes, mbNO], 0) = 6 then
    begin
      if pbcIDVenda = 0 then
      begin
        MessageDlg('Venda não iniciada!',mtConfirmation,[mbOK], 0);
      end
      else
        pbcIDCliente := dmPrincipal.qrCliente.FieldByName('ID').AsInteger;
    end;
  finally
    dmPrincipal.qrCliente.Close();
    LimparEdits();
    tbNomeCliente.SetFocus;
    ControlaEdits(false);
    ControlaBotoes(true);
  end;
end;

//Função para contorlar os botões
procedure TfrmClientes.ControlaBotoes(prmEnable: Boolean);
begin
  btnNovo.Enabled     := prmEnable;
  btnSalvar.Enabled   := not prmEnable;
  btnCancelar.Enabled := not prmEnable;
end;

procedure TfrmClientes.ControlaEdits(prmEnable: Boolean);
begin
  tbEndereco.Enabled       := prmEnable;
  tbDataNascimento.Enabled := prmEnable;
  tbDataCadastro.Enabled   := prmEnable;
end;

//Função para limpar os edits do formulário
procedure TfrmClientes.LimparEdits;
begin
  tbNomeCliente.Clear();
  tbEndereco.Clear();
  tbDataCadastro.Clear();
  tbDataNAscimento.Clear();
end;

procedure TfrmClientes.tbNomeClienteChange(Sender: TObject);
var
  LocBuscarClienteNome: IBuscarClienteNome;
begin
  if (tbNomeCliente.Text <> '') and btnNovo.Enabled then
  begin
    LocBuscarClienteNome:= TBuscarClienteNome.Create();
    if not LocBuscarClienteNome.Buscar(tbNomeCliente.Text, false) then
      MessageDlg('Erro ao buscar Cliente!',mtConfirmation,[mbOK], 0);
  end;
end;

end.
