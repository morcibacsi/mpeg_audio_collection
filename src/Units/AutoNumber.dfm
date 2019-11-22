object frmAutoNumber: TfrmAutoNumber
  Left = 473
  Top = 376
  BorderStyle = bsDialog
  Caption = '_Numeration'
  ClientHeight = 135
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lStartNumber: TLabel
    Left = 8
    Top = 8
    Width = 113
    Height = 22
    AutoSize = False
    Caption = '_Start with number:'
    Layout = tlCenter
  end
  object lSkip: TLabel
    Left = 8
    Top = 40
    Width = 161
    Height = 22
    AutoSize = False
    Caption = '_Skip numbers (seperate with ; ):'
    Layout = tlCenter
  end
  object spBeginNumber: TSpinEdit
    Left = 208
    Top = 8
    Width = 65
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 1
  end
  object eSkip: TEdit
    Left = 208
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object bOK: TButton
    Left = 161
    Top = 101
    Width = 81
    Height = 25
    Caption = '_OK'
    ModalResult = 1
    TabOrder = 2
  end
  object bCancel: TButton
    Left = 249
    Top = 101
    Width = 81
    Height = 25
    Caption = '_Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object cbTestmode: TCheckBox
    Left = 160
    Top = 80
    Width = 120
    Height = 17
    Caption = '_Preview'
    TabOrder = 4
  end
end
