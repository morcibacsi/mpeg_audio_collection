object FormEditOggTag: TFormEditOggTag
  Left = 362
  Top = 173
  BorderStyle = bsDialog
  Caption = 'Ogg Vorbis info'
  ClientHeight = 280
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lePath: TLabeledEdit
    Left = 8
    Top = 21
    Width = 513
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
      OnKeyDown = FormKeyDown
    end
  end
  object gbInfo: TGroupBox
    Left = 352
    Top = 48
    Width = 169
    Height = 193
    Caption = 'File / Stream info'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 8
      Top = 33
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 8
      Top = 50
      Width = 32
      Height = 13
      Caption = 'Label3'
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
    Left = 352
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Update'
    TabOrder = 3
    OnClick = btUpdateClick
    OnKeyDown = FormKeyDown
  end
  object btClose: TButton
    Left = 440
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Close'
    TabOrder = 4
    OnClick = btCloseClick
    OnKeyDown = FormKeyDown
  end
end
