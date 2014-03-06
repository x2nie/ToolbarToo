unit ToolbarToo;

{$IFDEF FPC}
{$mode Delphi}
{$ENDIF}

interface

uses
  SysUtils, Classes,
{$IFDEF FPC}
  LCLType,LCLIntf, lMessages, LCLProc, Types, RTLConsts,
{$ELSE}
  //Windows,
{$ENDIF}
  Messages, Controls, Forms, Graphics,
  GR32, GR32_Image;


type
  TToolbarToo = class(TCustomPaintBox32)
  private
    { Private declarations }
  protected
    procedure DoPaintBuffer; override;
    function CalcClientRect : TRect; virtual;
    function GetClientRect: TRect; override;
  public
    property Canvas;
  published
    property Align;
    property Anchors;
    property AutoSize;
    property Constraints;
    property Cursor;
    property DragCursor;
    property DragMode;
    property Options;
    property ParentShowHint;
    property PopupMenu;
    property RepaintMode;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
{$IFNDEF PLATFORM_INDEPENDENT}
    property OnCanResize;
{$ENDIF}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnGDIOverlay;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnResize;
    property OnStartDrag;
  end;

implementation

{ TToolbarToo }

function TToolbarToo.CalcClientRect: TRect;
begin
  Result := Rect(0,0, Width-1, Height-1);
  InflateRect(result, -4, -4);
  inc(Result.Left, 10);
end;

procedure TToolbarToo.DoPaintBuffer;
begin
  buffer.Clear(Color32(self.Color));
  buffer.FrameRectS(self.ClientRect, clRed32);
  BufferValid := True;
end;

function TToolbarToo.GetClientRect: TRect;
begin
  result := CalcClientRect;
end;

end.
