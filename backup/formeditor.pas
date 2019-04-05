unit FormEditor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ComCtrls,
  StdCtrls, EditBtn, Buttons, RTTIGrids, CastleControl, Castle2DSceneManager,
  CastleScene, CastleColors, CastleKeysMouse, CastleControls, CastleVectors;

type

  { TForm_FormEditor }

  TForm_FormEditor = class(TForm)
    CastleControl_Form: TCastle2DControl;
    MenuItem_FormEditor: TMenuItem;
    PopupMenu1: TPopupMenu;
    procedure Button1Click(Sender: TObject);
    procedure CastleControl_FormBeforeRender(Sender: TObject);
    procedure CastleControl_FormMotion(Sender: TObject;
      const Event: TInputMotion);
    procedure CastleControl_FormMouseEnter(Sender: TObject);
    procedure CastleControl_FormUpdate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem_FormEditorClick(Sender: TObject);
  private

  public

  end;

var
  Form_FormEditor: TForm_FormEditor;
  Object_:array of T2DScene;
  ToolForm_Visible:boolean;
  tx,ty:integer;
   Cursor_Rotate:TCursorImage;
implementation
uses
  toolsform,Main,toolform;
{$R *.lfm}

{ TForm_FormEditor }

procedure TForm_FormEditor.FormCreate(Sender: TObject);
begin
  Left:=337;
  Top:=185;
  Width:=330 ;
  Height:=248;
  CastleControl_Form.SceneManager.BackgroundColor:=White;
  ToolForm_Visible:=True;
  {Cursor_Rotate:=TCursorImage.Create;
  try
    Cursor_Rotate.LoadFromFile('images\NewObject_1.cur');
  finally

  end; }
end;

procedure TForm_FormEditor.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Shift=[ssShift] then
  CastleControl_Form.Height:=Height;
  CastleControl_Form.Width:=Width;
end;

procedure TForm_FormEditor.FormResize(Sender: TObject);
begin
  CastleControl_Form.Height:=Height;
  CastleControl_Form.Width:=Width;
end;

procedure TForm_FormEditor.FormShow(Sender: TObject);
begin
 if ToolForm_Visible=True then
Form_ToolsForm.Visible:=True;
   Case ToolIndex of
  0: CastleControl_Form.Cursor:=crDefault;
  1: begin
    Form_FormEditor.Cursor:=crSizeAll;
    CastleControl_Form.Cursor:=crSizeAll;
    end;
  end;
end;

procedure TForm_FormEditor.MenuItem_FormEditorClick(Sender: TObject);
begin
  Form_ToolsForm.Show;
  ToolForm_Visible:=True;
  if (Form_FormEditor.Height<RestoredHeight-50) OR (WindowState<>wsMaximized)then
  begin
  Form_ToolForm.Left:=Left+Width;
    Form_ToolForm.Top:=Top;
    Form_ToolForm.FormStyle:=fsStayOnTop;
    end else begin
    Form_ToolForm.Left:=Width-50;
    Form_ToolForm.Top:=Top-50;
    Form_ToolForm.FormStyle:=fsStayOnTop;
    end;
  end;

procedure TForm_FormEditor.FormCloseQuery(Sender: TObject; var CanClose: boolean
  );
begin

end;

procedure TForm_FormEditor.FormActivate(Sender: TObject);
begin
  if ToolForm_Visible=True then
Form_ToolsForm.Visible:=True;
   Case ToolIndex of
  0: CastleControl_Form.Cursor:=crDefault;
  1: CastleControl_Form.Cursor:=crSize;
  end;
end;

procedure TForm_FormEditor.CastleControl_FormMotion(Sender: TObject;
  const Event: TInputMotion);
var
   i:Integer;
begin
   if ToolForm_Visible=True then
Form_ToolsForm.Visible:=True;
   Case ToolIndex of
  0: CastleControl_Form.Cursor:=crDefault;
  1: begin
    Form_FormEditor.Cursor:=crSizeAll;
    CastleControl_Form.Cursor:=crSizeAll;
    end;
  2:begin
    Form_FormEditor.Cursor:=crSizeNWSE;
    CastleControl_Form.Cursor:=crSizeNWSE;
    end;
  end;
  if Event.Pressed=[mbLeft] then
  begin
  с
  1:begin
    if CastleControl_Form.SceneManager.MouseRayHit<>nil then
    begin
    i:=CastleControl_Form.SceneManager.MouseRayHit.First.Item.Translation.Z.Exp;
   CastleControl_Form.SceneManager.MouseRayHit.First.Item.Translation:=Vector3(Event.Position.X,Event.Position.Y,0);
    CastleControl_Form.SceneManager.MouseRayHit.First.Item.Translation:=Vector3( CastleControl_Form.SceneManager.MouseRayHit.First.Item.TranslationXY,i);
   Form_ToolForm.StatusBar1.Panels.Items[0].Text:=IntToStr(CastleControl_Form.SceneManager.MouseRayHit.First.Item.TranslationXY.X.Exp);
     Form_ToolForm.StatusBar1.Panels.Items[1].Text:=IntToStr(CastleControl_Form.SceneManager.MouseRayHit.First.Item.TranslationXY.Y.Exp);
     end;
    end;
  2: if CastleControl_Form.SceneManager.MouseRayHit<>nil then
    begin
   { CastleControl_Form.SceneManager.MouseRayHit.First.Item.Rotation:=Vector4(CastleControl_Form.SceneManager.MouseRayHit.First.Item.Center,sqrt(sqr(CastleControl_Form.MousePosition.X))+sqr(CastleControl_Form.MousePosition.Y));}
    Form_ToolForm.Visible:=True;
    Tool1Index:=1;
    end;
    end;
  end;
  end;

procedure TForm_FormEditor.CastleControl_FormBeforeRender(Sender: TObject);
begin

end;

procedure TForm_FormEditor.Button1Click(Sender: TObject);
var
  Mouse:TMouse;
begin
  Object_[1].Translation:=Vector3(Mouse.CursorPos.x,Mouse.CursorPos.y,0)*CastleControl_Form.Container.Fps.SecondsPassed;
end;

procedure TForm_FormEditor.CastleControl_FormMouseEnter(Sender: TObject);
begin
   if CastleControl_Form.MousePressed=[mbLeft] then
  begin
  Case ToolIndex of
   2: if CastleControl_Form.SceneManager.MouseRayHit<>nil then
    begin
   { CastleControl_Form.SceneManager.MouseRayHit.First.Item.Rotation:=Vector4(CastleControl_Form.SceneManager.MouseRayHit.First.Item.Center,sqrt(sqr(CastleControl_Form.MousePosition.X))+sqr(CastleControl_Form.MousePosition.Y));}
    Form_ToolForm.Visible:=True;
    Tool1Index:=1;
    end;
   end;
  end;
end;

procedure TForm_FormEditor.CastleControl_FormUpdate(Sender: TObject);
begin
  {if CastleControl_Form.Handle then
begin
  if Container.Pressed[K_Right] then
    Transform.Position := Transform.Position + Vector3(SecondsPassed * 10, 0, 0);
  HandleInput := not ExclusiveEvents;}
end;

end.

