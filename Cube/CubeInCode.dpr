program CubeInCode;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormCubeInCode in 'uFormCubeInCode.pas' {FormCubeInCode},
  uFmxContextHelper in 'uFmxContextHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCubeInCode, FormCubeInCode);
  Application.Run;
end.
