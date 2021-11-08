unit untClasses;

//Classes baseadas em micro servi�os
interface

uses untInterfaces, frmDataModulo, SysUtils, vcl.Dialogs;

type
  TAdicionarCliente = class(TInterfacedObject, IAdicionarCliente)
    function ADD(prmNomeCliente, prmEndereco, prmDataNascimento,
              prmDataCadastro: String; prmCriarDM: Boolean = False): Boolean;
  end;

  TAdicionarProdutoVenda = class(TInterfacedObject, IAdicionarProdutoVenda)
    function ADD(prmProduto: String; prmIDVenda: Integer; prmQuantidade: Double; prmCriarDM: Boolean = False):Boolean;
  end;

  TAdicionarProdutoVendaPorCodBarras = class(TInterfacedObject, IAdicionarProdutoVendaPorCodBarras)
    function ADD(prmCodBarras: String; prmIDVenda: Integer; prmQuantidade: Double; prmCriarDM: Boolean = False): Boolean;
  end;

  TAdicionarProdutoVendaPorID = class(TInterfacedObject, IAdicionarProdutoVendaPorID)
    function ADD(prmIDProduto, prmIDVenda: Integer; prmQuantidade, prmValorUnitario: Double; prmCriarDM: Boolean = False): Boolean;
  end;

  TAtualizarTotaisVenda = class(TInterfacedObject, IAtualizarTotaisVenda)
    function Atualizar(prmIdVenda: Integer; prmCriarDM: Boolean = False): Boolean;
  end;

  TBuscarClienteNome = class(TInterfacedObject, IBuscarClienteNome)
    function Buscar(prmNome: String; prmCriarDM: Boolean = False): Boolean;
  end;

  TCancelarVenda = class(TInterfacedObject, ICancelarVenda)
    function Cancelar(prmIDVenda: Integer; prmCriarDM: Boolean = False): Boolean;
  end;

  TCodigoBarraExistente = class(TInterfacedObject, ICodigoBarraExistente)
    function Existe(prmCodigo: String; prmCriarDM: Boolean = False): Boolean;
  end;

  TConfiguracoesShowfrmPrincipal = class(TInterfacedObject, IConfiguracoesShowfrmPrincipal)
    function Iniciar(prmIDNovaVenda: Integer; prmCriarDM: Boolean = False): Integer;
  end;

  TConsultarVendas = class(TInterfacedObject, IConsultarVendas)
    function Consultar(prmData, prmNumeroVenda: String; prmCriarDM: Boolean = False): Boolean;
  end;

  TFinalizarVenda = class(TInterfacedObject, IFinalizarVenda)
    function Finalizar(prmIDVenda, prmIDCliente: Integer; prmCriarDM: Boolean = False): Boolean;
  end;

  TIniciarNovaVenda = class(TInterfacedObject, IIniciarNovaVenda)
    function Iniciar(prmCriarDM: Boolean = False): Integer;
  end;

  TVendaIniciada = class(TInterfacedObject, IVendaIniciada)
    function Iniciada(prmIDVendaIniciada: integer; prmCriarDM: Boolean = False): Boolean;
  end;

  TConsultarItensFrmShow = class(TInterfacedObject, IConsultarItensFrmShow)
    function Iniciar(prmIDVenda: String; prmCriarDM: Boolean = False): Boolean;
  end;

  TSalvarNovoProduto = class(TInterfacedObject, ISalvarNovoProduto)
    function Salvar(prmNomeProduto, prmDataCadastro, prmDataAtualizacao,
          prmPrecoUnitario, prmValCompra, prmCodBarras: String; prmCriarDM: Boolean = False): Boolean;
  end;

implementation

{ TAdicionarCliente }

uses Funcoes;

function TAdicionarCliente.ADD(prmNomeCliente, prmEndereco, prmDataNascimento,
  prmDataCadastro: String; prmCriarDM: Boolean = False): Boolean;
begin
  Result := False;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);
    dmPrincipal.qrCliente.Close();
    dmPrincipal.qrCliente.Open();
    dmPrincipal.qrCliente.Insert();
    dmPrincipal.qrCliente.FieldByName('Nome').AsString := prmNomeCliente;
    dmPrincipal.qrCliente.FieldByName('Endereco').AsString := prmEndereco;
    dmPrincipal.qrCliente.FieldByName('DataNascimento').AsDateTime := StrToDate(prmDataNascimento);
    dmPrincipal.qrCliente.FieldByName('DataCadastro').AsDateTime := StrToDate(prmDataCadastro);
    dmPrincipal.qrCliente.Post();
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
    Result := True;
  except on Exception do
    raise Exception.Create('Erro ao adicionar Cliente');
  end;
