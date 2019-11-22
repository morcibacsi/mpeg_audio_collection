object frmReplTag: TfrmReplTag
  Left = 521
  Top = 268
  BorderStyle = bsDialog
  Caption = '_Exceptions'
  ClientHeight = 255
  ClientWidth = 211
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    211
    255)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 193
    Height = 201
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object bOK: TButton
    Left = 110
    Top = 222
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '_OK'
    TabOrder = 1
    OnClick = bOKClick
  end
  object bCancel: TButton
    Left = 18
    Top = 222
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '_Cancel'
    TabOrder = 2
    OnClick = bCancelClick
  end
end
