object FormEditOggTag: TFormEditOggTag
  Left = 443
  Top = 460
  BorderStyle = bsDialog
  Caption = 'Ogg Vorbis info'
  ClientHeight = 450
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object imSwap: TImage
    Left = 348
    Top = 80
    Width = 32
    Height = 32
    Cursor = crHandPoint
    Hint = 'Swap Artist - Title (Ctrl+Up)'
    AutoSize = True
    Center = True
    ParentShowHint = False
    Picture.Data = {
      055449636F6E0000010001001010100000000000280100001600000028000000
      10000000200000000100040000000000C0000000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF0000000000000000000FFFFFF99FFFFFF00FFFFF9999FFFFF00FFFF999
      999FFFF00FFF99F99F99FFF00FFF9FF99FF9FFF00FFFFFF99FFFFFF00FFFFFF9
      9FFFFFF00FFFFFF99FFFFFF00FFFFFF99FFFFFF00FFF9FF99FF9FFF00FFF99F9
      9F99FFF00FFFF999999FFFF00FFFFF9999FFFFF00FFFFFF99FFFFFF000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000}
    ShowHint = True
    Stretch = True
    OnClick = imSwapClick
  end
  object lePath: TLabeledEdit
    Left = 8
    Top = 21
    Width = 553
    Height = 21
    Color = clBtnFace
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'File:'
    ReadOnly = True
    TabOrder = 0
    OnKeyDown = FormKeyDown
  end
  object gbStandTags: TGroupBox
    Left = 8
    Top = 48
    Width = 337
    Height = 193
    Caption = 'Tags'
    TabOrder = 1
    object lbGenre: TLabel
      Left = 184
      Top = 98
      Width = 29
      Height = 13
      Caption = 'Genre'
    end
    object lbComment: TLabel
      Left = 32
      Top = 128
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comment'
    end
    object leArtist: TLabeledEdit
      Left = 80
      Top = 18
      Width = 249
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'Artist'
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = leArtistChange
      OnKeyDown = FormKeyDown
    end
    object leTitle: TLabeledEdit
      Left = 80
      Top = 44
      Width = 249
      Height = 21
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'Title'
      LabelPosition = lpLeft
      TabOrder = 1
      OnChange = leArtistChange
      OnKeyDown = FormKeyDown
    end
    object leAlbum: TLabeledEdit
      Left = 80
      Top = 70
      Width = 185
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Album'
      LabelPosition = lpLeft
      TabOrder = 2
      OnChange = leArtistChange
      OnKeyDown = FormKeyDown
    end
    object leTrack: TLabeledEdit
      Left = 304
      Top = 70
      Width = 25
      Height = 21
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'Track:'
      LabelPosition = lpLeft
      TabOrder = 3
      OnChange = leArtistChange
      OnKeyDown = FormKeyDown
    end
    object leDate: TLabeledEdit
      Left = 80
      Top = 94
      Width = 89
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'Date'
      LabelPosition = lpLeft
      TabOrder = 4
      OnChange = leArtistChange
      OnKeyDown = FormKeyDown
    end
    object cbGenre: TComboBox
      Left = 224
      Top = 96
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      OnChange = leArtistChange
      OnKeyDown = FormKeyDown
    end
    object Memo: TMemo
      Left = 80
      Top = 128
      Width = 249
      Height = 49
      TabOrder = 6
      OnChange = leArtistChange
      OnEnter = MemoEnter
      OnKeyDown = FormKeyDown
    end
  end
  object gbInfo: TGroupBox
    Left = 8
    Top = 248
    Width = 337
    Height = 193
    Caption = 'File / Stream info'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 33
      Width = 39
      Height = 13
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 50
      Width = 39
      Height = 13
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 8
      Top = 85
      Width = 32
      Height = 13
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 8
      Top = 102
      Width = 32
      Height = 13
      Caption = 'Label6'
    end
    object Label7: TLabel
      Left = 8
      Top = 120
      Width = 32
      Height = 13
      Caption = 'Label7'
    end
    object Label8: TLabel
      Left = 8
      Top = 137
      Width = 32
      Height = 13
      Caption = 'Label8'
    end
    object Label9: TLabel
      Left = 8
      Top = 154
      Width = 32
      Height = 13
      Caption = 'Label9'
    end
    object Label10: TLabel
      Left = 8
      Top = 172
      Width = 3
      Height = 13
    end
  end
  object btUpdate: TButton
    Left = 368
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Update'
    TabOrder = 3
    OnClick = btUpdateClick
    OnKeyDown = FormKeyDown
  end
  object btCancel: TButton
    Left = 448
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 4
    OnClick = btCancelClick
    OnKeyDown = FormKeyDown
  end
  object gbCapitalization: TGroupBox
    Left = 368
    Top = 160
    Width = 337
    Height = 73
    Caption = 'Set capitalization'
    TabOrder = 5
    object lbWordDelimiters: TLabel
      Left = 8
      Top = 44
      Width = 75
      Height = 13
      Caption = 'Word delimiters:'
    end
    object cbCapitalization: TCheckBox
      Left = 8
      Top = 16
      Width = 137
      Height = 17
      Caption = '&Set capitalization:'
      TabOrder = 0
      OnClick = cbCapitalizationClick
      OnKeyDown = FormKeyDown
    end
    object cboxCapitalization: TComboBox
      Left = 152
      Top = 12
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 1
      Text = 'Large Case'
      OnChange = cboxCapitalizationChange
      OnKeyDown = FormKeyDown
      Items.Strings = (
        'lower case'
        'UPPER CASE'
        'Large Case'
        'Like a sentence'
        'iNVERT CASE'
        'rAnDom cASe'
        'unchanged')
    end
    object edDelimiters: TEdit
      Left = 152
      Top = 40
      Width = 177
      Height = 21
      Hint = '1'#13#10'2'#13#10'3'
      TabOrder = 2
      Text = ' _!+-.,[(&@#='#39
      OnKeyDown = FormKeyDown
    end
  end
  object gbMisc: TGroupBox
    Left = 369
    Top = 48
    Width = 336
    Height = 105
    Caption = 'Miscellaneous'
    TabOrder = 6
    object lbFileNameFormat: TLabel
      Left = 9
      Top = 56
      Width = 74
      Height = 13
      Hint = 
        'Can be used to get the values of the fields from'#13#10'the filename b' +
        'y pressing CTRL+DOWN'#13#10'%a - artist'#13#10'%b - title'#13#10'%c - album'#13#10'%d - ' +
        'date'#13#10'%e - track'#13#10'%f - genre'#13#10'%h - comment'
      Caption = 'Filename format'
      ParentShowHint = False
      ShowHint = True
    end
    object leReplaceThis: TLabeledEdit
      Left = 8
      Top = 28
      Width = 129
      Height = 21
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = '&Replace'
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
    object leReplaceForThis: TLabeledEdit
      Left = 200
      Top = 28
      Width = 129
      Height = 21
      EditLabel.Width = 7
      EditLabel.Height = 24
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      LabelSpacing = 9
      TabOrder = 1
      OnKeyDown = FormKeyDown
    end
    object btReplace: TButton
      Left = 148
      Top = 26
      Width = 33
      Height = 25
      Caption = '-->'
      TabOrder = 2
      OnKeyDown = FormKeyDown
    end
    object edFileFormat: TEdit
      Left = 200
      Top = 52
      Width = 129
      Height = 21
      Hint = 
        'Can be used to get the values of the fields from'#13#10'the filename b' +
        'y pressing CTRL+DOWN'#13#10'%a - artist'#13#10'%b - title'#13#10'%c - album'#13#10'%d - ' +
        'date'#13#10'%e - track'#13#10'%f - genre'#13#10'%h - comment'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '%a - %b'
      OnKeyDown = FormKeyDown
    end
    object cbDeleteIfNotEmpty: TCheckBox
      Left = 8
      Top = 80
      Width = 297
      Height = 17
      Caption = 'Delete fields if they'#39're not empty'
      TabOrder = 4
      OnKeyDown = FormKeyDown
    end
  end
  object btUndo: TButton
    Left = 528
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Undo'
    TabOrder = 7
    OnClick = btUndoClick
    OnKeyDown = FormKeyDown
  end
end
