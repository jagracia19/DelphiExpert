program SunAppCodeStatic;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunCodeStatic in 'uFormSunCodeStatic.pas' {Form1},
  uFmxCanvasHelper in 'uFmxCanvasHelper.pas',
  uFormSunCodeShape in 'uFormSunCodeShape.pas' {FormSunCodeShape};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSunCodeShape, FormSunCodeShape);
  Application.Run;
end.
