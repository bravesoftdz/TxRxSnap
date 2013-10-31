program DSClient1;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Form12},
  ClientProxy in 'ClientProxy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm12, Form12);
  Application.Run;
end.
