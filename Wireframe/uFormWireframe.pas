unit uFormWireframe;

interface

uses
  uWireframe,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, System.Math.Vectors;

type
  TForm1 = class(TForm3D)
    procedure Form3DCreate(Sender: TObject);
  private
    FWireframe: TWireframe;
    procedure CreatePyramid;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.CreatePyramid;
begin
  with FWireframe do
  begin
    Points.Add(Point3D(-2, -2, 0));
    Points.Add(Point3D(2, -2, 0));
    Points.Add(Point3D(-2, 2, 0));
    Points.Add(Point3D(2, 2, 0));
    Points.Add(Point3D(0, 0, 6));

    Edges.AddEdge(0, 1);
    Edges.AddEdge(1, 3);
    Edges.AddEdge(3, 2);
    Edges.AddEdge(2, 0);
    Edges.AddEdge(0, 4);
    Edges.AddEdge(1, 4);
    Edges.AddEdge(2, 4);
    Edges.AddEdge(3, 4);
  end;
end;

procedure TForm1.Form3DCreate(Sender: TObject);
begin
  FWireframe := TWireframe.Create(Self);
  FWireframe.Parent := Self;
  FWireframe.RotationAngle.Point := Point3D(75, 10, 15);

  CreatePyramid;
end;

end.
