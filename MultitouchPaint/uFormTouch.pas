unit uFormTouch;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TFormTouch = class(TForm)
    PaintBox1: TPaintBox;
    procedure FormTouch(Sender: TObject; const Touches: TTouches;
      const Action: TTouchAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
  private
    FBitmap: TBitmap;
  public
  end;

var
  FormTouch: TFormTouch;

implementation

uses
  uFmxCanvasHelper;

{$R *.fmx}

procedure TFormTouch.FormCreate(Sender: TObject);
begin
  FBitmap := TBitmap.Create;
  {$IFDEF MSWINDOWS}
  FBitmap.SetSize(ClientWidth, ClientHeight);
  {$ENDIF}
  {$IFDEF ANDROID}
  FBitmap.SetSize(1000, 1000);
  {$ENDIF}
  FBitmap.Clear(TAlphaColors.White);
end;

procedure TFormTouch.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FBitmap);
end;

procedure TFormTouch.FormTouch(Sender: TObject; const Touches: TTouches;
  const Action: TTouchAction);
var I, cnt: Integer;
begin
  FBitmap.Canvas.BeginScene;
  try
    FBitmap.Clear(TAlphaColors.White);
    cnt := Length(Touches);
    if cnt > 1 then
    begin
      for I := 0 to cnt-2 do
        FBitmap.Canvas.DrawLine(Touches[I].Location, Touches[I+1].Location,
            TAlphaColors.Red);
      if cnt > 2  then
        FBitmap.Canvas.DrawLine(Touches[cnt-1].Location, Touches[0].Location,
            TAlphaColors.Red);
    end
  finally
    FBitmap.Canvas.EndScene;
  end;
  PaintBox1.Repaint;
end;

procedure TFormTouch.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
var r: TRectF;
begin
  r := TRectF.Create(0, 0, FBitmap.Width, FBitmap.Height);
  PaintBox1.Canvas.DrawBitmap(FBitmap, r, r, 1, True);
end;

end.
