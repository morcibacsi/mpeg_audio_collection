object frmProgressWindow: TfrmProgressWindow
  Left = 732
  Top = 611
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = '_Title'
  ClientHeight = 82
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 16
    Width = 241
    Height = 49
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 16
      Width = 209
      Height = 17
      Smooth = True
      TabOrder = 0
    end
  end
end
