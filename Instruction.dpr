program Instruction;

uses
  Vcl.Forms,
  Startup in 'Startup.pas' {frmStartup},
  Broadcast in 'Broadcast.pas' {frmBroadcast},
  PlayList in 'PlayList.pas' {frmPlayList},
  About in 'About.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmStartup, frmStartup);
  Application.Run;
end.