end;

{ TAdicionarProduto }

function TAdicionarProdutoVenda.ADD(prmProduto: String; prmIDVenda: Integer;
  prmQuantidade: Double; prmCriarDM: Boolean = False): Boolean;
begin
  Result := False;
  if IsDouble(prmProduto) then
  begin
    var AddProduto: TAdicionarProdutoVendaPorCodBarras;
    try
      AddProduto := TAdicionarProdutoVendaPorCodBarras.Create();
      Result := AddProduto.ADD(prmProduto, prmIDVenda, prmQuantidade, prmCriarDM);
      if not result then
        MessageDlg('Produto n�o encontrado!',mtConfirmation,[mbOK], 0);
    finally
      AddProduto := nil;
      AddProduto.free;
    end;
  end
  else
  begin
    Result := AbrirBuscarProdutoNome(prmIDVenda, prmProduto, prmQuantidade);
  end;
end;

{ TAdicionarProdutoPorCodBarras }

function TAdicionarProdutoVendaPorCodBarras.ADD(prmCodBarras: String;
  prmIDVenda: Integer; prmQuantidade: Double; prmCriarDM: Boolean = False): Boolean;
var
  LocScript: String;
  LocAdicionarProdutoPorID : TAdicionarProdutoVendaPorID;
begin
  Result := False;
  try
    LocAdicionarProdutoPorID := TAdicionarProdutoVendaPorID.Create();
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);
    //Buscando o produto pelo codigo de barras
    LocScript := 'SELECT * FROM Produto WHERE CodBarras = ' + prmCodBarras;
    dmPrincipal.qrProduto.Close();
    dmPrincipal.qrProduto.SQL.Clear();
    dmPrincipal.qrProduto.SQL.Text := LocScript;
    dmPrincipal.qrProduto.Open();

    //Se o produto n�o foi encontrado, sai da fun��o
    if dmPrincipal.qrProduto.FieldByName('ID').AsInteger = 0 then
      Exit();

    Result := LocAdicionarProdutoPorID.ADD(dmPrincipal.qrProduto.FieldByName('ID').AsInteger,prmIDVenda,prmQuantidade, dmPrincipal.qrProduto.FieldByName('PrecoUnitario').AsInteger, prmCriarDM);

    if prmCriarDM then
      FreeAndNil(dmPrincipal);
    FreeAndNil(LocAdicionarProdutoPorID);
  Except on Exception do
    raise Exception.Create('Erro ao adicionar Produto por c�digo de barras');
  end;
end;

{ TAdicionarProdutoPorID }

function TAdicionarProdutoVendaPorID.ADD(prmIDProduto, prmIDVenda: Integer;
  prmQuantidade, prmValorUnitario: Double; prmCriarDM: Boolean = False): Boolean;
var
  LocAtualizarTotaisVenda: IAtualizarTotaisVenda;
begin
  Result := False;
  LocAtualizarTotaisVenda:= TAtualizarTotaisVenda.Create();
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    if not dmPrincipal.qrItemVenda.Active then
    begin
      dmPrincipal.qrItemVenda.ParamByName('IDVenda').AsInteger := prmIDVenda;
      dmPrincipal.qrItemVenda.Open();
    end;

    dmPrincipal.qrItemVenda.Insert();
    dmPrincipal.qrItemVenda.FieldByName('IDVenda').AsInteger      := prmIDVenda;
    dmPrincipal.qrItemVenda.FieldByName('IDProduto').AsInteger    := prmIDProduto;
    dmPrincipal.qrItemVenda.FieldByName('Quantidade').AsFloat     := prmQuantidade;
    dmPrincipal.qrItemVenda.FieldByName('ValorUnitario').AsFloat  := prmValorUnitario;
    dmPrincipal.qrItemVenda.FieldByName('ValorTotalItem').AsFloat := strtofloat(formatfloat('#0.00', prmQuantidade * dmPrincipal.qrProduto.FieldByName('PrecoUnitario').AsFloat));
    dmPrincipal.qrItemVenda.Post();
    dmPrincipal.qrItemVenda.Close();
    dmPrincipal.qrItemVenda.ParamByName('IDVenda').AsInteger := prmIDVenda;
    dmPrincipal.qrItemVenda.Open();
    dmPrincipal.qrItemVenda.Last();

    Result := LocAtualizarTotaisVenda.Atualizar(prmIDVenda);

    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
    raise Exception.Create('Erro ao adicionar produto por ID');
  end;
