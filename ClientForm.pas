unit ClientForm;

interface

uses  Winapi.Windows, System.Classes, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.DB,
  Data.SqlExpr, Vcl.StdCtrls, Vcl.Controls,

  DBXJSON,

  Winapi.Messages, System.SysUtils, System.Variants,  Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.Buttons,

  REST.Response.Adapter, REST.Client, REST.Json;


type
  TForm12 = class(TForm)
    SQLConnection1: TSQLConnection;
    Button1: TButton;
    MMCustomer: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  Customer, ClientProxy;


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
  allCustomers : TJSONArray;
  i: Integer;
begin
  proxy := nil;
  SQLConnection1.Open;
  try
    proxy := TServerMethods2Client.Create(SQLConnection1.DBXConnection);
    allCustomers := proxy.ListofCustomer;

    {for i := 0 to allCustomers.Size -1 do
    begin
      mySingleCustomer := JSONToCustomer(allCustomers.Get(i));
      MMCustomer.Lines.Add(mySingleCustomer.ToString);
      mySingleCustomer.Free;
    end;
    }
    MMCustomer.Lines.Text := TJson.Format(allCustomers)

  finally
    SQLConnection1.Close;
    proxy.Free;
  end;


end;

end.
