unit uFormSunCodeStatic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
const
  DEFAULT_OPACITY = 1;
  POS_X           = 150;
  POS_Y           = 150;
  SUN_RADIUS      = 50;
  RAY_COUNT       = 12;
  RAY_LENGTH      = 100;
  RAY_THICKNESS   = 3;
var aRect         : TRectF;
    x, y, r, angle: Double;
    I             : Integer;
    a, b          : TPointF;
begin
  Canvas.BeginScene;
  try
    // draw blue sky
    Canvas.Fill.Color := TAlphaColorRec.Skyblue;
    Canvas.FillRect(PaintBox1.BoundsRect, 0, 0, [], DEFAULT_OPACITY);

    // draw yellow sun solid circle
    Canvas.Fill.Color := TAlphaColorRec.Yellow;
    Canvas.Fill.Kind := TBrushKind.Solid;
    x := POS_X;
    y := POS_Y;
    r := SUN_RADIUS;
    aRect := RectF(x-r, y-r, x+r, y+r);
    Canvas.FillEllipse(aRect, DEFAULT_OPACITY);

    // draw sun rays
    Canvas.Stroke.Color := TAlphaColorRec.Yellow;
    Canvas.Stroke.Kind := TBrushKind.Solid;
    Canvas.Stroke.Thickness := RAY_THICKNESS;
    for I := 0 to RAY_COUNT-1 do
    begin
      angle := I*2*pi/RAY_COUNT;
      a := PointF(x, y);
      b := PointF(x + RAY_LENGTH * cos(angle), y + RAY_LENGTH * sin(angle));
      Canvas.DrawLine(a, b, DEFAULT_OPACITY);
    end;
  finally
    Canvas.EndScene;
  end;
end;

end.
