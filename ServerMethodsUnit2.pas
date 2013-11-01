unit ServerMethodsUnit2;

interface

uses
  SysUtils, Classes, DSServer, DBXJSON,
  Data.DB, Datasnap.DBClient,
  // Define Customers
  Customer, Concentrador, Data.DbxSqlite, Data.SqlExpr, Data.FMTBcd;

type

  TServerMethods2 = class(TDSServerModule)
    CBC: TSQLConnection;
    Concetradores: TSQLDataSet;
    ClientDataSet1: TClientDataSet;
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

    function QueryConcentrador():TJSONObject;

    function ListofDifferentTypes: TJSONArray;

  end;



var
  ServerMethods2: TServerMethods2;

implementation

{$R *.dfm}


function TServerMethods2.ListofDifferentTypes: TJSONArray;
var
  strval: TJSONString;
  trueval : TJSONTrue;
  falseval : TJSONFalse;
  numval: TJSONNumber;
  objval : TJSONObject;
begin


  Result := TJSONArray.Create;

  strval := TJSONString.Create('Retornar valor de String do Servidor DataSnap');
  Result.AddElement(strval);

  numval := TJSONNumber.Create(100);
  Result.AddElement(numval);

  numval := TJSONNumber.Create(99.99);
  Result.AddElement(numval);

  trueval := TJSONTrue.Create;
  Result.AddElement(trueval);

  falseval := TJSONFalse.Create;
  Result.AddElement(falseval);

  Result.AddElement(ConcentradorToJSON(GetConcentrador));

end;




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
 // I: Integer;
  myConcentrador: TConcentrador;
begin
  Result := TJSONArray.Create;
  CBC.Open;
  Concetradores.Open;
  while not Concetradores.Eof do
  Begin
     myConcentrador := GetConcentrador;
     myConcentrador.ID := Concetradores.FieldByName('id').AsInteger;
     myConcentrador.IP_HOST := Concetradores.FieldByName('ip_host').AsString;;
     myConcentrador.Port := Concetradores.FieldByName('port').AsInteger;;
     Result.AddElement(ConcentradorToJSON(myConcentrador));
     Concetradores.Next;
  End;{
  for I := 0 to 19 do
  begin
    myConcentrador := GetConcentrador;
    myConcentrador.ID := I;
    myConcentrador.IP_HOST := '192.168.0.'+IntToStr(I);
    myConcentrador.Port := I;
    Result.AddElement(ConcentradorToJSON(myConcentrador));
  end; }
  Concetradores.Close;
  CBC.Close;




end;

function TServerMethods2.QueryConcentrador: TJSONObject;
var
  myQuery :TSQLDataSet;
begin
   myQuery := Concetradores;

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
