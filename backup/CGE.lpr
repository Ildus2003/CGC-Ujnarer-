program CGE;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Constructor1
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='CGC';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.

