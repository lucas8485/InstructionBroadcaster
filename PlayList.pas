unit PlayList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Broadcast;

type
  TfrmPlayList = class(TForm)
    lstPlayList: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlayList: TfrmPlayList;

implementation

{$R *.dfm}

procedure TfrmPlayList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPlayList.Release;
  frmPlayList := nil;
end;

procedure TfrmPlayList.FormCreate(Sender: TObject);
var i: longint;
    processingItem: TListItem;
begin
  for i := 0 to lstInstructions.Count - 1 do
  begin
    processingItem := TListItem.Create(lstPlayList.Items);
    processingItem.SubItems.Add(lstInstructions[i].FileNameStr);
    processingItem.SubItems.Add(lstInstructions[i].InstructionDetail);
    processingItem.SubItems.Add(lstInstructions[i].PlayTimeStr);
    lstPlayList.Items.AddItem(processingItem);
  end;
end;

end.
