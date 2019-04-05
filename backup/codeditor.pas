unit CodEditor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls;

type

  { TForm_CodEditor }

  TForm_CodEditor = class(TForm)
    PageControl_CodEditor: TPageControl;
    StatusBar_CodEditor: TStatusBar;
    ToolBar_CodEditor: TToolBar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl_CodEditorCloseTabClicked(Sender: TObject);
  private

  public

  end;

var
  Form_CodEditor: TForm_CodEditor;

implementation
uses Main,FormEditor,toolsform;
{$R *.lfm}

{ TForm_CodEditor }

procedure TForm_CodEditor.PageControl_CodEditorCloseTabClicked(Sender: TObject);
begin
  if PageControl_CodEditor.PageCount=0 then Form_CodEditor.Close;
end;

procedure TForm_CodEditor.FormCreate(Sender: TObject);
begin
Left:=340;
Top:=106;
Height:=600;
Width:=950;
end;

procedure TForm_CodEditor.FormActivate(Sender: TObject);
begin
  if Form_ToolForm.Visible=True then
 Form_ToolForm.Visible:=False;
end;

end.

