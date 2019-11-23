object fTags: TfTags
  Left = 365
  Top = 399
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  BorderWidth = 2
  Caption = 'Tags'
  ClientHeight = 177
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pcTags: TPageControl
    Left = 0
    Top = 0
    Width = 333
    Height = 177
    ActivePage = tsID3v1
    Align = alClient
    TabOrder = 0
    object tsID3v1: TTabSheet
      Caption = 'ID3v1'
      object StaticText1: TStaticText
        Left = 0
        Top = 8
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Title'
        TabOrder = 8
      end
      object StaticText2: TStaticText
        Left = 0
        Top = 32
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Artist'
        TabOrder = 9
      end
      object StaticText3: TStaticText
        Left = 0
        Top = 56
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Album'
        TabOrder = 10
      end
      object StaticText4: TStaticText
        Left = 0
        Top = 80
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Year'
        TabOrder = 11
      end
      object StaticText5: TStaticText
        Left = 0
        Top = 104
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Comment'
        TabOrder = 12
      end
      object StaticText6: TStaticText
        Left = 104
        Top = 80
        Width = 41
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Genre'
        TabOrder = 13
      end
      object eTitle: TEdit
        Left = 56
        Top = 4
        Width = 265
        Height = 21
        Hint = 'max. 30 characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = eTitleExit
      end
      object eArtist: TEdit
        Left = 56
        Top = 28
        Width = 265
        Height = 21
        Hint = 'max. 30 characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object eAlbum: TEdit
        Left = 56
        Top = 52
        Width = 265
        Height = 21
        Hint = 'max. 30 characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object eComment: TEdit
        Left = 56
        Top = 100
        Width = 265
        Height = 21
        Hint = 'max. 30/28(v1.1) characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object eYear: TEdit
        Left = 56
        Top = 76
        Width = 41
        Height = 21
        Hint = 'max. 4 characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object cbGenre: TComboBox
        Left = 152
        Top = 76
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnChange = cbGenreChange
      end
      object StaticText7: TStaticText
        Left = 224
        Top = 128
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Track-No'
        TabOrder = 14
      end
      object eTrackNo: TEdit
        Left = 280
        Top = 124
        Width = 41
        Height = 21
        Hint = 'only numbers'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object cbID3v11: TCheckBox
        Left = 56
        Top = 128
        Width = 97
        Height = 17
        Caption = 'ID3v1.1-Tags'
        TabOrder = 6
      end
    end
    object tsLyrics: TTabSheet
      BorderWidth = 4
      Caption = 'Lyrics3'
      ImageIndex = 1
      object mLyrics3: TMemo
        Left = 0
        Top = 0
        Width = 317
        Height = 141
        Hint = 'max. 5100/99999(v2) characters'
        Align = alClient
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
      end
    end
    object tsLyrics3v2: TTabSheet
      Caption = 'Lyrics3v2'
      ImageIndex = 2
      object eL3v2Title: TEdit
        Left = 56
        Top = 4
        Width = 265
        Height = 21
        Hint = 'max. 250 characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object StaticText8: TStaticText
        Left = 0
        Top = 8
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Title'
        TabOrder = 1
      end
      object StaticText9: TStaticText
        Left = 0
        Top = 32
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Artist'
        TabOrder = 2
      end
      object eL3v2Artist: TEdit
        Left = 56
        Top = 28
        Width = 265
        Height = 21
        Hint = 'max. 250 characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object eL3v2Album: TEdit
        Left = 56
        Top = 52
        Width = 265
        Height = 21
        Hint = 'max. 250 characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object StaticText10: TStaticText
        Left = 0
        Top = 56
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Album'
        TabOrder = 5
      end
      object eL3v2Author: TEdit
        Left = 56
        Top = 76
        Width = 265
        Height = 21
        Hint = 'max. 250 characters'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object StaticText11: TStaticText
        Left = 0
        Top = 80
        Width = 49
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Author'
        TabOrder = 7
      end
      object bnMore: TBitBtn
        Left = 246
        Top = 120
        Width = 75
        Height = 25
        Hint = 'show images and infos'
        Caption = '&More...'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = bnMoreClick
      end
    end
    object tsLyrics3v2more: TTabSheet
      BorderWidth = 4
      Caption = 'More Lyrics3v2'
      ImageIndex = 3
      TabVisible = False
      object mImages: TMemo
        Left = 0
        Top = 74
        Width = 317
        Height = 67
        Hint = 'max. 99999 characters'
        Align = alBottom
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
      end
      object mInfos: TMemo
        Left = 0
        Top = 0
        Width = 317
        Height = 67
        Hint = 'max. 99999 characters'
        Align = alTop
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
      end
    end
    object tsID3v2: TTabSheet
      Caption = 'ID3v2'
      ImageIndex = 4
      object StaticText12: TStaticText
        Left = 8
        Top = 8
        Width = 129
        Height = 17
        Caption = 'You''ve gotta wait for this...'
        TabOrder = 0
      end
    end
  end
end