program SunAppCodeStatic;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunCodeStatic in 'uFormSunCodeStatic.pas' {Form1},
  uFmxCanvasHelper in 'uFmxCanvasHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
