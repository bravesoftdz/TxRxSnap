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

  function ServerComputerName: String;

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


function TServerContainer3.ServerComputerName: String;
var
  Buffer : array[0..255] of char;
  Size : DWORD;
begin
  if GetComputerName(Buffer, Size) then
     Result := Buffer
  else
     Result := '';
end;

{
function TServerContainer3.ReadIPs: TStrings;
type
  TaPInAddr = array[0..10] of PAnsiChar;
  PaPInAddr = ^TaPInAddr;
var
  Buffer: PAnsiChar;
  iI: Integer;
  PPtr: PaPInAddr;
  pHE: PHostEnt;
  GInitData: TWSAData;
begin
  WSAStartup($101, GInitData);

  Result := TStringList.Create;

  try
    Result.Clear;
    Buffer := '';
    GetHostName(Buffer, SizeOf(Buffer));
    pHE := GetHostByName(buffer);

    if pHE = nil then
       Exit;

     PPtr := PaPInAddr(pHE^.H_Addr_List);
     iI := 0;
     while pPtr^[iI] <> nil do
     begin
       Result.Add(String(Inet_NToA(PPtr^[iI]^)));
       Inc(iI);
     end;
  finally
     WSACleanup;
  end;

end;
}


end.
