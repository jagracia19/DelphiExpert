unit uWireframe;

interface

uses
  System.Math.Vectors, // TPoint3D
  System.Generics.Collections, // TList<T>
  FMX.Controls3D, // TControl3D
  System.UITypes, // TAlphacolor
  System.Classes, // TComponent
  FMX.Types3D; // TContext3D

type
  TPoints3D = class(TList<TPoint3d>);

  TEdge = record
    A, B: Integer;
  end;

  TEdges = class(TList<TEdge>)
    procedure AddEdge(pStart, pEnd: Integer);
  end;

  TWireframe = class(TControl3D)
  private
    FDrawColor: TAlphaColor;
    FEdges: TEdges;
    FPoints: TPoints3D;
    FDisplayed: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Render; override;
    property DrawColor: TAlphaColor read FDrawColor write FDrawColor;
    property Edges: TEdges read FEdges write FEdges;
    property Points: TPoints3D read FPoints write FPoints;
    property Displayed: Boolean read FDisplayed write FDisplayed;
  end;

implementation

{ TEdges }

procedure TEdges.AddEdge(pStart, pEnd: Integer);
var edge: TEdge;
begin
  edge.A := pStart;
  edge.B := pEnd;
  Add(edge);
end;

{ TWireframe }

constructor TWireframe.Create(AOwner: TComponent);
begin
  inherited;
  FPoints := TPoints3D.Create;
  FEdges := TEdges.Create;
  FDrawColor := TAlphaColorRec.Red;
  FDisplayed := True;
end;

destructor TWireframe.Destroy;
begin
  FEdges.Free;
  FPoints.Free;
  inherited;
end;

procedure TWireframe.Render;
var edge: TEdge;
begin
  if Displayed then
    for edge in Edges do
      Context.DrawLine(Points[edge.A], Points[edge.B], 1, DrawColor);
end;

end.
