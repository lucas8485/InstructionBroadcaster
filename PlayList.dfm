object frmPlayList: TfrmPlayList
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #25773#25918#21015#34920
  ClientHeight = 467
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lstPlayList: TListView
    Left = 8
    Top = 8
    Width = 401
    Height = 449
    Columns = <
      item
        Caption = ' '
        Width = 0
      end
      item
        Caption = #25991#20214#21517
        Width = 100
      end
      item
        Caption = #25351#20196#20869#23481
        Width = 210
      end
      item
        Caption = #25773#25918#26102#38388
        Width = 90
      end>
    ColumnClick = False
    DoubleBuffered = True
    ReadOnly = True
    ParentDoubleBuffered = False
    TabOrder = 0
    ViewStyle = vsReport
  end
end
