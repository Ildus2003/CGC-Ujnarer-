unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  ExtCtrls, Buttons, ComCtrls, StdCtrls, CastleControl, CastleDialogs,
  Castle2DSceneManager, CastleScene, CastleColors, CastleVectors,
  CastleFilesUtils, X3DNodes, CastleTransform, CastleGLImages, ObjectInspector;

type

  { TForm_Main }

  TForm_Main = class(TForm)
    OpenDialog1: TCastleOpenDialog;
    CoolBar1: TCoolBar;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem_InspektorObjects: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem_FormEitor: TMenuItem;
    MenuItem_CodEditor: TMenuItem;
    MenuItem_AddObject: TMenuItem;
    MenuItem_Convert: TMenuItem;
    MenuItem_About: TMenuItem;
    MenuItem_English: TMenuItem;
    MenuItem_Language: TMenuItem;
    MenuItem_Russia: TMenuItem;
    MenuItem_Site: TMenuItem;
    MenuItem_Parameter_Compilation: TMenuItem;
    MenuItem_Compilation1: TMenuItem;
    MenuItem_Create: TMenuItem;
    MenuItem_Switch: TMenuItem;
    MenuItem_Exit: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem_SaveAs: TMenuItem;
    MenuItem_Save: TMenuItem;
    MenuItem_Open: TMenuItem;
    MenuItem_help: TMenuItem;
    MenuItem_Window: TMenuItem;
    MenuItem_Service: TMenuItem;
    MenuItem_Package: TMenuItem;
    MenuItem_compilation: TMenuItem;
    MenuItem_Project: TMenuItem;
    MenuItem_View: TMenuItem;
    MenuItem_File: TMenuItem;
    PageControl_Main: TPageControl;
    Splitter1: TSplitter;
    TabSheet1_Main: TTabSheet;
    ToolBar_Main: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton_Save: TToolButton;
  {  FrmS:TFormStorage;  }
    ToolButton_AddObject: TToolButton;
    procedure Button1Click(Sender: TObject);
    procedure CoolBar1Click(Sender: TObject);
    procedure CoolBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure MenuItem_AddObjectClick(Sender: TObject);
    procedure MenuItem_CodEditorClick(Sender: TObject);
    procedure MenuItem_FormEitorClick(Sender: TObject);
    procedure MenuItem_InspektorObjectsClick(Sender: TObject);
    procedure MenuItem_SwitchClick(Sender: TObject);
    procedure TabControl_MainChange(Sender: TObject);
  private


  public
    procedure ClickAndTranslate(Sender:TObject;Shift:TShiftState);
    function BuildRootNode ( const ImageUrl :  String ) : TX3DRootNode ;
  end;

var
  Form_Main: TForm_Main;
     ActionCodEditor:Boolean;
     ObjectsCount:integer=1;
     ObjectsCount_NoName:integer=1;
implementation
uses
  FormEditor,CodEditor,inspektorobjects;
{$R *.lfm}

{ TForm_Main }

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  Left:=0;
  Top:=0;
  Width:=1360;
  Height:=90;
  ActionCodEditor:=True;
end;

procedure TForm_Main.FormHide(Sender: TObject);
begin
Application.MainForm.Hide;
end;

procedure TForm_Main.Button1Click(Sender: TObject);
begin

end;

procedure TForm_Main.CoolBar1Click(Sender: TObject);
begin

end;

procedure TForm_Main.CoolBar1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Shift=[ssShift] then MessageDlg('ggg','gggggg',mtInformation,[mbOk, mbCancel, mbYes],0);
end;

procedure TForm_Main.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
     i:integer;
begin

 {Halt; }
end;

procedure TForm_Main.MenuItem_AddObjectClick(Sender: TObject);
var
  a:TGlImage;
  b:integer;
  str:String;
