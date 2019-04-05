unit inspektorobjects;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, TreeFilterEdit;

type

  { TForm_ObjectInspektor }

  TForm_ObjectInspektor = class(TForm)
    Label_InspektorObjects1: TLabel;
    Label_InspektorObjects2: TLabel;
    Panel1: TPanel;
    Splitter_InspektorObjects: TSplitter;
    StatusBar_InspektorObjects: TStatusBar;
    TreeFilterEdit_InspektorObjects: TTreeFilterEdit;
    TreeView_InspektorObjects: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure TreeView_InspektorObjectsEdited(Sender: TObject; Node: TTreeNode;
      var S: string);
    procedure TreeView_InspektorObjectsEditing(Sender: TObject;
      Node: TTreeNode; var AllowEdit: Boolean);
    procedure TreeView_InspektorObjectsEditingEnd(Sender: TObject;
      Node: TTreeNode; Cancel: Boolean);
  private

  public

  end;

var
  Form_ObjectInspektor: TForm_ObjectInspektor;
  FirstString:string;

implementation
uses
  Main;
{$R *.lfm}

{ TForm_ObjectInspektor }

procedure TForm_ObjectInspektor.FormCreate(Sender: TObject);
begin
 Width:=260;
 Height:=585;
 Left:=0;
 Top:=136;
end;

procedure TForm_ObjectInspektor.TreeView_InspektorObjectsEdited(
  Sender: TObject; Node: TTreeNode; var S: string);
begin

end;

procedure TForm_ObjectInspektor.TreeView_InspektorObjectsEditing(
  Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
begin
   FirstString:=Node.Text;
end;

procedure TForm_ObjectInspektor.TreeView_InspektorObjectsEditingEnd(
  Sender: TObject; Node: TTreeNode; Cancel: Boolean);
begin
{if (FirstString='Object'+Copy(Node.Text,6,1)) OR (FirstString='Object'+Copy(Node.Text,6,2)) then if Node.Text<>FirstString then ObjectsCount_NoName:=ObjectsCount_NoName-1;}
end;

end.

