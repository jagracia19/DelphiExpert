unit uFormSunCodeStatic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    btnSunrise: TButton;
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
    procedure Timer1Timer(Sender: TObject);
    procedure btnSunriseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSunPosY: Double;
  public
  end;

var
  Form1: TForm1;

implementation

uses
  uFmxCanvasHelper;

{$R *.fmx}

const
  END_SUN_POS_Y = 150;

procedure TForm1.btnSunriseClick(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := False;
  {$IFDEF MSWINDOWS}
  FSunPosY := Height + 150
  {$ENDIF}
  {$IFDEF ANDROID}
    // Height = 0
    FSunPosY := 800;
  {$ENDIF}
end;

procedure TForm1.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
const
  DEFAULT_OPACITY = 1;
  POS_X           = 150;
  POS_Y           = 150;
  SUN_RADIUS      = 50;
  RAY_COUNT       = 12;
  RAY_LENGTH      = 100;
  RAY_THICKNESS   = 3;
var angle: Double;
    I    : Integer;
    a, b : TPointF;
    x, y : Double;
begin
  Canvas.BeginScene;
  try
    // draw blue sky
    Canvas.SolidRect(PaintBox1.BoundsRect, TAlphaColorRec.Skyblue);

    x := POS_X;
    y := FSunPosY;

    // draw yellow sun solid circle
    Canvas.SolidCircle(PointF(x, y), SUN_RADIUS, TAlphaColorRec.Yellow);

    // draw sun rays
    for I := 0 to RAY_COUNT-1 do
    begin
      angle := I*2*pi/RAY_COUNT;
      a := PointF(x, y);
      b := PointF(
          x + RAY_LENGTH * cos(angle),
          y + RAY_LENGTH * sin(angle));
      Canvas.Line(a, b, TAlphaColorRec.Yellow, RAY_THICKNESS);
    end;
  finally
    Canvas.EndScene;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if FSunPosY > END_SUN_POS_Y then
  begin
    FSunPosY := FSunPosY - 10;
    Invalidate;
  end;
end;

end.
