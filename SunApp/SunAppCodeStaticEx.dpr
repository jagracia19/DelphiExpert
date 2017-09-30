program SunAppCodeStaticEx;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFmxCanvasHelper in 'uFmxCanvasHelper.pas',
  uFormSunCodeStatic in 'uFormSunCodeStatic.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
