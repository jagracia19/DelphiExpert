program Arrows3D;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormArrows3D in 'uFormArrows3D.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
