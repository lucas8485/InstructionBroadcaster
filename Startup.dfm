object frmStartup: TfrmStartup
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26222#36890#39640#31561#23398#26657#25307#29983#20840#22269#32479#19968#32771#35797#38899#39057#25351#20196#33258#21160#25773#25918#31995#32479
  ClientHeight = 187
  ClientWidth = 645
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #40657#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 11
  object lblHint: TLabel
    Left = 8
    Top = 8
    Width = 616
    Height = 21
    Alignment = taCenter
    Caption = #27426#36814#20351#29992#26222#36890#39640#31561#23398#26657#25307#29983#20840#22269#32479#19968#32771#35797#38899#39057#25351#20196#33258#21160#25773#25918#31995#32479
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblTime: TLabel
    Left = 144
    Top = 48
    Width = 198
    Height = 21
    Caption = #35745#31639#26426#24403#21069#26102#38388#26159#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblSelectHint: TLabel
    Left = 104
    Top = 104
    Width = 128
    Height = 16
    Caption = #35831#36873#25321#32771#35797#31185#30446#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object cbItemSelect: TComboBox
    Left = 238
    Top = 101
    Width = 297
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Items.Strings = (
      #35821#25991
      #25968#23398
      #25991#31185#32508#21512'/'#29702#31185#32508#21512'/'#19987#19994#32508#21512
      #22806#35821)
  end
  object btnStartSystem: TButton
    Left = 24
    Top = 138
    Width = 175
    Height = 41
    Caption = #21551#21160#31995#32479
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnStartSystemClick
  end
  object btnAbout: TButton
    Left = 238
    Top = 138
    Width = 175
    Height = 41
    Caption = #20851#20110#31995#32479
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAboutClick
  end
  object btnExit: TButton
    Left = 454
    Top = 138
    Width = 175
    Height = 41
    Caption = #36864#20986#31995#32479
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnExitClick
  end
  object tmrUpdate: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrUpdateTimer
    Left = 368
    Top = 48
  end
end
