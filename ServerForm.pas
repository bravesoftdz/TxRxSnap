unit ServerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Datasnap.DBClient, Vcl.Buttons, Data.DBXCommon, Data.SqlExpr,
  Data.DBXDataSnap, IPPeerClient, Vcl.ExtCtrls;

type
  TForm11 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}
uses ServerContainerUnit3;

procedure TForm11.FormActivate(Sender: TObject);
begin
   Panel1.Caption := ServerContainer3.ServerComputerName;;
end;

end.