begin
 SetLength(Object_,Length(Object_)+1);

  if OpenDialog1.Execute then
    begin
     str:=OpenDialog1.FileName;
 b:=OpenDialog1.FilterIndex;
    end;
   if b<>0 then
  begin
   Form_FormEditor.Show;
  Object_[Length(Object_)]:=T2DScene.Create(Form_FormEditor);
   if b=1 then
  begin

     a:=TGLImage.Create(OpenDialog1.FileName);
    if  a.Height>Form_FormEditor.CastleControl_Form.Height then
    Form_FormEditor.CastleControl_Form.Height:=a.Height;
       if  a.Width>Form_FormEditor.CastleControl_Form.Width then
    Form_FormEditor.CastleControl_Form.Width:=a.Width;
  Object_[Length(Object_)].Load(BuildRootNode(OpenDialog1.FileName),True) end else Object_[Length(Object_)].Load(OpenDialog1.FileName);
  Object_[Length(Object_)].Spatial:=[ssRendering];
   Object_[Length(Object_)].ProcessEvents:=True;
   Form_FormEditor.CastleControl_Form.SceneManager.Items.Add(Object_[Length(Object_)]);
   Object_[Length(Object_)].Move(Vector3(a.Width/2,a.Height/2,0),false);
   FreeAndNil(TGLImage(a));
   if ObjectsCount=1 then begin
   Form_ObjectInspektor.TreeView_InspektorObjects.Items.AddChild(Form_ObjectInspektor.TreeView_InspektorObjects.TopItem,'Объект'+IntToStr(ObjectsCount_NoName));
      Form_ObjectInspektor.TreeView_InspektorObjects.BottomItem.Expand(True);
   end
   else Form_ObjectInspektor.TreeView_InspektorObjects.Items.Add(Form_ObjectInspektor.TreeView_InspektorObjects.BottomItem,'Объект'+IntToStr(ObjectsCount_NoName));
   ObjectsCount:=ObjectsCount+1;
   ObjectsCount_NoName:=ObjectsCount_NoName+1;
  end else   SetLength(Object_,Length(Object_)-1);
end;

procedure TForm_Main.MenuItem_CodEditorClick(Sender: TObject);
begin
    Form_CodEditor.Show;
end;

procedure TForm_Main.MenuItem_FormEitorClick(Sender: TObject);
begin
    Form_FormEditor.Show;
end;

procedure TForm_Main.MenuItem_InspektorObjectsClick(Sender: TObject);
begin
  Form_ObjectInspektor.Show;
end;

procedure TForm_Main.MenuItem_SwitchClick(Sender: TObject);
begin
  if ActionCodEditor=False then begin
    Form_CodEditor.Show;
    ActionCodEditor:=True;
    end else  begin
    Form_FormEditor.Show;
    ActionCodEditor:=False;
    end;
end;

procedure TForm_Main.TabControl_MainChange(Sender: TObject);
begin

end;

procedure TForm_Main.ClickAndTranslate(Sender: TObject; Shift: TShiftState);
begin

end;

function TForm_Main.BuildRootNode(const ImageUrl: String): TX3DRootNode;
  var
  Shape: TShapeNode;
  Geometry: TIndexedFaceSetNode;
  Coordinate: TCoordinateNode;
  TextureCoordinate: TTextureCoordinateNode;
  Texture: TImageTextureNode;
  Width_, Height_: Integer;
begin
  { Create ImageTexture node (represents the texture from file) }
  Texture := TImageTextureNode.Create;
  Texture.SetUrl([ImageUrl]);
  if Texture.TextureImage = nil then
    raise Exception.CreateFmt('Image "%s" could not be loaded', [ImageUrl]);

  { Read the texture size (it is necessary to determine geometry size) }
  Width_  := Texture.TextureImage.Width;
  Height_ := Texture.TextureImage.Height;

  { Create Coordinate node (position of quad in 3D) }
  Coordinate := TCoordinateNode.Create;
  Coordinate.SetPoint([
    Vector3(-Width_ / 2, -Height_ / 2, 0),
    Vector3( Width_ / 2, -Height_ / 2, 0),
    Vector3( Width_ / 2,  Height_ / 2, 0),
    Vector3(-Width_ / 2,  Height_ / 2, 0)
  ]);

  { Create TextureCoordinate node (how the image is mapped onto a surface) }
  TextureCoordinate := TTextureCoordinateNode.Create;
  TextureCoordinate.SetPoint([
    Vector2(0, 0),
    Vector2(1, 0),
    Vector2(1, 1),
    Vector2(0, 1)
  ]);

  { Create Shape and IndexedFaceSet node (mesh with coordinates, texture coordinates) }
  Geometry := TIndexedFaceSetNode.CreateWithShape(Shape);
  Geometry.Coord := Coordinate;
  Geometry.TexCoord := TextureCoordinate;
  Geometry.Solid := false; // to see it from any side
  Geometry.SetCoordIndex([0, 1, 2, 3]);

  { Create Appearance (refers to a texture, connects the Texture to Shape) }
  Shape.Appearance := TAppearanceNode.Create;
  Shape.Appearance.Texture := Texture;

  Result := TX3DRootNode.Create;
  Result.AddChildren(Shape);
end;


end.

