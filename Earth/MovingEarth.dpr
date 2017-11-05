program MovingEarth;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormEarth in 'uFormEarth.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
