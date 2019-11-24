object frmFreedb: TfrmFreedb
  Left = 193
  Top = 148
  Width = 640
  Height = 528
  HorzScrollBar.Tracking = True
  VertScrollBar.Smooth = True
  VertScrollBar.Tracking = True
  Caption = '_Freedb'
  Color = clBtnFace
  Constraints.MinHeight = 528
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    632
    501)
  PixelsPerInch = 96
  TextHeight = 13
  object gbSource: TGroupBox
    Left = 8
    Top = 5
    Width = 353
    Height = 175
    Caption = '_1) Search-source'
    TabOrder = 0
    DesignSize = (
      353
      175)
    object gbSearchIn: TGroupBox
      Left = 120
      Top = 120
      Width = 217
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = '_Search in'
      TabOrder = 0
      object cbTrack: TCheckBox
        Left = 110
        Top = 16
        Width = 55
        Height = 17
        Caption = '_Track'
        TabOrder = 0
      end
      object cbRest: TCheckBox
        Left = 165
        Top = 16
        Width = 47
        Height = 17
        Caption = '_Rest'
        TabOrder = 1
      end
      object cbArtist: TCheckBox
        Left = 8
        Top = 16
        Width = 55
        Height = 17
        Caption = '_Artist'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbTitle: TCheckBox
        Left = 62
        Top = 16
        Width = 45
        Height = 17
        Caption = '_Title'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
    object eSearch: TEdit
      Left = 120
      Top = 96
      Width = 217
      Height = 21
      Hint = 'Enter keywords for search'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object rbSearch: TRadioButton
      Left = 8
      Top = 96
      Width = 110
      Height = 17
      Caption = '_Web-search:'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = rbSearchClick
    end
    object rbManually: TRadioButton
      Left = 8
      Top = 72
      Width = 110
      Height = 17
      Hint = 'Use only if you have the exact ID'
      Caption = '_Enter ID manually:'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = rbManuallyClick
    end
    object eID: TEdit
      Left = 120
      Top = 72
      Width = 121
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 4
    end
    object cbGenre: TComboBox
      Left = 248
      Top = 72
      Width = 89
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Enabled = False
      ItemHeight = 13
      ItemIndex = 6
      TabOrder = 5
      Text = 'misc'
      Items.Strings = (
        'blues'
        'classical'
        'country'
        'data'
        'folk'
        'jazz'
        'misc'
        'newage'
        'reggae'
        'rock'
        'soundtrack')
    end
    object rbCalculate: TRadioButton
      Left = 8
      Top = 48
      Width = 330
      Height = 17
      Caption = '_Calculate from files (all tracks in correct order needed)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      OnClick = rbCalculateClick
    end
    object rbFromCD: TRadioButton
      Left = 8
      Top = 24
      Width = 110
      Height = 17
      Caption = '_Calculate from CD:'
      TabOrder = 7
      OnClick = rbFromCDClick
    end
    object cbDrives: TComboBox
      Left = 120
      Top = 22
      Width = 217
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ItemHeight = 13
      TabOrder = 8
    end
  end
  object gbAlbum: TGroupBox
    Left = 368
    Top = 5
    Width = 255
    Height = 175
    Anchors = [akLeft, akTop, akRight]
    Caption = '_2) Album-selection'
    TabOrder = 1
    DesignSize = (
      255
      175)
    object ListView1: TListView
      Left = 10
      Top = 20
      Width = 235
      Height = 142
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = '_Genre'
          Width = 55
        end
        item
          Caption = '_Album'
          Width = 100
        end
        item
          Caption = '_ID'
          Width = 65
        end>
      DragMode = dmAutomatic
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ListView1DblClick
    end
  end
  object gbSetInfo: TGroupBox
    Left = 8
    Top = 213
    Width = 615
    Height = 246
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '_3) Set information'
    TabOrder = 2
    DesignSize = (
      615
      246)
    object cbVarious: TCheckBox
      Left = 280
      Top = 7
      Width = 133
      Height = 21
      Caption = '_Various Artists'
      TabOrder = 0
      OnClick = cbVariousClick
    end
    object cbEdit: TComboBox
      Left = 280
      Top = 220
      Width = 177
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
    end
    object bSetValue: TButton
      Left = 468
      Top = 220
      Width = 133
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = '_Set value'
      TabOrder = 2
      OnClick = bSetValueClick
    end
    object StringGrid1: TStringGrid
      Left = 280
      Top = 28
      Width = 325
      Height = 169
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColCount = 7
      DefaultColWidth = 100
      DefaultRowHeight = 15
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goDrawFocusSelected, goColSizing, goRowMoving, goRowSelect, goThumbTracking]
      TabOrder = 3
      OnDblClick = StringGrid1DblClick
      OnSelectCell = StringGrid1SelectCell
      ColWidths = (
        35
        120
        120
        100
        100
        100
        100)
    end
    object cbEditmode: TCheckBox
      Left = 280
      Top = 200
      Width = 169
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = '_Edit-mode:'
      TabOrder = 4
      OnClick = cbEditmodeClick
    end
    object StringGrid2: TStringGrid
      Left = 16
      Top = 28
      Width = 257
      Height = 169
      Anchors = [akLeft, akTop, akBottom]
      ColCount = 1
      DefaultColWidth = 100
      DefaultRowHeight = 15
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goRowMoving, goRowSelect, goThumbTracking]
      TabOrder = 5
      OnRowMoved = StringGrid2RowMoved
      ColWidths = (
        290)
    end
    object bMoveUp: TButton
      Left = 56
      Top = 208
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '_Move up'
      TabOrder = 6
      OnClick = bMoveUpClick
    end
    object bMoveDown: TButton
      Left = 144
      Top = 208
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '_Move down'
      TabOrder = 7
      OnClick = bMoveDownClick
    end
  end
  object bSearch: TButton
    Left = 280
    Top = 184
    Width = 81
    Height = 25
    Caption = '_Search'
    TabOrder = 3
    OnClick = bSearchClick
  end
  object bSelect: TButton
    Left = 542
    Top = 184
    Width = 81
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '_Select'
    TabOrder = 4
    OnClick = bSelectClick
  end
  object bOK: TButton
    Left = 450
    Top = 467
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '_OK'
    ModalResult = 1
    TabOrder = 5
  end
  object bCancel: TButton
    Left = 542
    Top = 467
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '_Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 8
    Top = 184
  end
  object TCP: TIdTCPClient
    ReadTimeout = 0
    Port = 0
    Left = 40
    Top = 184
  end
  object ImageList1: TImageList
    Left = 72
    Top = 184
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF212100F7000000DE000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF4A4A00FF212100F7000000DE0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F700000000000000BD0000009C0000007B00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF21210000000000DE000000BD0000009C00
      00007B0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF212100F7000000DE0000000000
      0000000000000000000000000000FF4A4A000000000000000000000000000000
      00009C0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF4A4A00FF212100F7000000DE00
      0000000000000000000000000000FF6B6B00FF4A4A0000000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECECE0084848400000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F700
      000000000000BD0000009C000000FF949400FF6B6B00FF4A4A00FF2121000000
      0000DE0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF21
      210000000000DE000000BD0000009C000000FF949400FF6B6B00FF4A4A00FF21
      2100F70000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF4A
      4A00000000000000000000000000000000009C00000000000000FF6B6B00FF4A
      4A00FF2121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF6B
      6B00FF4A4A00000000000000000000000000BD00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF94
      9400FF6B6B00FF4A4A00FF21210000000000DE00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF949400FF6B6B00FF4A4A00FF212100F700000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF6B6B00FF4A4A00FF21210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000F1FFFFFFFFFF0000
      F0FFFFFFFFFF0000FE8FFFFFFFFF0000FE87FF00FFFF00001EF7FF3CFFE70000
      0E77FF3DFFC30000E817FF99FFDB0000E807FFDBFF990000EF47FFC3FFBD0000
      E77FFFE7FF3C0000E17FFFFFFF000000F07FFFFFFFFF0000FC7FFFFFFFFF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
