unit toolsform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, RTTIGrids;

type

  { TForm_ToolsForm }

  TForm_ToolsForm = class(TForm)
    CoolBar_ToolForm: TCoolBar;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    ToolBar_ToolForm: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ToolBar_ToolFormClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private

  public

  end;

var
  Form_ToolsForm: TForm_ToolsForm;
  ToolIndex:integer;

implementation
 uses
   FormEditor;
{$R *.lfm}

{ TForm_ToolsForm }

procedure TForm_ToolsForm.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  ToolForm_Visible:=False;
end;

procedure TForm_ToolsForm.FormShow(Sender: TObject);
begin

end;

procedure TForm_ToolsForm.ToolBar_ToolFormClick(Sender: TObject);
begin

end;

procedure TForm_ToolsForm.ToolButton1Click(Sender: TObject);
begin
  ToolIndex:=1;
  Form_FormEditor.Show;
end;

procedure TForm_ToolsForm.ToolButton2Click(Sender: TObject);
begin
  ToolIndex:=0;
  Form_FormEditor.Show;
end;

procedure TForm_ToolsForm.ToolButton3Click(Sender: TObject);
begin
  ToolIndex:=2;
  Form_FormEditor.Show;
end;

end.

