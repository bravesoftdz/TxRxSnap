// 
// Created by the DataSnap proxy generator.
// 

unit ClientProxy;

interface

uses DBXCommon, DBXJSON, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TServerMethods2Client = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FMVPCustomerCommand: TDBXCommand;
    FListofCustomerCommand: TDBXCommand;
    FListofListaConcetradorCommand : TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function MVPCustomer: TJSONValue;
    function ListofCustomer: TJSONArray;

    function ListaConcetrador: TJSONArray;
  end;

implementation

function TServerMethods2Client.MVPCustomer: TJSONValue;
begin
  if FMVPCustomerCommand = nil then
  begin
    FMVPCustomerCommand := FDBXConnection.CreateCommand;
    FMVPCustomerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FMVPCustomerCommand.Text := 'TServerMethods2.MVPCustomer';
    FMVPCustomerCommand.Prepare;
  end;
  FMVPCustomerCommand.ExecuteUpdate;
  Result := TJSONValue(FMVPCustomerCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods2Client.ListofCustomer: TJSONArray;
begin
  if FListofCustomerCommand = nil then
  begin
    FListofCustomerCommand := FDBXConnection.CreateCommand;
    FListofCustomerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofCustomerCommand.Text := 'TServerMethods2.ListofCustomer';
    FListofCustomerCommand.Prepare;
  end;
  FListofCustomerCommand.ExecuteUpdate;
  Result := TJSONArray(FListofCustomerCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods2Client.ListaConcetrador: TJSONArray;
begin
  if FListofListaConcetradorCommand = nil then
  begin
    FListofListaConcetradorCommand := FDBXConnection.CreateCommand;
    FListofListaConcetradorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofListaConcetradorCommand.Text := 'TServerMethods2.ListaConcetrador';
    FListofListaConcetradorCommand.Prepare;
  end;
  FListofListaConcetradorCommand.ExecuteUpdate;
  Result := TJSONArray(FListofListaConcetradorCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;




constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TServerMethods2Client.Destroy;
begin
  FreeAndNil(FMVPCustomerCommand);
  FreeAndNil(FListofCustomerCommand);
  inherited;
end;

end.
