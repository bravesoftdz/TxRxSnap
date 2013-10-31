// 
// Created by the DataSnap proxy generator.
// 

unit ClientMethods;

interface

uses DBXCommon, DBXJSON, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TServerMethods2Client = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FMVPCustomerCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function MVPCustomer: TJSONValue;
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
  inherited;
end;

end.