end;

{ TCancelarVenda }

function TCancelarVenda.Cancelar(prmIDVenda: Integer; prmCriarDM: Boolean = False): Boolean;
begin
  Result:= false;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    dmPrincipal.qrVenda.Close;
    dmPrincipal.qrVenda.Params.ParamByName('prmID').AsInteger := prmIDVenda;
    dmPrincipal.qrVenda.Open();
    dmPrincipal.qrVenda.Edit();
    dmPrincipal.qrVenda.FieldByName('StatusVenda').AsInteger := 3; //Status venda cancelada
    dmPrincipal.qrVenda.Post();
    dmPrincipal.qrVenda.Close;
    dmPrincipal.qrItemVenda.Close();
    Result := true;
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
    raise Exception.Create('Error Ao Cadastrar Produto!');
  end;
end;

{ TCodigoBarraExistente }

function TCodigoBarraExistente.Existe(prmCodigo: String; prmCriarDM: Boolean = False): Boolean;
var
  LocScript, LocScriptOriginal: String;
begin
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    LocScript := 'SELECT NomeProduto FROM Produto WHERE CODBARRAS = ' + prmCodigo;

    dmPrincipal.qrUtilidade.Close;
    dmPrincipal.qrUtilidade.Sql.Clear;
    dmPrincipal.qrUtilidade.SQl.Text:= LocScript;
    dmPrincipal.qrUtilidade.Open;

    result := dmPrincipal.qrUtilidade.FieldByName('NomeProduto').AsString <> '';
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
    raise Exception.Create('Erro ao consultar c�digo de barras!');
  end;
end;


{ IConfiguracoesShowfrmPrincipal }

function TConfiguracoesShowfrmPrincipal.Iniciar(prmIDNovaVenda: Integer; prmCriarDM: Boolean = False): Integer;
var
  LocIDNovaVenda: Integer;
  LocVendaIniciada: IVendaIniciada;
  LocAualizaTotaisVenda: IAtualizarTotaisVenda;
begin
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    LocVendaIniciada      := TVendaIniciada.Create();
    LocIDNovaVenda        := prmIDNovaVenda;
    LocAualizaTotaisVenda := TAtualizarTotaisVenda.Create();
    //Fechando as qrys
    dmPrincipal.qrVenda.Close();
    dmPrincipal.qrCliente.Close();
    dmPrincipal.qrItemVenda.Close();
    //Verificando se tem venda iniciada
    if LocVendaIniciada.Iniciada(LocIDNovaVenda) then
    begin
      dmPrincipal.qrVenda.Params.ParamByName('prmID').AsInteger     := LocIDNovaVenda;
      dmPrincipal.qrVenda.Open();
      dmPrincipal.qrItemVenda.Params.ParamByName('IDVenda').AsInteger := LocIDNovaVenda;
      dmPrincipal.qrItemVenda.Open();
      LocAualizaTotaisVenda.Atualizar(LocIDNovaVenda);
    end;
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  finally
    Result := LocIDNovaVenda;
  end;
end;


{ TFinalizarVenda }

function TFinalizarVenda.Finalizar(prmIDVenda, prmIDCliente: Integer; prmCriarDM: Boolean = False): Boolean;
var
  LocScript, LocScriptCliente: String;
begin
  result := False;
  LocScriptCliente := ' ';

  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    if prmIDCliente <> 0 then
      LocScriptCliente := ',`IDCLiente`='+IntToStr(prmIDCliente);

    LocScript := 'UPDATE `venda` SET `DataVenda`='+ QuotedStr(FormatarDataSQL(Date)) +
        ',`StatusVenda`= 2 '+
        ',`DataEntrega`= '+ QuotedStr(FormatarDataSQL(Date+10)) +
        LocScriptCliente +
        ' WHERE `ID`='+ IntToStr(prmIdVenda);

    dmPrincipal.qrUtilidade.Close();
    dmPrincipal.qrUtilidade.SQL.Clear();
    dmPrincipal.qrUtilidade.SQL.Text := LocScript;
    dmPrincipal.qrUtilidade.ExecSQL();

    dmPrincipal.qrVenda.Close();
    dmPrincipal.qrVenda.ParamByName('prmID').AsInteger := prmIDVenda;
    dmPrincipal.qrVenda.Open();

    MessageDlg('Venda N� '+IntToStr(prmIDVenda)+' Previs�o de Entega: '+ dmPrincipal.qrVenda.FieldByName('DataEntrega').AsString ,mtConfirmation,[mbOK], 0);
    dmPrincipal.qrVenda.Close();
    dmPrincipal.qrItemVenda.Close();
    dmPrincipal.qrProduto.Close();
    dmPrincipal.qrProduto.Close();
    result := True;
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
    raise Exception.Create('Erro ao finalizar Venda');
  end;
