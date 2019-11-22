object frmPreview: TfrmPreview
  Left = 347
  Top = 236
  Width = 569
  Height = 303
  Anchors = [akLeft, akRight, akBottom]
  Caption = '_Tag preview'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 340
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    561
    276)
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 8
    Top = 12
    Width = 545
    Height = 213
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = '_Files'
        Width = 300
      end
      item
        Caption = '_Title'
        Width = 100
      end
      item
        Caption = '_Artist'
        Width = 100
      end
      item
        Caption = '_Album'
        Width = 100
      end
      item
        Caption = '_Track'
        Width = 70
      end
      item
        Caption = '_Year'
        Width = 70
      end
      item
        Caption = '_Comment'
        Width = 100
      end
      item
        Caption = '_Genre'
        Width = 100
      end
      item
        Caption = '_Tag version'
        Width = 80
      end>
    HideSelection = False
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object bCancel: TButton
    Left = 472
    Top = 240
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '_Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object bOK: TButton
    Left = 384
    Top = 240
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '_OK'
    ModalResult = 1
    TabOrder = 2
  end
end
