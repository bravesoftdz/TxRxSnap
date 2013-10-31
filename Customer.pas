unit Customer;

interface

uses
  System.SysUtils, System.Variants, Data.DB, Datasnap.DBClient, Data.DBXCommon,
  Data.SqlExpr,
  Data.DBXDataSnap, Data.DBXJSON, Data.DBXJSONReflect, IPPeerClient;

type
  TMaritalStatus = (msMarried, msEngaged, msEligible);

  TCustomer = class
  private
    FName: string;
    FAge: integer;
    FMaritalStatus: TMaritalStatus;
  public
    property Name: string read FName write FName;
    property Age: integer read FAge write FAge;
    property MaritalStatus: TMaritalStatus read FMaritalStatus
      write FMaritalStatus;

    function ToString: string; override;
  end;

function CustomerToJSON(Customer: TCustomer): TJSONValue;
function JSONToCustomer(json: TJSONValue): TCustomer;

implementation

function CustomerToJSON(Customer: TCustomer): TJSONValue;
var
  m: TJSONMarshal;
begin
  if Assigned(Customer) then
  begin
    m := TJSONMarshal.Create(TJSONConverter.Create);
    try
      exit(m.Marshal(Customer))
    finally
      m.Free;
    end;
  end
  else
    exit(TJSONNull.Create);
end;

function JSONToCustomer(json: TJSONValue): TCustomer;
var
  unm: TJSONUnMarshal;
begin
  if json is TJSONNull then
    exit(nil);
  unm := TJSONUnMarshal.Create;
  try
    exit(unm.Unmarshal(json) as TCustomer)
  finally
    unm.Free;
  end;
end;
{ TCustomer }

function TCustomer.ToString: string;
begin
  Result := Self.Name + ' - Age: ' + IntToStr(Self.Age);
end;

end.
