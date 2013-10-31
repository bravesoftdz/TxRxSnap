unit Concentrador;

interface

uses
  System.SysUtils, System.Variants, Data.DB, Datasnap.DBClient, Data.DBXCommon,
  Data.SqlExpr,
  Data.DBXDataSnap, Data.DBXJSON, Data.DBXJSONReflect, IPPeerClient;

type

  TConcentrador = class
  private
    FID : Integer;
    FIP_HOST: string;
    FPort: integer;
  public
    property ID: integer read FID write FID;
    property IP_HOST: string read FIP_HOST write FIP_HOST;
    property Port: integer read FPort write FPort;
   // function ToString: string; override;
  end;




function ConcentradorToJSON(Concentrador: TConcentrador): TJSONValue;
function JSONToConcentrador(json: TJSONValue): TConcentrador;

implementation

function ConcentradorToJSON(Concentrador: TConcentrador): TJSONValue;
var
  m: TJSONMarshal;
begin
  if Assigned(Concentrador) then
  begin
    m := TJSONMarshal.Create(TJSONConverter.Create);
    try
      exit(m.Marshal(Concentrador))
    finally
      m.Free;
    end;
  end
  else
    exit(TJSONNull.Create);
end;

function JSONToConcentrador(json: TJSONValue): TConcentrador;
var
  unm: TJSONUnMarshal;
begin
  if json is TJSONNull then
    exit(nil);
  unm := TJSONUnMarshal.Create;
  try
    exit(unm.Unmarshal(json) as TConcentrador)
  finally
    unm.Free;
  end;
end;
{ TCustomer }
 {
function TCustomer.ToString: string;
begin
  Result := Self.Name + ' - Age: ' + IntToStr(Self.Age);
end;
  }
end.
