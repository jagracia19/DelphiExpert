unit uFormSunCodeShape;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Effects;

type
  TFormSunCodeShape = class(TForm)
    rectSky: TRectangle;
    circleSun: TCircle;
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
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
  private
    FReady: Boolean;
    FDown: TPointF;
    FMoving: Boolean;
    FLastAngle: Double;
  public
  end;

var
  FormSunCodeShape: TFormSunCodeShape;

implementation

{$R *.fmx}

procedure TFormSunCodeShape.FloatAnimation1Finish(Sender: TObject);
begin
  FReady := True;
end;

procedure TFormSunCodeShape.FormCreate(Sender: TObject);
begin
  FMoving := False;
  FReady := False;
  {$IFDEF MSWINDOWS}
  FloatAnimation1.StartValue := Height + 150;
  {$ENDIF}
  {$IFDEF ANDROID}
    FloatAnimation1.StartValue := 800; // Heigh is 0
  {$ENDIF}
end;

procedure TFormSunCodeShape.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiRotate then
  begin
    if TInteractiveGestureFlag.gfBegin in EventInfo.Flags then
      FLastAngle := circleSun.RotationAngle
    else if EventInfo.Angle <> 0 then
      circleSun.RotationAngle := FLastAngle - (EventInfo.Angle * 180) / Pi;
  end;
end;

procedure TFormSunCodeShape.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if FReady then
  begin
    FDown := PointF(X, Y);
    FMoving := True;
  end;
end;

procedure TFormSunCodeShape.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if FMoving then
  begin
    circleSun.Position.X := circleSun.Position.X + (X - FDown.X);
    circleSun.Position.Y := circleSun.Position.Y + (Y - FDown.Y);
  end;

end;

end.
