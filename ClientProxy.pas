//
// Created by the DataSnap proxy generator.
// 

unit ClientProxy;

interface

uses Data.DBXCommon, Data.DBXJSON, System.Classes, system.SysUtils, Data.DB, Data.SqlExpr,
     Data.DBXDBReaders, Datasnap.DBClient, Data.DBXClient;

type


  TServerMethods2Client = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FMVPCustomerCommand: TDBXCommand;
    FListofCustomerCommand: TDBXCommand;
    FListofListaConcetradorCommand : TDBXCommand;
    FListofDifferentTypesCommand  : TDBXCommand;
    FMVPDataSetCommand : TDBXCommand;

  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function MVPCustomer: TJSONValue;
    function ListofCustomer: TJSONArray;
    function ListaConcetrador: TJSONArray;
    function ListofDifferentTypes : TJSONArray;

    function GetData(Cds : TClientDataSet; Fields, Table: String) : TDBXReader;
    function GetRecords(Fields, Table: String): TDBXReader;

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

function TServerMethods2Client.ListofDifferentTypes: TJSONArray;
begin
  if FListofDifferentTypesCommand = nil then
  begin
    FListofDifferentTypesCommand := FDBXConnection.CreateCommand;
    FListofDifferentTypesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListofDifferentTypesCommand.Text := 'TServerMethods2.ListofDifferentTypes';
    FListofDifferentTypesCommand.Prepare;
  end;
  FListofDifferentTypesCommand.ExecuteUpdate;
  Result := TJSONArray(FListofDifferentTypesCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;



constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('A conexão não pode ser nula. Certifique-se de que a conexão foi aberta.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('A conexão não pode ser nula. Certifique-se de que a conexão foi aberta.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TServerMethods2Client.Destroy;
begin
  FreeAndNil(FMVPCustomerCommand);
  FreeAndNil(FListofCustomerCommand);
  inherited;
end;

function TServerMethods2Client.GetData(Cds: TClientDataSet; Fields,
  Table: String): TDBXReader;
var
  Reader : TDBXReader;

begin
    if not Cds.Active then // Not active means, never move the data to ClientDataSet – no cache
      begin
      Reader := GetRecords(Fields, Table);
//      TDBXDataSetReader.CopyReaderToClientDataSet( Reader, Cds );

      Reader.Free;
      Cds.Open;
    end;

    Result := TDBXDataSetReader.Create(Cds, False (* InstanceOwner *) );
end;

function TServerMethods2Client.GetRecords(Fields, Table: String): TDBXReader;
begin
  if FMVPDataSetCommand = nil then
  begin
    FMVPDataSetCommand := FDBXConnection.CreateCommand;
    try
      FMVPDataSetCommand.Text := 'Select ' + Fields + ' from ' + Table;
      Result := FMVPDataSetCommand.ExecuteQuery;
    except
      raise;
    end;
  end;
end;




end.
