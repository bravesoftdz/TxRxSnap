unit ContatoUnit;

 // Classe que estão as property

interface
uses DBXJSON, DBXJSONReflect;

type
  TSexo = (sxMasculino, sxFeminino);

  TTipoTelefone = (ttResidencial, ttComercial, ttCelular);

  TTelefone = class
  private
    FNumero: string;
    FTipo: TTipoTelefone;
  public
    constructor Create(ATipo: TTipoTelefone; ANumero: string);
    property Tipo: TTipoTelefone read FTipo write FTipo;
    property Numero: string read FNumero write FNumero;
  end;

  TEndereco = class
  private
    FNumero: string;
    FRua: string;
  public
    property Rua: string read FRua write FRua;
    property Numero: string read FNumero write FNumero;
  end;

  TContato = class
  private
    FEmail: string;
    FSexo: TSexo;
    FNome: Variant;
    FEndereco: TEndereco;
    FTelefones: array of TTelefone;
    FTelefonesCount: Integer;
    function GetTelefones(idx: Integer): TTelefone;
    procedure SetTelefones(idx: Integer; const Value: TTelefone);
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddTelefone(telefone: TTelefone);
    property Nome: Variant read FNome write FNome;
    property Telefones[idx: Integer]: TTelefone read GetTelefones write SetTelefones;
    property Email: string read FEmail write FEmail;
    property Sexo: TSexo read FSexo write FSexo;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property TelefonesCount: Integer read FTelefonesCount;
  end;

implementation

{ TContato }

procedure TContato.AddTelefone(telefone: TTelefone);
begin
  SetTelefones(FTelefonesCount, telefone);
end;

constructor TContato.Create;
begin
  FEndereco := TEndereco.Create;
end;

destructor TContato.Destroy;
var
  i: Integer;
begin
  FEndereco.Free;
  for i := 0 to FTelefonesCount-1 do
  begin
    FTelefones[i].Free;
  end;
  inherited;
end;

function TContato.GetTelefones(idx: Integer): TTelefone;
begin
  Result := FTelefones[idx];
end;

procedure TContato.SetTelefones(idx: Integer; const Value: TTelefone);
begin
  FTelefonesCount := FTelefonesCount + 1;
  SetLength(FTelefones, FTelefonesCount);
  FTelefones[idx] := Value;
end;

{ TTelefone }

constructor TTelefone.Create(ATipo: TTipoTelefone; ANumero: string);
begin
  FTipo := ATipo;
  FNumero := ANumero;
end;


{

// OnClick do botão que serializa e tudo feito.
var
  contato: TContato;
  conversor: TJSONMarshal;
  value: TJSONValue;
  func: TObjectsConverter;
begin
  contato := TContato.Create;
  contato.Nome := 'Gilson';
  contato.Email := 'email@email.com.br';
  contato.Sexo := TSexo.sxMasculino;
  contato.Endereco.Rua := 'Quadra (';
  contato.Endereco.Numero := '4';
  contato.AddTelefone(TTelefone.Create(ttComercial, '(99) 9999-9999'));
  contato.AddTelefone(TTelefone.Create(ttCelular, '(99) 9999-9999'));

  func := TelefonesConverter;
  conversor := TJSONMarshal.Create(TJSONConverter.Create);
  conversor.RegisterConverter(TContato, 'FTelefones', func);
  value := conversor.Marshal(contato);

  Memo1.Lines.Add(value.ToString);// no Value.tostring mostrar os valores  do memo icluseve o "nome: William"

  conversor.Free;
  value.Free;
  contato.Free;
end;
}

end.
