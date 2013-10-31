unit ServerMethodsUnit2;

interface

uses
  SysUtils, Classes, DSServer, DBXJSON,
  Data.DB, Datasnap.DBClient,
  // Define Customers
  Customer, Concentrador;

type

  TServerMethods2 = class(TDSServerModule)
  private
    { Private declarations }
  protected
    function GetCustomer: TCustomer;
    function GetConcentrador: TConcentrador;

  public
    { Public declarations }
    function MVPCustomer(): TJSONValue;
    function ListofCustomer(): TJSONArray;
    function ListaConcetrador():TJSONArray;
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

function TServerMethods2.GetConcentrador: TConcentrador;
begin
  Result := TConcentrador.Create;
  Result.ID := 0;
  Result.IP_HOST := 'localhost';
  Result.Port := 0;
end;


function TServerMethods2.ListofCustomer: TJSONArray;
var
  I: Integer;
  myCustomer: TCustomer;
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

function TServerMethods2.ListaConcetrador: TJSONArray;
var
  I: Integer;
  myConcentrador: TConcentrador;
begin
  Result := TJSONArray.Create;
  for I := 0 to 19 do
  begin
    myConcentrador := GetConcentrador;
    myConcentrador.ID := I;
    myConcentrador.IP_HOST := '192.168.0.'+IntToStr(I);
    myConcentrador.Port := I;
    Result.AddElement(ConcentradorToJSON(myConcentrador));
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
