object frmRemTags: TfrmRemTags
  Left = 521
  Top = 422
  BorderStyle = bsDialog
  Caption = '_Remove Tags'
  ClientHeight = 146
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    335
    146)
  PixelsPerInch = 96
  TextHeight = 13
  object rbRemAll: TRadioButton
    Left = 16
    Top = 16
    Width = 289
    Height = 17
    Caption = '_Remove all tag-formats'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = rbRemAllClick
  end
  object rbRemSpec: TRadioButton
    Left = 16
    Top = 40
    Width = 289
    Height = 17
    Caption = '_Remove only specified tag-formats:'
    TabOrder = 1
    OnClick = rbRemSpecClick
  end
  object gbTagFormats: TGroupBox
    Left = 32
    Top = 64
    Width = 201
    Height = 73
    Caption = '_Tag-formats'
    TabOrder = 2
    object cbID3v1: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = '_ID3v1'
      Enabled = False
      TabOrder = 0
    end
    object cbID3v2: TCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      Caption = '_ID3v2'
      Enabled = False
      TabOrder = 1
    end
    object cbAPE: TCheckBox
      Left = 8
      Top = 48
      Width = 97
      Height = 17
      Caption = '_APE'
      Enabled = False
      TabOrder = 2
    end
  end
  object bOK: TButton
    Left = 246
    Top = 81
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '_OK'
    ModalResult = 1
    TabOrder = 3
  end
  object bCancel: TButton
    Left = 246
    Top = 113
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '_Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
