unit ServerContainerUnit3;

interface

uses
  System.SysUtils, System.Classes,
  IPPeerServer, Datasnap.DSCommonServer,
  Datasnap.DSServer, Datasnap.DSTCPServerTransport;

type
  TServerContainer3 = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
  end;

var
  ServerContainer3: TServerContainer3;

implementation

uses Windows, ServerMethodsUnit2;

{$R *.dfm}

procedure TServerContainer3.DSServerClass1GetClass(DSServerClass
  : TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit2.TServerMethods2;
end;

end.
