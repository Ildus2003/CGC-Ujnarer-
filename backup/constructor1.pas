unit Constructor1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  ExtCtrls, Buttons, ComCtrls, StdCtrls,FormStorage;

type

  { TForm_Main }

  TForm_Main = class(TForm)
    CoolBar1: TCoolBar;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem_AddObject: TMenuItem;
    MenuItem_Convert: TMenuItem;
    MenuItem_About: TMenuItem;
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
    procedure FormCreate(Sender: TObject);
    procedure MenuItem_AddObjectClick(Sender: TObject);
    procedure TabControl_MainChange(Sender: TObject);
  private

  public

  end;

var
  Form_Main: TForm_Main;

implementation

{$R *.lfm}

{ TForm_Main }

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  Left:=0;
  Top:=0;
  Width:=1360;
  Height:=90;
end;

procedure TForm_Main.Button1Click(Sender: TObject);
begin

end;

procedure TForm_Main.MenuItem_AddObjectClick(Sender: TObject);
begin

end;

procedure TForm_Main.TabControl_MainChange(Sender: TObject);
begin

end;

end.

