program CGC;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, castle_components, castle_base, runtimetypeinfocontrols, lazcontrols,
  Main, CodEditor, FormEditor, toolsform, inspektorobjects, toolform
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='CGC';
  Application.Scaled:=True;
  Application.Initialize;
    Application.CreateForm(TForm_Main, Form_Main);
    Form_Main.Show;
      Application.CreateForm(TForm_ToolsForm, Form_ToolsForm);
      Application.CreateForm(TForm_CodEditor, Form_CodEditor);
  Form_CodEditor.Show;
    Application.CreateForm(TForm_FormEditor, Form_FormEditor);
      Form_FormEditor.Show;
  Application.CreateForm(TForm_ObjectInspektor, Form_ObjectInspektor);
  Application.CreateForm(TForm_ToolForm, Form_ToolForm);
  Application.Run;
end.