end;

{ TIniciarNovaVenda }

function TIniciarNovaVenda.Iniciar(prmCriarDM: Boolean = False): Integer;
begin
  Result := 0;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    dmPrincipal.qrVenda.Close();
    //dmPrincipal.qrVenda.ParamByName('prmID').AsInteger:= -1;
    dmPrincipal.qrVenda.Open();
    dmPrincipal.qrVenda.Insert();
    dmPrincipal.qrVenda.FieldByName('DataVenda').AsDateTime := date;
    dmPrincipal.qrVenda.FieldByName('ValorTotal').AsFloat := 0;
    dmPrincipal.qrVenda.FieldByName('QuantidadeItens').AsInteger := 0;
    //Status Venda: 1 - Iniciada 2 - Finalizada 3 - Cancelada
    dmPrincipal.qrVenda.FieldByName('StatusVenda').AsInteger := 1;
    dmPrincipal.qrVenda.Post();

    Result := dmPrincipal.qrVenda.FieldByName('ID').AsInteger;

    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
      raise Exception.Create('Erro ao inicar venda');
  end;
end;

{ TVendaIniciada }

function TVendaIniciada.Iniciada(prmIDVendaIniciada: integer; prmCriarDM: Boolean = False): Boolean;
var
  LocScript: String;
begin
  Result := False;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    LocScript := 'SELECT ID FROM Venda WHERE StatusVenda = 1 AND DataVenda = '+ QuotedStr(FormatarDataSQL(Date))+' ORDER BY ID DESC';
    dmPrincipal.qrUtilidade.Close();
    dmPrincipal.qrUtilidade.SQL.Clear();
    dmPrincipal.qrUtilidade.SQL.Text := LocScript;
    dmPrincipal.qrUtilidade.Open();
    prmIDVendaIniciada := dmPrincipal.qrUtilidade.FieldByName('ID').AsInteger;
    if prmIDVendaIniciada <> 0 then
      Result := True;
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
    raise Exception.Create('Erro ao verificar se a venda est� iniciada');
  end;
end;


{ TConsultarItensFrmShow }

function TConsultarItensFrmShow.Iniciar(prmIDVenda: string; prmCriarDM: Boolean = False): Boolean;
begin
  Result := False;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    dmPrincipal.qrItemVenda.Close();
    dmPrincipal.qrItemVenda.SQL.Clear();
    dmPrincipal.qrItemVenda.SQL.Text :=
      'SELECT P.NomeProduto, IV.Quantidade, IV.ValorUnitario, IV.ValorTotalItem FROM `itemvenda` IV ' +
      ' INNER JOIN `produto` P ON IV.IDProduto = P.ID '+
      ' WHERE IV.IDVenda = ' + prmIDVenda;
    dmPrincipal.qrItemVenda.Open();
    Result := True;
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
    raise Exception.Create('Erro ao iniciar formul�rio Itens Venda');
  end;
end;

{ TSalvarNovoProduto }

function TSalvarNovoProduto.Salvar(prmNomeProduto, prmDataCadastro,
  prmDataAtualizacao, prmPrecoUnitario, prmValCompra,
  prmCodBarras: String; prmCriarDM: Boolean = False): Boolean;
begin
  Result := False;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    dmPrincipal.qrProduto.Close();
    dmPrincipal.qrProduto.Open();
    dmPrincipal.qrProduto.Insert();
    dmPrincipal.qrProduto.FieldByName('NomeProduto').AsString := prmNomeProduto;
    dmPrincipal.qrProduto.FieldByName('DataCadastro').AsDateTime := StrToDate(prmDataCadastro);
    dmPrincipal.qrProduto.FieldByName('DataAtualizacao').AsDateTime := StrToDate(prmDataAtualizacao);
    dmPrincipal.qrProduto.FieldByName('PrecoUnitario').AsFloat := StrToFloat(prmPrecoUnitario);
    dmPrincipal.qrProduto.FieldByName('ValCompra').AsFloat := StrToFloat(prmValCompra);
    dmPrincipal.qrProduto.FieldByName('CodBarras').AsFloat := StrToFloat(prmCodBarras);
    dmPrincipal.qrProduto.Post();
    Result := True;
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
    raise Exception.Create('Error Ao Cadastrar Produto!');
  end;
