unit Broadcast;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Xml.Win.msxmldom, System.Generics.Collections,
  Vcl.MPlayer;

type
  TfrmBroadcast = class(TForm)
    gbInstructionDetail: TGroupBox;
    lblTime: TLabel;
    lblNextInstructionHint: TLabel;
    tmrUpdate: TTimer;
    lblEnd: TLabel;
    lblStart: TLabel;
    btnExit: TButton;
    lblSubject: TLabel;
    edNextInstructionTime: TEdit;
    btnDetail: TButton;
    lblTimeHint: TLabel;
    lblEndHint: TLabel;
    lblStartHint: TLabel;
    lblSubjectHint: TLabel;
    xmlInstructions: TXMLDocument;
    mmInstructionDetail: TMemo;
    mpInstructionPlayer: TMediaPlayer;
    procedure tmrUpdateTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure updateInformation;
    procedure btnDetailClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  InstructionDetail = record
    FileNameStr : string;
    FileName : string;
    InstructionDetail : string;
    PlayTimeStr : string;
    PlayTime: TDateTime;
  end;

var
  frmBroadcast: TfrmBroadcast;
  indSubject: IXMLNode;
  lstInstructions: TList<InstructionDetail>;
  playIndex: longint;
  initialized: boolean;
  closing: boolean;

implementation

{$R *.dfm}

uses Startup, PlayList;

procedure TfrmBroadcast.CreateParams(var Params:TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent := GetDesktopWindow;
end;

function SetPlaylistIndex:longint;
var i: longint;
begin
  if now < lstInstructions.First.PlayTime then
  begin
    SetPlayListIndex := playIndex;
    playIndex := -1;
  end
  else
  begin
    if now > lstInstructions.Last.PlayTime then
    begin
      SetPlayListIndex := playIndex;
      playIndex := lstInstructions.Count - 1;
    end
    else
    begin
      for i := 1 to lstInstructions.Count - 1 do
      begin
        if (now > lstInstructions[i-1].PlayTime) and (now < lstInstructions[i].PlayTime) then
        begin
          SetPlayListIndex := playIndex;
          playIndex := i-1;
        end;
      end;
    end;
  end;
end;

procedure ProcessNode(Node: IXMLNode);
var i: longint;
    processingDetail: InstructionDetail;
begin
  lstInstructions := TList<InstructionDetail>.Create;
  for i := 0 to Node.ChildNodes.Count - 1 do
  begin
    processingDetail.FileNameStr := Node.ChildNodes[i].ChildNodes['FileName'].Text;
    processingDetail.FileName := '.\sound\' + processingDetail.FileNameStr;
    processingDetail.InstructionDetail := Node.ChildNodes[i].ChildNodes['InstructionDetail'].Text;
    processingDetail.PlayTimeStr := Node.ChildNodes[i].ChildNodes['PlayTime'].Text;
    processingDetail.PlayTime := VarToDateTime(DateToStr(now) + ' ' + processingDetail.PlayTimeStr);
    lstInstructions.Add(processingDetail);
  end;
  initialized := False;
end;

procedure TfrmBroadcast.updateInformation;
begin
  edNextInstructionTime.Clear;
  mmInstructionDetail.Clear;
  if playIndex = -1 then
  begin
    edNextInstructionTime.Text := '播放时间：' + lstInstructions[0].PlayTimeStr;
    mmInstructionDetail.Lines.Add(lstInstructions[0].InstructionDetail);
  end
  else
  begin
    edNextInstructionTime.Text := '播放时间：' + lstInstructions[playIndex].PlayTimeStr;
    mmInstructionDetail.Lines.Add(lstInstructions[playIndex].InstructionDetail);
  end;
end;

procedure TfrmBroadcast.btnDetailClick(Sender: TObject);
begin
  frmPlayList := TfrmPlayList.Create(nil);
  frmPlayList.Show;
end;

procedure TfrmBroadcast.btnExitClick(Sender: TObject);
begin
  closing := true;
  frmBroadcast.Close;
  if frmPlayList <> nil then
    frmPlayList.Close;
  frmStartup.Show;
end;

procedure TfrmBroadcast.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrUpdate.Enabled := false;
  frmBroadcast.Release;
end;

procedure TfrmBroadcast.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if closing = false then
    CanClose := false;
end;

procedure TfrmBroadcast.FormCreate(Sender: TObject);
begin
  closing := false;
  playIndex := -2;
  xmlInstructions.FileName := 'InstructionList.xml';
  xmlInstructions.Active := true;
  indSubject := xmlInstructions.DocumentElement;
  case selectedSubject of
    Chinese:
    begin
      lblSubject.Caption := '语文';
      indSubject := indSubject.ChildNodes['Chinese'];
    end;
    Math:
    begin
      lblSubject.Caption := '数学';
      indSubject := indSubject.ChildNodes['Math'];
    end;
    IntegratedSubject:
    begin
      lblSubject.Caption := '文科综合/理科综合/专业综合';
      indSubject := indSubject.ChildNodes['IntegratedSubject'];
    end;
    ForeignLanguage:
    begin
      lblSubject.Caption := '外语';
      indSubject := indSubject.ChildNodes['ForeignLanguage'];
    end;
  end;
  tmrUpdate.Enabled := true;
  lblStart.Caption := indSubject.ChildNodes['StartTime'].Text;
  lblEnd.Caption := indSubject.ChildNodes['EndTime'].Text;
  ProcessNode(indSubject.ChildNodes['Instructions']);
end;


procedure TfrmBroadcast.tmrUpdateTimer(Sender: TObject);
begin
  lblTime.Caption := DateTimeToStr(now);

  if initialized = false then
  begin
    initialized := true;
    SetPlayListIndex;
    updateInformation;
    Exit;
  end;
  if playIndex <> SetPlayListIndex then
  begin
    updateInformation;
     if mpInstructionPlayer.FileName <> '' then
      begin
        mpInstructionPlayer.Close;
      end;
      mpInstructionPlayer.FileName := lstInstructions[playIndex].FileName;
      mpInstructionPlayer.Open;
      mpInstructionPlayer.Play;
  end;
end;

end.
