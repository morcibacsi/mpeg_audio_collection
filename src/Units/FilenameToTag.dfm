object frmFilenameToTag: TfrmFilenameToTag
  Left = 481
  Top = 314
  BorderStyle = bsDialog
  Caption = '_Filename To Tag'
  ClientHeight = 334
  ClientWidth = 412
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
  object bOK: TButton
    Left = 320
    Top = 264
    Width = 75
    Height = 25
    Caption = '_OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = bOKClick
  end
  object bCancel: TButton
    Left = 320
    Top = 296
    Width = 75
    Height = 25
    Caption = '_Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object rbGuessFromName: TRadioButton
    Left = 24
    Top = 16
    Width = 281
    Height = 17
    Caption = '_Guess tag from filename'
    TabOrder = 2
    OnClick = rbGuessFromNameClick
  end
  object rbOwnScheme: TRadioButton
    Left = 24
    Top = 40
    Width = 281
    Height = 17
    Caption = '_Use own scheme:'
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = rbOwnSchemeClick
  end
  object eScheme: TEdit
    Left = 32
    Top = 64
    Width = 273
    Height = 21
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 96
    Width = 273
    Height = 225
    Caption = '_Explanation'
    TabOrder = 5
    object Label1: TLabel
      Left = 176
      Top = 24
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%01'
      Layout = tlCenter
      OnClick = Label8Click
    end
    object Label2: TLabel
      Left = 176
      Top = 48
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%02'
      Layout = tlCenter
      OnClick = Label9Click
    end
    object Image5: TImage
      Left = 16
      Top = 72
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        0001000000000000000080000080000000808000800000008000800080800000
        C0C0C000C0DCC000F0CAA60000003E0000005D0000007C0000009B000000BA00
        0000D9000000F0002424FF004848FF006C6CFF009090FF00B4B4FF0000143E00
        001E5D0000287C0000329B00003CBA000046D9000055F000246DFF004885FF00
        6C9DFF0090B5FF00B4CDFF00002A3E00003F5D0000547C0000699B00007EBA00
        0093D90000AAF00024B6FF0048C2FF006CCEFF0090DAFF00B4E6FF00003E3E00
        005D5D00007C7C00009B9B0000BABA0000D9D90000F0F00024FFFF0048FFFF00
        6CFFFF0090FFFF00B4FFFF00003E2A00005D3F00007C5400009B690000BA7E00
        00D9930000F0AA0024FFB60048FFC2006CFFCE0090FFDA00B4FFE600003E1400
        005D1E00007C2800009B320000BA3C0000D9460000F0550024FF6D0048FF8500
        6CFF9D0090FFB500B4FFCD00003E0000005D0000007C0000009B000000BA0000
        00D9000000F0000024FF240048FF48006CFF6C0090FF9000B4FFB400143E0000
        1E5D0000287C0000329B00003CBA000046D9000055F000006DFF240085FF4800
        9DFF6C00B5FF9000CDFFB4002A3E00003F5D0000547C0000699B00007EBA0000
        93D90000AAF00000B6FF2400C2FF4800CEFF6C00DAFF9000E6FFB4003E3E0000
        5D5D00007C7C00009B9B0000BABA0000D9D90000F0F00000FFFF2400FFFF4800
        FFFF6C00FFFF9000FFFFB4003E2A00005D3F00007C5400009B690000BA7E0000
        D9930000F0AA0000FFB62400FFC24800FFCE6C00FFDA9000FFE6B4003E140000
        5D1E00007C2800009B320000BA3C0000D9460000F0550000FF6D2400FF854800
        FF9D6C00FFB59000FFCDB4003E0000005D0000007C0000009B000000BA000000
        D9000000F0000000FF242400FF484800FF6C6C00FF909000FFB4B4003E001400
        5D001E007C0028009B003200BA003C00D9004600F0005500FF246D00FF488500
        FF6C9D00FF90B500FFB4CD003E002A005D003F007C0054009B006900BA007E00
        D9009300F000AA00FF24B600FF48C200FF6CCE00FF90DA00FFB4E6003E003E00
        5D005D007C007C009B009B00BA00BA00D900D900F000F000FF24FF00FF48FF00
        FF6CFF00FF90FF00FFB4FF002A003E003F005D0054007C0069009B007E00BA00
        9300D900AA00F000B624FF00C248FF00CE6CFF00DA90FF00E6B4FF0014003E00
        1E005D0028007C0032009B003C00BA004600D9005500F0006D24FF008548FF00
        9D6CFF00B590FF00CDB4FF0006060600121212001F1F1F002C2C2C0039393900
        45454500525252005F5F5F006C6C6C007878780085858500929292009F9F9F00
        ABABAB00B8B8B800C5C5C500D2D2D200DEDEDE00EBEBEB00F8F8F800F0FBFF00
        A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF000000000000E9E9E9E9E9000000000000000000EDED2CF30707F0E9E9
        000000000000ED21212C2C07070707F0E900000000EDC9C921212C07070707F3
        F0E9000000F774C9C9212C070707F30707E90000F007077474C9EAE9EAF30707
        07F0E900F021210707EAE9ECE9EA07070707E900F007072121E9F807ECE90707
        0707E900F007070707EAE9F8E9EA7474078F8F00F007070707F3EAE9EA212174
        74908F8F00F00707F30707072CC9929121ED908F00F007F3070707072CC99292
        91ED00900000F00707070707F22CC99292000090000000F0F0070707F22CF7ED
        920000910000000000F0F0F0F0F0000093009291000000000000000000000000
        93939292F83F0000E00F0000C007000080030000800300000001000000010000
        0001000000010000000000008000000080020000C0060000E0060000F8340000
        FFF00000}
      OnClick = Label10Click
    end
    object Image6: TImage
      Left = 16
      Top = 96
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        0001000000000000000080000080000000808000800000008000800080800000
        C0C0C000C0DCC000F0CAA60000003E0000005D0000007C0000009B000000BA00
        0000D9000000F0002424FF004848FF006C6CFF009090FF00B4B4FF0000143E00
        001E5D0000287C0000329B00003CBA000046D9000055F000246DFF004885FF00
        6C9DFF0090B5FF00B4CDFF00002A3E00003F5D0000547C0000699B00007EBA00
        0093D90000AAF00024B6FF0048C2FF006CCEFF0090DAFF00B4E6FF00003E3E00
        005D5D00007C7C00009B9B0000BABA0000D9D90000F0F00024FFFF0048FFFF00
        6CFFFF0090FFFF00B4FFFF00003E2A00005D3F00007C5400009B690000BA7E00
        00D9930000F0AA0024FFB60048FFC2006CFFCE0090FFDA00B4FFE600003E1400
        005D1E00007C2800009B320000BA3C0000D9460000F0550024FF6D0048FF8500
        6CFF9D0090FFB500B4FFCD00003E0000005D0000007C0000009B000000BA0000
        00D9000000F0000024FF240048FF48006CFF6C0090FF9000B4FFB400143E0000
        1E5D0000287C0000329B00003CBA000046D9000055F000006DFF240085FF4800
        9DFF6C00B5FF9000CDFFB4002A3E00003F5D0000547C0000699B00007EBA0000
        93D90000AAF00000B6FF2400C2FF4800CEFF6C00DAFF9000E6FFB4003E3E0000
        5D5D00007C7C00009B9B0000BABA0000D9D90000F0F00000FFFF2400FFFF4800
        FFFF6C00FFFF9000FFFFB4003E2A00005D3F00007C5400009B690000BA7E0000
        D9930000F0AA0000FFB62400FFC24800FFCE6C00FFDA9000FFE6B4003E140000
        5D1E00007C2800009B320000BA3C0000D9460000F0550000FF6D2400FF854800
        FF9D6C00FFB59000FFCDB4003E0000005D0000007C0000009B000000BA000000
        D9000000F0000000FF242400FF484800FF6C6C00FF909000FFB4B4003E001400
        5D001E007C0028009B003200BA003C00D9004600F0005500FF246D00FF488500
        FF6C9D00FF90B500FFB4CD003E002A005D003F007C0054009B006900BA007E00
        D9009300F000AA00FF24B600FF48C200FF6CCE00FF90DA00FFB4E6003E003E00
        5D005D007C007C009B009B00BA00BA00D900D900F000F000FF24FF00FF48FF00
        FF6CFF00FF90FF00FFB4FF002A003E003F005D0054007C0069009B007E00BA00
        9300D900AA00F000B624FF00C248FF00CE6CFF00DA90FF00E6B4FF0014003E00
        1E005D0028007C0032009B003C00BA004600D9005500F0006D24FF008548FF00
        9D6CFF00B590FF00CDB4FF0006060600121212001F1F1F002C2C2C0039393900
        45454500525252005F5F5F006C6C6C007878780085858500929292009F9F9F00
        ABABAB00B8B8B800C5C5C500D2D2D200DEDEDE00EBEBEB00F8F8F800F0FBFF00
        A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF000000E2E29F9FE2E2E2E2E2E2E2E2E2E20000E2F6F69F9FF6F6F6F6F6
        F6F6F6E20000E2E2E2E29FE29F9FE29F9FE2E2E20000E2F6F6F69FF6F69F9FF6
        9F9FF6E20000E2E2E2E29FE2E2E29FE2E29FE2E200E2E2E20000000000009FE2
        E29F0000E2ECECEBE2000000E2E29FE2E29F0000EC2B2A29E2E200E2ECEC9F9F
        9F9F0000EC2C2B2AE2ECE2E22B2A29E200000000EC2D2C2BE207EBE22C2B2AE2
        00000000ECEBECEBE207ECE22D2C2BE200000000ECE2E2E2E207EBE2ECECECE2
        00000000E2E2ECE2E2ECECE2E2E2E2E200000000ECE2ECE200E2ECE2EB07E2E2
        0000000000E2ECE20000E2ECEC07E2E2000000000000E2E2000000E2E2E2E200
        00000000C0000000C0000000C0000000C0000000C00000008FDB0000071B0000
        02030000000F0000000F0000000F0000000F0000000F0000080F00008C0F0000
        CE1F0000}
      OnClick = Label11Click
    end
    object Image7: TImage
      Left = 16
      Top = 120
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        0001000000000000000080000080000000808000800000008000800080800000
        C0C0C000C0DCC000F0CAA60000003E0000005D0000007C0000009B000000BA00
        0000D9000000F0002424FF004848FF006C6CFF009090FF00B4B4FF0000143E00
        001E5D0000287C0000329B00003CBA000046D9000055F000246DFF004885FF00
        6C9DFF0090B5FF00B4CDFF00002A3E00003F5D0000547C0000699B00007EBA00
        0093D90000AAF00024B6FF0048C2FF006CCEFF0090DAFF00B4E6FF00003E3E00
        005D5D00007C7C00009B9B0000BABA0000D9D90000F0F00024FFFF0048FFFF00
        6CFFFF0090FFFF00B4FFFF00003E2A00005D3F00007C5400009B690000BA7E00
        00D9930000F0AA0024FFB60048FFC2006CFFCE0090FFDA00B4FFE600003E1400
        005D1E00007C2800009B320000BA3C0000D9460000F0550024FF6D0048FF8500
        6CFF9D0090FFB500B4FFCD00003E0000005D0000007C0000009B000000BA0000
        00D9000000F0000024FF240048FF48006CFF6C0090FF9000B4FFB400143E0000
        1E5D0000287C0000329B00003CBA000046D9000055F000006DFF240085FF4800
        9DFF6C00B5FF9000CDFFB4002A3E00003F5D0000547C0000699B00007EBA0000
        93D90000AAF00000B6FF2400C2FF4800CEFF6C00DAFF9000E6FFB4003E3E0000
        5D5D00007C7C00009B9B0000BABA0000D9D90000F0F00000FFFF2400FFFF4800
        FFFF6C00FFFF9000FFFFB4003E2A00005D3F00007C5400009B690000BA7E0000
        D9930000F0AA0000FFB62400FFC24800FFCE6C00FFDA9000FFE6B4003E140000
        5D1E00007C2800009B320000BA3C0000D9460000F0550000FF6D2400FF854800
        FF9D6C00FFB59000FFCDB4003E0000005D0000007C0000009B000000BA000000
        D9000000F0000000FF242400FF484800FF6C6C00FF909000FFB4B4003E001400
        5D001E007C0028009B003200BA003C00D9004600F0005500FF246D00FF488500
        FF6C9D00FF90B500FFB4CD003E002A005D003F007C0054009B006900BA007E00
        D9009300F000AA00FF24B600FF48C200FF6CCE00FF90DA00FFB4E6003E003E00
        5D005D007C007C009B009B00BA00BA00D900D900F000F000FF24FF00FF48FF00
        FF6CFF00FF90FF00FFB4FF002A003E003F005D0054007C0069009B007E00BA00
        9300D900AA00F000B624FF00C248FF00CE6CFF00DA90FF00E6B4FF0014003E00
        1E005D0028007C0032009B003C00BA004600D9005500F0006D24FF008548FF00
        9D6CFF00B590FF00CDB4FF0006060600121212001F1F1F002C2C2C0039393900
        45454500525252005F5F5F006C6C6C007878780085858500929292009F9F9F00
        ABABAB00B8B8B800C5C5C500D2D2D200DEDEDE00EBEBEB00F8F8F800F0FBFF00
        A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000D0B0D0D00000000000000000000000DF9F9F9F90B0000
        000000000000000DF9EDFFFFEDF90D00000000000000000BF9FFFFEDFFF90D00
        00000000ECF2F20DF9FF0000F5F90BF2F2ED0000ECF3F20BF9FF00FFFFF90DF2
        F2ED0000ECF3F30DF9EDF5FFEDF90BF2F2ED0000ECF3F3F30DF9F9F9F90BF3F3
        F2ED0000ECF4F3F3F30D0B0D0DF3F3F3F3ED0000ECF49C9C9CF300F4F49D9C9C
        F3ED0000ECF4F49CF3F300F4F49DF4F3F3ED0000ECF6F49DF4F300F6F4F49DF4
        F3ED0000ECF69E9DF4F400F6F69EF49DF4ED0000ECF6F69EF4F400F6F6979E97
        F4ED0000ECF6F6F6F6F400F6F6F6F6F4F4ED000000ECECECECEC00ECECECECEC
        ECEC0000F87F0000F03F0000E01F000000010000000100000001000000010000
        0001000000010000000100000001000000010000000100000001000000010000
        82030000}
      OnClick = Label12Click
    end
    object Image8: TImage
      Left = 16
      Top = 144
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        0001000000000000000080000080000000808000800000008000800080800000
        C0C0C000C0DCC000F0CAA60000003E0000005D0000007C0000009B000000BA00
        0000D9000000F0002424FF004848FF006C6CFF009090FF00B4B4FF0000143E00
        001E5D0000287C0000329B00003CBA000046D9000055F000246DFF004885FF00
        6C9DFF0090B5FF00B4CDFF00002A3E00003F5D0000547C0000699B00007EBA00
        0093D90000AAF00024B6FF0048C2FF006CCEFF0090DAFF00B4E6FF00003E3E00
        005D5D00007C7C00009B9B0000BABA0000D9D90000F0F00024FFFF0048FFFF00
        6CFFFF0090FFFF00B4FFFF00003E2A00005D3F00007C5400009B690000BA7E00
        00D9930000F0AA0024FFB60048FFC2006CFFCE0090FFDA00B4FFE600003E1400
        005D1E00007C2800009B320000BA3C0000D9460000F0550024FF6D0048FF8500
        6CFF9D0090FFB500B4FFCD00003E0000005D0000007C0000009B000000BA0000
        00D9000000F0000024FF240048FF48006CFF6C0090FF9000B4FFB400143E0000
        1E5D0000287C0000329B00003CBA000046D9000055F000006DFF240085FF4800
        9DFF6C00B5FF9000CDFFB4002A3E00003F5D0000547C0000699B00007EBA0000
        93D90000AAF00000B6FF2400C2FF4800CEFF6C00DAFF9000E6FFB4003E3E0000
        5D5D00007C7C00009B9B0000BABA0000D9D90000F0F00000FFFF2400FFFF4800
        FFFF6C00FFFF9000FFFFB4003E2A00005D3F00007C5400009B690000BA7E0000
        D9930000F0AA0000FFB62400FFC24800FFCE6C00FFDA9000FFE6B4003E140000
        5D1E00007C2800009B320000BA3C0000D9460000F0550000FF6D2400FF854800
        FF9D6C00FFB59000FFCDB4003E0000005D0000007C0000009B000000BA000000
        D9000000F0000000FF242400FF484800FF6C6C00FF909000FFB4B4003E001400
        5D001E007C0028009B003200BA003C00D9004600F0005500FF246D00FF488500
        FF6C9D00FF90B500FFB4CD003E002A005D003F007C0054009B006900BA007E00
        D9009300F000AA00FF24B600FF48C200FF6CCE00FF90DA00FFB4E6003E003E00
        5D005D007C007C009B009B00BA00BA00D900D900F000F000FF24FF00FF48FF00
        FF6CFF00FF90FF00FFB4FF002A003E003F005D0054007C0069009B007E00BA00
        9300D900AA00F000B624FF00C248FF00CE6CFF00DA90FF00E6B4FF0014003E00
        1E005D0028007C0032009B003C00BA004600D9005500F0006D24FF008548FF00
        9D6CFF00B590FF00CDB4FF0006060600121212001F1F1F002C2C2C0039393900
        45454500525252005F5F5F006C6C6C007878780085858500929292009F9F9F00
        ABABAB00B8B8B800C5C5C500D2D2D200DEDEDE00EBEBEB00F8F8F800F0FBFF00
        A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000ECE90000000000000000E9EC00000000E9F3F2F2F2F1F1F1
        F0F0F0E90000000000F3F3262625252424F0F0000000000000F3F3F3F2F2F2F1
        F1F1F0000000000000F4F3262625252424F1F100E90000000000000000E9EEF2
        F2F1F100067C7C7B7B7B7A7A7A06E92424F2F100EB7C7C7C7B7B7B7A7A7AE9F3
        F2F2F200EC067C7C7C7B7B7B7A7A06E924F2F20000E9FE7C7C7C7B7B7B7A7AE9
        F3F3F20000EC06FE7C7C7C7B7B7B7A06E9F3F3000000E9FEFE86868686867B7A
        E9F3F3000000EC06FE8686868686867B06E9F300000000E97DFEFE7C7C7C7B7B
        7BE9F0E9000000ECE97D7D7D7C7C7C7B7BE9E9EC00000000ECE9000000000000
        00E9ECF0F0000000F0000000F0000000F0000000F00000000000000000000000
        00000000000000008000000080000000C0000000C0000000E0000000E0000000
        F0000000}
      OnClick = Label13Click
    end
    object Image3: TImage
      Left = 16
      Top = 24
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        0001000000000000000080000080000000808000800000008000800080800000
        C0C0C000C0DCC000F0CAA60000003E0000005D0000007C0000009B000000BA00
        0000D9000000F0002424FF004848FF006C6CFF009090FF00B4B4FF0000143E00
        001E5D0000287C0000329B00003CBA000046D9000055F000246DFF004885FF00
        6C9DFF0090B5FF00B4CDFF00002A3E00003F5D0000547C0000699B00007EBA00
        0093D90000AAF00024B6FF0048C2FF006CCEFF0090DAFF00B4E6FF00003E3E00
        005D5D00007C7C00009B9B0000BABA0000D9D90000F0F00024FFFF0048FFFF00
        6CFFFF0090FFFF00B4FFFF00003E2A00005D3F00007C5400009B690000BA7E00
        00D9930000F0AA0024FFB60048FFC2006CFFCE0090FFDA00B4FFE600003E1400
        005D1E00007C2800009B320000BA3C0000D9460000F0550024FF6D0048FF8500
        6CFF9D0090FFB500B4FFCD00003E0000005D0000007C0000009B000000BA0000
        00D9000000F0000024FF240048FF48006CFF6C0090FF9000B4FFB400143E0000
        1E5D0000287C0000329B00003CBA000046D9000055F000006DFF240085FF4800
        9DFF6C00B5FF9000CDFFB4002A3E00003F5D0000547C0000699B00007EBA0000
        93D90000AAF00000B6FF2400C2FF4800CEFF6C00DAFF9000E6FFB4003E3E0000
        5D5D00007C7C00009B9B0000BABA0000D9D90000F0F00000FFFF2400FFFF4800
        FFFF6C00FFFF9000FFFFB4003E2A00005D3F00007C5400009B690000BA7E0000
        D9930000F0AA0000FFB62400FFC24800FFCE6C00FFDA9000FFE6B4003E140000
        5D1E00007C2800009B320000BA3C0000D9460000F0550000FF6D2400FF854800
        FF9D6C00FFB59000FFCDB4003E0000005D0000007C0000009B000000BA000000
        D9000000F0000000FF242400FF484800FF6C6C00FF909000FFB4B4003E001400
        5D001E007C0028009B003200BA003C00D9004600F0005500FF246D00FF488500
        FF6C9D00FF90B500FFB4CD003E002A005D003F007C0054009B006900BA007E00
        D9009300F000AA00FF24B600FF48C200FF6CCE00FF90DA00FFB4E6003E003E00
        5D005D007C007C009B009B00BA00BA00D900D900F000F000FF24FF00FF48FF00
        FF6CFF00FF90FF00FFB4FF002A003E003F005D0054007C0069009B007E00BA00
        9300D900AA00F000B624FF00C248FF00CE6CFF00DA90FF00E6B4FF0014003E00
        1E005D0028007C0032009B003C00BA004600D9005500F0006D24FF008548FF00
        9D6CFF00B590FF00CDB4FF0006060600121212001F1F1F002C2C2C0039393900
        45454500525252005F5F5F006C6C6C007878780085858500929292009F9F9F00
        ABABAB00B8B8B800C5C5C500D2D2D200DEDEDE00EBEBEB00F8F8F800F0FBFF00
        A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF000000000000000000000000000000000000F8E90000000000E9EE0000
        0000000000E9F3F2F2F2F1F1F1E9EE00000000000000F3F36E6E6E6D6D6DE9EE
        000000000000F3F3F3F2F2F2F1F1F1E9EE0000000000F4F36E6E6E6D6D6D6C6C
        E9EE00000000F4F4F3F3F3F2F2F2F1F1F1E9EE000000F4F46E6E6E6D6D6D6C6C
        6C6BE9EE0000F6F4F4F4F3F3F3F2F2F2F1F1F1E90000F6F60EF4F4100F0EF20F
        F2F1F1000000F6F60FF4F411F30FF3100F0EF1000000F5F610F6F413F410F311
        F20FF2000000F5141310F6141311F3131110F20000E9F5F5F5F6F6F6F4F4F4F3
        F3F3F2E900F8E90000000000000000000000E9F8000000000000000000000000
        00000000FFFF0000803F0000801F0000800F0000800700008003000080010000
        8000000080000000800000008000000080000000800000008000000080000000
        FFFF0000}
      OnClick = Label8Click
    end
    object Image4: TImage
      Left = 16
      Top = 48
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        0001000000000000000080000080000000808000800000008000800080800000
        C0C0C000C0DCC000F0CAA60000003E0000005D0000007C0000009B000000BA00
        0000D9000000F0002424FF004848FF006C6CFF009090FF00B4B4FF0000143E00
        001E5D0000287C0000329B00003CBA000046D9000055F000246DFF004885FF00
        6C9DFF0090B5FF00B4CDFF00002A3E00003F5D0000547C0000699B00007EBA00
        0093D90000AAF00024B6FF0048C2FF006CCEFF0090DAFF00B4E6FF00003E3E00
        005D5D00007C7C00009B9B0000BABA0000D9D90000F0F00024FFFF0048FFFF00
        6CFFFF0090FFFF00B4FFFF00003E2A00005D3F00007C5400009B690000BA7E00
        00D9930000F0AA0024FFB60048FFC2006CFFCE0090FFDA00B4FFE600003E1400
        005D1E00007C2800009B320000BA3C0000D9460000F0550024FF6D0048FF8500
        6CFF9D0090FFB500B4FFCD00003E0000005D0000007C0000009B000000BA0000
        00D9000000F0000024FF240048FF48006CFF6C0090FF9000B4FFB400143E0000
        1E5D0000287C0000329B00003CBA000046D9000055F000006DFF240085FF4800
        9DFF6C00B5FF9000CDFFB4002A3E00003F5D0000547C0000699B00007EBA0000
        93D90000AAF00000B6FF2400C2FF4800CEFF6C00DAFF9000E6FFB4003E3E0000
        5D5D00007C7C00009B9B0000BABA0000D9D90000F0F00000FFFF2400FFFF4800
        FFFF6C00FFFF9000FFFFB4003E2A00005D3F00007C5400009B690000BA7E0000
        D9930000F0AA0000FFB62400FFC24800FFCE6C00FFDA9000FFE6B4003E140000
        5D1E00007C2800009B320000BA3C0000D9460000F0550000FF6D2400FF854800
        FF9D6C00FFB59000FFCDB4003E0000005D0000007C0000009B000000BA000000
        D9000000F0000000FF242400FF484800FF6C6C00FF909000FFB4B4003E001400
        5D001E007C0028009B003200BA003C00D9004600F0005500FF246D00FF488500
        FF6C9D00FF90B500FFB4CD003E002A005D003F007C0054009B006900BA007E00
        D9009300F000AA00FF24B600FF48C200FF6CCE00FF90DA00FFB4E6003E003E00
        5D005D007C007C009B009B00BA00BA00D900D900F000F000FF24FF00FF48FF00
        FF6CFF00FF90FF00FFB4FF002A003E003F005D0054007C0069009B007E00BA00
        9300D900AA00F000B624FF00C248FF00CE6CFF00DA90FF00E6B4FF0014003E00
        1E005D0028007C0032009B003C00BA004600D9005500F0006D24FF008548FF00
        9D6CFF00B590FF00CDB4FF0006060600121212001F1F1F002C2C2C0039393900
        45454500525252005F5F5F006C6C6C007878780085858500929292009F9F9F00
        ABABAB00B8B8B800C5C5C500D2D2D200DEDEDE00EBEBEB00F8F8F800F0FBFF00
        A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000085858500858585000000000000000000008590009085000000
        0000000000000000859000908500000000000000000000008590009085000000
        0000000000000000859000908500000000000000000000008590909085000000
        0000000000000000859290908500000000000000000000008592949085000091
        91000000000000859092949290009090909000000000859090929492900090D9
        D9D9D9D900008590909294929090850000000000000085908790929087908500
        0000000000000085878790878785000000000000000000008790909087000000
        0000000000000000009090900000000000000000000000000086908600000000
        00000000E23F0000F27F0000F27F0000F27F0000F27F0000F07F0000F07F0000
        F0670000E0430000C0400000C01F0000C01F0000E03F0000F07F0000F8FF0000
        F8FF0000}
      OnClick = Label9Click
    end
    object Label5: TLabel
      Left = 176
      Top = 120
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%05'
      Layout = tlCenter
      OnClick = Label12Click
    end
    object Label6: TLabel
      Left = 176
      Top = 144
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%06'
      Layout = tlCenter
      OnClick = Label13Click
    end
    object Label4: TLabel
      Left = 176
      Top = 96
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%04'
      Layout = tlCenter
      OnClick = Label11Click
    end
    object Label3: TLabel
      Left = 176
      Top = 72
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%03'
      Layout = tlCenter
      OnClick = Label10Click
    end
    object Label7: TLabel
      Left = 176
      Top = 168
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%07'
      Layout = tlCenter
      OnClick = Label14Click
    end
    object Label8: TLabel
      Left = 40
      Top = 24
      Width = 128
      Height = 16
      AutoSize = False
      Layout = tlCenter
      OnClick = Label8Click
    end
    object Label9: TLabel
      Left = 40
      Top = 48
      Width = 128
      Height = 16
      AutoSize = False
      Layout = tlCenter
      OnClick = Label9Click
    end
    object Label10: TLabel
      Left = 40
      Top = 72
      Width = 128
      Height = 16
      AutoSize = False
      Layout = tlCenter
      OnClick = Label10Click
    end
    object Label11: TLabel
      Left = 40
      Top = 96
      Width = 128
      Height = 16
      AutoSize = False
      Layout = tlCenter
      OnClick = Label11Click
    end
    object Label12: TLabel
      Left = 40
      Top = 120
      Width = 128
      Height = 16
      AutoSize = False
      Layout = tlCenter
      OnClick = Label12Click
    end
    object Label13: TLabel
      Left = 40
      Top = 145
      Width = 128
      Height = 16
      AutoSize = False
      Layout = tlCenter
      OnClick = Label13Click
    end
    object Label15: TLabel
      Left = 40
      Top = 193
      Width = 128
      Height = 16
      AutoSize = False
      Caption = 'Disregard'
      Layout = tlCenter
      OnClick = Label15Click
    end
    object Label14: TLabel
      Left = 40
      Top = 169
      Width = 128
      Height = 16
      AutoSize = False
      Caption = 'Genre'
      Layout = tlCenter
      OnClick = Label14Click
    end
    object Label16: TLabel
      Left = 176
      Top = 192
      Width = 25
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '%08'
      Layout = tlCenter
      OnClick = Label15Click
    end
    object Image1: TImage
      Left = 16
      Top = 169
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        0001000000000000000080000080000000808000800000008000800080800000
        C0C0C000C0DCC000F0CAA60000003E0000005D0000007C0000009B000000BA00
        0000D9000000F0002424FF004848FF006C6CFF009090FF00B4B4FF0000143E00
        001E5D0000287C0000329B00003CBA000046D9000055F000246DFF004885FF00
        6C9DFF0090B5FF00B4CDFF00002A3E00003F5D0000547C0000699B00007EBA00
        0093D90000AAF00024B6FF0048C2FF006CCEFF0090DAFF00B4E6FF00003E3E00
        005D5D00007C7C00009B9B0000BABA0000D9D90000F0F00024FFFF0048FFFF00
        6CFFFF0090FFFF00B4FFFF00003E2A00005D3F00007C5400009B690000BA7E00
        00D9930000F0AA0024FFB60048FFC2006CFFCE0090FFDA00B4FFE600003E1400
        005D1E00007C2800009B320000BA3C0000D9460000F0550024FF6D0048FF8500
        6CFF9D0090FFB500B4FFCD00003E0000005D0000007C0000009B000000BA0000
        00D9000000F0000024FF240048FF48006CFF6C0090FF9000B4FFB400143E0000
        1E5D0000287C0000329B00003CBA000046D9000055F000006DFF240085FF4800
        9DFF6C00B5FF9000CDFFB4002A3E00003F5D0000547C0000699B00007EBA0000
        93D90000AAF00000B6FF2400C2FF4800CEFF6C00DAFF9000E6FFB4003E3E0000
        5D5D00007C7C00009B9B0000BABA0000D9D90000F0F00000FFFF2400FFFF4800
        FFFF6C00FFFF9000FFFFB4003E2A00005D3F00007C5400009B690000BA7E0000
        D9930000F0AA0000FFB62400FFC24800FFCE6C00FFDA9000FFE6B4003E140000
        5D1E00007C2800009B320000BA3C0000D9460000F0550000FF6D2400FF854800
        FF9D6C00FFB59000FFCDB4003E0000005D0000007C0000009B000000BA000000
        D9000000F0000000FF242400FF484800FF6C6C00FF909000FFB4B4003E001400
        5D001E007C0028009B003200BA003C00D9004600F0005500FF246D00FF488500
        FF6C9D00FF90B500FFB4CD003E002A005D003F007C0054009B006900BA007E00
        D9009300F000AA00FF24B600FF48C200FF6CCE00FF90DA00FFB4E6003E003E00
        5D005D007C007C009B009B00BA00BA00D900D900F000F000FF24FF00FF48FF00
        FF6CFF00FF90FF00FFB4FF002A003E003F005D0054007C0069009B007E00BA00
        9300D900AA00F000B624FF00C248FF00CE6CFF00DA90FF00E6B4FF0014003E00
        1E005D0028007C0032009B003C00BA004600D9005500F0006D24FF008548FF00
        9D6CFF00B590FF00CDB4FF0006060600121212001F1F1F002C2C2C0039393900
        45454500525252005F5F5F006C6C6C007878780085858500929292009F9F9F00
        ABABAB00B8B8B800C5C5C500D2D2D200DEDEDE00EBEBEB00F8F8F800F0FBFF00
        A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000F8F3F2F2F2F1F1F1F0F0F0EF
        00000000F8F3F3F2F2F2F1F1F1F0F0F000000000F8F3F3A4A3A30000F1F1F0F0
        00000000F8F4F3F3F3F2F2320000000000000000F8F4F4F3F3F3F2F232343932
        00000000F8F4F4A4A3A3A2A2A132343932F80000F8F6F4F4F4F3F3F3F2F23234
        390000EDF8F6F6F4F4F4F3F3F3F2F2320000ED05F8F6F6A4A3A3A2A2A1A1F2F2
        00EDC305F8F5F6F6F6F4F4F4F3F3F3F20005C9C3F8F5F5F6F6F6F4F4F4F3F3F3
        0005C3C9F8F5F5F5F6F6F6F4F4F4F3F3000005C3F8EEEEEEEEEEEEEEEEEEEEEE
        0000000500ECF3F3F3F2F2F2F1F1F1EC000000000000ECECECECECECECECEC00
        00000000800F0000000700000007000000070000000700000003000000010000
        00000000000000000000000000000000000000000004000000060000800F0000
        C01F0000}
    end
  end
  object cbTestmode: TCheckBox
    Left = 320
    Top = 240
    Width = 90
    Height = 17
    Caption = '_Preview'
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 320
    Top = 24
    Width = 81
    Height = 57
    Lines.Strings = (
      '%03 -- [%04] -- '
      '%02 -- %01'
      '%02/[%04] -- '
      '%02 -- %01'
      '%03/[%04] -- '
      '%02 -- %01'
      '%03 -- [%04] '
      '%02 -- %01'
      '%02/[%04] %02 '
      '-- %01'
      '%03/[%04] %02 '
      '-- %01'
      '%02 -- %03 -- '
      '[%04] %01'
      '%02/%03 -- '
      '[%04] %01'
      '%02/%03/[%04'
      '] - %01'
      '%02/%03/[%04'
      '] %01'
      '%02/%02 -- '
      '%01'
      '%03/%02 -- '
      '%01'
      '%02_-_%03_-_'
      '%05\%04_-_%0'
      '2_-_%01'
      '%02_-_%03-%0'
      '5\%04_-_%02_-'
      '_%01'
      '%02_-_%03\%0'
      '4_-_%02_-_%0'
      '1_-_%05'
      '%02_-_%03\%0'
      '4_-_%02_-_%0'
      '1'
      '%03-%05\%04_'
      '-_%02_-_%01'
      '%02\%04_-_%0'
      '2_-_%01_-_%0'
      '5'
      '%03\%04_-_%0'
      '2_-_%01_-_%0'
      '5'
      '%02\%04_-_%0'
      '2_-_%01-%05'
      '%03\%04_-_%0'
      '2_-_%01-%05'
      '(%05) %03\%02 '
      '- %03 - [%04] - '
      '%01'
      '(%05) %03\%02 '
      '- %03 - (%04) - '
      '%01'
      '(%05) %03\%02 '
      '- %03 - %04 - '
      '%01'
      '(%05) %03\%02 '
      '- %03 [%04] - '
      '%01'
      '(%05) %03\%02 '
      '- %03 (%04) - '
      '%01'
      '(%05) %03\%02 '
      '- %03 - [%04] '
      '%01'
      '(%05) %03\%02 '
      '- %03 - (%04) '
      '%01'
      '(%05) %03\%02 '
      '- %03 [%04] '
      '%01'
      '(%05) %03\%02 '
      '- %03 (%04) '
      '%01'
      '%03 (%05)\%03 '
      '- [%04] - %02 - '
      '%01'
      '%03 (%05)\%03 '
      '- (%04) - %02 - '
      '%01'
      '%03 (%05)\%03 '
      '- %04 - %02 - '
      '%01'
      '%03 (%05)\%03 '
      '[%04] - %02 - '
      '%01'
      '%03 (%05)\%03 '
      '(%04) - %02 - '
      '%01'
      '%03 (%05)\%03 '
      '- [%04] %02 '
      '%01'
      '%03 (%05)\%03 '
      '- (%04) %02 '
      '%01'
      '%03 (%05)\%03 '
      '[%04] %02 - '
      '%01'
      '%03 (%05)\%03 '
      '(%04) %02 - '
      '%01'
      '%02 - %03 - '
      '[%04] - %01'
      '%02 - %03 - '
      '(%04) - %01'
      '%02 - %03 - '
      '%04 - %01'
      '%02 - %03 '
      '[%04] - %01'
      '%02 - %03 '
      '(%04) - %01'
      '%02 - %03 - '
      '[%04] %01'
      '%02 - %03 - '
      '(%04) %01'
      '%02 - %03 '
      '[%04] %01'
      '%02 - %03 '
      '(%04) %01'
      '%02\%04 - %02 '
      '- %01'
      '%02\%02 - %04 '
      '- %01'
      '%02 - %03\%04 '
      '- %02 - %01'
      '%02 - %03\%02 '
      '- %04 - %01'
      '%02 - '
      '%03\%04- %02 '
      '- %01'
      '%02\%02 - '
      '[%04] - %01'
      '%03\%02 - '
      '[%04] - %01'
      '%02\%02 - '
      '(%04) - %01'
      '%03\%02 - '
      '(%04) - %01'
      '%02\(%04) - '
      '%02 - %01'
      '%03\(%04) - '
      '%02 - %01'
      '%02\%02 - '
      '[%04] %01'
      '%03\%02 - '
      '[%04] %01'
      '%02\%02 - '
      '(%04) %01'
      '%03\%02 - '
      '(%04) %01'
      '%02\%02 [%04] '
      '- %01'
      '%03\%02 [%04] '
      '- %01'
      '%02\%02 (%04) '
      '- %01'
      '%03\%02 (%04) '
      '- %01'
      '%02\%02 (%04) '
      '%01'
      '%03\%02 (%04) '
      '%01'
      '%02\%02 [%04] '
      '%01'
      '%03\%02 [%04] '
      '%01'
      '%02\(%04) %02 '
      '- %01'
      '%03\(%04) %02 '
      '- %01'
      '%02\%04_-_%0'
      '2_-_%01'
      '%03\%04_-_%0'
      '2_-_%01'
      '%02\%04_%02'
      '_-_%01'
      '%02\%04_%02 '
      '- %01'
      '%03\%04_%02 '
      '- %01'
      '%02\%04 - %02 '
      '- %01'
      '%03\%04 - %02 '
      '- %01'
      '%02\%02 - %04 '
      '- %01'
      '%03\%02 - %04 '
      '- %01'
      '%02\%04- %02 '
      '- %01'
      '%03\%04- %02 '
      '- %01'
      '%02\%04-%02 - '
      '%01'
      '%03\%04-%02 - '
      '%01'
      '%02 - %03\%04 '
      '%02 - %01'
      '%03\%04 %02 - '
      '%01'
      '%02 - %03\%04 '
      '- %01'
      '%02\%03\%04 '
      '- %01'
      '%02 - %03\%02 '
      '- %01'
      '%02\%02 - %01'
      '%03\%02 - %01'
      '%04 - %01'
      '%02\%03\%04. '
      '%01'
      '%02-%03\%04-'
      '%02-%01'
      '%02-%03\%02-'
      '%04-%01'
      '%02 - '
      '%03\%04-%02-'
      '%01'
      '%02 - '
      '%03\%02-%04-'
      '%01'
      '%02\%02-%04-'
      '%01'
      '%03\%02-%04-'
      '%01'
      '%02\%04-%02-'
      '%01'
      '%03\%04-%02-'
      '%01'
      '%02\%04-%01'
      '%02_%03\%02'
      '_%01'
      '%02_%03\%02'
      '_%04_%01'
      '%02_%03\%04'
      '_%02_%01'
      '%02\%02_%04'
      '_%01'
      '%03\%02_%04'
      '_%01'
      '%02\%02_%01'
      '%03\%02_%01'
      '%01')
    TabOrder = 7
    Visible = False
  end
end
