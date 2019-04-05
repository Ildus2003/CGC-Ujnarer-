unit toolform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls,CastleVectors;

type

  { TForm_ToolForm }

  TForm_ToolForm = class(TForm)
    StatusBar1: TStatusBar;
    TrackBar1: TTrackBar;
    UpDown1: TUpDown;
    procedure FormActivate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private

  public

  end;

var
  Form_ToolForm: TForm_ToolForm;
  Tool1Index:integer;

implementation
uses FormEditor;

{$R *.lfm}

{ TForm_ToolForm }

procedure TForm_ToolForm.FormActivate(Sender: TObject);
begin
  Case Tool1Index of
  0:Visible:=False;
  1:begin
    TrackBar1.Visible:=True;
    StatusBar1.Visible:=True;
     UpDown1.Visible:=True;
     {TrackBar1.Position:=; }
    end;
  end;
end;

procedure TForm_ToolForm.TrackBar1Change(Sender: TObject);
begin
 Form_FormEditor.CastleControl_Form.SceneManager.MouseRayHit.First.Item.Rotation:=Vector4(Form_FormEditor.CastleControl_Form.SceneManager.MouseRayHit.First.Item.Center,(TrackBar1.Position*0.1))
  {pointer}
end;

end.

