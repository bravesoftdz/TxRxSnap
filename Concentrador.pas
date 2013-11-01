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
//function DataSetToJSON(Dados : TClientDataSet) : TJSONObject ;
//function AllApplyUpdatesJson(JSONArrayValue:TJSONValue): Boolean;

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


{
function DataSetToJSON(Dados : TClientDataSet) : TJSONObject ;
var
    obj:TJSONArrayCds;
    Vtran: TDBXTransaction;
    Lista:TList<TClientDataSet>;
    cds:TClientDataSet;
     i:integer;
Begin

End;

{
function AllApplyUpdatesJson(JSONArrayValue:TJSONValue): Boolean;
var
    obj:TJSONArrayCds;
    Vtran: TDBXTransaction;
    Lista:TList<TClientDataSet>;
    cds:TClientDataSet;
     i:integer;
begin
  obj:=TJSONArrayCds.JSONToBaseObject(JSONArrayValue);
    try
      Lista:=TList<TClientDataSet>.Create;
        try
           Vtran := DataSnap2010.DBXConnection.BeginTransaction
                                             (TDBXIsolations.ReadCommitted);
             try
                for I := Low(Obj.FDelta) to High(Obj.FDelta) do
                  begin
                    cds:=TClientDataSet.Create(self);
                    With cds do
                      begin
                         ProviderName:= obj.Fprovider[i];
                         open;
                         XMLData:=obj.FDelta[i]; //Coração do Processo
                         if not ApplyUpdates(0) = 0 then
                         Raise TAllApplyUpdatesError.Create(
                                                      'Erro '+ProviderName);
                      end;
                  Lista.Add(Cds);
                end;
           DataSnap2010.DBXConnection.CommitFreeAndNil(Vtran);
           result:=true;
         finally
            DataSnap2010.DBXConnection.RollbackIncompleteFreeAndNil(Vtran);
         end;
     finally
       begin
          for cds In Lista do
            cds.Free;
          Lista.Free;
      end;
    end;
finally
obj.Free;
end;
end;
}

end.