end;

{ TConsultarVendas }

function TConsultarVendas.Consultar(prmData, prmNumeroVenda: String; prmCriarDM: Boolean = False): Boolean;
var
  LocStringData, LocStringNumeroVenda, LocScript: String;
begin
  Result := False;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    LocStringData        := '';
    LocStringNumeroVenda := '';

    if prmData <> '' then
      LocStringData := ' AND V.DataVenda = ' + QuotedStr(FormatarDataSQL(StrToDate(prmData)));

    if prmNumeroVenda <> '' then
      LocStringNumeroVenda := ' AND V.ID = '+prmNumeroVenda;

    LocScript :=
      'SELECT V.ID, V.DataVenda,V.QuantidadeItens, V.DataEntrega, V.ValorTotal, ' +
      ' IF(V.StatusVenda = 1, '+QuotedStr('Iniciada')+', IF(V.StatusVenda = 2,'+QuotedStr('Finalizada')+', '+QuotedStr('Cancelada')+')) StatusVenda,'+
      ' C.Nome FROM `Venda` V ' +
      ' LEFT JOIN `Cliente` C ON V.IDCliente = C.ID ' +
      ' WHERE 1 ' + LocStringData + LocStringNumeroVenda;

    dmPrincipal.qrConsultarVenda.Close();
    dmPrincipal.qrConsultarVenda.SQL.Text := LocScript;
    dmPrincipal.qrConsultarVenda.Open();

    result := dmPrincipal.qrConsultarVenda.RecordCount <> 0;
    if prmCriarDM then
      FreeAndNil(dmPrincipal);
  except on Exception do
    raise Exception.Create('Error ao Consultar Vendas!');
  end;
end;


{ TAtualizarTotaisVenda }

function TAtualizarTotaisVenda.Atualizar(prmIdVenda: Integer; prmCriarDM: Boolean = False): Boolean;
var
  LocScript: String;
begin
  Result := False;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);

    LocScript := 'SELECT COUNT(ID) Quantidade, SUM(ValorTotalItem) ValorTotal FROM ItemVenda where IDVenda = ' + IntToStr(prmIdVenda) + ' GROUP BY IDVENDA';
    dmprincipal.qrUtilidade.Close();
    dmprincipal.qrUtilidade.SQL.Text := LocScript;
    dmprincipal.qrUtilidade.Open();

    LocScript := 'UPDATE `venda` SET '+
      ' `DataVenda`='+ QuotedStr(FormatarDataSQL(Date)) +
      ',`ValorTotal`='+ FormatFloat('#0.00', dmprincipal.qrUtilidade.FieldByName('ValorTotal').AsFloat).Replace(',','.')+
      ',`QuantidadeItens`='+IntToStr(dmprincipal.qrUtilidade.FieldByName('Quantidade').AsInteger) +
      ' WHERE `ID`='+ IntToStr(prmIdVenda);
    dmprincipal.qrUtilidade.Close();
    dmprincipal.qrUtilidade.SQL.Text := LocScript;
    dmprincipal.qrUtilidade.ExecSQL();

    if not prmCriarDM and (dmprincipal.qrUtilidade.RowsAffected > 0) then
    begin
      dmPrincipal.qrVenda.Close();
      dmPrincipal.qrVenda.ParamByName('prmID').AsInteger := prmIdVenda;
      dmPrincipal.qrVenda.Open();
      dmPrincipal.qrItemVenda.Open();
    end;

    if prmCriarDM then
      FreeAndNil(dmPrincipal);

    Result := True;
  except on Exception do
    raise Exception.Create('Erro ao atualizar totais da venda');
  end;
end;

{ TBuscarClienteNome }

function TBuscarClienteNome.Buscar(prmNome: String;
  prmCriarDM: Boolean = False): Boolean;
var
  LocScript: String;
begin
  Result := False;
  try
    if prmCriarDM then
      dmPrincipal := TdmPrincipal.Create(nil);
      
    dmPrincipal.qrCliente.Close;

    LocScript := 'SELECT * FROM `Cliente` WHERE `Nome` LIKE '+ QuotedStr(prmNome+'%') +'ORDER BY Nome' ;

    dmPrincipal.qrCliente.Sql.Clear();
    dmPrincipal.qrCliente.SQL.Text := LocScript;
    dmPrincipal.qrCliente.Open();

    if prmCriarDM then
      FreeAndNil(dmPrincipal);
      
    Result := True;
  Except on Exception do
    raise Exception.Create('Erro ao buscar cliente por nome');
  end;
end;


end.
