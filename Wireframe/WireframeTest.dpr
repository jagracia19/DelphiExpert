program WireframeTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormWireframe in 'uFormWireframe.pas' {Form1},
  uWireframe in 'uWireframe.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
