unit uFormCubeInCode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics, 
  FMX.Dialogs;

type
  TFormCubeInCode = class(TForm3D)
    procedure Form3DRender(Sender: TObject; Context: TContext3D);
  private
  public
  end;

var
  FormCubeInCode: TFormCubeInCode;

implementation

uses
  uFmxContextHelper;

{$R *.fmx}

procedure TFormCubeInCode.Form3DRender(Sender: TObject; Context: TContext3D);
begin
  Context.BeginScene;
  try
    Context.DrawCube();

  finally
    Context.EndScene;
  end;
end;

end.
