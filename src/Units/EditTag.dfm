object FormEditTag: TFormEditTag
  Left = 384
  Top = 132
  BorderStyle = bsDialog
  Caption = 'MPEG file info box + ID3 tag editor'
  ClientHeight = 455
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object imSwap: TImage
    Left = 308
    Top = 88
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
  object gbID1: TGroupBox
    Left = 8
    Top = 32
    Width = 289
    Height = 161
    Caption = 'ID3v1'
    TabOrder = 0
    object lbGenre1: TLabel
      Left = 117
      Top = 115
      Width = 29
      Height = 13
      Alignment = taCenter
      Caption = 'Genre'
    end
    object lbLyrics3Tag: TLabel
      Left = 104
      Top = 16
      Width = 67
      Height = 13
      Caption = 'Lyrics3Tag!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbArL: TLabel
      Left = 270
      Top = 43
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object lbTiL: TLabel
      Left = 270
      Top = 68
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object lbAlL: TLabel
      Left = 270
      Top = 93
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object cbID3v1: TCheckBox
      Left = 16
      Top = 16
      Width = 73
      Height = 17
      Caption = 'ID3v&1 Tag'
      TabOrder = 0
      OnClick = cbID3v1Click
      OnKeyDown = FormKeyDown
    end
    object leTrack1: TLabeledEdit
      Left = 232
      Top = 16
      Width = 33
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = 'Track #'
      LabelPosition = lpLeft
      TabOrder = 1
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leArtist1: TLabeledEdit
      Left = 64
      Top = 40
      Width = 201
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'Artist'
      LabelPosition = lpLeft
      TabOrder = 2
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leTitle1: TLabeledEdit
      Left = 64
      Top = 64
      Width = 201
      Height = 21
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'Title'
      LabelPosition = lpLeft
      TabOrder = 3
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leAlbum1: TLabeledEdit
      Left = 64
      Top = 88
      Width = 201
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Album'
      LabelPosition = lpLeft
      TabOrder = 4
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leYear1: TLabeledEdit
      Left = 64
      Top = 112
      Width = 49
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Year'
      LabelPosition = lpLeft
      MaxLength = 4
      TabOrder = 5
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leComment1: TLabeledEdit
      Left = 64
      Top = 136
      Width = 201
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Comment'
      LabelPosition = lpLeft
      MaxLength = 30
      TabOrder = 7
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object cbGenre1: TComboBox
      Left = 156
      Top = 112
      Width = 109
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
      Items.Strings = (
        ''
        'Blues'
        'Classic Rock'
        'Country'
        'Dance'
        'Disco'
        'Funk'
        'Grunge'
        'Hip-Hop'
        'Jazz'
        'Metal'
        'New Age'
        'Oldies'
        'Other'
        'Pop'
        'R&B'
        'Rap'
        'Reggae'
        'Rock'
        'Techno'
        'Industrial'
        'Alternative'
        'Ska'
        'Death Metal'
        'Pranks'
        'Soundtrack'
        'Euro-Techno'
        'Ambient'
        'Trip-Hop'
        'Vocal'
        'Jazz+Funk'
        'Fusion'
        'Trance'
        'Classical'
        'Instrumental'
        'Acid'
        'House'
        'Game'
        'Sound Clip'
        'Gospel'
        'Noise'
        'Alternrock'
        'Bass'
        'Soul'
        'Punk'
        'Space'
        'Meditative'
        'Instrumental Pop'
        'Instrumental Rock'
        'Ethnic'
        'Gothic'
        'Darkwave'
        'Techno-Industrial'
        'Electronic'
        'Pop-Folk'
        'Eurodance'
        'Dream'
        'Southern Rock'
        'Comedy'
        'Cult'
        'Gangsta'
        'Top 40'
        'Christian Rap'
        'Pop/Funk'
        'Jungle'
        'Native American'
        'Cabaret'
        'New Wave'
        'Psychadelic'
        'Rave'
        'Showtunes'
        'Trailer'
        'Lo-Fi'
        'Tribal'
        'Acid Punk'
        'Acid Jazz'
        'Polka'
        'Retro'
        'Musical'
        'Rock & Roll'
        'Hard Rock'
        'Folk'
        'Folk-Rock'
        'National Folk'
        'Swing'
        'Fast Fusion'
        'Bebob'
        'Latin'
        'Revival'
        'Celtic'
        'Bluegrass'
        'Avantgarde'
        'Gothic Rock'
        'Progessive Rock'
        'Psychedelic Rock'
        'Symphonic Rock'
        'Slow Rock'
        'Big Band'
        'Chorus'
        'Easy Listening'
        'Acoustic'
        'Humour'
        'Speech'
        'Chanson'
        'Opera'
        'Chamber Music'
        'Sonata'
        'Symphony'
        'Booty Bass'
        'Primus'
        'Porn Groove'
        'Satire'
        'Slow Jam'
        'Club'
        'Tango'
        'Samba'
        'Folklore'
        'Ballad'
        'Power Ballad'
        'Rhythmic Soul'
        'Freestyle'
        'Duet'
        'Punk Rock'
        'Drum Solo'
        'A Capella'
        'Euro-House'
        'Dance Hall'
        'Goa'
        'Drum & Bass'
        'Club-House'
        'Hardcore'
        'Terror'
        'Indie'
        'Britpop'
        'Negerpunk'
        'Polsk Punk'
        'Beat'
        'Christian Gangsta Rap'
        'Heavy Metal'
        'Black Metal'
        'Crossover'
        'Contemporary Christian'
        'Christian Rock'
        'Merengue'
        'Salsa'
        'Trash Metal'
        'Anime'
        'Jpop'
        'Synthpop')
    end
  end
  object gbID2: TGroupBox
    Left = 336
    Top = 32
    Width = 289
    Height = 345
    Caption = 'ID3v2'
    TabOrder = 1
    object lbGenre2: TLabel
      Left = 117
      Top = 115
      Width = 29
      Height = 13
      Alignment = taCenter
      Caption = 'Genre'
    end
    object btCopyTo: TButton
      Left = 64
      Top = 312
      Width = 97
      Height = 25
      Hint = 'Alt + <--'
      Caption = 'Copy &to ID3v1'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btCopyToClick
      OnKeyDown = FormKeyDown
    end
    object btCopyFrom: TButton
      Left = 184
      Top = 312
      Width = 97
      Height = 25
      Hint = 'Alt + -->'
      Caption = 'Copy &from ID3v1'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btCopyFromClick
      OnKeyDown = FormKeyDown
    end
    object cbID3v2: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'ID3v&2 Tag'
      TabOrder = 2
      OnClick = cbID3v2Click
      OnKeyDown = FormKeyDown
    end
    object leTrack2: TLabeledEdit
      Left = 224
      Top = 16
      Width = 57
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = 'Track #'
      LabelPosition = lpLeft
      TabOrder = 3
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leArtist2: TLabeledEdit
      Left = 64
      Top = 40
      Width = 217
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'Artist'
      LabelPosition = lpLeft
      TabOrder = 4
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leTitle2: TLabeledEdit
      Left = 64
      Top = 64
      Width = 217
      Height = 21
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'Title'
      LabelPosition = lpLeft
      TabOrder = 5
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leAlbum2: TLabeledEdit
      Left = 64
      Top = 88
      Width = 217
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Album'
      LabelPosition = lpLeft
      TabOrder = 6
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leYear2: TLabeledEdit
      Left = 64
      Top = 112
      Width = 49
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Year'
      LabelPosition = lpLeft
      TabOrder = 7
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object cbGenre2: TComboBox
      Left = 156
      Top = 112
      Width = 125
      Height = 21
      ItemHeight = 13
      TabOrder = 8
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leComment2: TLabeledEdit
      Left = 64
      Top = 136
      Width = 217
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Comment'
      LabelPosition = lpLeft
      TabOrder = 9
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leComposer: TLabeledEdit
      Left = 64
      Top = 192
      Width = 217
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'Composer'
      LabelPosition = lpLeft
      TabOrder = 10
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leOrigArtist: TLabeledEdit
      Left = 64
      Top = 216
      Width = 217
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Orig. Artist'
      LabelPosition = lpLeft
      TabOrder = 11
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leCopyright: TLabeledEdit
      Left = 64
      Top = 240
      Width = 217
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Copyright'
      LabelPosition = lpLeft
      TabOrder = 12
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leURL: TLabeledEdit
      Left = 64
      Top = 264
      Width = 217
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'URL'
      LabelPosition = lpLeft
      TabOrder = 13
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
    object leEncodedby: TLabeledEdit
      Left = 64
      Top = 288
      Width = 217
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'Encoded by'
      LabelPosition = lpLeft
      TabOrder = 14
      OnChange = leArtist1Change
      OnKeyDown = FormKeyDown
    end
  end
  object gbInfo: TGroupBox
    Left = 8
    Top = 200
    Width = 289
    Height = 177
    Caption = 'MPEG info'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Size:'
    end
    object Label2: TLabel
      Left = 8
      Top = 28
      Width = 36
      Height = 13
      Caption = 'Length:'
    end
    object Label3: TLabel
      Left = 8
      Top = 41
      Width = 38
      Height = 13
      Caption = 'BitRate:'
    end
    object Label4: TLabel
      Left = 8
      Top = 53
      Width = 61
      Height = 13
      Caption = 'SampleRate:'
    end
    object Label5: TLabel
      Left = 8
      Top = 66
      Width = 25
      Height = 13
      Caption = 'CRC:'
    end
    object Label6: TLabel
      Left = 8
      Top = 78
      Width = 47
      Height = 13
      Caption = 'Copyrigth:'
    end
    object Label7: TLabel
      Left = 8
      Top = 91
      Width = 38
      Height = 13
      Caption = 'Original:'
    end
    object Label8: TLabel
      Left = 8
      Top = 104
      Width = 48
      Height = 13
      Caption = 'Emphasis:'
    end
  end
  object btUpdate: TButton
    Left = 16
    Top = 416
    Width = 75
    Height = 25
    Caption = '&Update'
    TabOrder = 3
    OnClick = btUpdateClick
    OnKeyDown = FormKeyDown
  end
  object btCancel: TButton
    Left = 112
    Top = 416
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 4
    OnClick = btCancelClick
    OnKeyDown = FormKeyDown
  end
  object btUndo: TButton
    Left = 208
    Top = 416
    Width = 89
    Height = 25
    Caption = 'Undo changes'
    TabOrder = 5
    OnClick = btUndoClick
    OnKeyDown = FormKeyDown
  end
  object edPath: TEdit
    Left = 8
    Top = 8
    Width = 617
    Height = 21
    Color = clActiveBorder
    ReadOnly = True
    TabOrder = 6
    OnKeyDown = FormKeyDown
  end
  object cboxCapitalization: TComboBox
    Left = 152
    Top = 392
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 7
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
  object cbCapitalization: TCheckBox
    Left = 16
    Top = 392
    Width = 113
    Height = 17
    Caption = '&Set capitalization:'
    TabOrder = 8
    OnClick = cbCapitalizationClick
    OnKeyDown = FormKeyDown
  end
  object leReplaceThis: TLabeledEdit
    Left = 336
    Top = 392
    Width = 113
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = '&Replace'
    TabOrder = 9
  end
  object leReplaceForThis: TLabeledEdit
    Left = 496
    Top = 392
    Width = 121
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 24
    EditLabel.Caption = '-->'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -19
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    LabelSpacing = 9
    TabOrder = 10
  end
  object btReplace: TButton
    Left = 436
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Replace'
    TabOrder = 11
    OnClick = btReplaceClick
    OnKeyDown = FormKeyDown
  end
  object pkID31: TpkID3
    ID3v1.Lyrics3.UseLyrics3v2 = False
    ID3v1.Lyrics3.UseTimestamp = False
    ID3v1.GenreID = 0
    ID3v1.Genre = 'Blues'
    ID3v1.TrackNo = 0
    ID3v1.UseID3v11 = True
    UseID3v1 = True
    Left = 192
    Top = 272
  end
end
