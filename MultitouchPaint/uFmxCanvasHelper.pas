unit uFmxCanvasHelper;

interface

uses
  System.Types, System.UITypes, FMX.Graphics;

type
  TFmxCanvasHelper = class helper for TCanvas
    procedure Line(A, B: TPointF; AColor: TColor; AThickness: Single = 1);
    procedure SolidRect(ARect: TRectF; AColor: TColor = TAlphaColorRec.White);
    procedure SolidCircle(A: TPointF; R: Double; AColor: TColor);
  end;

implementation

const
  DEFAULT_OPACITY: Double = 1;

{ TFmxCanvasHelper }

procedure TFmxCanvasHelper.Line(A, B: TPointF; AColor: TColor;
  AThickness: Single);
begin
  Stroke.Color := AColor;
  Stroke.Kind := TBrushKind.Solid;
  Stroke.Thickness := AThickness;
  DrawLine(A, B, DEFAULT_OPACITY);
end;

procedure TFmxCanvasHelper.SolidCircle(A: TPointF; R: Double; AColor: TColor);
var aRect: TRectF;
begin
  aRect := RectF(A.X-R, A.Y-R, A.X+R, A.Y+R);
  Fill.Color := AColor;
  Fill.Kind := TBrushKind.Solid;
  FillEllipse(aRect, DEFAULT_OPACITY);
end;

procedure TFmxCanvasHelper.SolidRect(ARect: TRectF; AColor: TColor);
begin
  Fill.Color := AColor;
  FillRect(ARect, 0, 0, [], DEFAULT_OPACITY);
end;

end.
