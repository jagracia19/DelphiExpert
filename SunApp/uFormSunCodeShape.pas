unit uFormSunCodeShape;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Effects;

type
  TFormSunCodeShape = class(TForm)
    rectSky: TRectangle;
    cicleSun: TCircle;
    LineRay01: TLine;
    LineRay02: TLine;
    LineRay03: TLine;
    LineRay04: TLine;
    LineRay05: TLine;
    LineRay06: TLine;
    LineRay07: TLine;
    LineRay08: TLine;
    LineRay09: TLine;
    LineRay10: TLine;
    LineRay11: TLine;
    LineRay13: TLine;
    LineRay12: TLine;
    FloatAnimation1: TFloatAnimation;
    GlowEffect1: TGlowEffect;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSunCodeShape: TFormSunCodeShape;

implementation

{$R *.fmx}

procedure TFormSunCodeShape.FormCreate(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
  FloatAnimation1.StartValue := Height + 150;
  {$ENDIF}
  {$IFDEF ANDROID}
    FloatAnimation1.StartValue := 800; // Heigh is 0
  {$ENDIF}
end;

end.
