unit ServerMethodsUnit2;

interface

uses
  SysUtils, Classes, DSServer, Customer, DBXJSON,
  Data.DB, Datasnap.DBClient;

type

  TServerMethods2 = class(TDSServerModule)
  private
    { Private declarations }
  protected
    function GetCustomer: TCustomer;
  public
    { Public declarations }
    function MVPCustomer(): TJSONValue;
    function ListofCustomer(): TJSONArray;
  end;


  TDBXJsonTools = class
  public
    //class procedure jsonToDBX(obj: TJSONValue; var value: TDBXValue; dbxTypeName: String);
    //class procedure JSONToValueType(json: TJSONArray; var vt: TDBXValueType);
    //class function DBXParametersToJSONObject(dbxParameters: TDSParams) : TJSONObject;
    //class function DBXReaderToJSONObject(dbxReader: TDBXReader): TJSONObject;
    class function CreateTDataSetFromJSON(value: TJSONObject): TDataset;
    class function TDataSetToJSONObject(value: TDataset): TJSONObject;
    //class function GetTFieldTypeByTDBXDataTypes(DBXDataTypes: TDBXDataTypes) : TFieldType;
    //class function GetTDBXDataTypesByTFieldType(FieldType: TFieldType) : TDBXDataTypes;
    class function CreateTStreamFromJSONArray(value: TJSONArray): TStream;
    class function StreamToJSONArray(value: TStream): TJSONArray;
    class function JSONToTableType(value: TJSONValue; dbxTypeName: String): TObject;
    class function SerializeTableType(Objetc: TObject): TJSONObject;

end;


var
  ServerMethods2: TServerMethods2;

implementation

{$R *.dfm}

function TServerMethods2.GetCustomer: TCustomer;
begin
  Result := TCustomer.Create;
  Result.Name := 'Pedro';
  Result.Age := 30;
  Result.MaritalStatus := msEligible;
end;

function TServerMethods2.ListofCustomer: TJSONArray;
var
  I: Integer;
  myCustomer: TCustomer;
  MyCustomeClient: TCustomClientDataSet;
begin
  Result := TJSONArray.Create;

  for I := 0 to 19 do
  begin
    myCustomer := GetCustomer;
    myCustomer.Name := 'Customer ' + IntToStr(I);
    myCustomer.Age := I;
    Result.AddElement(CustomerToJSON(myCustomer));
  end;

end;

function TServerMethods2.MVPCustomer(): TJSONValue;
var
  myCustomer: TCustomer;
begin
  myCustomer := GetCustomer;
  Result := CustomerToJSON(myCustomer);
  myCustomer.Free;
end;

{
  function TServerMethods2.RetornaOleVariant(Url, pSQL:string): TJSONArray;
  var
  dataStream: TStringStream;
  jObj: TJSONObject;
  jPair: TJSONPair;
  jItems: TJSONArray;
  jItem: TJSONValue;
  i: Integer;
  obj:TJSONArray;
  begin

  try
  dataStream := TStringStream.Create;
  //DMCliente.http.Get(DMCliente.url+pSQL, dataStream);

  jObj := TJSONObject.Create;
  jObj.Parse(dataStream.Bytes, 0);
  jPair := jObj.Get(0);
  jItems := TJSONArray(TJSONArray(jPair.JsonValue).Get(0));


  For i := 0 to jItems.Size - 1 do
  begin
  jItem := jItems.Get(i);
  //obj := TDataCds.JSONToObject<TDataCds>(jItem);

  // result := obj.Id;
  end;

  finally
  dataStream.Free;
  jObj.Free;
  end;
}

end.
