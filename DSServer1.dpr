program DSServer1;

uses
  Forms,
  ServerMethodsUnit2 in 'ServerMethodsUnit2.pas' {ServerMethods2: TDSServerModule},
  ServerContainerUnit3 in 'ServerContainerUnit3.pas' {ServerContainer3: TDataModule},
  Customer in 'Customer.pas',
  ServerForm in 'ServerForm.pas' {Form11},
  Concentrador in 'Concentrador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TServerMethods2, ServerMethods2);
  Application.CreateForm(TServerContainer3, ServerContainer3);
  Application.Run;

end.
