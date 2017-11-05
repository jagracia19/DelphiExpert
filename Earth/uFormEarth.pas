unit uFormEarth;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics, 
  FMX.Dialogs, System.Math.Vectors, FMX.MaterialSources, FMX.Objects3D,
  FMX.Controls3D, FMX.Ani;

type
  TForm1 = class(TForm3D)
    DummyScene: TDummy;
    SphereEarth: TSphere;
    TextureMaterialSource1: TTextureMaterialSource;
    FloatAnimation1: TFloatAnimation;
    procedure SphereEarthClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.SphereEarthClick(Sender: TObject);
begin
  if SphereEarth.Position.Z < 0 then
    TAnimator.AnimateFloat(SphereEarth, 'Position.Z', 1.5, 1.2)
  else TAnimator.AnimateFloat(SphereEarth, 'Position.Z', -1.5, 1.2)
end;

end.
