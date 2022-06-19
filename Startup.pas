unit Startup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmStartup = class(TForm)
    lblHint: TLabel;
    lblTime: TLabel;
    tmrUpdate: TTimer;
    lblSelectHint: TLabel;
    cbItemSelect: TComboBox;
    btnStartSystem: TButton;
    btnAbout: TButton;
    btnExit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrUpdateTimer(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnStartSystemClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  Subject = (Chinese, Math, IntegratedSubject, ForeignLanguage);

var
  frmStartup: TfrmStartup;
  selectedSubject: Subject;

implementation

{$R *.dfm}

uses Broadcast, About;

procedure TfrmStartup.btnAboutClick(Sender: TObject);
begin
  if frmAbout = nil then
  begin
    frmAbout := TfrmAbout.Create(nil);
    frmAbout.Show;
  end;
end;

procedure TfrmStartup.btnExitClick(Sender: TObject);
begin
  frmStartup.Close;
end;

procedure TfrmStartup.btnStartSystemClick(Sender: TObject);
begin
  case cbItemSelect.ItemIndex of
    0:selectedSubject := Chinese;
    1:selectedSubject := Math;
    2:selectedSubject := IntegratedSubject;
    3:selectedSubject := ForeignLanguage;
    else begin
      MessageDlg('请选择科目！', mtError, [mbOk], 0);
      Exit;
    end;
  end;
  frmBroadcast := TfrmBroadcast.Create(nil);
  frmStartup.Hide;
  frmBroadcast.Show;
end;

procedure TfrmStartup.FormCreate(Sender: TObject);
begin
  tmrUpdate.Enabled := true;
end;

procedure TfrmStartup.FormDestroy(Sender: TObject);
begin
  tmrUpdate.Enabled := false;
end;

procedure TfrmStartup.tmrUpdateTimer(Sender: TObject);
begin
  lblTime.Caption := '计算机当前时间是：' + datetimetostr(now);
  lblTime.Left := round(frmStartup.Width / 2 - lblTime.Width / 2);
end;

end.
