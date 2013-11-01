unit ClientForm;

interface

uses  Winapi.Windows, System.Classes, Data.DBXDataSnap, Data.DBXCommon, Data.DB,
  Data.SqlExpr, Vcl.StdCtrls, Vcl.Controls,

  Data.DBXJSON,

  Winapi.Messages, System.SysUtils, System.Variants,  Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.Buttons,

  REST.Response.Adapter, REST.Client, REST.Json, IPPeerClient, Vcl.ComCtrls;


type
  TForm12 = class(TForm)
    SQLConnection1: TSQLConnection;
    Button1: TButton;
    MMCustomer: TMemo;
    Button2: TButton;
    myCliente: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

uses
  Concentrador, Customer, ClientProxy;


procedure TForm12.BitBtn1Click(Sender: TObject);
var
  proxy: TServerMethods2Client;
  mySingleValue: TJSONValue;
  allValues: TJSONArray;
  i: Integer;
begin
  proxy := nil;
  SQLConnection1.Open;
  try
    proxy := TServerMethods2Client.Create(SQLConnection1.DBXConnection);
    allValues := proxy.ListofDifferentTypes;
    MMCustomer.Lines.Clear;
    for i := 0 to allValues.Size - 1 do
    begin
      mySingleValue := allValues.Get(i);

      if mySingleValue is TJSONString then
        MMCustomer.Lines.Add('TJSONString value ' + mySingleValue.Value)
      else if mySingleValue is TJSONNumber then
        MMCustomer.Lines.Add('TJSONNumber value ' + mySingleValue.Value)
      else if mySingleValue is TJSONTrue then
        MMCustomer.Lines.Add('TJSONTrue value ' + mySingleValue.ToString)
      else if mySingleValue is TJSONFalse then
        MMCustomer.Lines.Add('TJSONFalse value ' + mySingleValue.ToString)
      else if mySingleValue is TJSONObject then
        MMCustomer.Lines.Add('TJSONObject value ' + mySingleValue.ToString);

    end;

  finally
    proxy.Free;
  end;

end;


procedure TForm12.BitBtn2Click(Sender: TObject);
var
  proxy: TServerMethods2Client;
begin
 proxy := nil;
  SQLConnection1.Open;
  try
    proxy := TServerMethods2Client.Create(SQLConnection1.DBXConnection);
  finally
     proxy.GetData(myCliente,'ID,ID_HOST,PORT','Concetradores');
  end;
{
    Reader := proxy.GetRecords(Fields, Table);
    TDBXDataSetReader.CopyReaderToClientDataSet( Reader, Cds );
    Reader.Free;
    Cds.Open;
    //Result := TDBXDataSetReader.Create(Cds, False (* InstanceOwner *) );
 }
end;

procedure TForm12.Button1Click(Sender: TObject);
var
  proxy: TServerMethods2Client;
  myMVPCustomer: TCustomer;
begin

  SQLConnection1.Open;
  proxy := nil;
  try
    proxy := TServerMethods2Client.Create(SQLConnection1.DBXConnection);
    myMVPCustomer := JSONToCustomer(proxy.MVPCustomer);

    MMCustomer.Lines.Text := myMVPCustomer.ToString;
    myMVPCustomer.Free;
  finally
    SQLConnection1.Close;
    proxy.Free;
  end;
end;

procedure TForm12.Button2Click(Sender: TObject);
var
  proxy: TServerMethods2Client;
  mySingleCustomer: TCustomer;
  MyConcentrador : TConcentrador;
  allCustomers : TJSONArray;
  i: Integer;

  Reader : TDBXReader;
  XMLDadta : String;

begin
  proxy := nil;
  //myCliente := TClientDataSet.Create(self);
  myCliente.DisableControls;
  myCliente.FieldDefs.Clear;
  myCliente.Close;
  myCliente.FieldDefs.Clear;
  myCliente.FieldDefs.Add('ID',ftInteger);
  myCliente.FieldDefs.Add('IP_HOST',ftString, 30);
  myCliente.FieldDefs.Add('PORT',ftInteger);
  with  myCliente do
  Begin
    CreateDataSet;
    FieldByName('ID').DisplayLabel := 'Identificador';
    FieldByName('IP_HOST').DisplayLabel := 'IP HOST';
    FieldByName('PORT').DisplayLabel := 'Porta';
  End;
  // Limpamos todos os registro da tabela
{  myCliente.DisableControls;
  myCliente.FieldDefs.Clear; }
  myCliente.Open;
  SQLConnection1.Open;
  try
    proxy := TServerMethods2Client.Create(SQLConnection1.DBXConnection);
    allCustomers := proxy.ListaConcetrador;

    // Get AllCustomers :)
    MMCustomer.Lines.Text := TJson.Format(allCustomers);
     // Get Customer ID :)
     for i := 0 to allCustomers.Size -1 do
     begin
       MyConcentrador := JSONToConcentrador(allCustomers.Get(i));
       MMCustomer.Lines.Add(MyConcentrador.ID.ToString+'->'+MyConcentrador.IP_HOST+'->'+MyConcentrador.Port.ToString());
       myCliente.Append; // Inserimos dados
       myCliente.FieldByName('ID').AsInteger := MyConcentrador.ID;
       myCliente.FieldByName('IP_HOST').AsString := MyConcentrador.IP_HOST;
       myCliente.FieldByName('PORT').AsInteger := MyConcentrador.Port;
       myCliente.Post;
     end;
     myCliente.Open;
     myCliente.First;
   finally
     myCliente.EnableControls;
     SQLConnection1.Close;
     proxy.Free;
  end;




end;

end.
