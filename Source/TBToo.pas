unit TBToo;

{
  ToolbarToo : Another toolbar for Delphi and Lazarus/FreePascal
  by x2nie
  Partially derivated from following projects :


  * Toolbar97 Copyright (C) 1998-2004 by Jordan Russell http://www.jrsoftware.org/
  * ExtToolbar Copyright (C) 2009 Matthieu GIROUX From Jordan Russell

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
}

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

  //Centralized. Hence, when we decide to change the root parent, we only change here.
  TCustomControlToo = class(TCustomPaintBox32)
  private
    { Private declarations }
  protected
    //procedure DoPaintBuffer; override;
  public
    property Canvas;
  published
    {property Align;
    property Anchors;
    property AutoSize;
    property Constraints;}
    property Cursor;
    property DragCursor;
    property DragMode;
    property Options;
    property ParentShowHint;
    property PopupMenu;
    //property RepaintMode;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
{$IFNDEF PLATFORM_INDEPENDENT}
    property OnCanResize;
{$ENDIF}
    {property OnClick;
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
    property OnStartDrag;}
  end;

  TDockToo = class(TCustomControlToo)
  private
    function GetAlign: TAlign;
    procedure SetAlign(const Value: TAlign);

  protected
    procedure DoPaintBuffer; override;
  public
    constructor Create(AOwner: TComponent); override;
    //destructor Destroy; override;
  published
    property Align : TAlign read GetAlign write SetAlign;
  end;



implementation

{ TDockToo }



constructor TDockToo.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csAcceptsControls];
  inherited Align := alTop;
end;

procedure TDockToo.DoPaintBuffer;
begin
  buffer.Clear(Color32(self.Color));
  BufferValid := True;
end;

function TDockToo.GetAlign: TAlign;
begin
  result := inherited Align;
end;

procedure TDockToo.SetAlign(const Value: TAlign);
begin
  if (value <> inherited Align) and (Value in [alTop, alBottom, alLeft, alRight]) then
  begin
    inherited Align := Value;
  end;
end;

end.
