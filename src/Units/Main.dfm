object frmMain: TfrmMain
  Left = 215
  Top = 117
  Caption = 'frmMain'
  ClientHeight = 434
  ClientWidth = 763
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 297
    Top = 46
    Width = 4
    Height = 368
    AutoSnap = False
    Color = clBtnFace
    MinSize = 1
    ParentColor = False
    ResizeStyle = rsUpdate
  end
  object FileListBox1: TFileListBox
    Left = 8
    Top = 328
    Width = 17
    Height = 73
    TabStop = False
    FileType = [ftReadOnly, ftHidden, ftSystem, ftArchive, ftNormal]
    ItemHeight = 13
    TabOrder = 3
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 8
    Top = 248
    Width = 17
    Height = 73
    TabStop = False
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 297
    Height = 368
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Constraints.MinWidth = 100
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 293
      Height = 364
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      TabStop = False
      object TabSheet1: TTabSheet
        Caption = '_Collection'
        object Image1: TImage
          Left = 8
          Top = 279
          Width = 41
          Height = 57
          Picture.Data = {
            07544269746D61702E090000424D2E0900000000000076000000280000004600
            00003E0000000100040000000000B8080000C40E0000C40E0000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FF8F8F8888FFF8FFFFFFFF8FFFF888FFF8FF8F8F8F88FFF888F8888FF8FF
            88FF8F8FFF00FFF88FFF8FFF8F8F8FF88F8FFFF8FFFFFF88FFFF88FF8FF8FFFF
            88F88F8FF88FF8FFFF00FFFF8F8F88888FF8F88FFF88FF8FFFFFF8FF8FFF8FFF
            F88FFFF8FFFFFFF8FFFFF88FF8008F8F88FFFFFF8FF8FF8888FF8FFF8FFF8FF8
            F8FFFFFFFFFFFFFFFF8FFFFF8F8FFFFF8F00FF88FFF888FFFFFFFFF8F88F888F
            8F8FF88F88F8F8FF8FFF88FFFFFFFFFF8888FF8FFF00FF8F88FF8F8FF8FF88FF
            FFFFF888FFFFFFF8FF8FF8FFFFFFFF8F88F88FF888F8FFF8FF0088F88F88F88F
            F88888F88FFF8FFF88F8FFF8FFFFFFFFFFFFFFFFF8FFFFFFFF8FFF8FFF00F8F8
            8FFFFFF8FFFFFF8FFFFFFF88F8F8FFFFFFF8FF8FFF8FFFFF8FF88FFF8FF8FFFF
            FF00FFFFF88F88FF8FFFFFF88F8F8FF8F8F888FFFF88FFFFF8FFFFFFFFF8FF8F
            8FFF88F8FF008FFFFFFFFF8FFFFFF8F88FF8FF8FF8FFFF888FF8FFFFF8FFFF88
            FFFFFFF888FFF8FF8800F8FFFFFFFF8FF8F8FFFFFFFF8FFFFFF8F8F8FFFF8FF8
            8F8FFFFFF8FF8FFFFFF8FFFFF8008FFF88FF88FFFFFF88FFF8FFF88888FFFFF8
            FFFFFFFFFF8F8FFFFFFFFFFFFFFF8FF88F00FFF8FFF8F8FF8FFFFFFFF8F8F8FF
            888F8F8FFFF8FFF8FFFFFFFFF8FF8FF88F88F8FF8F008FFFF88FFF8F8FFFFF8F
            FFFFFFFFFF88FFF8F8FF8F88FF88FF8FFFFFF8F8FF8FFFFFFF00FFFFFF8FF888
            F8FFFFFFFFFF88FF8F8FFF8FFF88FFFFFFFFFFFFFFFFF88888FFFFFF8F00F888
            FFFFFFFFFFF888FF8F88FFF8FF8F8FFF888FFFFFFFFFFF888FF8F88FFF8FF8F8
            FF00FFF88FFFFFFFFFFFFFFFFF88888FFFFFF8FFFFFFF8FF888F8FFFFFFFFFF8
            8FF8F8FFF8008F8FF8F88FF88FFFFFFFFF8F8FF8FFFFFFF8FFFF88FFF8F8FFFF
            F8FFFFFFFFFFF88FFF00FFFF8FFF8FFFFFFF8F8FF8FF88F88F8FF8FFFF8FFF8F
            8FF8FFFFFFFF8F8F8FF8F8F8F8008FFFFFFFFFF8F8FFFFFFFFFFFFFFF8FF88F8
            FFF88FF88FFFFFF88FFF8FFF8F888FFFFF008FFFF8FF88F8FFFFFF8FF8FFFFFF
            8FFFFF8F8FFFFFFFF8FF8F8FFFFFFFF8FFFFFF8F8F0088FF8FFFFF8FFFF88FFF
            FFFF888FFF8FF888FFFFFFFFF8FFFFFF8F88FF8FF8FF8FFFF800FFF88FFFFF8F
            FFFFFFFF8FF8F8FFF88F8FFFFFFF88F88FF8FFFFFF88F8F8FF8F8F888F00FFFF
            8FF8FFF8FF8FF8FF88FFF8FF8FFFFFFF8F88FFFFFF8FFFFFF8FFFFFFF88F8F8F
            FF008FFFFFFFFFFFFFFFFF8FFFFFFFF8FFF8FFF88F8FF88F88FF88888F88FFF8
            FFF88F8FFF008FF8FF8FFFF8FFF8F88F88FF888F8F8F8FFFF8F88FF8F8FF8FF8
            8FFFFFFF888FFFFFFF00F88F8F8FF8FFF88FFFFFFFFFFFF88FF8FFFFFF8FFF88
            8FFFFFFFFF8F88F888F8F8FF88008F8FFFFFFFFFFFFFFFFF8FFFF8F8FFFFF8F8
            F8F88FFFFFF8FF8FF8888FF8FFF8FFF8FF00F8FFF8FFFF88FFFF8FFFFFFF8FFF
            FF88FF8FFFF8F8FF888FFF8F88FFF88FF8FFFFFF8F008FFFF88FF8FF8FFFF88F
            88FFFF88FF8FFFFFFF88FFF8FFF8F8F8FF88F8FFFF8FFFFFF800F8F8F8F88FFF
            888F8888FF8FF88FF8F8FFF8F8F8F88F8FFFFFFFFFFFF8FFFF888FFF8F00F8FF
            F888FFFF8FFFFFFFFFFFF8F88F8F8F8FFF8F8FFF8FF8FF8888F888FFF88F8F8F
            8F008FFFFFF8FFFF8F88FF8F8F8FFF8FFF88FFFFFFF8FF88FFFF88F88FFFF8FF
            8FF88FFFF800F8FFFFFF8FF88FFF88F8FFF888FF8F8FFFF8FF88FFFFF8FFFFFF
            F8FFFF88FFFF8FFF8F00FF8FFF8FFF8FF8888FF8FF8FFFFFF88F8F8F8FFFFF8F
            8FFF8FFFFFFFFFFFFFFFFFF8F80088FF8F8F8F8F88F8FFFFFFFFF888FFF88FFF
            FF8FF88F8FFFFFFFFFF88FFF8FF8F8F88F00FFFFFFF888FFFFFFF88FF8FF8F8F
            F88F8FFFF8F8F8F888FF88F88F8FFFFFFFF8FF8FF800FFF8F88FFF8FFF88F8F8
            88FF88F88F88F88FFF8FFF8FFFFFFFF8FFFFFFFFFFFFFFFFF800FFF8F8F88FFF
            FFFF8FFFFFF8FFFFFF88F8FFFFFFF8FF8FFF88FF8FF8FF8FFF8FF8FFFF00F888
            F8F8FF8F8F8FFFFFFF8FF88F88FFFFFFF8F88FFF8F8FF8FFFFFFFFF8FFFFF88F
            FF008FFFF8FF8FF8FF8FF8FFFFFF8FFFFFFFFF888FF8FFF888FFFFFFF88FFFF8
            FFFFF8FF8800F8F8FFFFFF8FFFFFFFF8F8FF8FFFFFFFF8F8FFFFF8FFFFFF8FF8
            FFFFFF8F88FF8FFFF800FFFFF88888FFF8F8F88FFFFFF88FF88FFF8F88FF8FFF
            FFFFFFFFFFFF8F8FFFFFFFFFF8008F8F8F8FF8F8F8FFFFFFFF8FF8F8FFF8FFFF
            8FF8F88F88FF8FF8FF8FFFFFF8FFF8FFFF00FFF88FFFFFFFFFFF8FFFFF8F8FFF
            88FFFF8FFFFFFF8FF8F8FFFFFFFFF88FF88F8FF8F8008FFF8F8FF88FFFFFFFFF
            F8F888FF8FFFFFFF8FFFFFF88888FFFFFFFFFFFFFFFFF88FFF00FF8F8FF8FFF8
            8F8FF888FFFFFFFFFFF888FFF8F8FF8FFF88F8FF888FFFFFFFFFFF888F00F8FF
            FFFF88888FFFFFFFFFFFFFFFFF88FFF8FFF8F8FF88FFFFFFFFFF8F888FF8FFFF
            FF00FFFFFFF8FF8F8FFFFFFFFF88FF88F8FF8F8FFF88FFFFFFFFFFF8FFFFF8F8
            FFF88FFFF800F8FF8F88F88FF8FF8F8FFFFFFF8FFF8FFFF8F8F8F8FF8F8F8FFF
            FFFFF8FF8F8FFF8FFF00F88FF8FFFFFFFFFFFFFFF8F8FFFFFFFFFF8FFFFF8888
            8FFF8FFF88FFFFFF88FF88FFF8008FFFFF8FFFFFF8FF8FFFFFF8F88FF8FFFF8F
            8F8FFFFFF8FFFFFFFF8F8FF8FFFFFFFF8F0088FF8FFF888FFFFFFF88FFFF8FFF
            FF8FF888FFFF8FF8FF8FF88F8FFFFFF8FFFFFFFFF800FF8F88FFF8F8FF8FFFFF
            FFFF8FF8FF88FFFF888F8F8FF8F8F88FFFFFF8FF88F88FFFFF00FFFFFF8FF8FF
            F88FF8FFF8F8FFFFFF8FFFFFFF8F8F88FFFFFFF8FFFFFF8FFFFFF88F8F00FFF8
            FFF8FFFFFFFF8FFFFFFFF88FFFFFFF8FFF8F88FFF8FFF88F88888FF88F88F88F
            8800FF8F8F8F888FF88F88F8FFFFFFFF8FF8FF8FFFFFFF888FFFFFFF88FF8FF8
            F8FF88F8FF00FFF8FF8888FFFFFFFFFF88FFF8FF8F8F88F88FF8F8F888F88F8F
            FFFFFFFF888FFF88FF00F8FFFFF8F8FFFF8FFFFFFFFFFFFFFFFF8F8FF8FFF8FF
            F8FF8888FF8FF8FFFFFF88F8F8008FF88FFFFF8FFFFFFF8FFFF88FFFF8FFF8FF
            8FFFFFF8FF88FFF88F8FF88888F8F8FFFF00FFFF8FF88FF8F88F88FFFF8FF8FF
            88FFFF88FFFFFF8FFFF8F88FF8F8F8FFF8FFF88FFF00FFF8F8FF88FF8FF8888F
            888FFF88F8F8F8FF8FFF888FFFF8FFFFFFFF8FFF8888F8F8FF00}
        end
        object TreeView3: TTreeView
          Left = 8
          Top = 200
          Width = 41
          Height = 33
          Indent = 19
          TabOrder = 1
          TabStop = False
        end
        object TreeView2: TTreeView
          Left = 8
          Top = 160
          Width = 41
          Height = 33
          Indent = 19
          TabOrder = 2
          TabStop = False
        end
        object ListBox5: TListBox
          Left = 72
          Top = 112
          Width = 57
          Height = 41
          ItemHeight = 13
          TabOrder = 3
          Visible = False
        end
        object ListBox4: TListBox
          Left = 8
          Top = 240
          Width = 41
          Height = 33
          TabStop = False
          ItemHeight = 13
          TabOrder = 4
        end
        object ListBox3: TListBox
          Left = 8
          Top = 120
          Width = 41
          Height = 33
          TabStop = False
          ItemHeight = 13
          TabOrder = 5
        end
        object ListBox2: TListBox
          Left = 8
          Top = 80
          Width = 41
          Height = 33
          TabStop = False
          ItemHeight = 13
          TabOrder = 6
        end
        object DriveComboBox1: TDriveComboBox
          Left = 8
          Top = 280
          Width = 17
          Height = 19
          TabOrder = 7
          TabStop = False
        end
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 285
          Height = 336
          Align = alClient
          BevelKind = bkSoft
          BorderStyle = bsNone
          HideSelection = False
          Images = ImageList1
          Indent = 19
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          OnChange = TreeView1Change
          OnGetSelectedIndex = TreeView1GetSelectedIndex
          OnKeyDown = ListView1KeyUp
          OnMouseDown = TreeView1MouseDown
        end
        object ListBox1: TListBox
          Left = 16
          Top = 16
          Width = 265
          Height = 57
          TabStop = False
          ItemHeight = 13
          Items.Strings = (
            '000English'
            '001Collection'
            '002New'
            '003Open'
            '004Save'
            '005Save as'
            '006Import'
            '007Statistics'
            '008Report'
            '009Exit'
            '010Edit'
            '011Add volume'
            '012Update volume'
            '013Delete volume'
            '014Sort all'
            '015Search'
            '016Find'
            '017On drive'
            '018Property'
            '019Tag'
            '020Duplicates'
            '021View'
            '022Font...'
            '023Grid lines'
            '024Hot track'
            '025Toolbar'
            '026Status bar'
            '027Tools'
            '028Rename label'
            '029Tag editor'
            '030CD cover'
            '031Options...'
            '032?'
            '033Info'
            '034History'
            '035License'
            '036Homepage'
            '037Send Feedback'
            '038Donation'
            '039About'
            '040'
            '041Name'
            '042Title'
            '043Artist'
            '044Album'
            '045Track'
            '046Year'
            '047Comment'
            '048Can not open the file'
            
              '049The collection has changed. Would you like to save the change' +
              's?'
            '050Confirmation'
            '051Error'
            '052Information'
            '053Warning'
            '054Ok'
            '055Yes'
            '056No'
            '057Cancel'
            '058Loading'
            '059Read data'
            '060Build collection'
            '061Refresh window'
            '062MB'
            '063'
            '064H:M:S'
            '065~'
            '066'
            '067'
            '068Folder(s)'
            '069File(s)'
            '070'
            '071Stereo'
            '072Joint Stereo'
            '073Dual Channel'
            '074Mono'
            '075MPEG'
            '076Layer'
            '077Can not save in the file'
            '078Saving'
            '079Please wait'
            '080Total size'
            '081Total duration'
            '082Average bitrate'
            '083Volume count'
            '084File count'
            '085Last change'
            '086GB'
            '087Hour(s)'
            '088Volume(s)'
            '089Source'
            '090Tag info'
            '091Save'
            '092Remove'
            '093Close'
            '094The file is not valid'
            '095The file does not exist'
            '096Can not write tag in the file'
            '097Can not remove tag in the file'
            '098Can not read the selected drive!'
            
              '099The selected volume already exists in the collection. Would y' +
              'ou like to update it?'
            '100The source does not contain audio files.'
            '101Adding'
            '102Scanning'
            '103Volume'
            '104Directory'
            '105File'
            '106Volume list'
            '107There are no items selected!'
            '108Deleting'
            '109Do you really want to delete the selected volume(s)?'
            '110Remove selection'
            '111Sorting'
            '112Reindex data'
            '113Do you really want to sort the collection?'
            '114The sorting finished successfully.'
            '115Importing'
            '116Load data'
            '117Copy data'
            '118Clear buffer'
            '119The importing finished successfully.'
            '120Name'
            '121'
            '122In'
            '123Directory and file'
            '124Directory'
            '125File'
            '126Options'
            '127Match case'
            '128Searching'
            '129'
            '130Terms'
            '131Bitrate'
            '132Sample rate'
            '133Channel mode'
            '134MPEG version'
            '135MPEG layer'
            '136Valid tag'
            '137Present'
            '138Not present'
            '139There are no matches.'
            '140Found'
            '141Building'
            '142On start up'
            '143Auto open last collection'
            '144Restore last window settings'
            '145Language pack'
            '146Default'
            '147The default language restored.'
            '148'
            '149Marked'
            '150Can not import from the file'
            '151Convert data'
            '152Play'
            '153Enqueue'
            '154Save as playlist'
            '155Listing'
            '156Create playlist'
            '157Can not create a playlist in the file'
            '158Can not find the source of the selected item'
            '159Drive label'
            '160Drive serial'
            '161Collection file'
            '162Playlist file'
            '163Updating'
            '164Do you really want to delete this volume?'
            '165Do you really want to update this volume?'
            '166Object'
            '167Report format'
            '168Information'
            '169Text'
            '170DIF for Excel'
            '171Size'
            '172Duration'
            '173Folder count'
            '174Date'
            '175Folder'
            '176MPEG version/layer'
            '177Tag'
            '178Save report as'
            '179Text'
            '180Process'
            '181The report successfully created in the file'
            '182Copy all selected objects'
            '183Format report'
            '184Write report in file'
            '185Compare'
            '186There are no duplicates.'
            '187Print'
            '188CD-ROM drive'
            '189Page zoom'
            '190Zoom to fit'
            '191Zoom to height'
            '192Zoom to width'
            '193Up'
            '194Down'
            '195HTML page'
            '196Stretch'
            '197Horizontal'
            '198Vertical'
            '199All items'
            '200Marked only'
            '201Not all directories of the source are readable!'
            
              '202The selected file already exists! Would you like to replace i' +
              't?'
            '203General settings'
            '204Backup for old collection files'
            '205Miscellaneous'
            '206Numeration for directories'
            '207Add current date'
            '208CD label'
            '209Scan valid files only'
            '210Extra columns...'
            '211Type'
            '212Clear'
            '213Reopen'
            '214File extensions'
            '215Numeration'
            '216Various'
            '217Full path'
            '218Object(s)'
            '219Summary'
            '220File renamer'
            '221Do you really want to rename files?'
            '222Merge'
            '223Do you really want to merge the selected volume(s)?'
            '224Use guessed encoder as comment'
            '225Preferred ID3-tag version'
            '226Rename'
            '227Can not rename with'
            '228Restore'
            '229Filter'
            '230Add'
            '231Delete'
            '232Do you really want to delete the selected file(s)?'
            '233Can not delete the file'
            '234Auto size'
            '235Use foobar2000 for playing'
            '236Include all files in collection'
            '237Copy To Clipboard'
            '238Where is foobar2000?'
            '239Genre'
            '240Eject CD'
            '241Check this if you want the CD to be ejected after scanning'
            '242Open in Explorer'
            '243Capitalize'
            '244Don'#39't change'
            '245Every Word'
            '246First word'
            '247lowercase'
            '248UPPERCASE'
            '249Replace'
            '250Use replacement-filter'
            '251Wizards'
            '252Filename > Tag'
            '253Numeration'
            '254Remove Tags'
            '255Write only in existing tag-formats'
            '256Exceptions'
            '257<delete>'
            '258Clear all fields'
            '259Tagging...'
            '260Tag preview'
            '261Remove all tag-formats'
            '262Remove only specified tag-formats:'
            '263Tag-formats'
            '264ID3v1'
            '265ID3v2'
            '266APE'
            '267Tag version'
            '268Filename To Tag'
            '269Guess tag from filename'
            '270Use own scheme:'
            '271Disregard'
            '272Preview'
            '273Start with number:'
            '274Skip numbers (seperate with ; ):'
            '275Preview'
            '276Use only for specified tags'
            '277Select'
            '278Various Artists'
            '279Edit-mode:'
            '280Set value'
            '281Move up'
            '2821) Search-source'
            '2832) Album-selection'
            '2843) Set information'
            '285Calculate from CD:'
            '286Calculate from files (all tracks in correct order needed)'
            '287Enter ID manually:'
            '288Web-search:'
            '289Search in'
            '290Rest'
            '291Move down'
            '292ID'
            '293Freedb'
            '294Clear results'
            '295Composer'
            '296Orig. Artist'
            '297Copyright'
            '298Encoded by'
            '299Update'
            '300Undo'
            '301Copy to ID3v1'
            '302Copy from ID3v1'
            '303CRC'
            '304Copyright'
            '305Original'
            '306Emphasis'
            '307Can not save tag to the file: '
            '308You have to select a file!'
            '309View file info (Edit ID3)'
            '310File not found!'
            '311Data loaded from database!'
            '312Not avaible in this mode!'
            '313Nominal BitRate'
            '314Serial Number'
            '315Version'
            '316Vendor'
            '317Standard tags'
            '318Other'
            '319Physically remove selected'
            
              '320All selected files will be REMOVED PHYSICALLY from the disc! ' +
              'Are you sure?'
            '321Set capitalization:'
            '322lower case'
            '323UPPER CASE'
            '324Large Case'
            '325Like a sentence'
            '326iNVERT CASE'
            '327rAnDom cASe'
            '328unchanged'
            '329Swap Artist <> Title (Ctrl+Up)'
            '330Auto sort collection after adding a new volume'
            '331Auto save collection after adding a new volume'
            '332Word delimiters'
            '333Filename format'
            '334Delete fields if they'#39're not empty'
            
              '335Can be used to get the values of the fields from the filename' +
              ' by pressing CTRL+DOWN %a - artist %b - title %c - album %d - da' +
              'te %e - track %f - genre %h - comment'
            '>>>Translation by Jurgen Faul'
            '>>>Correction by Joerg Walther')
          TabOrder = 8
          Visible = False
        end
      end
      object TabSheet2: TTabSheet
        Caption = '_Artist'
        ImageIndex = 1
        object Label1: TLabel
          Left = 40
          Top = 224
          Width = 208
          Height = 39
          Alignment = taCenter
          Caption = 
            'There should go the collection sorted by the artists but I'#39'm sti' +
            'll thinking how to do it in the right way'
          WordWrap = True
        end
        object tvArtists: TTreeView
          Left = 0
          Top = 0
          Width = 241
          Height = 169
          Indent = 19
          TabOrder = 0
        end
      end
    end
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 414
    Width = 763
    Height = 20
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end>
    ParentShowHint = False
    ShowHint = True
    UseSystemFont = False
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 763
    Height = 46
    AutoSize = True
    Bands = <
      item
        BorderStyle = bsSingle
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 38
        Width = 757
      end>
    ShowText = False
    object ToolBar2: TToolBar
      Left = 12
      Top = 2
      Width = 743
      Height = 38
      AutoSize = True
      ButtonHeight = 38
      ButtonWidth = 44
      Images = ImageList3
      TabOrder = 0
      Transparent = True
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = New1Click
      end
      object ToolButton2: TToolButton
        Left = 44
        Top = 0
        DropdownMenu = PopupMenu2
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = Open1Click
      end
      object ToolButton3: TToolButton
        Left = 88
        Top = 0
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = Save1Click
      end
      object ToolButton5: TToolButton
        Left = 132
        Top = 0
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = Statistic1Click
      end
      object ToolButton6: TToolButton
        Left = 176
        Top = 0
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = Report1Click
      end
      object ToolButton7: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Enabled = False
        Style = tbsDivider
      end
      object ToolButton8: TToolButton
        Left = 228
        Top = 0
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = Add1Click
      end
      object ToolButton9: TToolButton
        Left = 272
        Top = 0
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = Delete1Click
      end
      object ToolButton10: TToolButton
        Left = 316
        Top = 0
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = Sort1Click
      end
      object ToolButton11: TToolButton
        Left = 360
        Top = 0
        Width = 8
        Enabled = False
        Style = tbsDivider
      end
      object ToolButton12: TToolButton
        Left = 368
        Top = 0
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = Search1Click
      end
      object ToolButton16: TToolButton
        Left = 412
        Top = 0
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
        OnClick = Tageditor1Click
      end
      object ToolButton4: TToolButton
        Left = 456
        Top = 0
        Caption = 'ToolButton4'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = Filerenamer1Click
      end
      object ToolButton17: TToolButton
        Left = 500
        Top = 0
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
        OnClick = CDcover1Click
      end
      object ToolButton13: TToolButton
        Left = 544
        Top = 0
        ImageIndex = 13
        OnClick = ToolButton13Click
      end
      object ToolButton19: TToolButton
        Left = 588
        Top = 0
        Width = 8
        Style = tbsDivider
      end
      object ToolButton20: TToolButton
        Left = 596
        Top = 0
        ImageIndex = 12
        ParentShowHint = False
        ShowHint = True
        OnClick = About1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 301
    Top = 46
    Width = 462
    Height = 368
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 5
    object Splitter2: TSplitter
      Left = 1
      Top = 251
      Width = 460
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ResizeStyle = rsUpdate
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 460
      Height = 250
      Align = alTop
      Caption = 'Panel3'
      TabOrder = 0
      object ListView1: TListView
        Left = 1
        Top = 1
        Width = 458
        Height = 248
        Align = alClient
        Columns = <>
        HideSelection = False
        MultiSelect = True
        RowSelect = True
        PopupMenu = PopupMenu1
        SmallImages = ImageList1
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnColumnClick = ListView1ColumnClick
        OnCompare = ListView1Compare
        OnDblClick = ListView1DblClick
        OnEdited = ListView1Edited
        OnEditing = ListView1Editing
        OnKeyDown = ListView1KeyUp
        OnMouseMove = ListView1MouseMove
        OnSelectItem = ListView1SelectItem
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 254
      Width = 460
      Height = 113
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 1
      object lvSearchResults: TListView
        Left = 1
        Top = 25
        Width = 458
        Height = 87
        Align = alClient
        Columns = <>
        IconOptions.WrapText = False
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = pmnSearch
        SmallImages = ILSearchResults
        TabOrder = 0
        TabStop = False
        ViewStyle = vsReport
        OnColumnClick = lvSearchResultsColumnClick
        OnCompare = ListView1Compare
        OnDblClick = lvSearchResultsDblClick
        OnKeyDown = lvSearchResultsKeyDown
        OnMouseMove = lvSearchResultsMouseMove
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 458
        Height = 24
        Align = alTop
        TabOrder = 1
        object cbDuplicates: TComboBox
          Left = 0
          Top = 1
          Width = 481
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 0
          TabStop = False
          OnChange = cbDuplicatesChange
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    Images = ImageList2
    ParentBiDiMode = False
    Left = 480
    Top = 136
    object Collection1: TMenuItem
      Caption = '_Collection'
      OnClick = Collection1Click
      object New1: TMenuItem
        Caption = '_New'
        ImageIndex = 0
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = '_Open'
        ImageIndex = 1
        ShortCut = 16463
        OnClick = Open1Click
      end
      object Reopen1: TMenuItem
        Caption = '_Reopen'
      end
      object Save1: TMenuItem
        Caption = '_Save'
        ImageIndex = 2
        ShortCut = 16467
        OnClick = Save1Click
      end
      object Saveas1: TMenuItem
        Caption = '_Save as'
        OnClick = Saveas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Statistic1: TMenuItem
        Caption = '_Statistic'
        ImageIndex = 4
        ShortCut = 16457
        OnClick = Statistic1Click
      end
      object Report1: TMenuItem
        Caption = '_Report'
        ImageIndex = 5
        ShortCut = 16466
        OnClick = Report1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = '_Exit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = '_Edit'
      OnClick = Edit1Click
      object Add1: TMenuItem
        Caption = '_Add'
        ImageIndex = 6
        ShortCut = 119
        OnClick = Add1Click
      end
      object Delete1: TMenuItem
        Caption = '_Delete'
        ImageIndex = 7
        ShortCut = 16460
        OnClick = Delete1Click
      end
      object Import1: TMenuItem
        Caption = '_Import'
        OnClick = Import1Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object Update2: TMenuItem
        Caption = '_Update'
        ShortCut = 115
        OnClick = Update1Click
      end
      object Rename2: TMenuItem
        Caption = '_Rename'
        ShortCut = 113
        OnClick = Rename1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Sort1: TMenuItem
        Caption = '_Sort'
        ImageIndex = 8
        OnClick = Sort1Click
      end
    end
    object View1: TMenuItem
      Caption = '_View'
      object Gridlines1: TMenuItem
        Caption = '_Grid lines'
        OnClick = Gridlines1Click
      end
      object Hottrack1: TMenuItem
        Caption = '_Hot track'
        OnClick = Hottrack1Click
      end
      object Fullpath1: TMenuItem
        Caption = '_Full path'
        OnClick = Fullpath1Click
      end
      object Fileextensions1: TMenuItem
        Caption = '_File extensions'
        OnClick = Fileextensions1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object Toolbar1: TMenuItem
        Caption = '_Tool bar'
        Checked = True
        OnClick = Toolbar1Click
      end
      object Statusbar1: TMenuItem
        Caption = '_Status bar'
        Checked = True
        OnClick = Statusbar1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Font1: TMenuItem
        Caption = '_Font'
        OnClick = Font1Click
      end
      object Columns1: TMenuItem
        Caption = '_Columns'
        OnClick = Columns1Click
      end
    end
    object Tools1: TMenuItem
      Caption = '_Tools'
      object Cheat1: TMenuItem
        Caption = 'Cheat'
        ShortCut = 24688
        Visible = False
        OnClick = Cheat1Click
      end
      object Selection1: TMenuItem
        Caption = 'Selection'
        ShortCut = 16449
        Visible = False
        OnClick = Selection1Click
      end
      object Copy1: TMenuItem
        Caption = 'Copy'
        ShortCut = 16451
        Visible = False
        OnClick = Copy1Click
      end
      object Search1: TMenuItem
        Caption = '_Search'
        ImageIndex = 9
        ShortCut = 114
        OnClick = Search1Click
      end
      object Tageditor1: TMenuItem
        Caption = '_Tag editor'
        ImageIndex = 10
        ShortCut = 16468
        OnClick = Tageditor1Click
      end
      object Filerenamer1: TMenuItem
        Caption = '_File renamer'
        ImageIndex = 3
        ShortCut = 16454
        OnClick = Filerenamer1Click
      end
      object CDcover1: TMenuItem
        Caption = '_CD cover'
        ImageIndex = 11
        ShortCut = 16470
        OnClick = CDcover1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Options1: TMenuItem
        Caption = '_Options'
        OnClick = Options1Click
      end
    end
    object Help1: TMenuItem
      Caption = '_?'
      object Info1: TMenuItem
        Caption = '_Info'
        ShortCut = 112
        OnClick = Info1Click
      end
      object History1: TMenuItem
        Caption = '_History'
        OnClick = History1Click
      end
      object License1: TMenuItem
        Caption = '_License'
        OnClick = License1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Homepage1: TMenuItem
        Caption = '_Homepage'
        OnClick = Homepage1Click
      end
      object Feedback1: TMenuItem
        Caption = '_Feedback'
        OnClick = Feedback1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = '_About'
        ImageIndex = 12
        OnClick = About1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 544
    Top = 136
  end
  object ImageList1: TImageList
    Left = 328
    Top = 80
    Bitmap = {
      494C010119001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007000000001002000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFD6A500000000004C3A
      40009C766100AB817500B08C8700B3B9B30084AD8F0068A8A2004EB09C000037
      240000000000FFD6A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005645
      3500A6846D00B8958200C0998A00D2A69700C5B09300839A7C0071A78000003E
      1100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFDCAE00000000009C70
      3F00FFBE7F00FFC89600FFC58D00FFCD9D00FFDEBC00FFDAA700DA915700345A
      330000000000FFDCAE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFE0B40000000000FFCF
      7100FFECC100FFE8BD00FFE3B500FFDFB200FFDEB100FFDBAC00FFD6A300807A
      370000000000FFE0B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFE3B700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFE3B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFE6BD00000000004C3A
      40009C766100AB817500B08C8700B3B9B30084AD8F0068A8A2004EB09C000037
      240000000000FFE6BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFE7BF00000000005645
      3500A6846D00B8958200C0998A00D2A69700C5B09300839A7C0071A78000003E
      110000000000FFE7BF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C70
      3F00FFBE7F00FFC89600FFC58D00FFCD9D00FFDEBC00FFDAA700DA915700345A
      3300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFEAC30000000000B07C
      4000FFE7BE00FFE2BB00FFDFB400FFDAAD00FFDFB900FFE1BE00FFB96D003D60
      300000000000FFEAC30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF2CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFECC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF3CF00000000004638
      37004C3F3B007F6A69008AA09B00529B80004A9A8C003EA3960018827200006A
      480000000000FFEDC70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF2CE00000000005645
      3500A6846D00B8958200C0998A00D2A69700C5B09300839A7C0071A78000003E
      110000000000FFEFCA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C70
      3F00FFBE7F00FFC89600FFC58D00FFCD9D00FFDEBC00FFDAA700DA915700345A
      3300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF2CE0000000000B07C
      4000FFE7BE00FFE2BB00FFDFB400FFDAAD00FFDFB900FFE1BE00FFB96D003D60
      300000000000FFF2CE0000000000000000000000000000000000000000000000
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
      00000000000000000000737373005A5A5A005A5A5A005A5A5A00737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373007373730073737300737373007373730073737300737373007373
      7300737373007373730073737300737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000737373005A5A5A005A5A
      5A005A5A5A000073AD000073A5000073A5000073AD00006BA500424242005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C5A
      5A008C5A5A008C5252008C5252008C5252008C5A5A008C5252008C5A5A008C52
      52008C5A5A008C5A5A008C525200737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210021212100212121002121
      21002121210010ADDE0029C6EF0029BDDE0029C6EF00007BAD00212121002121
      2100212121002121210021212100424242000000000000000000000000000000
      0000C6C6C60000000000D6D6D600848484000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD7300DEAD7300DEAD
      7300FFCECE00E7C6A500DEB59C00E7CEBD00FFCECE00F7DEBD00FFCECE00FFE7
      C600FFCECE00FFCEAD0084525200737373000000000000000000000000000000
      00000000000000000000000000008C8C8C008C8C8C008C8C8C00000000000000
      0000000000000000000000000000000000009C9C9C00FFF7DE00FFF7DE00FFF7
      E700FFF7E70031ADD600BDE7EF00CEF7FF00ADE7F700188CBD00FFF7DE00FFF7
      DE00FFF7DE00FFF7DE00212121005A5A5A000000000000000000000000008484
      8400FFFFFF00639C9C008484840000000000D6D6D60084848400000000000000
      000000000000000000000000000000000000DEAD7300C6A5840000000000CE8C
      39008C5A2900633918006B4231006339180084634200DEB59C00F7D6BD00FFCE
      CE00FFE7C600FFCEAD0084525200737373000000000000000000000000000000
      00000000000094949400636363008C848400524A4A004A4A4A005A5A5A007373
      7300000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C004AB5DE00DEEFEF00FFFFFF00D6EFF7001094BD009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000000000000000000084848400FFFF
      FF00D6D6D600A5A5A50084848400639C9C008484840000000000D6D6D6008484
      840000000000000000000000000000000000DE9C310000000000CE8C3900A573
      2900EF9C3100EF943100F7AD3900EFD67300EFBD6B005A423100D6BD9400FFDE
      BD00FFDEBD00FFCEAD0084525200737373000000000000000000000000008484
      8400737373008C8C8C00A5A5A500736B6B00393939004A4242005A5252004A4A
      4A00525252007373730000000000000000000000000000000000000000000000
      00000000000021A5D60042B5DE004AB5D600299CC60042A5CE00000000000000
      00000000000000000000000000000000000000000000C6C6C600848484008484
      8400D6D6D600CECECE00CECECE00B5B5B50084848400639C9C00848484000000
      0000D6D6D600848484000000000000000000BD8C5200DE943900A5732900E794
      2900EF942900B5733100E7C6A500CE842900CE842900CE84290084634200EFD6
      B500FFE7C600FFCEAD008452520073737300000000008C8C8C008C8C8C00CECE
      CE00A5A5A5007B7B7B00848484007B7B7B004A4A4A00737373007B7B7B00736B
      6B007363630052525200525252007B7B7B000000000000000000000000000000
      0000000000000000000084848400ADA594001010100039393900000000000000
      00000000000000000000000000000000000084848400FFFFFF00D6D6D600D6D6
      D600CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6C60084848400639C
      9C008484840000000000D6D6D60000000000C6A58400FFD67300A5732900E794
      29008C5A2900FFC69400FFE7C600FFE7C600FFE7C600FFE7C600FFE7CE00EFCE
      AD00FFE7CE00FFCEB5008C5A5A00737373008C8C8C00ADADAD009C9C9C008484
      8400A5A5A500BDBDBD00D6D6D6008C8C8C007B7B7B006B6B6B00848484006363
      630031313100B59C9C008C7373006B6B6B000000000000000000000000000000
      000000000000949494004A4A4A008C8484003129290018181800525252008C8C
      8C00000000000000000000000000000000000000000084848400639C9C00D6D6
      D600CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6C600B5B5B500B5B5
      B50084848400639C9C00848484000000000000000000C6A58400FFCE4200E79C
      21008C5A29008C5A29008C5A29008C5A29008C5A29008C5A2900946B3900E7CE
      BD00FFEFD600FFCEB50094636300737373009C9C9C009C9C9C00B5B5B500C6C6
      C600E7E7E700E7E7E700D6D6D600DEDEDE00D6D6D600C6C6C6009C9C9C007B73
      73004242420094848400847373007B7B7B000000000000000000000000008484
      8400737373008C8C8C00A5A5A500736B6B00393939004A424200524A4A004A4A
      4A00525252007373730000000000000000000000000000000000000000008484
      8400639C9C00CECECE00C6C6C600C6C6C600B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500A5A5A5008484840000000000BD8C520000000000C6A58400F7B5
      2900CE8C2100EFAD4A00EFAD4A00DE8C3100EF9C3100FFAD4200AD7B4A00E7CE
      BD00FFEFDE00FFCEBD009C6B6B0073737300BDBDBD00D6D6D600DEDEDE00C6C6
      C600E7E7E700DEDEDE00F7F7F700FFFFFF00EFEFEF00DEDEDE00F7F7F700EFEF
      EF00DECECE008C8C8C008C8C8C0000000000000000008C8C8C008C8C8C00CECE
      CE00A5A5A5007B7B7B00848484007B7B7B004A4A4A00737373007B7B7B00736B
      6B007363630052525200525252007B7B7B000000000000000000000000000000
      00000000000084848400639C9C00C6C6C600C6C6C600B5B5B500B5B5B500B5B5
      B500B5B5B500A5A5A500000000000000000000000000BD8C520000000000C6A5
      8400A5732900E7C6A500FFFFFF00BD7B2100FFAD4200DE943900AD8C6B00FFEF
      DE00FFF7E700FFCEBD009C6B6B007373730000000000C6C6C600BDBDBD007B7B
      7B006B6B6B00BDBDBD00F7F7F700FFFFFF00EFEFEF00DEDEDE00F7F7F700CECE
      CE00C6C6C600C6C6C6000000000000000000A5A5A500ADADAD009C9C9C008484
      8400A5A5A500BDBDBD00D6D6D6008C8C8C007B7B7B006B6B6B00848484006363
      630031313100B59C9C008C7373006B6B6B000000000000000000000000000000
      000000000000000000000000000084848400639C9C00B5B5B500B5B5B500B5B5
      B500A5A5A50000000000000000000000000000000000B5946300CE9C6300F7E7
      C600EFAD3100C68C2900C68C2900E79C2100EFA52900AD7B4A00FFFFFF00FFF7
      EF00FFF7EF00FFCEBD00A5737300737373000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000009C9C9C009C9C9C00B5B5B500C6C6
      C600E7E7E700E7E7E700D6D6D600DEDEDE00D6D6D600C6C6C6009C9C9C007B73
      73004242420094848400847373007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400639C9C00A5A5
      A500000000000000000000000000000000000000000000000000BD8C5200BD8C
      5200FFEF8C00FFF77300FFCE4200F7BD3100CE9C6300FFFFFF00EFBD6B00F7EF
      E700FFFFF700FFCEBD00AD847B00737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00D6D6D600DEDEDE00C6C6
      C600E7E7E700DEDEDE00F7F7F700FFFFFF00EFEFEF00DEDEDE00F7F7F700EFEF
      EF00DECECE008C8C8C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6AD
      8C00CE9C6300BD8C5200CE9C6300BD8C5200BD8C5200FFFFFF00F7BD31009C6B
      6B009C6B6B009C6B6B00AD847B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD007B7B
      7B006B6B6B00BDBDBD00F7F7F700FFFFFF00EFEFEF00DEDEDE00F7F7F700CECE
      CE00C6C6C600BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6AD
      8C00FFFFFF00FFFFFF00F7EFE700EFD6C600D6AD8C00D6AD8C00EFD6B500B584
      7300FFCEBD00E79C390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00CECECE00D6D6D600E7E7E700CECECE00D6D6D600BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6AD
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B584
      7300CE9C63000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6AD
      8C00D6AD8C00D6AD8C00D6AD8C00D6AD8C00D6AD8C00D6AD8C00D6AD8C00B584
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008C8C8C006B6B6B006363630052525200424242005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400636363005A5A5A00636363007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484005252520073737300000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      00008484840063636300847B7B007B6363009C5A5A00BD6B6B00A56363005A42
      4200636363000000000000000000000000000000000000000000000000000000
      000073737300736B6B00948C8C00B5ADAD00948C8C006B6B6B00525252005252
      52007B7B7B000000000000000000000000000000000000000000000000000000
      000084848400737373005A5A5A009C8C8C007363630042424200525252007373
      730084848400000000000000000000000000C6A58C00BD8C7B00BD947B00BD94
      7B00BD947B00BD947B00BD947B00BD947B00BD947B00BD947B00BD947B00BD94
      7B00BD947B00BD947B00BD947B00848484000000000000000000000000007B73
      7300BDA5A500F7D6D600EFBDBD00844242008C4A4A0084424200A55A5A00D684
      84004A4242008484840000000000000000000000000000000000000000007B73
      7300CEB5B500FFDEDE00FFE7E700FFEFEF00FFEFEF00FFF7F700CECECE007B7B
      7B004A4A4A006B6B6B0000000000000000000000000000000000848484006B6B
      6B008C8C8C00ADADAD0063636300B5ADAD008C737300B59C9C00948484005A52
      52004A4A4A005A5A5A008C8C8C0000000000C69C7B00D6CEBD00D6C6B500D6C6
      B500D6C6BD00D6CEBD00DECEBD00E7D6B500D6CEB500D6CEBD00D6CEBD00D6C6
      B500D6C6B500DECEBD00BD947B008484840000000000000000008C848400EFC6
      C600FFD6D600FFDEDE00DE9C9C00D67B7B00F79C9C00D67B7B00844A4A00CE7B
      7B005A4A4A005A5A5A0084848400000000000000000000000000847B7B00F7C6
      C600FFD6D600FFDEDE00FFDEDE00FFE7E700FFEFEF00FFF7F700FFFFFF00F7F7
      F7009C9C9C004A4A4A007B7B7B00000000000000000084848400ADADAD00D6D6
      D600D6D6D600C6C6C60073737300948C8C003131310010101000080808007B73
      7300C6A5A500847373005252520073737300BD947B00E7FFFF00E7FFFF00E7FF
      FF00F7FFFF00FFFFEF00CEE7FF00948CA500F7EFD600FFFFFF00E7FFFF00E7FF
      FF00E7FFFF00EFFFFF00BD947B0084848400000000008C8C8C00EFC6C600FFCE
      CE00FFCECE00FFD6D600EFB5B500FFB5B500FFE7E700FFADAD00AD636300AD63
      6300A5949400525252007373730000000000000000008C848400F7CECE00FFCE
      CE00FFCECE00FFD6D600FFDEDE00FFDEDE00FFE7E700FFFFFF00FFFFFF00FFFF
      FF00F7F7F7007B7B7B00525252000000000084848400C6C6C600CECECE00C6C6
      C600BDBDBD00CECECE00CECECE008C8C8C00847B7B0063636300212121007373
      730021212100D6B5B500947B7B006B6B6B00BD947B00E7FFFF00E7FFFF00E7FF
      FF007B94D60084637B007B8CA5001073CE00B5847B004A529C00CEB5A500EFFF
      FF00E7FFFF00E7FFFF00BD947B0084848400A59C9C00B5A5A500FFDEDE00FFD6
      D600FFCECE00FFCECE00FFD6DE00EFADB500EFBDBD00EF949400B57373008C5A
      5A00DECECE008484840052525200848484009C9C9C00C6B5B500FFDEDE00FFD6
      D600FFCECE00FFCECE00FFD6DE00FFD6E700FFE7EF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6CECE00525252008C8C8C00B5B5B500BDBDBD00C6C6C600D6D6
      D600EFEFEF00C6BDBD00B5B5B500D6D6D600A5A5A5008484840073737300948C
      8C008C7B7B00527B5A00737B73008C8C8C00BD947B00E7FFFF00E7FFFF00E7FF
      FF007BC6DE002984D6003994D60063EFFF00216BBD00089CE700ADB5A500FFEF
      D600E7FFFF00E7FFFF00BD947B0084848400ADADAD00F7DEDE00FFDEDE00FFDE
      DE00FFD6D600FFE7EF00FFDEFF00FFD6F700FFEFFF00FFFFFF00FFFFFF008C5A
      5A00DECECE00AD848400525252007B7B7B009C9C9C00FFE7E700FFDEDE00FFDE
      DE00FFD6D600FFDEE700FFDEFF00FFD6F700FFE7FF00FFFFFF00FFFFFF00EFDE
      DE00DEBDBD00CE9C9C006B6363006B6B6B00C6C6C600E7E7E700F7F7F700F7F7
      F700F7F7F700EFA5A500A55A5A00C6C6C600BDBDBD00ADADAD00CECECE00A5A5
      A500848484007B737300A59C9C0000000000BD947B00E7FFFF00E7FFFF007384
      BD00317BC60084F7FF0063DEFF005ACEEF004AD6FF0039CEF700184AA500C6B5
      AD00E7FFFF00E7FFFF00BD947B0084848400A5A5A500FFEFEF00FFE7E700FFDE
      DE00FFE7E700FFEFFF00AD94940073737300CEBDC600FFF7FF00CE9C9C008C5A
      5A00DECECE00AD7B7B00523939004A4A4A009C949400FFE7E700FFE7E700FFDE
      DE00FFE7E700FFEFFF00B59CA5006B6B6B00ADADAD00FFF7FF00D6ADAD00CE9C
      9C00CE9C9C00CE9C9C00847373005A5A5A0000000000BDBDBD00D6D6D600DEDE
      DE00EFEFEF00F7ADAD00A55A5A00B5848400DEADAD00E7E7E7009C8C8C009463
      630063636300A59C9C000000000000000000BD947B00E7FFFF00E7FFFF0094D6
      EF005ACEF7006BDEFF00BDE7EF00735A5A00186BA50021B5EF0000A5E700B5CE
      D600E7FFFF00E7FFFF00BD947B0084848400A59C9C00EFBDBD00EFC6C600F7C6
      C600FFD6D600FFEFF700525252004A4A4A00847B7B00FFFFFF00E7BDBD008C5A
      5A00DECECE009452520063313100636363009C8C8C00EFBDBD00EFC6C600F7C6
      C600FFD6D600FFEFF700847373004A4A4A006B6B6B00FFEFEF00EFCECE00E7BD
      BD00E7BDBD00E7C6C600A59494006B6B6B000000000000000000000000000000
      0000BDBDBD00EFADAD00A55A5A00B5848400C6949400FFFFFF00B59C9C00A55A
      5A004A4A4A00A59C9C000000000000000000BD947B00E7FFFF00E7FFFF00E7FF
      FF0084C6EF0052CEFF00DEF7FF0073524A00218CB50029BDF70084CED600DEF7
      FF00E7FFFF00E7FFFF00BD947B00848484009C949400DEADAD00E7ADAD00EFB5
      B500F7D6D600FFEFFF00B5ADAD00847B7B00CEBDC600FFF7FF00FFD6D6008C5A
      5A00C6636300B55A5A007B424200636363009C8C8C00DEADAD00E7B5B500EFB5
      B500F7CECE00FFEFFF00C6BDC600736B6B00B5A5A500FFF7FF00FFDEDE00FFDE
      DE00FFDEDE00FFE7E7008C8484008C8C8C000000000000000000000000000000
      000000000000EFADAD00A55A5A00DEC6C600B59C9C00CECECE00BDA5A500A55A
      5A004A4A4A00A59C9C000000000000000000BD947B00E7FFFF00E7FFFF00E7FF
      FF00ADC6E7005AD6FF00CEE7E7004A313100429CAD0042CEFF00F7E7E700E7FF
      FF00E7FFFF00E7FFFF00BD947B0084848400A59C9C00C69C9C00EFCECE00FFEF
      EF00FFFFFF00FFF7FF00FFDEFF00FFD6FF00FFE7FF00FFDEDE00FFCECE008C5A
      5A00944A4A00BD6363007B6B6B00000000009C9C9C00D6A5A500E7C6C600F7E7
      E700FFFFFF00FFF7FF00FFDEFF00FFD6F700FFE7FF00FFE7E700FFCECE00FFD6
      D600FFDEDE00FFDEDE006B6B6B008C8C8C000000000000000000000000000000
      000000000000EFB5B500BD6363009C525200AD7B7B008C73730084636300A55A
      5A004A4A4A00A59C9C000000000000000000BD947B00EFFFFF00E7FFFF00E7FF
      FF00EFFFFF00EFFFFF00DEDED60052525200C6D6D600EFFFFF00EFFFFF00E7FF
      FF00E7FFFF00EFFFFF00BD947B008484840000000000B5ADAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFEFEF00FFDEE700FFDEDE00FFD6D600FFCECE008C5A
      5A007B42420073636300848484000000000000000000C6BDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFEFF700FFDEE700FFDEDE00FFD6D600FFCECE00FFCE
      CE00FFD6D600C6ADAD007B7B7B00000000000000000000000000000000000000
      000000000000EFB5B500A55A5A00B5B5B500CEBDBD00BDA5A500B5848400BD63
      63004A4A4A00A59C9C000000000000000000BD947B00DEEFE700DEE7DE00DEE7
      DE00DEE7DE00E7E7DE00E7E7DE00E7EFDE00E7EFE700E7E7DE00DEE7DE00DEDE
      DE00DEDEDE00E7EFDE00BD947B008484840000000000A59C9C00E7E7E700FFFF
      FF00FFFFFF00FFFFFF00FFE7E700FFE7E700FFDEDE00FFDEDE00FFD6D600FFCE
      CE00BDA5A5008484840000000000000000000000000094949400F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFE7E700FFE7E700FFDEDE00FFDEDE00FFD6D600FFCE
      CE00F7C6C6007B73730000000000000000000000000000000000000000000000
      000000000000EFB5B500A55A5A00BDBDBD009C9C9C00B5B5B500DEDEDE00A55A
      5A004A4A4A00A59C9C000000000000000000B55A0000AD520000AD520000AD52
      0000AD520000AD520000AD520000AD520000AD520000AD520000AD520000B55A
      0800B55A00009C5A2900AD6B29008484840000000000000000008C8C8C00E7E7
      E700FFFFFF00FFF7F700FFEFEF00FFE7E700FFE7E700FFDEDE00FFDEDE00C6AD
      AD007B7B7B0000000000000000000000000000000000000000008C8C8C00F7F7
      F700FFFFFF00FFFFFF00FFEFEF00FFE7E700FFE7E700FFDEDE00FFDEDE00F7CE
      CE00847B7B000000000000000000000000000000000000000000000000000000
      000000000000F7BDBD00A55A5A00C6C6C600C6C6C600BDBDBD00D6D6D600A55A
      5A005A5A5A00A59C9C000000000000000000DE842900E78C2100E7841000E784
      1000E7841000E7841000E7841000E7841000E7841000E7840800E77B0800EF8C
      1800EF8C1800CE844200CE84420000000000000000000000000000000000A5A5
      A500B5B5B500EFE7E700FFF7F700FFEFEF00FFE7E700E7CECE00A5949400A59C
      9C00000000000000000000000000000000000000000000000000000000009494
      9400C6C6C600FFF7F700FFF7F700FFEFEF00FFE7E700FFE7E700C6B5B5008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DED6D600DED6D600DED6D600DED6D600DEDEDE00BD73
      7300A59C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A59C9C00A5A5A500ADADAD009C9C9C00A59C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A5A5A5008C8C8C00A59C9C00A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300000000000000000000000000636363006363
      6300636363006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      00000000000000000000000000002910100073849400637B9400296B8C000852
      6B000000000042526B0000000000000000000000000000000000A5736B00D6A5
      9C00D6A59C00D6A59C00D6A59C00CEA59400C69C9400C69C9400C69C9400C69C
      9400B5948400B58C8400636363000000000000000000D6BDBD00EFEFE700F7F7
      EF00EFEFE700CEC6BD00B5ADA500636363006363630063636300636363006363
      630000000000000000000000000000000000C6A58C00BD8C7B00BD947B00BD94
      7B00BD947B00BD947B00BD947B00BD947B00BD947B00BD947B00BD947B00BD94
      7B00BD947B00BD947B00BD947B00848484000000000000000000000000000000
      0000000000000000000073B5C60029101000A5ADBD00CEEFF7004ABDE7000842
      630010294200426B840000000000000000000000000000000000BD847300E7DE
      D600FFEFD600FFE7C600FFE7C600FFE7C600FFD6B500FFD6B500FFD6B500FFD6
      AD00FFD6AD00E7BDA500636363000000000000000000D6B5B500F7F7CE00FFFF
      D600FFFFDE00FFFFDE00FFFFE700FFFFE700FFFFEF00FFFFEF00FFFFF7006363
      630000000000000000000000000000000000C69C7B00D6CEBD00D6C6B500D6C6
      B500D6C6BD00D6CEBD00DECEBD00D6CEB500D6CEB500D6CEBD00D6CEBD00D6C6
      B500D6C6B500DECEBD00BD947B00848484000000000010395A0010395A001039
      5A0018395A0018395A0018395A00000000000000000018395A0010294A000000
      0000000000000000000000000000000000000000000000000000BD847300E7DE
      D600FFEFD600FFEFD600FFE7C600FFE7C600FFE7C600FFD6AD00FFD6AD00FFD6
      B500FFD6AD00E7BDA500636363000000000000000000D6B5B500F7F7CE00FFF7
      C600FFEFC600FFFFDE00FFFFE700FFFFEF00FFFFEF00FFFFF700FFFFF7006363
      630000000000000000000000000000000000BD947B00E7FFFF00E7FFFF00E7FF
      FF00F7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00FFFFFF00E7FFFF00E7FF
      FF00E7FFFF00EFFFFF00BD947B008484840018638C0021A5DE0021A5DE0031A5
      DE00399CD6004A9CD6005A9CD60018638C0018294A0010294A0010294A001029
      4A00000000000000000000000000000000000000000000000000C68C7B00EFE7
      DE00FFEFD600FFEFD600FFEFD600EFD6BD00EFB57B0010529C00D6945200C694
      7B00FFD6AD00F7CEAD00636363000000000000000000D6B5B500F7F7D600FFF7
      C600FFEFC600FFF7D600FFF7DE00FFFFEF00FFFFF700FFFFF700FFFFFF006363
      63006B5A6300636363000000000000000000BD947B00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00EFFF
      FF00E7FFFF00E7FFFF00BD947B0084848400000000007B7B840042526B004252
      6B0042526B0042526B0042526B00A5EFF700E7F7FF00B5DEF70063C6EF00315A
      7B00000000000000000000000000000000000000000000000000C6947B00EFE7
      DE00FFF7E700FFEFD600FFEFD6004A94C600106BA50031B5E700107BBD00107B
      AD00F7BD8400F7CEAD00636363000000000000000000D6B5B500F7F7D600FFF7
      CE00FFF7CE00FFEFCE00F7DEB500F7E7CE00D6BDB500FFEFDE00104A94002939
      5200423942004A425A006363630000000000BD947B00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00BD947B008484840000000000FFE7E700F7DEDE00FFE7
      E700F7DEDE00FFCECE007B7B84000000000039526B0031526B00214A6B001042
      6B00000000000000000000000000000000000000000000000000CE9C8400EFEF
      E700FFF7E700FFF7E700B5B5C600299CCE0042BDEF004AADD600109CD6000094
      CE00738C8C00FFCEBD00636363000000000000000000D6B5B500F7F7D600F7E7
      BD00F7DEB500F7DEBD00F7E7CE00D6D6C600085AA500396BA50039B5EF00216B
      A50018529C00296B9C005A4A4A0000000000BD947B00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00BD947B008484840000000000FFE7E700F7DEDE00F7DE
      DE00F7DEDE00FFCECE007B7B8400000000000000000018182100103131000000
      0000000000000000000000000000000000000000000000000000DEA58400F7EF
      E700FFF7E700FFF7E700B5CECE0052C6F70063C6F700A5A5A500107BAD000094
      CE0094C6CE00FFCEBD00636363000000000000000000D6B5B500F7F7DE00EFCE
      9C00EFBD8C00F7DEB500F7D6B500A5BDD6004ABDF70039B5E70031B5EF0021A5
      DE0018A5DE00299CCE0039425A0063636300BD947B00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00BD947B008484840000000000F7F7F700FFE7E700FFE7
      E700FFE7E700F7DEDE008484840000000000000000007B9494004A5A6B000000
      0000000000000000000000000000000000000000000000000000DEA58400FFF7
      E700EFE7DE00298C18004AA53100188C52005AC6D6009C9C9C00298CB500299C
      CE00FFE7C600FFCEBD00636363000000000000000000D6B5B500F7F7DE00F7E7
      BD00F7DEB500F7DEBD00FFF7DE00106BAD004ABDF70042BDEF0052ADCE002984
      AD00088CC600088CC600297BA50063636300BD947B00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00DEF7
      FF00E7FFFF00E7FFFF00BD947B008484840000000000F7F7F700F7F7F700F7F7
      F700F7F7F700F7DEDE008C848C00000000000000000029292900181818000000
      0000000000000000000000000000000000000000000000000000DEA58400FFFF
      FF0084BD7B004AE7730039D6520029C6420018B529004A733900FFD6B500FFEF
      D600FFE7C600FFCEBD00636363000000000000000000D6B5B500F7F7DE00FFFF
      EF00FFFFEF00FFFFF700FFFFFF0073D6FF0052C6F70063C6F700ADADAD004252
      63000894CE00089CD60039ADD60000000000BD947B00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00BD947B008484840000000000F7F7F700FFFFFF00FFF7
      F700FFF7F700F7F7F700A594940000000000000000009CB5BD0039526B000000
      0000000000000000000000000000000000000000000000000000DEA58400FFFF
      FF005AF784004AE773009CD6A500217B21000094000000940000FFE7C600FFEF
      D600FFEFD600FFCEBD00636363000000000000000000D6B5B500F7F7DE00FFF7
      DE00FFEFD600FFEFDE00FFEFDE00FFFFFF0042ADE70063C6F700ADADAD00425A
      630018A5DE00429CBD006363630000000000BD947B00EFFFFF00E7FFFF00E7FF
      FF00EFFFFF00EFFFFF00E7FFFF00E7FFFF00E7FFFF00EFFFFF00EFFFFF00E7FF
      FF00E7FFFF00EFFFFF00BD947B008484840000000000F7F7F700FFFFFF00FFF7
      F700FFFFFF00F7F7F700A59C9C00000000002929290021212100212121000000
      0000000000000000000000000000000000000000000000000000DEA58400FFFF
      FF00E7FFEF004AE77300D6D6D600398C420010AD1800C6CE9400FFF7E700FFEF
      D600FFEFD600FFCEBD00636363000000000000000000D6B5B500F7F7E700FFFF
      F700FFFFF700FFF7EF00FFF7EF00FFFFFF00B5E7FF00A5CEE7008C847B005A63
      6B0042A5CE0042A5CE000000000000000000BD947B00DEEFE700DEE7DE00DEE7
      DE00DEE7DE00E7E7DE00E7E7DE00E7EFDE00E7EFE700E7E7DE00DEE7DE00DEDE
      DE00DEDEDE00E7EFDE00BD947B008484840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDB5B500A59C9C00000000001029420010294200102942001029
      4200000000000000000000000000000000000000000000000000DEA58400FFFF
      FF00FFFFFF00E7FFEF00A59C94009CA58C00A5EFB500FFF7E700FFDEC600FFDE
      C600FFB5AD00BD847300636363000000000000000000D6B5B500F7F7E700FFF7
      DE00FFEFDE00FFEFE700FFEFE700FFFFFF00FFFFFF00FFFFFF00EFEFEF006363
      630000000000000000000000000000000000B55A0000AD520000AD520000AD52
      0000AD520000AD520000AD520000AD520000AD520000AD520000AD520000B55A
      0800B55A00009C5A2900AD6B29008484840000000000FFFFFF00F7F7F700F7F7
      F700F7F7F700A59C9C008C848C0010294200F7FFFF00CEEFFF007BCEEF00315A
      7B00000000000000000000000000000000000000000000000000DEA58400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7A54200F7A5
      4200E794420063636300000000000000000000000000D6B5B500EFD6CE006BB5
      CE00EFD6CE00ADCEDE00CEB5BD00DEEFF700BDD6DE00F7FFFF00E7EFEF006363
      630000000000000000000000000000000000DE842900E78C2100E7841000E784
      1000E7841000E7841000E7841000E7841000E7841000E7840800E77B0800EF8C
      1800EF8C1800CE844200CE8442000000000018638C001894C6001894C6002194
      BD003194BD003994BD004294BD009CDEF70052738C004A637B00315A7B000000
      0000000000000000000000000000000000000000000000000000DEA58400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEA58400EFB5
      7B006363630000000000000000000000000000000000000000006B7B8C00318C
      AD00848494002994B500A56B73006B94AD00A594A5007BA5BD004A9CBD006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018638C0018638C00185A
      8C00215A8C00295A8400315A840042638C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400DEA584006363
      63000000000000000000000000000000000000000000000000009CCED6000000
      00007BBDCE000000000052B5C600000000005AB5C600000000005AADBD000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000D68400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEEF00DEDEEF00E7E7EF00E7EF
      EF00DEE7EF00C6CEDE00ADB5CE00ADB5C600BDBDC600ADADBD00ADADB500ADA5
      B500A5A5AD00A5A5A5009CA5A5008C94940000000000000000007B7B7B00CECE
      CE00C6C6C600B5B5B500ADADAD00A5A5A500949494007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      00000000000000000000D6840000FFDEAD00D6840000D6840000000000000000
      0000000000000000000000000000000000008C8C8C00E7E7E700DEDEDE00D6D6
      D600CECECE00CECEC600C6C6C600BDBDBD00B5B5B500ADADAD00A5A5A5009C9C
      9C0000000000000000000000000000000000E7E7EF00DEDEEF00D6DEE700C6C6
      DE00B5B5D600A5ADC600A5A5BD00A59CB500A59CB500847B9C007B739400736B
      94006B638400736B8C00736B8C006B6B840000000000000000007B7B7B00D6D6
      D600CECECE00C6C6C600B5B5B500ADADAD00A5A5A500949494007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      000000000000D6840000FFE7B500FFDEB500FFDEAD00FFDEAD00D6840000D684
      0000000000000000000000000000000000008C8C8C00E7E7E700E7E7E700DEDE
      DE00D6D6D600CECECE00CECECE00C6C6C600BDBDBD00B5B5B500ADADAD00A5A5
      A50000000000000000000000000000000000D6D6E700CECEE700B5ADDE00ADA5
      D600A59CCE00ADA5C6009C94B5009C94B500ADA5BD009494A500847B9C007373
      84006B6B8C005A5A7B0042426B004242630000000000000000007B7B7B00DEDE
      DE00D6D6D600CECECE00C6C6C600B5B5B500ADADAD00A5A5A500949494007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      000000000000D6840000FFE7BD00FFE7B500FFDEB500FFDEAD00FFDEAD00FFD6
      A500D6840000D684000000000000000000008C8C8C00EFEFEF00E7E7E700E7E7
      E700DEDEDE00D6D6D600D6D6D600CECECE00C6C6C600BDBDBD00B5B5B500ADAD
      AD0000000000000000000000000000000000D6CEE700CEBDE700CEC6E700C6BD
      DE00BDBDD600DED6DE00DECECE00D6C6BD00C6B5AD00CEBDB500CEC6B500C6BD
      B500ADA5AD00A594A5009C8C9C007B7B8C0000000000000000007B7B7B00E7E7
      E700DEDEDE00D6D6D600CECECE00C6C6C600B5B5B500ADADAD00A5A5A5009494
      94007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000D6840000FFEFC600FFE7BD00FFE7BD00FFE7B500FFDEAD00FFDEAD00FFD6
      AD00FFD6A500FFD69C00D6840000D68400008C8C8C00F7F7F700EFEFEF000000
      00000000000000000000000000000000000000000000C6C6C600BDBDBD00B5B5
      B50000000000000000000000000000000000B5ADD600C6BDDE00E7DEEF00EFE7
      EF00F7EFE700DED6B500ADA57B00948C6300847B520084845A009C9C7B00C6BD
      9C00BDBD9C00A5A59C00948CA500A58CA50000000000000000007B7B7B00E7E7
      E700E7E7E700DEDEDE00D6D6D600CECECE00C6C6C600B5B5B500ADADAD00A5A5
      A500949494007B7B7B000000000000000000000000000000000000000000D684
      0000FFEFCE00FFEFC600FFEFC600FFE7B500FFCE7B00FFC67300FFDEAD00FFDE
      AD00FFD6A500FFD6A500FFD69C00D68400008C8C8C00F7F7F700F7F7F700EFEF
      EF00EFEFEF00E7E7E700DEDEDE00DEDEDE00D6D6D600CECECE00C6C6C600BDBD
      BD0000000000000000000000000000000000B5B5D600D6DEE700F7F7EF00FFFF
      EF00DED6AD009C946B00948C5A008C84520094845200948C5A006B6339007B73
      5A00B5AD8C00ADA58C00848C840063637B0000000000000000007B7B7B00EFEF
      EF00E7E7E700E7E7E700DEDEDE00D6D6D600CECECE00C6C6C600B5B5B500ADAD
      AD00A5A5A5007B7B7B0000000000000000000000000000000000D6840000FFF7
      D600FFF7CE00FFF7CE00FFEFC600FFC67300FFA51000FFA52100FFCE8C00FFDE
      AD00FFD6A500FFD6A500D6840000000000008C8C8C00FFFFFF00F7F7FF000000
      00000000000000000000000000000000000000000000D6D6D600CECECE00CEC6
      CE0000000000000000000000000000000000CED6DE00E7EFE700FFFFEF00EFEF
      CE00948C63009C946300A5A56B008484520073734A009C945A009C945A005A52
      3100847B6300B5AD94009C9C840063636B0000000000000000007B7B7B00F7F7
      F700EFEFEF00E7E7E700E7E7E700DEDEDE00D6D6D600CECECE00C6C6C600B5B5
      B500ADADAD007B7B7B00000000000000000000000000D6840000FFFFD600FFF7
      D600EFF7C600B5F78C00FFEFBD00FFDEAD00FFB53900FFC65200FFD68C00FFDE
      AD00FFDEAD00FFD6A500D6840000000000008C8C8C00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00D6D6D600CECE
      CE0000000000000000000000000000000000C6CED600DEE7DE00FFFFEF00C6BD
      9C00848452009C9C63005A5A390018181000181810005A523100948C52007B73
      42006B634200B5AD8C00ADA58C006B63630000000000000000007B7B7B00F7F7
      F700F7F7F700EFEFEF00E7E7E700E7E7E700DEDEDE00D6D6D600CECECE00C6C6
      C600B5B5B5007B7B7B00000000000000000000000000D6840000FFFFDE00D6FF
      BD006BFF5A0021FF1800A5F78400FFEFC600FFDE9C00EFD6B500FFE7B500FFDE
      AD00FFDEAD00D684000000000000000000008C8C8C00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000E7E7E700DEDEDE00D6D6
      D60000000000000000000000000000000000C6C6C600E7EFD600FFFFDE00A59C
      7B008C845A00847B4A001810100000000000000000002118100073734200847B
      4A006B633900ADA58400A59C8C004242520000000000000000007B7B7B00FFFF
      FF00F7F7F700F7F7F700EFEFEF00E7E7E700E7E7E700DEDEDE00D6D6D600CECE
      CE00C6C6C6007B7B7B000000000000000000D6840000FFFFDE00FFFFDE00EFFF
      CE0063FF520018FF100084F77300EFEFBD00CEBDC600AD94D600F7DEBD00FFDE
      AD00FFDEAD00D684000000000000000000008C8C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700DEDE
      DE0000000000000000000000000000000000B5B5A500EFEFBD00FFFFCE00A59C
      7300847B4A00847B4A0021181000000000000800000018100800736B4200847B
      4A005A5A3900A59C8400847B6B001821390000000000000000007B7B7B00FFFF
      FF00FFFFFF00F7F7F700F7F7F700EFEFEF00E7E7E700E7E7E700DEDEDE00D6D6
      D600CECECE007B7B7B000000000000000000D6840000FFFFDE00FFFFDE00FFFF
      DE00CEFFAD00ADFF8C00EFEFC600B5ADD6003931F7002121F700BDA5CE00FFDE
      AD00FFDEAD00D684000000000000000000008C8C8C00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF000000000000000000EFEFEF00EFEFEF00E7E7
      E700000000000000000000000000000000006B6B7300A5A58400E7E7AD00CEC6
      9400736B4200847B4A005A5A390029291800312118005A5231007B6B39005A5A
      31006B634A00847B6B00313139000008180000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00E7E7E700E7E7E700DEDE
      DE00D6D6D6007B7B7B00000000000000000000000000D6840000D6840000FFF7
      D600FFF7D600FFF7CE00FFEFCE00DECECE004A42EF004239EF00B59CCE00FFDE
      AD00FFDEAD00D684000000000000000000008C8C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7F700EFEFEF00EFEF
      EF0000000000000000000000000000000000525A7300424A5A0063636300BDB5
      8C008C845A005252310063633900636339005A523100635A3900423921003931
      29004A4A4A0021293100101821002929310000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF007B7B7B007B7B
      7B007B7B7B007B7B7B000000000000000000000000000000000000000000D684
      0000D6840000FFF7CE00FFEFC600FFEFC600C6B5CE00D6BDC600FFDEB500FFDE
      AD00D68400000000000000000000000000008C8C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEF
      EF0000000000000000000000000000000000424263005A5A73004A5263005252
      5A0063635A003939310029212100312921003131290021212100212129002929
      31002121310018212900292939002929420000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F7007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      000000000000D6840000D6840000FFE7BD00FFE7BD00FFE7B500FFDEAD00FFDE
      AD00D68400000000000000000000000000008C8C8C00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF000000000000000000000000000000000018214A0021294A00393952004A4A
      5A0031394200292942002129390029313900212939002931420031394A002939
      4A0029394A0031425A00394A63004252630000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F7007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6840000D6840000FFDEB500FFDEAD00FFD6
      AD00D68400000000000000000000000000000000000000000000FFFFFF008C8C
      8C00FFFFFF008C8C8C00FFFFFF008C8C8C00FFFFFF008C8C8C00FFFFFF000000
      00000000000000000000000000000000000042526B0042526B00314A6300394A
      63004252630042526B004A5A6B0052637B0063738400738494007B8C94008494
      9C007B8C94007B8C940073848C007384840000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6840000D6840000D684
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003942630042526B004A5A73005263
      7B006373840073848C0084949C008C9C9C0094ADA5009CADAD00A5ADAD00A5AD
      AD009CADAD008C9C9C008C9C94007B848C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE730000DE73
      0000DE730000DE730000DE730000DE730000DE730000DE730000DE730000DE73
      0000DE730000DE73000000000000000000000000000000000000000000000000
      0000FF212100F7000000DE000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE730000FFE7
      AD00FFE7AD00FFE7AD00FFE7AD00FFDE9400FFE7AD00FFE7AD00FFE7AD00FFE7
      9C00FFE79C00DE73000000000000000000000000000000000000000000000000
      0000FF4A4A00FF212100F7000000DE0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE730000FFEF
      B500FFE7B500EF9C3900BD210000CE4A0000FFE7AD00FFE7AD00FFE7AD00FFE7
      AD00FFE79C00DE73000000000000000000000000000000000000000000000000
      0000000000000000000000000000F700000000000000BD0000009C0000007B00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE730000FFF7
      C600EF8C2900CE390000FFEFB500FFEFB500FFE7B500FFE7B500FFE7AD00FFE7
      AD00FFE7AD00DE73000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF21210000000000DE000000BD0000009C00
      00007B0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE730000FFF7
      C600FFF7C600BD210000EF9C4200BD210000CE4A0000FFEFB500FFE7B500FFE7
      AD00FFE7AD00DE7300000000000000000000FF212100F7000000DE0000000000
      0000000000000000000000000000FF4A4A000000000000000000000000000000
      00009C0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000000000000000000000000000000000000DE730000FFEF
      CE00FFEFCE00D65A0000DE6B0000FFF7C600FFF7C600FFC67300FFEFB500FFE7
      B500FFE7AD00DE7300000000000000000000FF4A4A00FF212100F7000000DE00
      0000000000000000000000000000FF6B6B00FF4A4A0000000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECECE0084848400000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000DE730000FFFF
      DE00FFEFCE00FFEFCE00BD210000C6290000BD210000FFBD6B00FFF7C600FFEF
      B500FFE7B500DE7300000000000000000000000000000000000000000000F700
      000000000000BD0000009C000000FF949400FF6B6B00FF4A4A00FF2121000000
      0000DE0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF0000000000000000000000000000000000DE730000FFFF
      DE00FFFFDE00FFFFDE00D65A0000FFEFCE00FFEFCE00FFF7C600FFF7C600FFF7
      C600FFEFB500DE7300000000000000000000000000000000000000000000FF21
      210000000000DE000000BD0000009C000000FF949400FF6B6B00FF4A4A00FF21
      2100F70000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000DE730000FFFF
      E700FFFFE700FFFFDE00FFFFDE00FFFFDE00EFB5B500BD4A7B00BD4A7B00C65A
      8400FFEFB500DE7300000000000000000000000000000000000000000000FF4A
      4A00000000000000000000000000000000009C00000000000000FF6B6B00FF4A
      4A00FF2121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000000000000FFFFFF00000000000000000000000000DE730000B5CE
      DE002973B5002973B500E7E7DE00FFFFDE00BD4A7B00FFEFCE00FFEFCE00BD4A
      7B00FFF7C600DE7300000000000000000000000000000000000000000000FF6B
      6B00FF4A4A00000000000000000000000000BD00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000DE7300002973
      B500FFFFF700FFFFF700FFFFE700FFFFE700C6638400FFD6C600FFEFCE00DE94
      9C00EFA59C00DE7300000000000000000000000000000000000000000000FF94
      9400FF6B6B00FF4A4A00FF21210000000000DE00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000DE7300002973
      B500FFFFF700FFFFF700FFFFF700FFFFE700F7C6BD00CE6B8C00FFFFDE00FFE7
      CE00BD4A7B00DE73000000000000000000000000000000000000000000000000
      0000FF949400FF6B6B00FF4A4A00FF212100F700000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE7300002973
      B500FFFFFF00FFFFFF0084ADCE00A5C6DE00FFFFE700BD4A7B00DE730000EF94
      3100EF943100DE73000000000000000000000000000000000000000000000000
      00000000000000000000FF6B6B00FF4A4A00FF21210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE730000E7EF
      F7002973B5002973B500397BBD00FFFFF700FFFFE700FFDECE00DE730000EF94
      3100FFEFAD00DE73000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE730000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFE700FFFFE700DE730000FFEF
      AD00DE7300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE730000DE73
      0000DE730000DE730000DE730000DE730000DE730000DE730000DE730000DE73
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400949494009CCEFF00DEDEDE00C6C6C600C6C6C600B5B5B5005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF00EFEFEF0000000000000000000000
      000000000000000000000000000000000000000000000000000094949400CECE
      FF00CECEFF009CCEFF009CCEFF00C6C6C600C6C6C600C6C6C600C6C6C600B5B5
      B5005A5A5A000000000000000000000000000094DE0000527B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000527B00006B9C00000000000000000000000000000000000052
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000527B00007BBD000000000000000000000000000000
      00000000000000000000EFEFEF000000DE009494FF00EFEFEF00000000000000
      0000000000000000000000000000000000000000000094949400FFCEFF00FFCE
      FF00CECEFF00CECEFF009CCEFF00C6C6C600C6C6C600C6C6C600C6C6C600DEDE
      DE00B5B5B5005A5A5A000000000000000000007BBD006BCEFF006BCEFF004AC6
      FF006BCEFF004AC6FF004AC6FF0021B5FF004AC6FF0021B5FF0021B5FF0000AD
      F70021B5FF0000ADF70000527B00000000000000000000000000007BBD0094DE
      FF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6FF0021B5FF004AC6
      FF0021B5FF0021B5FF000000000000527B000000000000000000000000000000
      000000000000EFEFEF000000FF000000F7000000DE00EFEFEF00000000000000
      00000000000000000000000000000000000000000000A5A5A500CEFF9C00FFCE
      FF00FFCEFF00CECEFF009CCEFF00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6
      C600C6C6C6005A5A5A000000000000000000006B9C0094DEFF006BCEFF006BCE
      FF004AC6FF006BCEFF004AC6FF004AC6FF0021B5FF004AC6FF0021B5FF0021B5
      FF0000ADF70021B5FF0000000000000000000000000000000000006B9C006BCE
      FF0094DEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6FF0021B5
      FF004AC6FF0021B5FF0000000000000000000000000000000000000000000000
      0000EFEFEF004A4AFF002121FF000000F7000000DE009494FF00EFEFEF000000
      000000000000000000000000000000000000B5B5B500C6C6C600C6C6C600CEFF
      9C00CEFF9C00FFCEFF00636363005A5A5A0063636300DEDEDE00C6C6C600C6C6
      C600C6C6C600B5B5B5005A5A5A0000000000006B9C006BCEFF0094DEFF006BCE
      FF006BCEFF004AC6FF006BCEFF004AC6FF004AC6FF0021B5FF004AC6FF0021B5
      FF0021B5FF0000ADF700000000000000000000000000006B9C0094DEFF0094DE
      FF006BCEFF0094DEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6
      FF0021B5FF000000000021B5FF0000000000000000000000000000000000EFEF
      EF006B6BFF000000FF004A4AFF002121FF000000F7000000DE00EFEFEF000000
      000000000000000000000000000000000000B5B5B500CECEFF00CECEFF00C6C6
      C600C6C6C600636363005A5A5A00848484005A5A5A0063636300C6C6C600C6C6
      C600C6C6C600C6C6C6005A5A5A0000000000006B9C0094DEFF006BCEFF0094DE
      FF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6FF0021B5FF004AC6
      FF0021B5FF0021B5FF00000000000000000000000000006B9C00B5E7FF0094DE
      FF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6
      FF004AC6FF000000000021B5FF00000000000000000000000000EFEFEF009494
      FF006B6BFF006B6BFF00EFEFEF00EFEFEF000000F7000000DE009494FF00EFEF
      EF0000000000000000000000000000000000B5B5B500C6C6C600C6C6C600CECE
      FF00CECEFF005A5A5A007B7B7B00C6C6C600848484005A5A5A00C6C6C600C6C6
      C600C6C6C600C6C6C6005A5A5A0000000000006B9C0094DEFF0094DEFF006BCE
      FF0094DEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6FF0021B5
      FF004AC6FF0021B5FF000000000000000000006B9C00B5E7FF0094DEFF00B5E7
      FF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6FF006BCE
      FF000000000021B5FF0021B5FF00000000000000000000000000EFEFEF009494
      FF00EFEFEF00EFEFEF000000000000000000EFEFEF000000F7000000DE00EFEF
      EF0000000000000000000000000000000000B5B5B500C6C6C600C6C6C600C6C6
      C600C6C6C600636363005A5A5A007B7B7B005A5A5A0063636300CEFF9C00CEFF
      9C00C6C6C600C6C6C6005A5A5A0000000000006B9C00B5E7FF0094DEFF0094DE
      FF006BCEFF0094DEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6
      FF0021B5FF004AC6FF000000000000000000006B9C00B5E7FF00B5E7FF0094DE
      FF00B5E7FF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6
      FF00000000004AC6FF0021B5FF00000000000000000000000000EFEFEF00EFEF
      EF000000000000000000000000000000000000000000EFEFEF000000DE009494
      FF00EFEFEF00000000000000000000000000B5B5B500C6C6C600C6C6C600C6C6
      C600C6C6C600DEDEDE00636363005A5A5A0063636300CECEFF00CECEFF00CEFF
      9C00CEFF9C00CEFF9C005A5A5A0000000000006B9C0094DEFF00B5E7FF0094DE
      FF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6
      FF004AC6FF0021B5FF000000000000000000007BBD00006B9C00006B9C00006B
      9C00006B9C00006B9C00006B9C00006B9C00006B9C00006B9C00006B9C00006B
      9C000094DE0021B5FF004AC6FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF000000
      DE00EFEFEF0000000000000000000000000000000000B5B5B500C6C6C600C6C6
      C600DEDEDE00C6C6C600C6C6C600C6C6C6009CCEFF00FFCEFF00CECEFF00CECE
      FF00CECEFF00848484000000000000000000006B9C00B5E7FF0094DEFF00B5E7
      FF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6FF006BCE
      FF004AC6FF004AC6FF00000000000000000000000000006B9C0094DEFF00B5E7
      FF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6FF006BCE
      FF004AC6FF004AC6FF0021B5FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF000000
      DE009494FF00EFEFEF00000000000000000000000000B5B5B500C6C6C600DEDE
      DE00C6C6C600C6C6C600C6C6C600C6C6C6009CCEFF00FFCEFF00FFCEFF00FFCE
      FF00CECEFF00848484000000000000000000006B9C00B5E7FF00B5E7FF0094DE
      FF00B5E7FF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6
      FF006BCEFF004AC6FF0000527B000000000000000000006B9C00B5E7FF0094DE
      FF00B5E7FF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6
      FF006BCEFF004AC6FF004AC6FF0000527B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF000000DE00EFEFEF0000000000000000000000000000000000B5B5B500C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D6009CCEFF00FFCEFF00FFCE
      FF0084848400000000000000000000000000007BBD0000ADF70000ADF70000AD
      F70000ADF70000ADF70000ADF70000ADF700006B9C00006B9C00006B9C00006B
      9C00006B9C00007BBD000094DE000000000000000000006B9C00B5E7FF00B5E7
      FF0094DEFF00B5E7FF0094DEFF0094DEFF006BCEFF00006B9C00006B9C00006B
      9C00006B9C00006B9C00006B9C00007BBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00EFEFEF000000000000000000000000000000000000000000B5B5
      B500B5B5B500C6C6C600C6C6C600C6C6C600D6D6D6009CCEFF00949494008484
      84000000000000000000000000000000000000000000006B9C00B5E7FF0094DE
      FF006BCEFF004AC6FF0021B5FF00006B9C00007BBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000006B9C00B5E7
      FF00B5E7FF0094DEFF00B5E7FF0094DEFF00006B9C000094DE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000006B9C00006B
      9C00006B9C00006B9C00006B9C00007BBD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000006B
      9C00006B9C00006B9C00006B9C00006B9C000094DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000700000000100010000000000800300000000000000000000
      000000000000000000000000FFFFFF0000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      00010000000000000001000000000000FFFFFC1FFDFFF000FFFF8000F17FE000
      FFFF0000E05F8000FE3F0000C0172000F80F000180054000E003F83F00010000
      8000FC3F000000000000F80F800080000000E003C000400000018000F001A000
      80030000FC038000F01F0000FF07C000FFFF0001FFCFE001FFFF0003FFFFE003
      FFFFE01FFFFFE007FFFFFFFFFFFFE00FFFFFF80FF80FFC3F8000F007F007F007
      0000E003E003C0010000C001C001800000008001800100000000000000000000
      00000000000000010000000000008003000000000000F003000000000000F803
      000000010000F803000080018001F803000080038003F8030000C007C007F803
      0001E00FE00FFC07FFFFF83FF83FFFFFFFFFFFFFE001C1FF8000FE0BC001800F
      0000FC03C001800F0000819FC001800F0000000FC00180030000800FC0018001
      0000810FC00180010000819FC00180000000819FC00180000000819FC0018001
      0000819FC00180010000811FC00180030000810FC001800F0000800FC003800F
      0001001FC007C00FFFFF80FFC00FD55FC003FEFF800F0000C003FC3F00070000
      C003F80F00070000C003F80300070000C003F00000070000C003E00000070000
      C003C00100070000C003800100070000C003800300070000C003000300070000
      C003000300070000C003800300070000C003E00700070000C007F80700070000
      C00FFE07800F0000C01FFF8FD55F0000FFFFFFFFFFFFC003F1FFFFFFFFFFC003
      F0FFFFFFFFFFC003FE8FFFFFFFFFC003FE87FF00FFFFC0031EF7FF3CFFE7C003
      0E77FF3DFFC3C003E817FF99FFDBC003E807FFDBFF99C003EF47FFC3FFBDC003
      E77FFFE7FF3CC003E17FFFFFFF00C003F07FFFFFFFFFC003FC7FFFFFFFFFC003
      FFFFFFFFFFFFC007FFFFFFFFFFFFC00FFFFFF83FFFFFFFFFFFFFE00FFFFFFFFF
      FE7FC0070001E000FC3F80030001C000F83F80030001C000F01F000100018000
      E01F000100018000C00F000100010000C30F000100010000CF87000100010000
      FFC7800300018000FFC3800300018000FFE3C00700018000FFF3E00F807FC03F
      FFFFF83FC0FFE07FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 544
    Top = 200
  end
  object ImageList2: TImageList
    Left = 328
    Top = 144
    Bitmap = {
      494C01010D000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5A5A00D6D6D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEDEDE00DEDEDE00D6D6D600000000009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00EFEFEF00EFEFEF00F7520000DE420000BD3900009C3100007B290000DEDE
      DE00D6D6D600D6D6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00EFEFEF00F7520000DE420000BD390000DEDEDE00DEDE
      DE00DEDEDE00D6D6D600D6D6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00FF6B2100F7520000DE420000DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D6D6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF844A00FF6B2100F7520000EFEFEF00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00F7FFFF00F7FF
      FF00FFFFFF00FFFFFF00FF9C6B00FF9C6B00FF844A00FF6B2100EFEFEF00EFEF
      EF00DEDEDE00DEDEDE00DEDEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DEDEDE00DEDEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7520000DE420000BD3900009C310000EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7FF
      FF00F7FFFF00F7FFFF00FF6B2100F7520000DE420000BD390000FFFFFF00EFEF
      EF00EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7FFFF00F7FFFF00F7FFFF00FFFFFF00FFFFFF00FFFFFF000000
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
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      000000000000000000007B7B7B0000000000000000000000000000000000BD39
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD390000000000000000000000000000000000000000000000000000EFEF
      EF00DEDEDE00DEDEDE00D6D6D600DEDEDE00D6D6D600D6D6D600C6C6C600D6D6
      D600C6C6C6000000000000000000000000000000000084848400FFB5B500C6C6
      C600C6C6C600B5CEFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      00007B7B7B00C6C6C6000000000000000000000000009C6B0000BDBD0000FFFF
      B500DEDE0000FF9C6B00393939000000000000000000000000009C6B0000BDBD
      0000FFFFB500DEDE0000FF9C6B0000000000000000000000000000000000DEDE
      DE00009C6B00009C6B00DEDEDE00ADADAD0094949400949494007B7B7B007B7B
      7B00D6D6D60000000000000000000000000084848400FFB5B500FF94FF00FFB5
      B500B5CEFF0094FFFF00B5CEFF00848484000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00C6C6
      C60000000000C6C6C6000000000000000000BD390000FF9C6B00F7F70000FFFF
      6B00FFFFB500DEDE0000BD3900000000000000000000BD390000DE940000F7F7
      0000FFFF6B00FFFFB500DEDE0000BD390000000000000000000000000000EFEF
      EF00009C6B00009C6B00DEDEDE00ADADAD00ADADAD0094949400949494007B7B
      7B00C6C6C60000000000000000000000000084848400C6C6C600FFB5B5008484
      840084848400B5CEFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE00DEDE
      DE00DEDEDE00D6D6D600D6D6D600D6D6D600C6C6C600C6C6C60000000000C6C6
      C60000000000C6C6C600000000000000000000000000FF9C6B00DEDE0000FFFF
      4A00FFFF6B00FFFFB5005A5A5A00000000000000000000000000FF9C6B00DEDE
      0000FFFF4A00FFFF6B00FFFFB50000000000000000000000000000000000EFEF
      EF00EFEFEF00DEDEDE00EFEFEF00DEDEDE00DEDEDE00D6D6D600DEDEDE00D6D6
      D600D6D6D60000000000000000000000000084848400C6C6C600B5CEFF008484
      840084848400FFB5B500C6C6C600848484000000000084848400949494009C9C
      9C00C6C6C600C6C6C600C6C6C600000000000000000000000000DEDEDE00FF9C
      6B00FF844A00FF6B2100F7520000DE420000D6D6D600C6C6C60000000000C6C6
      C60000000000C6C6C6000000000000000000000000009C6B0000BDBD0000DEDE
      0000F7F700009C9C0000000000000000000000000000000000005A390000BDBD
      0000DEDE0000F7F700009C9C000000000000000000000000000000000000FFFF
      FF00FF212100FF212100DEDEDE00ADADAD0094949400949494007B7B7B007B7B
      7B00D6D6D60000000000000000000000000084848400B5CEFF0094FFFF00B5CE
      FF00FFB5B500FF94FF00FFB5B5008484840000000000C6C6C6009C9C9C009494
      9400848484007B7B7B00C6C6C600000000000000000000000000EFEFEF00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600C6C6C60000000000C6C6
      C60000000000C6C6C600000000000000000000000000000000006B6B6B00BD39
      00003939390039393900393939000000000000000000000000006B6B6B003939
      3900BD390000000000006B6B6B0000000000000000000000000000000000EFEF
      EF00FF212100FF212100EFEFEF00ADADAD00ADADAD0094949400949494007B7B
      7B00DEDEDE000000000000000000000000000000000084848400B5CEFF00C6C6
      C600C6C6C600FFB5B500848484008484840000000000C6C6C600DEDEDE00D6D6
      D600D6D6D60084848400C6C6C600000000000000000000000000EFEFEF00FF9C
      6B00FF844A00FF6B2100F7520000DE420000D6D6D600C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000007B7B7B00DEDEDE00C6C6C600ADAD
      AD00949494009494940000000000000000000000000000000000DEDEDE00C6C6
      C600ADADAD0094949400949494007B7B7B00000000000000000000000000FFFF
      FF00EFEFEF00FFFFFF00EFEFEF00EFEFEF00DEDEDE00EFEFEF00DEDEDE00DEDE
      DE00D6D6D6000000000000000000000000000000000000000000848484008484
      84008484840084848400D6D6D600D6D6D60000000000C6C6C600B5B5FF00B5B5
      FF00D6D6D60084848400D6D6D600000000000000000000000000EFEFEF00EFEF
      EF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C60000000000C6C6
      C60000000000C6C6C6000000000000000000000000007B7B7B00DEDEDE00C6C6
      C600ADADAD009494940000000000848484008484840000000000DEDEDE00C6C6
      C600ADADAD00949494007B7B7B0000000000000000000000000000000000FFFF
      FF00FF21FF00FF21FF00FFFFFF00ADADAD0094949400949494007B7B7B007B7B
      7B00DEDEDE0000000000000000000000000000000000000000009C9C9C008484
      8400EFEFEF00B5B5FF00B5B5FF008484840000000000C6C6C600EFEFEF00DEDE
      DE00DEDEDE0084848400D6D6D600000000000000000000000000EFEFEF00FF84
      4A00FF6B2100F7520000DEDEDE00DEDEDE00DEDEDE00C6C6C60000000000C6C6
      C60000000000C6C6C6000000000000000000000000007B7B7B00848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      840084848400848484007B7B7B0000000000000000000000000000000000F7FF
      FF00FF21FF00FF21FF00EFEFEF00ADADAD00ADADAD0094949400949494007B7B
      7B00DEDEDE000000000000000000000000000000000000000000ADADAD008484
      8400EFEFEF00EFEFEF00DEDEDE00DEDEDE0000000000C6C6C6009494FF009494
      FF00DEDEDE0084848400DEDEDE00000000000000000000000000EFEFEF00EFEF
      EF00EFEFEF00FF6B2100F7520000DE420000DEDEDE00C6C6C60000000000C6C6
      C60000000000C6C6C600000000000000000000000000000000007B7B7B00DEDE
      DE00C6C6C600ADADAD0000000000000000000000000000000000DEDEDE00C6C6
      C600ADADAD007B7B7B000000000000000000000000000000000000000000FFFF
      FF00F7FFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00EFEFEF00EFEFEF00DEDE
      DE00EFEFEF000000000000000000000000000000000000000000BDBDBD008484
      8400FFFFFF009494FF009494FF008484840000000000C6C6C600FFFFFF00EFEF
      EF00EFEFEF0084848400DEDEDE00000000000000000000000000F7FFFF00EFEF
      EF00EFEFEF00FF844A00EFEFEF00F7520000DEDEDE00C6C6C60000000000C6C6
      C60000000000C6C6C600000000000000000000000000000000007B7B7B00DEDE
      DE00C6C6C600ADADAD0000000000000000000000000000000000DEDEDE00C6C6
      C600ADADAD007B7B7B000000000000000000000000000000000000000000F7FF
      FF002121FF002121FF00FFFFFF00ADADAD0094949400FFFFFF00EFEFEF00D6D6
      D600BDBDBD000000000000000000000000000000000000000000C6C6C6008484
      8400FFFFFF00FFFFFF00EFEFEF00EFEFEF0000000000C6C6C6006B6BFF006B6B
      FF00EFEFEF0084848400EFEFEF00000000000000000000000000F7FFFF00F7FF
      FF00EFEFEF00FF9C6B00FF844A00FF6B2100EFEFEF00C6C6C60000000000C6C6
      C60000000000000000007B7B7B00000000000000000000000000000000007B7B
      7B00DEDEDE00C6C6C60000000000848484008484840000000000DEDEDE00C6C6
      C6007B7B7B00000000000000000000000000000000000000000000000000F7FF
      FF002121FF002121FF00F7FFFF00ADADAD00ADADAD00EFEFEF00000000000000
      0000000000000000000000000000000000000000000000000000D6D6D6008484
      8400F7FFFF006B6BFF006B6BFF008484840000000000C6C6C600F7FFFF00FFFF
      FF00FFFFFF0084848400EFEFEF00000000000000000000000000F7FFFF00F7FF
      FF00F7FFFF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00C6C6C600000000000000
      00007B7B7B000000000000000000000000000000000000000000000000007B7B
      7B00DEDEDE00C6C6C60000000000BDBDBD00BDBDBD0000000000DEDEDE00C6C6
      C6007B7B7B00000000000000000000000000000000000000000000000000F7FF
      FF00F7FFFF00F7FFFF00FFFFFF00F7FFFF00FFFFFF00D6D6D60000000000F7FF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00FFFFFF00FFFFFF0000000000C6C6C600F7FFFF00F7FF
      FF00FFFFFF00848484000000000000000000000000007B7B7B00000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00FFFFFF00F7FFFF00BDBDBD00000000000000
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
      0000000000005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD000000000000000000000000009494
      9400949494009CCEFF00DEDEDE00C6C6C600C6C6C600B5B5B5005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000009494
      9400949494009CCEFF00DEDEDE00C6C6C600C6C6C600B5B5B5005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000848400008484000084840000000000000000000000000094949400CECE
      FF00CECEFF009CCEFF009CCEFF00C6C6C600C6C6C600C6C6C600C6C6C600B5B5
      B5005A5A5A00000000000000000000000000000000000000000094949400CECE
      FF00CECEFF009CCEFF009CCEFF00C6C6C600C6C6C600C6C6C600C6C6C600B5B5
      B5005A5A5A000000000000000000000000000000000000000000FFFFFF006B6B
      6B0039393900DEDEDE006B6B6B0039393900DEDEDE00DEDEDE00DEDEDE006B6B
      6B0039393900C6C6C600000000000000000000848400C6C6C60094949400009C
      9C009494940094949400949494009494940094949400009C6B0094949400009C
      6B0094949400009C6B005A5A5A00000000000000000094949400FFCEFF00FFCE
      FF00CECEFF00CECEFF009CCEFF00C6C6C600C6C6C600C6C6C600C6C6C600DEDE
      DE00B5B5B5005A5A5A0000000000000000000000000094949400FFCEFF00FFCE
      FF00CECEFF00CECEFF009CCEFF00C6C6C600C6C6C600C6C6C600C6C6C600DEDE
      DE00B5B5B5005A5A5A0000000000000000000000000000000000FFFFFF00ADAD
      AD006B6B6B00DEDEDE00ADADAD006B6B6B00DEDEDE00DEDEDE00DEDEDE00ADAD
      AD006B6B6B00C6C6C600000000000000000000848400C6C6C600009C9C009494
      9400009C9C009494940094949400949494009494940094949400009C6B009494
      9400009C6B00949494005A5A5A000000000000000000A5A5A500CEFF9C00FFCE
      FF00FFCEFF00CECEFF009CCEFF00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6
      C600C6C6C6005A5A5A00000000000000000000000000A5A5A500CEFF9C00FFCE
      FF00FFCEFF00CECEFF009CCEFF00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6
      C600C6C6C6005A5A5A0000000000000000000000000000000000FFFFFF006B6B
      6B0039393900DEDEDE006B6B6B0039393900DEDEDE00DEDEDE00DEDEDE006B6B
      6B0039393900C6C6C600000000000000000000848400C6C6C60094949400009C
      9C0094949400009C9C009494940094949400949494009494940094949400009C
      6B0094949400009C6B005A5A5A0000000000B5B5B500C6C6C600C6C6C600CEFF
      9C00CEFF9C00FFCEFF00636363005A5A5A0063636300DEDEDE00C6C6C600C6C6
      C600C6C6C600B5B5B5005A5A5A0000000000B5B5B500C6C6C600C6C6C600CEFF
      9C00CEFF9C00FFCEFF00636363005A5A5A0063636300DEDEDE00C6C6C600C6C6
      C600C6C6C600B5B5B5005A5A5A00000000000000000000000000FFFFFF00ADAD
      AD006B6B6B00DEDEDE00ADADAD006B6B6B00DEDEDE00DEDEDE00DEDEDE00ADAD
      AD006B6B6B00C6C6C600000000000000000000848400C6C6C6007B7B7B0000BD
      BD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BD
      BD005A5A5A00949494005A5A5A0000000000B5B5B500CECEFF00CECEFF00C6C6
      C600C6C6C600636363005A5A5A00848484005A5A5A0063636300C6C6C600C6C6
      C600C6C6C600C6C6C6005A5A5A0000000000B5B5B500CECEFF00CECEFF00C6C6
      C600C6C6C600636363005A5A5A00848484005A5A5A0063636300C6C6C600C6C6
      C600C6C6C600C6C6C6005A5A5A00000000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600000000000000000000848400C6C6C6005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A0052525200009C6B005A5A5A0000000000B5B5B500C6C6C600C6C6C600CECE
      FF00CECEFF005A5A5A007B7B7B00C6C6C600848484005A5A5A00C6C6C600C6C6
      C600C6C6C600C6C6C6005A5A5A0000000000B5B5B500C6C6C600C6C6C600CECE
      FF00CECEFF005A5A5A007B7B7B00C6C6C600848484005A5A5A00C6C6C600C6C6
      C600C6C6C600C6C6C6005A5A5A00000000000000000000000000FFFFFF00FFFF
      2100FFFF2100F7F70000F7F70000F7F70000F7F70000DEDE0000DEDE0000DEDE
      0000DEDE0000C6C6C600000000000000000000848400C6C6C60000BDBD008484
      8400FFFFFF00DEDEDE00C6C6C60000000000FFFFFF00DEDEDE00C6C6C6000000
      000000BDBD00009C6B005A5A5A0000000000B5B5B500C6C6C600C6C6C600C6C6
      C600C6C6C600636363005A5A5A007B7B7B005A5A5A0063636300CEFF9C00CEFF
      9C00C6C6C600C6C6C6005A5A5A0000000000B5B5B500C6C6C600C6C6C600C6C6
      C600C6C6C600636363005A5A5A007B7B7B005A5A5A0063636300949494005A5A
      5A005A5A5A005A5A5A005A5A5A00949494000000000000000000FFFFFF00FFFF
      2100FFFF2100FFFF2100F7F70000F7F70000F7F70000F7F70000DEDE0000DEDE
      0000DEDE0000C6C6C600000000000000000000848400C6C6C60000BDBD0000BD
      BD0084848400C6C6C60000000000FFFFFF00DEDEDE00C6C6C6000000000000BD
      BD0000BDBD00009C6B005A5A5A0000000000B5B5B500C6C6C600C6C6C600C6C6
      C600C6C6C600DEDEDE00636363005A5A5A0063636300CECEFF00CECEFF000000
      000000000000000000005A5A5A0000000000B5B5B500C6C6C600C6C6C600C6C6
      C600C6C6C600DEDEDE00636363005A5A5A0063636300CECEFF005A5A5A00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF005A5A5A00000000006B6B6B00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF0000FF
      000000FF0000C6C6C600000000000000000000848400C6C6C600C6C6C600C6C6
      C600C6C6C60000000000C6C6C60084848400C6C6C60000000000C6C6C600C6C6
      C600C6C6C600C6C6C600007B52000000000000000000B5B5B500C6C6C600C6C6
      C600DEDEDE00C6C6C600C6C6C600C6C6C6009CCEFF00FFCEFF00CECEFF000000
      000000FF000000000000000000000000000000000000B5B5B500C6C6C600C6C6
      C600DEDEDE00C6C6C600C6C6C600C6C6C6009CCEFF00FFCEFF005A5A5A00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF005A5A5A000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000393939000000
      000000000000000000000000000000000000BDBDBD0000848400008484000084
      8400008484000084840000848400008484000000000000848400008484000084
      8400008484000084840094949400BDBDBD0000000000B5B5B500C6C6C600DEDE
      DE00C6C6C600C6C6C600C6C6C600C6C6C6009CCEFF0000000000000000000000
      000000FF000000000000000000000000000000000000B5B5B500C6C6C600DEDE
      DE00C6C6C600C6C6C600C6C6C600C6C6C6009CCEFF009CCEFF005A5A5A00F7FF
      FF009C3131009C313100F7FFFF005A5A5A000000000000000000BDBDBD009494
      940000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000094949400BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      00000084840000BDBD0000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000B5B5B500C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D6000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000B5B5B500C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D6009CCEFF005A5A5A00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF005A5A5A000000000000000000000000009494
      940000000000C6C6C600C6C6C600C6C6C600C6C6C60000000000949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084840000BDBD0000BDBD0000BDBD0000BDBD0000BDBD00008484000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500C6C6C600C6C6C600C6C6C600D6D6D60000000000000000000000
      000000FF0000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500C6C6C600C6C6C600C6C6C600D6D6D6009CCEFF005A5A5A00F7FF
      FF009C3131009C313100F7FFFF005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD000084840000848400008484000084840000848400BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500000000000000
      000000FF00000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B500B5B5B500B5B5B5005A5A5A00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494005A5A
      5A005A5A5A005A5A5A005A5A5A00949494000000000000000000000000000000
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
      0000000000000000000000000000000000000000000094949400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005252520094949400000000000000000000000000000000000000
      000000000000F7AD0000DE940000DE940000BD7B0000BD7B0000DE9400000000
      000000000000000000000000000000000000000000000000000000000000DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C600000000000000000000000000000000000000000021B5FF0000AD
      F70000ADF7000094DE000094DE00007BBD00007BBD00006B9C00006B9C000000
      00000000000000000000000000000000000000000000525252000094DE000094
      DE0000000000848484007B7B7B006B6B6B005A5A5A0000000000000000000000
      000000000000006B9C0052525200000000000000000000000000000000000000
      0000DE940000DE940000DE940000BD7B0000BD7B0000BD7B00009C6B00009C6B
      000000000000000000006B6B6B0000000000000000000000000000000000DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D6000000000000000000000000000000000000FFFF000000000021B5
      FF0000ADF70000ADF7000094DE000094DE00007BBD00007BBD00006B9C00006B
      9C000000000000000000000000000000000000000000000000000094DE000094
      DE000000000094949400848484007B7B7B006B6B6B0000000000000000000000
      000000000000006B9C000000000000000000000000000000000000000000DE94
      0000DE940000DE940000BD7B0000BD7B0000BD7B00009C6B00009C6B00009C6B
      00007B520000000000000000000000000000000000000000000000000000EFEF
      EF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6
      D600D6D6D6000000000000000000000000000000000021FFFF0000FFFF000000
      000021B5FF0000ADF70000ADF7000094DE000094DE00007BBD00007BBD00006B
      9C00006B9C0000000000000000000000000000000000000000000094DE000094
      DE00000000009C9C9C0094949400848484007B7B7B0000000000000000000000
      000000000000006B9C0000000000000000000000000000000000DE940000DE94
      0000DE940000BD7B0000000000000000000000000000000000009C6B00007B52
      00007B5200007B5200000000000000000000000000000000000000000000EFEF
      EF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600D6D6D600000000000000000000000000000000006BFFFF0021FFFF0000FF
      FF000000000021B5FF0000ADF70000ADF7000094DE000094DE00007BBD00007B
      BD00006B9C00006B9C00000000000000000000000000000000000094DE000094
      DE00000000000000000000000000000000000000000000000000000000000000
      000000000000006B9C0000000000000000000000000000000000DE940000DE94
      0000BD7B00000000000000000000000000000000000000000000000000007B52
      00007B520000000000000000000000000000000000000000000000000000EFEF
      EF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600000000000000000000000000000000006BFFFF006BFFFF0021FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000ADF7000094
      DE000094DE000094DE000094DE000094DE00007BBD00007BBD00007BBD00007B
      BD00007BBD00006B9C0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B6B6B000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00D6D6D6000000000000000000000000000000000094FFFF006BFFFF006BFF
      FF0021FFFF0021FFFF0000F7F70000F7F70000DEDE0000DEDE00000000000000
      000000000000000000000000000000000000000000000000000000ADF70000AD
      F700000000000000000000000000000000000000000000000000000000000000
      0000007BBD00007BBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0000000000000000000000000000000000B5FFFF0094FFFF006BFF
      FF006BFFFF0021FFFF0021FFFF0000F7F70000F7F70000DEDE00000000000000
      000000000000000000000000000000000000000000000000000000ADF7000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000007BBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7FF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0000000000000000000000000000000000B5FFFF00B5FFFF0094FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000ADF7000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000007BBD0000000000000000000000000000000000000000000000
      0000000000006B6B6B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7FF
      FF00F7FFFF00EFEFEF00EFEFEF00EFEFEF00EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000ADF7000000
      0000FFFFFF0000BD7B0000BD7B0000BD7B0000BD7B0000BD7B0000BD7B00FFFF
      FF0000000000007BBD0000000000000000000000000000000000000000007B52
      00007B520000000000000000000000000000000000000000000000000000BD7B
      0000DE940000DE9400000000000000000000000000000000000000000000F7FF
      FF00F7FFFF00F7FFFF00EFEFEF00EFEFEF00EFEFEF0000000000EFEFEF00F7FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021B5FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000007BBD00000000000000000000000000000000007B5200007B52
      00007B5200009C6B000000000000000000000000000000000000BD7B0000DE94
      0000DE940000DE9400000000000000000000000000000000000000000000F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00EFEFEF00EFEFEF0000000000F7FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00000000000000000000000000000000000000000021B5FF000000
      0000FFFFFF0000BD7B0000BD7B0000BD7B0000BD7B0000BD7B0000BD7B00FFFF
      FF00000000000000000000000000000000000000000000000000000000007B52
      00009C6B00009C6B00009C6B0000BD7B0000BD7B0000BD7B0000DE940000DE94
      0000DE940000000000000000000000000000000000000000000000000000F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00000000009C9C
      9C00000000009C9C9C000000000000000000000000005252520021B5FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000005252520000000000000000006B6B6B00000000000000
      00009C6B00009C6B0000BD7B0000BD7B0000BD7B0000DE940000DE940000DE94
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C0000000000000000000000
      00009C9C9C000000000000000000000000000000000094949400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005252520094949400000000000000000000000000000000000000
      000000000000DE940000BD7B0000BD7B0000DE940000DE940000F7AD00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FF3F000000000000FF3F000000000000
      FE3F000000000000F80F000000000000E007000000000000C003000000000000
      8001000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008001000000000000C003000000000000
      E007000000000000F81F000000000000FFFFFFFFC003C3FFF80183C1C00381FF
      F0010180C00300FF80010180C003000080010180C003000080010180C0030000
      80010180C003800080010180C003800080018001C003800080018001C0038000
      8001C183C00380008001C183C00380008001E007C00380008007E007C0078000
      801FF18FC00FE083FFFFFFFFC01FFFFFFFFFFFFFF83FF83F80010000E00FE00F
      80010000C007C007800100008003800380010000800380038001000000010001
      8001000000010001800100000001000180010000000100008001000000010000
      80010000800380008001000080008000C00FF3DFC000C000E01FF01FE000E000
      F03FF01FF823F800FFFFFFFFFFE3FFC0FFFFFFFFFFFFFFFFC003001F8001F81F
      C003000F8031F00DC00300078031E005C00300038031C3C1C00300018001C7E1
      C00300008001FFC1C003001F8001FFFFC003001F8001FFFFC003001F800183FF
      C0038FFF800187E3C007FFF1800183C3C00FFFF18001A007C01FFF218005B00F
      C03FFF078001F81FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    MenuAnimation = [maLeftToRight, maTopToBottom]
    OnPopup = PopupMenu1Popup
    Left = 480
    Top = 200
    object Play1: TMenuItem
      Caption = '_Play'
      ImageIndex = 21
      ShortCut = 116
      OnClick = Play1Click
    end
    object Enqueue1: TMenuItem
      Caption = '_Enqueue'
      ImageIndex = 22
      ShortCut = 117
      OnClick = Enqueue1Click
    end
    object Playlist1: TMenuItem
      Caption = '_Playlist'
      OnClick = Playlist1Click
    end
    object OpenDir: TMenuItem
      Caption = '_OpenDir'
      OnClick = OpenDirClick
    end
    object Delete3: TMenuItem
      Caption = '_Delete'
      ShortCut = 46
      OnClick = Delete3Click
    end
    object Delete4: TMenuItem
      Caption = '_PhysicallyDelete'
      OnClick = Delete4Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Update1: TMenuItem
      Caption = '_Update'
      ShortCut = 115
      OnClick = Update1Click
    end
    object Delete2: TMenuItem
      Caption = '_Delete'
      OnClick = Delete2Click
    end
    object Rename1: TMenuItem
      Caption = '_Rename'
      ShortCut = 113
      OnClick = Rename1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Select1: TMenuItem
      Caption = '_Selected'
      ShortCut = 120
      OnClick = Select1Click
    end
    object Information1: TMenuItem
      Caption = '_Information'
      ShortCut = 118
      OnClick = Information1Click
    end
    object EditID3: TMenuItem
      Caption = '_Edit ID3'
      Visible = False
      OnClick = EditID3Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 544
    Top = 80
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 6
    MaxFontSize = 36
    Options = [fdEffects, fdLimitSize]
    Left = 608
    Top = 80
  end
  object ImageList3: TImageList
    Height = 32
    Width = 32
    Left = 328
    Top = 200
    Bitmap = {
      494C01010E001300040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7C7C700AAAAAA00AAAAAA00AAAA
      AA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AAAAAA00000000000000000000000000000000000000
      0000000000007272720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000072727200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400D6D6D600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AAAAAA00000000003939390055555500E3E3E300000000005555
      550000000000000000001D1D1D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400D6D6D600D6D6D600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E8E8E00555555005555
      5500555555000000000000000000000000000000000000000000E3E3E3005555
      5500000000000000000039393900AAAAAA00C7C7C70055555500555555005555
      550000000000000000000000000000000000AAAAAA00AAAAAA0000000000AAAA
      AA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400D6D6D600D6D6D600D6D6D600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000393939000000
      0000000000000000000000000000000000005555550000000000000000005555
      55000000000000000000AAAAAA001D1D1D0000000000000000001D1D1D005555
      5500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009494940094949400D6D6D600DEDEDE00DEDEDE00949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000055555500AAAAAA00727272000000000000000000000000005555
      550000000000E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400949494009C9C9C00C6C6C600DEDEDE00D6D6D600D6D6D6009C9C9C009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000393939000000
      00000000000055555500E3E3E300000000005555550000000000000000005555
      5500000000008E8E8E00000000000000000000000000E3E3E300000000003939
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400848484009C9C9C00C6C6
      C600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D6009C9C
      9C00949494008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000E3E3E3003939
      39000000000000000000000000001D1D1D001D1D1D0000000000000000005555
      550000000000555555000000000000000000555555000000000000000000AAAA
      AA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400C6C6C600EFEFEF00EFEFEF00EFEF
      EF00DEDEDE00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600D6D6D600D6D6D60084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C7C7C7008E8E8E00555555000000000000000000000000005555
      550000000000555555000000000000000000555555000000000000000000AAAA
      AA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600EFEFEF00EFEFEF00EFEFEF00EFEFEF00DEDE
      DE00EFEFEF00DEDEDE00EFEFEF00DEDEDE00DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00D6D6D600D6D6D600D6D6D6008484840000000000000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      00000000000000000000000000000000000000000000000000008E8E8E005555
      5500000000001D1D1D00E3E3E300000000003939390000000000000000005555
      55000000000072727200000000000000000000000000E3E3E300E3E3E3003939
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400EFEFEF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00EFEFEF00EFEF
      EF00DEDEDE00DEDEDE00DEDEDE00EFEFEF00DEDEDE00DEDEDE00D6D6D600DEDE
      DE00D6D6D600DEDEDE00D6D6D600D6D6D600D6D6D60084848400000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000C7C7C7000000
      000000000000000000000000000000000000000000000000000000000000AAAA
      AA0000000000C7C7C70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600848484000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000007272
      7200000000000000000000000000000000000000000000000000555555000000
      00000000000000000000AAAAAA0000000000000000000000000000000000AAAA
      AA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00EFEFEF00FFFFFF00EFEFEF00FFFFFF00FF21
      2100FF212100F7000000F7000000BD390000BD390000BD0000009C3100009C31
      0000DEDEDE00DEDEDE00D6D6D600DEDEDE00DEDEDE00D6D6D600D6D6D6008484
      8400000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AAAAAA00AAAAAA00AAAAAA00AAAAAA00E3E3E300000000000000
      0000000000000000000000000000E3E3E300AAAAAA00AAAAAA00E3E3E3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00FF212100F7000000F7000000BD390000BD390000DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600DEDEDE00D6D6D600D6D6
      D600848484000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00FF212100FF212100F7000000F7000000BD390000DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D6D6D600DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600848484000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000009C9C9C00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFF
      FF00EFEFEF00F7520000FF212100FF000000F7000000F7000000EFEFEF00EFEF
      EF00DEDEDE00EFEFEF00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600DEDE
      DE00D6D6D6009494940000000000000000005555550055555500555555005555
      5500555555005555550055555500555555005555550000000000000000000000
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
      0000000000000000000000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00FFFFFF00FF6B2100F7520000FF000000FF000000F7000000EFEFEF00EFEF
      EF00DEDEDE00DEDEDE00DEDEDE00D6D6D600DEDEDE00D6D6D600D6D6D600D6D6
      D600DEDEDE00848484000000000000000000000000008E8E8E00555555005555
      5500555555000000000000000000000000005555550055555500555555005555
      55005555550055555500555555008E8E8E00E3E3E30000000000000000000000
      00000000000000000000C7C7C700555555000000000000000000000000003939
      39008E8E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF844A00FF6B2100F7520000FF000000FF000000EFEFEF00DEDE
      DE00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D6008484840000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AAAAAA00000000000000
      000000000000AAAAAA0000000000000000000000000000000000000000000000
      0000000000005555550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF9C6B00FF844A00FF6B2100F7520000FF000000EFEFEF00EFEF
      EF00DEDEDE00EFEFEF00DEDEDE00EFEFEF00DEDEDE00DEDEDE00D6D6D600DEDE
      DE00D6D6D6008484840000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AAAAAA000000
      0000000000001D1D1D00000000000000000039393900AAAAAA00727272000000
      00000000000000000000C7C7C700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFB59400FF9C6B00FF844A00FF6B2100F7520000EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00EFEFEF00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE008484840000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000005555
      55000000000000000000C7C7C7000000000000000000000000001D1D1D000000
      0000C7C7C700555555003939390000000000E3E3E30000000000000000003939
      3900000000000000000055555500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFB5
      9400FFB59400FFB59400FFB59400FF9C6B00FF844A00FF6B2100EFEFEF00EFEF
      EF00FFFFFF00EFEFEF00DEDEDE00EFEFEF00DEDEDE00EFEFEF00DEDEDE00DEDE
      DE00DEDEDE008484840000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000005555
      550000000000000000000000000072727200000000000000000000000000C7C7
      C700000000000000000000000000000000000000000000000000000000005555
      5500000000000000000055555500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00EFEFEF00FFFF
      FF00FFFFFF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00EFEFEF00DEDE
      DE00C6C6C6009494940000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000005555
      5500000000000000000000000000AAAAAA00000000000000000000000000AAAA
      AA00000000000000000000000000000000000000000000000000E3E3E3000000
      000000000000000000008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00FFFF
      FF00EFEFEF00FFFFFF00EFEFEF00DEDEDE00EFEFEF00EFEFEF00DEDEDE00DEDE
      DE00848484000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000005555
      5500000000000000000000000000AAAAAA00000000000000000000000000AAAA
      AA0000000000000000000000000000000000AAAAAA0000000000000000000000
      0000000000001D1D1D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF6B2100F7520000BD3900009C310000FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00EFEFEF00DEDE
      DE00848484000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000005555
      5500000000000000000000000000AAAAAA00000000000000000000000000AAAA
      AA0000000000000000000000000000000000AAAAAA0000000000000000000000
      00001D1D1D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF9C6B00FF844A00FF6B2100F7520000BD3900009C310000FFFFFF00EFEF
      EF00FFFFFF00EFEFEF00FFFFFF00EFEFEF00EFEFEF00EFEFEF00EFEFEF008484
      8400000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000005555
      550000000000000000000000000055555500000000000000000000000000E3E3
      E30000000000000000000000000000000000E3E3E300AAAAAA001D1D1D000000
      0000000000007272720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFB59400FF9C6B00FF844A00FF6B2100F7520000BD390000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00EFEFEF00EFEFEF00848484000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000005555
      550000000000000000008E8E8E000000000000000000000000001D1D1D000000
      000000000000AAAAAA00AAAAAA0055555500C7C7C70000000000AAAAAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFB59400FF9C6B00FF844A00FF6B2100FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00EFEFEF00FFFFFF00EFEFEF00EFEFEF0084848400000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AAAAAA000000
      0000000000003939390000000000000000001D1D1D00AAAAAA00555555000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6009C9C9C0000000000000000000000
      0000000000000000000000000000000000000000000055555500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E8E8E00000000000000
      000000000000C7C7C70000000000000000000000000000000000000000000000
      0000000000007272720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C009C9C9C00C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000000000000000000000000000008E8E8E00555555005555
      5500555555000000000000000000000000005555550055555500555555005555
      55005555550055555500555555008E8E8E00E3E3E30000000000000000000000
      00000000000000000000C7C7C700555555000000000000000000000000003939
      39008E8E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C00C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
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
      0000000000006363630063636300636363006363630063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242000000000000000000000000000000000000000000000000000000
      0000949494007B7B7B0000000000000000007B7B7B0094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000949494007B7B7B0000000000000000007B7B7B009494
      9400000000000000000000000000000000000000000000000000000000000000
      00007B7B7B005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009494
      940084848400949494006B6B6B00848484006B6B6B006B6B6B006B6B6B009494
      9400949494008CD6FF00DEDEDE00C6C6C600C6C6C600B5B5B500636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      0000000000000000000094949400949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE005252
      5200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B006B6B6B00CECE
      CE00E7E7E700E7E7E7006B6B6B00F7F7F700F7F7F700F7F7F70094949400D6D6
      FF00D6D6FF008CD6FF008CD6FF00C6C6C600C6C6C600C6C6C600C6C6C600B5B5
      B500636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000009C6B
      0000F7CEA500F7CEA500EFEFEF00FFE7B500FFE7B500F7CEA500FF9C6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C6B0000F7CEA500F7CEA500EFEFEF00FFE7B500FFE7B500F7CE
      A500FF9C6B000000000000000000000000000000000000000000000000000000
      00007B7B7B00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B00F7F7F700F7F7F70094949400FFD6FF00FFD6
      FF00D6D6FF00D6D6FF008CD6FF00C6C6C600C6C6C600C6C6C600C6C6C600DEDE
      DE00B5B5B5006363630000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60042424200D6E7E700C6C6
      C6004242420000000000000000000000000000000000000000009C6B0000F7CE
      A500F7CEA500D6D6D600DEDEDE00FFE7B500EFEFEF00FFE7B500F7CEA500FF9C
      6B00000000000000000000000000000000000000000000000000000000000000
      00009C6B0000F7CEA500F7CEA500D6D6D600DEDEDE00FFE7B500EFEFEF00FFE7
      B500F7CEA500FF9C6B0000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7F7F700F7F7F700F7F7F700E7E7E700F7F7F700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B6B6B006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7F700A5A5A500D6FF8C00FFD6
      FF00FFD6FF00D6D6FF008CD6FF00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6
      C600C6C6C6006363630000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400D6E7E700D6E7E700D6E7
      E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7
      E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C60042424200000000000000000000000000000000009C6B0000FF9C6B00FF9C
      6B00A5A5A500F7CEA500F7CEA500DEDEDE00FFE7B500EFEFEF00FFE7B500F7CE
      A500FF9C6B000000000000000000000000000000000000000000000000009C6B
      0000FF9C6B00FF9C6B00A5A5A500F7CEA500F7CEA500DEDEDE00FFE7B500EFEF
      EF00FFE7B500F7CEA500FF9C6B00000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7FF
      FF00F7F7F700F7FFFF00F7F7F700E7E7E700E7E7E700E7E7E700F7F7F700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B6B6B006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700B5B5B500C6C6C600C6C6C600D6FF
      8C00D6FF8C00FFD6FF00636363006363630063636300DEDEDE00C6C6C600C6C6
      C600C6C6C600B5B5B50063636300000000000000000000000000000000008484
      8400424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242007300310073003100D6E7E700C6C6C60042424200D6E7E700C6C6
      C60042424200000000000000000000000000000000009C6B0000DE940000A5A5
      A500F7CEA500A5A5A500F7CEA500F7CEA500D6D6D600FFE7B500DEDEDE00F7CE
      A500FF9C6B000000000000000000000000000000000018181800000000009C6B
      0000DE940000A5A5A500F7CEA500A5A5A500F7CEA500F7CEA500D6D6D600FFE7
      B500DEDEDE00F7CEA500FF9C6B00000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF0000DE000000DE000000DE0000F7FF
      FF00F7FFFF00CECECE00B5B5B5009C9C9C00848484006B6B6B00E7E7E700E7E7
      E700B5B5B5009C9C9C00848484006B6B6B00E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD006B6B6B00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700FFFFFF00FFFFFF00B5B5B500D6D6FF00D6D6FF00C6C6
      C600C6C6C6006363630063636300848484006363630063636300C6C6C600C6C6
      C600C6C6C600C6C6C60063636300000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C60042424200000000000000000000000000000000009C6B0000A5A5A500FF9C
      6B00A5A5A500F7CEA500A5A5A500F7CEA500F7CEA500F7CEA500FFCEB500F7CE
      A500FF9C6B000000000000000000000000000000000000000000000000009C6B
      0000A5A5A500FF9C6B00A5A5A500F7CEA500A5A5A500F7CEA500F7CEA500F7CE
      A500FFCEB500F7CEA500FF9C6B00000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF0021FF2100F7FFFF0000DE0000F7FF
      FF00F7FFFF00E7E7E700CECECE00B5B5B5009C9C9C0084848400F7F7F700E7E7
      E700CECECE00B5B5B5009C9C9C0084848400E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B00CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700B5B5B500C6C6C600C6C6C600D6D6
      FF00D6D6FF006363630084848400C6C6C6008484840063636300C6C6C600C6C6
      C600C6C6C600C6C6C60063636300000000000000000000000000000000008484
      8400D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7
      E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C600424242007300310073003100D6E7E700C6C6C60042424200D6E7E700C6C6
      C60042424200000000000000000000000000000000009C6B0000DE940000A5A5
      A500DE940000A5A5A500F7CEA500A5A5A500F7CEA500A5A5A500F7CEA500FF9C
      6B00848400000000000000000000000000000000000000000000000000009C6B
      0000DE940000A5A5A500DE940000A5A5A500F7CEA500A5A5A500F7CEA500A5A5
      A500F7CEA500FF9C6B0084840000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF006BFF6B0021FF210000DE0000F7FF
      FF00F7F7F700F7FFFF00F7F7F700F7FFFF00E7E7E700E7E7E700E7E7E700F7F7
      F700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000949494006B6B6B00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700FFFFFF00FFFFFF00B5B5B500C6C6C600C6C6C600C6C6
      C600C6C6C6006363630063636300848484006363630063636300D6FF8C00D6FF
      8C00C6C6C600C6C6C60063636300000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00FF9C9C00FF9C9C00FF639C00FF639C00CE636300CE63
      6300CE006300CE00630073003100730031007300310073003100D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000005A5A5A00000000009C6B0000DE94
      0000A5A5A500DE940000A5A5A500FF9C6B00A5A5A500F7CEA500FF9C6B00FF6B
      21000000000000000000000000000000000000000000000000007B7B7B000000
      00009C6B0000DE940000A5A5A500DE940000A5A5A500FF9C6B00A5A5A500F7CE
      A500FF9C6B00FF6B210000000000181818000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7F7F700F7FFFF00F7F7F700E7E7E700E7E7E700F7F7F700E7E7
      E700F7F7F700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000000000
      00006B6B6B00CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500C6C6C600C6C6C600C6C6
      C600C6C6C600DEDEDE00636363006363630063636300D6D6FF00D6D6FF00D6FF
      8C00D6FF8C00D6FF8C0063636300000000000000000000000000000000008484
      8400F7FFFF00D6E7E700F7FFFF00D6E7E700F7FFFF00D6E7E700D6E7E700D6E7
      E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C600424242007300310073003100D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000005A5A5A0084848400000000009C6B
      0000DE940000A5A5A500DE940000DE940000FF9C6B00FF9C6B00FF6B21000000
      00005A5A5A000000000000000000000000000000000000000000848484007B7B
      7B00000000009C6B0000DE940000A5A5A500DE940000DE940000FF9C6B00FF9C
      6B00FF6B2100000000005A5A5A00101010000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7FFFF00F7F7F700F7F7
      F700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000008484
      84006B6B6B00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700FFFFFF00F7F7F700B5B5B500C6C6C600C6C6
      C600DEDEDE00C6C6C600C6C6C600C6C6C6008CD6FF00FFD6FF00D6D6FF00D6D6
      FF00D6D6FF008484840000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00FF9C9C00FF9C9C00FF639C00FF639C00CE636300CE63
      6300CE006300CE00630073003100730031007300310073003100D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000005A5A5A00D6D6D600848484000000
      00000000000000000000FF6B2100FF6B21000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000EFEFEF008484
      84007B7B7B00000000000000000000000000FF6B2100FF6B2100000000000000
      0000000000005A5A5A0042424200101010000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00FF734A00FF734A00FF734A00F7FF
      FF00F7FFFF00CECECE00B5B5B5009C9C9C00848484006B6B6B00F7FFFF00E7E7
      E700B5B5B5009C9C9C00848484006B6B6B00DEDEDE00E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000000000006B6B
      6B00CECECE00DEDEDE00E7E7E700F7F7F700E7E7E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500C6C6C600DEDE
      DE00C6C6C600C6C6C600C6C6C600C6C6C6008CD6FF00FFD6FF00FFD6FF00FFD6
      FF00D6D6FF008484840000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00D6E7E700F7FF
      FF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C60042424200000000000000000000000000000000005A5A5A00EFEFEF00BDBD
      BD00848484008484840000000000000000005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A000000000000000000000000000000000000000000EFEFEF00D6D6
      D60084848400848484007B7B7B007B7B7B0000000000000000007B7B7B007B7B
      7B005A5A5A005A5A5A0042424200101010000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00FF8C6B00F7FFFF00FF734A00F7FF
      FF00F7FFFF00E7E7E700CECECE00B5B5B5009C9C9C0084848400F7F7F700F7FF
      FF00CECECE00B5B5B5009C9C9C0084848400E7E7E700E7E7E700CECECE005252
      5200000000000000000000000000000000000000000000000000848484006B6B
      6B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700B5B5B500C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE008CD6FF00FFD6FF00FFD6
      FF00848484000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00FF9C9C00FF9C9C00FF639C00FF639C00CE636300CE63
      6300CE006300CE00630073003100730031007300310073003100D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C60042424200000000000000000000000000000000006B6B6B00EFEFEF00D6D6
      D600D6D6D600BDBDBD0094949400848484007B7B7B007B7B7B005A5A5A005A5A
      5A005A5A5A000000000000000000000000000000000000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD0094949400848484007B7B7B007B7B7B007B7B7B007B7B
      7B005A5A5A003939390010101000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00FFB5B500FF8C6B00FF734A00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7FFFF00F7F7F700F7FFFF00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700CECECE005252
      52000000000000000000000000000000000000000000000000006B6B6B00CECE
      CE00DEDEDE00CECECE00CECECE00CECECE00CECECE00DEDEDE00E7E7E700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700B5B5
      B500B5B5B500C6C6C600C6C6C600C6C6C600DEDEDE008CD6FF00949494008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00D6E7E700F7FFFF00D6E7E700F7FF
      FF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C6004242420000000000000000000000000000000000000000005A5A5A00EFEF
      EF00D6D6D600BDBDBD0094949400848484007B7B7B007B7B7B005A5A5A005A5A
      5A005A5A5A000000000000000000000000000000000000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD0094949400848484007B7B7B007B7B7B007B7B7B005A5A
      5A005A5A5A003939390018181800000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7FFFF00F7F7
      F700E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700E7E7E700CECECE005252
      520000000000000000000000000000000000000000006B6B6B006B6B6B00DEDE
      DE00CECECE00CECECE00CECECE006B6B6B00848484006B6B6B00DEDEDE00E7E7
      E700FFFFFF00FFFFFF00FFFFFF00F7F7F700FFFFFF00F7F7F700F7F7F700F7F7
      F700F7F7F700B5B5B500B5B5B500B5B5B500B5B5B500B5B5B5006B6B6B000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00D6E7E700F7FFFF00D6E7
      E700F7FFFF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C6004242420000000000000000000000000000000000000000005A5A5A00EFEF
      EF00D6D6D600D6D6D600BDBDBD0094949400848484007B7B7B007B7B7B005A5A
      5A005A5A5A000000000000000000000000000000000000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD0094949400848484007B7B7B007B7B7B007B7B7B005A5A
      5A00424242001010100000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7F7F700F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7F7F700E7E7E700F7F7F700E7E7E700E7E7E700E7E7E700CECECE005252
      520000000000000000000000000000000000000000006B6B6B00CECECE00CECE
      CE00CECECE00CECECE00CECECE006B6B6B006B6B6B006B6B6B00CECECE00DEDE
      DE00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7
      F700F7F7F700E7E7E700E7E7E700E7E7E700DEDEDE006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00D6E7E700F7FFFF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000005A5A
      5A00EFEFEF00D6D6D600BDBDBD0094949400848484007B7B7B007B7B7B005A5A
      5A005A5A5A000000000094949400949494009494940000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD0094949400848484007B7B7B007B7B7B005A5A5A005A5A
      5A00424242001010100000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00FF00FF00FF00FF00FF00FF00F7FF
      FF00F7FFFF00CECECE00B5B5B5009C9C9C00848484006B6B6B00F7FFFF00F7F7
      F700B5B5B5009C9C9C00848484006B6B6B00E7E7E700E7E7E700CECECE005252
      520000000000000000000000000000000000000000006B6B6B00CECECE00CECE
      CE00CECECE00636363006B6B6B00636363006B6B6B00636363006B6B6B006363
      6300CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7
      F700F7F7F700E7E7E700E7E7E700E7E7E7006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00CE636300CE636300CE006300F7FFFF00F7FF
      FF00F7FFFF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000006B6B
      6B00EFEFEF00C6C6C600D6D6D600BDBDBD0094949400848484007B7B7B005A5A
      5A005A5A5A00000000007B7B7B007B7B7B007B7B7B0000000000FFFFFF00C6C6
      C600C6C6C600BDBDBD0094949400848484007B7B7B007B7B7B005A5A5A003939
      3900101010000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00FF6BFF00F7FFFF00FF00FF00F7FF
      FF00F7FFFF00E7E7E700CECECE00B5B5B5009C9C9C0084848400F7F7F700F7FF
      FF00CECECE00B5B5B5009C9C9C0084848400E7E7E700E7E7E700CECECE005252
      520000000000000000000000000000000000000000006B6B6B00CECECE00CECE
      CE006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B00FFFFFF00FFFFFF00FFFFFF00F7F7F700FFFFFF00F7F7F700FFFF
      FF00F7F7F700F7F7F700E7E7E700E7E7E7006B6B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00FF639C00CE636300CE636300CE006300F7FF
      FF00F7FFFF00F7FFFF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      00005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A007B7B
      7B005A5A5A000000000000000000000000000000000000000000949494005A5A
      5A005A5A5A005A5A5A006B6B6B005A5A5A005A5A5A005A5A5A005A5A5A003939
      3900181818000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00FFB5FF00FF6BFF00FF00FF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7F7F700F7F7
      F700F7FFFF00F7F7F700F7F7F700E7E7E700E7E7E700CECECE00C6C6C6005252
      52000000000000000000000000000000000000000000848484006B6B6B006B6B
      6B006B6B6B0094940000DEDE0000DEDE0000DEDE0000DEDE0000DEDE00009494
      00006B6B6B0063636300FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700F7F7F700F7F7F700E7E7E7006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00CE636300F7FF
      FF00CE0063007300310073003100D6E7E700D6E7E700D6E7E700D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      00005A5A5A00EFEFEF00BDBDBD00BDBDBD00BDBDBD0094949400949494007B7B
      7B005A5A5A000000000000000000000000000000000000000000EFEFEF00D6D6
      D600BDBDBD00BDBDBD00A5A5A50094949400848484007B7B7B00424242001010
      1000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7F7F700F7F7F700F7F7F700E7E7E700CECECE00C6C6C6009C9C9C005252
      5200000000000000000000000000000000000000000000000000848484006B6B
      6B0094940000DEDE0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000DEDE
      0000949400006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700F7F7F700F7F7F700E7E7E7006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00CE636300F7FF
      FF00CE006300CE0063007300310073003100D6E7E700D6E7E700D6E7E700C6C6
      C60042424200F7FFFF00D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A00EFEFEF00D6D6D600D6D6D60094949400848484007B7B
      7B007B7B7B000000000000000000000000000000000000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD0094949400848484007B7B7B007B7B7B00424242001010
      1000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7
      F700F7F7F700F7F7F700E7E7E700CECECE00C6C6C6009C9C9C009C9C9C005252
      5200000000000000000000000000000000000000000000000000000000006B6B
      6B00DEDE0000BDBD0000949400006B6B6B006B6B6B006B6B6B0094940000BDBD
      0000DEDE00006B6B6B00FFFFFF00FFFFFF00F7F7F700FFFFFF00FFFFFF00F7F7
      F700F7F7F700F7F7F7006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FF639C00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF0073003100D6E7E700D6E7E700D6E7E700C6C6
      C60042424200D6E7E700D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B00EFEFEF00D6D6D600D6D6D600BDBDBD00949494008484
      84007B7B7B000000000000000000000000000000000000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD0094949400848484007B7B7B0042424200101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF004A4AFF004A4AFF004A4AFF00F7FF
      FF00F7FFFF00CECECE00B5B5B5009C9C9C00848484006B6B6B00F7FFFF00F7FF
      FF00F7F7F700E7E7E700CECECE00C6C6C6009C9C9C009C9C9C007B7B7B005252
      5200000000000000000000000000000000000000000000000000000000006B6B
      6B00BDBD0000949400006B6B6B006394000094940000BDBD00006B6B6B009494
      0000FFFF00006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700F7F7F700F7F7F7006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FF639C00FF63
      9C00F7FFFF00F7FFFF00F7FFFF00CE006300D6E7E700D6E7E700D6E7E700C6C6
      C60042424200F7FFFF00D6E7E700D6E7E700C6C6C60042424200D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00EFEFEF00D6D6D600BDBDBD00949494008484
      84007B7B7B000000000000000000000000000000000000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD00949494007B7B7B007B7B7B00424242007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF004A73FF00F7FFFF004A4AFF00F7FF
      FF00F7FFFF00E7E7E700CECECE00B5B5B5009C9C9C0084848400F7FFFF00F7FF
      FF00F7FFFF005252520031313100313131003131310031313100313131003131
      3100000000000000000000000000000000000000000000000000000000000000
      00006B6B6B00949400006B6B6B0094940000BDBD0000FFFF00006B6B6B009494
      00006B6B6B00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700F7F7F7006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FF9C9C00FF63
      9C00FF639C00CE636300F7FFFF00CE006300F7FFFF00D6E7E700D6E7E700C6C6
      C60042424200D6E7E700F7FFFF00D6E7E700C6C6C60042424200848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00EFEFEF00C6C6C600D6D6D600BDBDBD009494
      9400848484004242420094949400949494009494940000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD00949494007B7B7B004242420010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF008CADFF004A73FF004A4AFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF009C9C9C00FFFFFF00E7E7E700CECECE009C9C9C00525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B006B6B6B0094940000BDBD0000DEDE00006B6B6B006B6B
      6B006B6B6B006B6B6B00FFFFFF00FFFFFF00FFFFFF00F7F7F700FFFFFF00F7F7
      F700F7F7F7006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00FF9C
      9C00FF639C00FF639C00CE636300CE636300D6E7E700D6E7E700D6E7E700C6C6
      C60042424200F7FFFF00D6E7E700D6E7E700C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5A5A00EFEFEF00D6D6D600BDBDBD009494
      94007B7B7B00424242007B7B7B007B7B7B007B7B7B0000000000EFEFEF00D6D6
      D600C6C6C600BDBDBD00848484007B7B7B004242420084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF009C9C9C00E7E7E700CECECE009C9C9C0052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B000000
      000000000000000000006B6B6B006B6B6B00FFFFFF00FFFFFF00FFFFFF00F7F7
      F7006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF0084848400FF639C00CE636300F7FFFF00D6E7E700D6E7E700C6C6
      C600424242008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B6B6B00EFEFEF00D6D6D600D6D6D600C6C6
      C600949494000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D600D6D6D60084848400393939006B6B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF009C9C9C00CECECE009C9C9C005252520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B0063940000639400006394000063940000639400006B6B
      6B00000000000000000000000000000000006B6B6B006B6B6B00FFFFFF00FFFF
      FF006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00D6E7E700F7FFFF00D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A00EFEFEF00D6D6D600BDBD
      BD0094949400424242000000000000000000000000000000000094949400D6D6
      D600D6D6D600BDBDBD007B7B7B00393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF009C9C9C009C9C9C00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B0063940000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00006394
      00006B6B6B0000000000000000000000000000000000000000006B6B6B006B6B
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00D6E7E700D6E7E700C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B00C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000848484008484
      8400C6C6C6009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9C9C0052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B00FFFF0000DEDE0000DEDE0000DEDE0000DEDE0000DEDE0000FFFF
      00006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009494
      9400949494000000000000000000000000000000000000000000949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B00BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD
      00006B6B6B000000000000000000000000000000000000000000000000000000
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
      0000000000000000000094940000949400009494000094940000949400000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000737373007373730021212100424242006363
      6300A5A5A500A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A00C6C6
      C600ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD005A5A5A0000000000000000000000000000000000000000000000
      000000000000000000000000000031636300DEDEDE0031316300636363000021
      0000424242005252520073737300A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00ADADAD00949494005A5A5A005A5A5A005A5A5A00EFEFEF00EFEF
      EF00ADADAD00949494005A5A5A005A5A5A005A5A5A00D6D6D600949494005A5A
      5A00D6D6D6005A5A5A005A5A5A00C6C6C600949494005A5A5A005A5A5A00C6C6
      C600ADADAD005A5A5A0000000000000000000000000000000000000000000000
      000042424200636363006363630031316300DEDEDE009C9C9C0031639C003131
      63002121210021212100212121005252520073737300A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD00ADADAD0094DEFF0094DE
      FF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600BDBDBD0084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD00ADADAD0094DEFF0094DE
      FF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600BDBDBD0084848400848484000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00FFFFFF00FFFFFF0094949400949494005A5A5A00EFEFEF00EFEF
      EF00FFFFFF00FFFFFF0094949400949494005A5A5A00DEDEDE00FFFFFF009494
      9400D6D6D600949494005A5A5A00D6D6D600FFFFFF00949494005A5A5A00C6C6
      C600ADADAD005A5A5A0000000000000000000000000000000000000000007373
      7300FFFFFF00310031000021000000313100DEDEDE00DEDEDE00313163006363
      9C0031636300633163003163630031636300525252006363630073737300A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ADADAD00ADADAD00B5CEFF00B5CEFF0094DE
      FF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600BDBDBD008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ADADAD00ADADAD00B5CEFF00B5CEFF0094DE
      FF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600BDBDBD008484840000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600D6D6D6005A5A5A00D6D6D600D6D6D600C6C6C600C6C6C600C6C6
      C600ADADAD005A5A5A0000000000000000000000000000000000000000004242
      4200FFFFFF00316363009C9CCE00424242009C9C9C00DEDEDE0063639C003163
      63003131630031639C0063316300316363000000310031313100101010005252
      520073737300A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ADADAD00CEB5FF00CEB5FF00B5CEFF00B5CEFF0094DE
      FF0094DEFF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600DEDEDE00C6C6C600BDBDBD0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ADADAD00CEB5FF00CEB5FF00B5CEFF00B5CEFF0094DE
      FF0094DEFF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600DEDEDE00C6C6C600BDBDBD0084848400000000000000
      00000000000000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00949494005A5A5A00EFEFEF00949494005A5A5A00EFEFEF00D6D6
      D600949494005A5A5A00EFEFEF00949494005A5A5A00DEDEDE00949494005A5A
      5A00D6D6D600FFFFFF005A5A5A00D6D6D600949494005A5A5A005A5A5A00C6C6
      C600ADADAD005A5A5A0000000000000000000000000000000000000000003131
      6300CECE9C009C9CCE00CEFFCE003131630063636300DEDEDE0031639C006363
      9C005252520031639C003163630063639C003163630031316300316363003163
      6300424242006363630073737300A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00CEB5FF00CEB5FF00CEB5FF00CEB5FF00B5CEFF0094DE
      FF0094DEFF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDEDE00BDBDBD00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00CEB5FF00CEB5FF00CEB5FF00CEB5FF00B5CEFF0094DE
      FF0094DEFF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDEDE00BDBDBD00848484000000
      00000000000000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00FFFFFF0094949400EFEFEF00FFFFFF0094949400EFEFEF00EFEF
      EF00FFFFFF0094949400EFEFEF00FFFFFF0094949400DEDEDE00FFFFFF009494
      9400DEDEDE00FFFFFF0094949400D6D6D600FFFFFF00949494005A5A5A00C6C6
      C600ADADAD005A5A5A0000000000000000000000000000000000000000000031
      3100C6C6C6009C9CCE00F7FFFF003100310021212100DEDEDE0063639C005252
      520031639C005252520031636300313163005252520031636300525252003131
      63003131310010101000212121005252520073737300A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00B5CEFF00B5CE
      FF0094DEFF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600DEDEDE00DEDEDE00DEDEDE00C6C6C600C6C6C600BDBDBD008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00B5CEFF00B5CE
      FF0094DEFF0094DEFF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600DEDEDE00DEDEDE00DEDEDE00C6C6C600C6C6C600BDBDBD008484
      84000000000000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00FFFFFF0094949400D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600ADADAD005A5A5A0000000000000000000000000000000000000000003163
      6300424242009C9CCE00FFFFFF000031310031636300DEDEDE0063639C003163
      9C0063639C0031639C0063639C003163630031319C003131630063639C003131
      63003131630031316300313131003163630042424200636363009C9C9C00A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      000094DE0000CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00B5CE
      FF0094DEFF0094DEFF0094DEFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDEDE00DEDEDE00C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      000094DE0000CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00B5CE
      FF0094DEFF0094DEFF0094DEFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDEDE00DEDEDE00C6C6C6008484
      84000000000000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF005A5A5A005A5A5A00EFEFEF005A5A5A005A5A5A00EFEFEF00EFEF
      EF00949494005A5A5A00EFEFEF00949494005A5A5A00EFEFEF005A5A5A005A5A
      5A00DEDEDE00DEDEDE00DEDEDE00DEDEDE00949494005A5A5A005A5A5A00D6D6
      D600ADADAD005A5A5A0000000000000000000000000000000000000000003100
      310031636300C6C6C600FFFFFF003131310031003100DEDEDE0031639C006363
      630031639C003163630031639C00633163003163630031636300313163003163
      6300316363004242420031316300313163002121210000310000212121005252
      5200A5A5A500000000000000000000000000000000000000000000000000ADAD
      AD00C6DEC600C6DEC60094DE0000CEB5FF00CEB5FF00CEB5FF00CEB5FF00B5CE
      FF00B5CEFF0094DEFF0094DEFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600BDBD
      BD0084848400000000000000000000000000000000000000000000000000ADAD
      AD00C6DEC600C6DEC60094DE0000CEB5FF00CEB5FF00CEB5FF00CEB5FF00B5CE
      FF00B5CEFF0094DEFF0094DEFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600BDBD
      BD008484840000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00FFFFFF0094949400EFEFEF00FFFFFF005A5A5A00EFEFEF00EFEF
      EF00FFFFFF0094949400EFEFEF00FFFFFF0094949400EFEFEF00FFFFFF005A5A
      5A00DEDEDE005A5A5A005A5A5A00DEDEDE00FFFFFF00949494005A5A5A00D6D6
      D600ADADAD005A5A5A0000000000000000000000000000000000000000000031
      3100210000009CCECE00FFFFFF001010100031313100DEDEDE00A5A5A5006363
      9C007373730063639C006363630031639C006331630063639C00316363003131
      630063319C003163630031316300424242004242420031316300212121002121
      210052525200A5A5A5000000000000000000000000000000000000000000ADAD
      AD00C6DEC600C6DEC600C6DEC600C6DEC60094DE0000CEB5FF00CEB5FF00CEB5
      FF00B5CEFF00A5A5A50094949400949494009494940094949400A5A5A500DEDE
      DE00C6C6C600DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400000000000000000000000000000000000000000000000000ADAD
      AD00C6DEC600C6DEC600C6DEC600C6DEC60094DE0000CEB5FF00CEB5FF00CEB5
      FF00B5CEFF00A5A5A50094949400949494009494940094949400A5A5A500DEDE
      DE00C6C6C600DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6008484840000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE00DEDEDE005A5A5A00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600ADADAD005A5A5A0000000000000000000000000000000000000000002121
      210000002100CECECE00FFFFFF003131630010101000DEDEDE00DEDEDE003163
      9C0063639C0031639C003163630063639C0031639C0031636300316363006363
      9C00316363003131630031636300313163003163630031316300313163000000
      2100316363007373730000000000000000000000000000000000ADADAD00B5CE
      FF00C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC60094DE0000CEB5
      FF00A5A5A500949494007B7B7B007B7B7B007B7B7B007B7B7B0094949400A5A5
      A500DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600BDBDBD008484840000000000000000000000000000000000ADADAD00B5CE
      FF00C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC60094DE0000CEB5
      FF00A5A5A500949494007B7B7B007B7B7B007B7B7B007B7B7B0094949400A5A5
      A500DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600BDBDBD0084848400000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00949494005A5A5A00EFEFEF00949494005A5A5A00EFEFEF00EFEF
      EF00949494005A5A5A00EFEFEF00949494005A5A5A00EFEFEF00949494005A5A
      5A00EFEFEF00949494005A5A5A00DEDEDE00949494005A5A5A005A5A5A00D6D6
      D600ADADAD005A5A5A0000000000000000000000000000000000000000002121
      210021212100CECEFF00FFFFFF003131310031316300DEDEDE00DEDEDE006363
      9C003163630063639C0063639C003163630063639C0031319C00636363003131
      63005252520031639C0063316300316363003131630031316300313163002121
      2100316363007373730000000000000000000000000000000000ADADAD00B5CE
      FF00B5CEFF00B5CEFF00C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600A5A5
      A500949494007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B009494
      9400A5A5A500C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000ADADAD00B5CE
      FF00B5CEFF00B5CEFF00C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600A5A5
      A500949494007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B009494
      9400A5A5A500C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00FFFFFF0094949400EFEFEF00FFFFFF0094949400EFEFEF00EFEF
      EF00FFFFFF0094949400EFEFEF00FFFFFF0094949400EFEFEF00FFFFFF009494
      9400EFEFEF00FFFFFF0094949400DEDEDE00FFFFFF00949494005A5A5A00DEDE
      DE00ADADAD005A5A5A0000000000000000000000000000000000000000000031
      3100310031009CCECE00FFFFFF0000313100212121009C9C9C00DEDEDE00319C
      9C0063639C0063639C0031639C0063639C0031639C003163630063639C003163
      9C00316363003131630031636300633163003131630031636300313163001010
      1000316363007373730000000000000000000000000000000000ADADAD00B5CE
      FF00B5CEFF00B5CEFF00B5CEFF00B5CEFF00C6DEC600C6DEC600C6DEC6009494
      94007B7B7B007B7B7B007B7B7B00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B
      7B0094949400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000ADADAD00B5CE
      FF00B5CEFF00B5CEFF00B5CEFF00B5CEFF00C6DEC600C6DEC600C6DEC6009494
      94007B7B7B007B7B7B007B7B7B00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B
      7B0094949400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00ADADAD005A5A5A0000000000000000000000000000000000000000003131
      310000313100A5A5A500FFFFFF003131630031313100A5A5A500DEDEDE006363
      9C00639CCE0063639C0063639C00319C630063639C0063639C00316363006363
      9C006363630031639C005252520031639C003163630063316300316363002121
      2100313163007373730000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600B5CEFF00B5CEFF00B5CEFF00B5CEFF009494
      94007B7B7B007B7B7B00BDBDBD000000000000000000BDBDBD007B7B7B007B7B
      7B0094949400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600B5CEFF00B5CEFF00B5CEFF00B5CEFF009494
      94007B7B7B007B7B7B00BDBDBD000000000000000000BDBDBD007B7B7B007B7B
      7B0094949400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00ADADAD005A5A5A0000000000000000000000000000000000000000003131
      630031003100A5A5A500FFFFFF006331310031316300639C9C00DEDEDE00639C
      9C0063639C0031639C00639C9C0063639C0031639C006363630063639C003163
      630031639C006331630031639C00316363006331630031636300313163002121
      2100212121007373730000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6009494
      94007B7B7B007B7B7B00BDBDBD000000000000000000BDBDBD007B7B7B007B7B
      7B0094949400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6009494
      94007B7B7B007B7B7B00BDBDBD000000000000000000BDBDBD007B7B7B007B7B
      7B0094949400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF0084840000FFFF9400FFFF9400FFFF6B00FFFF6B00FFFF6B00FFFF
      4A00FFFF4A00FFFF4A00FFFF2100FFFF2100FFFF2100F7F70000F7F70000F7F7
      0000DEDE0000DEDE0000DEDE0000BDBD0000BDBD0000BDBD000084840000EFEF
      EF00ADADAD005A5A5A0000000000000000000000000000000000000000002121
      2100003131009C9CCE00FFFFFF00316363003131630063639C00FFFFFF00319C
      CE0063639C0063639C003163CE0063639C00639C9C0031639C0063639C006363
      9C0031639C003163630063639C003131630031639C003131630063639C002121
      2100000021007373730000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6009494
      94007B7B7B007B7B7B007B7B7B00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B
      7B0094949400C6DEC600C6DEC600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6009494
      94007B7B7B007B7B7B007B7B7B00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B
      7B0094949400C6DEC600C6DEC600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF0084840000FFFF9400FFFF9400FFFF9400FFFF6B00FFFF6B00FFFF
      6B00FFFF4A00FFFF4A00FFFF4A00FFFF2100FFFF2100FFFF2100F7F70000F7F7
      0000F7F70000DEDE0000DEDE0000DEDE0000BDBD0000BDBD000084840000EFEF
      EF00ADADAD005A5A5A0000000000000000000000000000000000000000003131
      310031316300A5A5A500FFFFFF00313163003163630063316300FFFFFF006363
      9C00639C9C006363CE00639C9C0063639C0031639C0063639C0063639C003163
      9C003163630063639C0031639C00316363003131630063639C00313163003163
      6300316363007373730000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600A5A5
      A500949494007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B009494
      9400A5A5A500C6DEC600C6DEC600C6DEC600C6DEC600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600A5A5
      A500949494007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B009494
      9400A5A5A500C6DEC600C6DEC600C6DEC600C6DEC600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF008484000084840000848400008484000084840000848400008484
      0000848400008484000084840000848400008484000084840000848400008484
      000084840000848400008484000084840000848400008484000084840000DEDE
      DE00ADADAD005A5A5A0000000000000000000000000000000000000000004242
      42005252520063639C00FFFFFF003163630063639C0031636300FFFFFF006363
      9C00639CCE00639C9C0063639C00639C9C006363CE0031639C00639C63006363
      9C0063639C00636363006363630031639C006363630031636300316363006331
      6300316363007373730000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6
      D600A5A5A500949494007B7B7B007B7B7B007B7B7B007B7B7B0094949400A5A5
      A500B5CEFF00B5CEFF00C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C600C6C6C6008484840000000000000000000000000000000000ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6
      D600A5A5A500949494007B7B7B007B7B7B007B7B7B007B7B7B0094949400A5A5
      A500B5CEFF009494940052525200525252005252520052525200525252005252
      52009494940084848400000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDE
      DE00ADADAD005A5A5A0000000000000000000000000000000000000000003163
      63003131630031639C00FFFFFF0063639C003163630063639C00FFFFFF00639C
      CE0063639C0063639C00639CCE0063639C00639C9C0063639C0063639C003163
      9C0063639C0031639C0031639C0063639C003163630063319C00316363003163
      9C0031313100737373000000000000000000000000000000000000000000ADAD
      AD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00C6C6
      C600DEDEDE00A5A5A50094949400949494009494940094949400A5A5A500CEB5
      FF00B5CEFF00B5CEFF00B5CEFF0042424200424242004242420042424200C6DE
      C60084848400000000000000000000000000000000000000000000000000ADAD
      AD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00C6C6
      C600DEDEDE00A5A5A50094949400949494009494940094949400A5A5A500CEB5
      FF00B5CEFF0052525200DEDEDE00DEDEDE00D6D6D600DEDEDE00D6D6D600D6D6
      D6005252520000000000000000000000000000000000000000005A5A5A00FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00DEDEDE005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A00C6C6C600C6C6C60084FF4A006BFF210052F7000042DE000039BD0000C6C6
      C600ADADAD005A5A5A0000000000000000000000000000000000000000003131
      63005252520063316300FFFFFF0031639C0063639C0031639C0063639C00FFFF
      FF00FFFFFF00639CCE0063639C00639C9C0031639C00639C9C006363CE006363
      9C00319C630063639C0063639C0031639C0063639C003163630063639C003131
      630031636300737373000000000000000000000000000000000000000000ADAD
      AD00C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C60094DEFF00CEB5FF00CEB5
      FF00CEB5FF00B5CEFF00B5CEFF004242420000BD0000009C000042424200C6DE
      C60084848400000000000000000000000000000000000000000000000000ADAD
      AD00C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C60094DEFF00CEB5FF00CEB5
      FF00CEB5FF0052525200EFEFEF00F7AD0000DE940000BD7B00009C6B0000D6D6
      D6005252520000000000000000000000000000000000000000005A5A5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A0094949400949494009494
      9400949494009494940094949400949494009494940094949400949494005A5A
      5A00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6005A5A5A0000000000000000000000000000000000000000005252
      520031639C0031636300FFFFFF0063639C00319C9C0063639C00639C9C006363
      9C009C9CCE009CCECE00CECEFF00CECEFF00CECECE006363CE00639C9C003163
      9C0063639C0063639C0031639C0063639C0031639C0031639C00316363006363
      9C00313163005252520000000000000000000000000000000000000000000000
      0000ADADAD00C6C6C600DEDEDE00DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDE
      DE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D60094DEFF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF004242420000BD000000BD0000424242008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00C6C6C600DEDEDE00DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDE
      DE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D60094DEFF00CEB5
      FF00CEB5FF0052525200DEDEDE00EFEFEF00DEDEDE00DEDEDE00D6D6D600DEDE
      DE005252520000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000006363
      9C0063639C0031639C00FFFFFF00FFCECE006363CE00639C9C006363CE00639C
      9C006363CE00639C9C00639CCE0063639C009CCEFF00FFFFFF00FFFFFF00CECE
      FF009C9CFF00639C9C006363630063639C00639C9C005252520063639C003163
      630063639C003131310000000000000000000000000000000000000000000000
      0000ADADAD00C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00DEDEDE00D6D6
      D600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE0094DEFF00CEB5
      FF004242420042424200424242004242420000DE000000BD0000424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000ADADAD00C6C6C600C6C6C600C6C6C600DEDEDE00DEDEDE00DEDEDE00D6D6
      D600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE0094DEFF00CEB5
      FF00CEB5FF0052525200EFEFEF00F7AD0000DE940000BD7B00009C6B0000D6D6
      D600525252000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00D6D6D6005A5A5A00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6005A5A
      5A00BDBDBD005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C00639C9C0063639C0063639C009CCECE00CECEFF00DEDEDE00639C9C00639C
      CE00639C9C006363CE00639C9C00639CCE00639C9C00639CCE0063639C009CCE
      CE009CCECE00CECECE00CECEFF009CCECE009C9CCE00639CCE0063639C003163
      9C00316363003131310000000000000000000000000000000000000000000000
      000000000000ADADAD00C6C6C600DEDEDE00C6C6C600DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D60094DE
      FF004242420021FF210000F7000000F7000000DE000000DE000000BD000000BD
      0000009C00004242420000000000000000000000000000000000000000000000
      000000000000ADADAD00C6C6C600DEDEDE00C6C6C600DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D60094DE
      FF00CEB5FF0052525200EFEFEF00EFEFEF00DEDEDE00EFEFEF00DEDEDE00DEDE
      DE00525252000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00D6D6D6005A5A5A00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D6005A5A
      5A00BDBDBD005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      9C0063639C00639C9C006363CE00639C9C0031639C00CECECE006363CE00639C
      CE00639CCE00639CCE006363CE0042424200A5A5A500639CCE00639CCE006363
      CE00639CCE00639CCE00639CCE006363CE009CCECE00FFFFFF00FFFFFF009C9C
      CE00639CFF0063639C0000000000000000000000000000000000000000000000
      00000000000000000000ADADAD00C6C6C600C6C6C600DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D60094DE
      FF00424242004AFF4A0021FF210000F7000000F7000000DE000000DE000000BD
      000000BD00004242420000000000000000000000000000000000000000000000
      00000000000000000000ADADAD00C6C6C600C6C6C600DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D60094DE
      FF00CEB5FF0052525200FFFFFF00F7AD0000DE940000BD7B00009C6B0000DEDE
      DE00525252000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A005A5A5A005A5A5A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063639C00639C9C006363CE00639C9C009C9CCE00CECEFF00C6C6
      C600CECECE00C6C6C600DEDEDE0063636300FFFFFF00FFFFFF00CECEFF00DEDE
      DE00C6C6C6009CCECE00A5A5A500639C9C006363CE00639CCE00639CCE00A5A5
      A50063639C0063639C0000000000000000000000000000000000000000000000
      0000000000000000000000000000ADADAD00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D600C6C6
      C6004242420042424200424242004242420000F7000000F70000424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000ADADAD00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6D600C6C6
      C60094DEFF0052525200EFEFEF00FFFFFF00EFEFEF00EFEFEF00DEDEDE00EFEF
      EF00525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D6005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063639C0063639C009C9CCE006363CE00639C9C00639C
      CE009C9CCE00639CCE0063639C00639CCE009C9CCE00639CCE00FFFFFF00FFFF
      FF00FFFFFF00CECEFF00FFFFFF00FFFFFF00C6C6C600A5A5A500639CCE006363
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD00ADADAD00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6
      D60094DEFF00CEB5FF0084848400424242004AFF4A0000F70000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD00ADADAD00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600D6D6
      D60094DEFF0052525200F7FFFF00F7AD0000DE940000BD7B00009C6B0000DEDE
      DE00525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063639C0063639C0063639C006363
      9C00DEDEDE00C6C6C6009CCECE00A5A5A500639CCE006363CE00639C9C00639C
      CE00639CCE00CECECE00CECEFF00CECEFF009CCECE00C6C6C60063639C006363
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6008484840084848400000000004242420021FF21004AFF4A00424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6008484840052525200F7FFFF00F7FFFF00F7FFFF00F7FFFF00EFEFEF00FFFF
      FF00525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00000000000000000000000000424242004242420042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00000000009494940052525200525252005252520052525200525252005252
      5200949494000000000000000000000000000000000000000000000000000000
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
      000000000000000000007B7B7B007B7B7B009494940000000000000000000000
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
      00007B7B7B007B7B7B000094DE000094DE0094949400BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300525252005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B0000ADF7000094DE000094DE000094DE00949494009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B0000ADF70000AD
      F7000094DE0000ADF7000094DE00A5A5A5009494940094949400000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF003163FF003163FF003163FF003163FF003163
      FF003163FF003163FF003163FF003163FF003163FF003163FF003163FF003163
      FF003163FF003163FF003163FF003163FF003163FF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7AD0000FFB52100F7AD0000DE940000F7AD0000F7AD0000FFB52100FFB5
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7
      E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B0000ADF70021B5FF0000ADF70000AD
      F70000ADF7000094DE0000ADF700009C6B009494940094949400000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF003163FF003163FF003163FF003163FF003163
      FF003163FF003163FF003163FF003163FF003163FF003163FF003163FF003163
      FF003163FF003163FF003163FF003163FF003163FF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE940000BD7B
      0000DE940000DE940000DE940000F7AD0000DE940000F7AD0000F7AD0000F7AD
      0000FFB52100F7AD000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7F7F700F7F7F700F7F7F700EFEF
      EF00F7F7F700D6E7E700D6E7E700EFEFEF00D6E7E700EFEFEF00D6E7E700D6E7
      E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B0021B5FF0021B5FF0021B5FF0000ADF70021B5FF0000AD
      F70000ADF70000ADF7000094DE00949494009C9C9C0094949400BDBDBD000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7AD0000BD7B0000BD7B0000DE94
      0000BD7B0000DE940000DE940000DE940000F7AD0000DE940000F7AD0000F7AD
      0000F7AD0000FFB52100F7AD0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7F7F700F7FFFF00F7F7
      F700EFEFEF00EFEFEF00EFEFEF00D6E7E700EFEFEF00D6E7E700EFEFEF00D6E7
      E700EFEFEF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B004AC6FF0021B5FF004AC6FF0021B5FF0021B5FF0021B5FF0000ADF70021B5
      FF0000ADF70000ADF70000ADF70094949400A5A5A50094949400949494000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000BD7B00009C6B0000BD7B0000BD7B0000BD7B
      0000DE940000BD7B0000DE940000DE940000DE940000F7AD0000DE940000F7AD
      0000F7AD0000F7AD0000FFB52100F7AD0000FFB5210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7F7F700F7FFFF00F7F7F700F7FF
      FF00F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00D6E7E700EFEF
      EF00D6E7E700EFEFEF00D6E7E700D6E7E700D6E7E700D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B006BCEFF004AC6
      FF004AC6FF004AC6FF0021B5FF004AC6FF0021B5FF0021B5FF0021B5FF0000AD
      F70021B5FF0000ADF70000ADF7009C9C9C00D6D6D6009C9C9C00848484000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF009CCEFF009CCEFF009CCEFF009CCEFF009CCE
      FF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCE
      FF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      000000000000000000009C6B00009C6B0000BD7B00009C6B0000BD7B0000BD7B
      0000BD7B0000DE940000BD7B0000DE940000DE940000DE940000F7AD0000DE94
      0000F7AD0000F7AD0000F7AD0000FFB52100F7AD0000FFB52100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7F7
      F700F7FFFF00F7F7F700EFEFEF00F7F7F700EFEFEF00F7F7F700EFEFEF00EFEF
      EF00EFEFEF00D6E7E700EFEFEF00D6E7E700D6E7E700D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B006BCEFF006BCEFF004AC6FF006BCE
      FF004AC6FF004AC6FF004AC6FF0021B5FF004AC6FF0021B5FF0021B5FF0021B5
      FF0000ADF70021B5FF0000ADF7009C9C9C0094DEFF00ADADAD007B7B7B00BDBD
      BD00000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF0052525200000000000000000000000000000000007B7B7B000000
      0000000000007B5200009C6B00009C6B00009C6B0000BD7B00009C6B0000BD7B
      0000BD7B0000000000000000000000000000000000000000000000000000F7AD
      0000DE940000F7AD0000F7AD0000F7AD0000FFB52100F7AD0000FFB521000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7F7F700F7FFFF00F7F7F700F7FFFF00F7F7F700F7FFFF00F7F7F700F7F7
      F700EFEFEF00EFEFEF00EFEFEF00D6E7E700D6E7E700D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B006BCEFF0094DEFF006BCEFF006BCEFF006BCEFF004AC6
      FF006BCEFF004AC6FF004AC6FF004AC6FF0021B5FF004AC6FF0021B5FF0021B5
      FF0021B5FF0000ADF7000094DE00BDBDBD0094DEFF00ADADAD00949494009494
      9400000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000006B6B
      6B007B5200009C6B00007B5200009C6B00009C6B00009C6B0000BD7B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DE940000F7AD0000F7AD0000F7AD0000FFB52100F7AD0000FFB5
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7F7F700F7FFFF00F7F7F700F7FFFF00F7F7F700F7F7F700EFEF
      EF00F7F7F700EFEFEF00D6E7E700EFEFEF00D6E7E700D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF006BCE
      FF004AC6FF006BCEFF004AC6FF004AC6FF004AC6FF0021B5FF004AC6FF0021B5
      FF0021B5FF0021B5FF00009C9C00D6D6D60094DEFF00BDBDBD00949494008484
      8400000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF009CCEFF009CCEFF009CCEFF009CCEFF009CCE
      FF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCE
      FF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      00007B5200007B5200009C6B00007B5200009C6B00009C6B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE940000F7AD0000F7AD0000F7AD0000FFB52100F7AD
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7FFFF00F7F7
      F700EFEFEF00F7F7F700EFEFEF00D6E7E700EFEFEF00D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCE
      FF006BCEFF004AC6FF006BCEFF004AC6FF004AC6FF004AC6FF0021B5FF004AC6
      FF0021B5FF0021B5FF009C9C9C0094DEFF0094DEFF00BDBDBD00949494009494
      9400000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      00007B5200007B5200007B5200009C6B00007B52000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DE940000F7AD0000F7AD0000F7AD0000FFB5
      2100F7AD00000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7F7F700F7FFFF00F7F7F700F7FFFF00F7F7F700F7F7
      F700F7F7F700EFEFEF00EFEFEF00EFEFEF00D6E7E700D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      00007B7B7B00B5E7FF0094DEFF0094DEFF0094DEFF006BCEFF0094DEFF006BCE
      FF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6FF004AC6FF0021B5
      FF004AC6FF0021B5FF00ADADAD0094DEFF0094DEFF00C6C6C600949494007B7B
      7B00BDBDBD000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      00007B5200007B5200007B5200007B5200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE940000F7AD0000F7AD0000F7AD
      0000FFB521000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7FFFF00F7F7F700F7F7
      F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      00007B7B7B0094DEFF00B5E7FF0094DEFF0094DEFF0094DEFF006BCEFF0094DE
      FF006BCEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6FF004AC6
      FF0021B5FF004AC6FF00ADADAD0094DEFF0094DEFF00C6C6C6009C9C9C007B7B
      7B00949494000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF00F7FFFF009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00F7FFFF00F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      00007B5200007B5200007B5200007B5200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE940000F7AD0000F7AD
      0000F7AD00000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7F7F700F7FFFF00F7FF
      FF00F7F7F700EFEFEF00F7F7F700EFEFEF00D6E7E700EFEFEF00D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000000000
      00007B7B7B00B5E7FF0094DEFF00B5E7FF0094DEFF0094DEFF0094DEFF006BCE
      FF0094DEFF006BCEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6FF004AC6
      FF004AC6FF0021B5FF00BDBDBD0094DEFF0094DEFF00D6D6D6009C9C9C006B6B
      6B00848484000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7F7
      F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000007B7B
      7B00B5E7FF00B5E7FF00B5E7FF0094DEFF00B5E7FF0094DEFF0094DEFF0094DE
      FF006BCEFF0094DEFF006BCEFF006BCEFF006BCEFF004AC6FF006BCEFF004AC6
      FF004AC6FF004AC6FF00BDBDBD00B5E7FF00B5E7FF00D6D6D6009C9C9C006B6B
      6B007B7B7B00BDBDBD0000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7FFFF00F7FF
      FF00F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000007B7B
      7B00B5FFFF00B5E7FF00B5E7FF00B5E7FF0094DEFF00B5E7FF0094DEFF0094DE
      FF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF006BCEFF004AC6FF006BCE
      FF004AC6FF00C6C6C600C6C6C600B5E7FF00B5E7FF00B5FFFF00ADADAD006B6B
      6B007B7B7B009494940000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7F7F700F7F7
      F700F7FFFF00F7F7F700EFEFEF00F7F7F700EFEFEF00D6E7E700D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000007B7B
      7B00B5E7FF00B5FFFF00B5E7FF00B5E7FF00B5E7FF0094DEFF00B5E7FF0094DE
      FF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF006BCEFF004AC6
      FF006BCEFF0094949400D6D6D600B5E7FF00B5E7FF00B5E7FF00ADADAD006B6B
      6B000094DE008484840000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00D6E7E700CECE
      CE00525252000000000000000000000000000000000000000000000000007B7B
      7B00B5FFFF00B5E7FF00B5FFFF00B5E7FF00B5E7FF00B5E7FF0094DEFF00B5E7
      FF0094DEFF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF006BCE
      FF004AC6FF0094949400B5E7FF00B5E7FF00B5E7FF00B5E7FF00BDBDBD006B6B
      6B000094DE007B7B7B0000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF00F7FFFF00C6C6C600C6C6C600C6C6C60021212100212121002121
      2100212121002121210021212100212121002121210021212100212121002121
      2100212121002121210021212100212121002121210021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7F7F700F7FFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00CECECE00C6C6
      C6005252520000000000000000000000000000000000000000007B7B7B00B5FF
      FF00B5FFFF00B5FFFF00B5E7FF00B5FFFF00B5E7FF00B5E7FF00B5E7FF0094DE
      FF00B5E7FF0094DEFF0094DEFF0094DEFF006BCEFF0094DEFF00C6C6C600009C
      6B0094949400B5E7FF00B5E7FF00B5FFFF00B5FFFF00F7FFFF00BDBDBD006B6B
      6B000094DE007B7B7B00BDBDBD00000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0042424200DEDEDE00DEDEDE00FFFFFF00A5A5A5009C9C9C009C9C
      9C0073737300737373005252520052525200424242004242420021212100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00FFFFFF0021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000F7AD0000F7AD
      0000F7AD0000DE94000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B5200007B5200007B5200007B5200000000
      000000000000000000000000000000000000000000000000000000000000CEFF
      FF000000000000000000CEFFFF00FFFFFF00F7FFFF00CEFFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7F7F700F7F7F700F7F7F700EFEFEF00CECECE00C6C6C6009C9C
      9C005252520000000000000000000000000000000000000000007B7B7B00F7FF
      FF00B5FFFF00B5FFFF00B5FFFF00B5E7FF00B5FFFF00B5E7FF00B5E7FF00B5E7
      FF0094DEFF00B5E7FF0094DEFF0094DEFF009494940094949400A5A5A500B5E7
      FF00B5E7FF00B5FFFF00B5FFFF00F7FFFF00F7FFFF00F7FFFF00C6C6C6006B6B
      6B000094DE007B7B7B0094949400000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00A5A5A500A5A5A5009C9C
      9C009C9C9C00737373007373730052525200525252004242420021212100DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00DEDEDE00F7FFFF0021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000FFB52100F7AD
      0000F7AD0000F7AD0000DE940000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B5200007B5200007B5200007B5200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEFFFF0000000000CEFFFF00FFFFFF00CEFFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7F7F700F7FFFF00F7F7F700EFEFEF00CECECE00C6C6C6009C9C9C009C9C
      9C005252520000000000000000000000000000000000000000007B7B7B00B5FF
      FF00F7FFFF00B5FFFF00B5FFFF00B5FFFF00B5E7FF00B5FFFF00B5E7FF00B5E7
      FF00B5E7FF0094DEFF009494940094949400DEDEDE00B5E7FF00B5E7FF00B5FF
      FF00B5FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00C6C6C6006B6B
      6B000094DE004AC6FF0084848400000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00C6C6C600A5A5A500A5A5
      A5009C9C9C009C9C9C007373730073737300525252005252520021212100DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00C6C6C600DEDEDE0021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000F7AD0000FFB5
      2100F7AD0000F7AD0000F7AD0000DE9400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B5200009C6B00007B5200007B5200007B5200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600CEFFFF0000FFFF00CEFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7F7F700EFEFEF00CECECE00C6C6C6009C9C9C009C9C9C007373
      73005252520000000000000000000000000000000000000000007B7B7B00F7FF
      FF00B5FFFF00F7FFFF00B5FFFF00B5FFFF00B5FFFF00B5E7FF00B5FFFF00A5A5
      A5009C9C9C00C6C6C600B5E7FF00B5E7FF00B5E7FF00B5FFFF00B5FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00D6D6D6006B6B
      6B000094DE004AC6FF007B7B7B00000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00C6C6C600C6C6C600A5A5
      A500A5A5A5009C9C9C009C9C9C0073737300737373005252520021212100DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00A5A5A500C6C6C60021212100C6C6C600F7FF
      FF00F7FFFF00525252000000000000000000000000000000000000000000F7AD
      0000FFB52100F7AD0000F7AD0000F7AD0000DE94000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C6B00009C6B00007B5200009C6B00007B5200007B5200000000
      0000000000000000000000000000000000000000000000000000CEFFFF00CEFF
      FF00CEFFFF0000FFFF00FFFFFF0000FFFF00CEFFFF00CEFFFF00CEFFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0052525200313131003131310031313100313131003131
      310031313100000000000000000000000000000000007B7B7B00F7FFFF00F7FF
      FF00F7FFFF00B5FFFF00F7FFFF00B5FFFF00B5FFFF00009C6B009C9C9C00B5E7
      FF00B5E7FF00B5E7FF00B5FFFF00B5FFFF00B5FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF007B7B7B006B6B6B00949494000094
      DE000094DE0000ADF7007B7B7B00000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00DEDEDE00C6C6C600C6C6
      C600A5A5A500A5A5A5009C9C9C009C9C9C00737373007373730021212100DEDE
      DE00DEDEDE00DEDEDE00FFFFFF009C9C9C00A5A5A50021212100C6C6C600F7FF
      FF00F7FFFF00525252000000000000000000000000000000000000000000FFB5
      2100F7AD0000FFB52100F7AD0000F7AD0000F7AD0000DE940000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD7B00009C6B00009C6B00009C6B00007B5200009C6B00007B5200006B6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000CEFFFF0000FFFF00CEFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF009C9C9C00FFFFFF00D6E7E700CECECE009C9C9C005252
      520000000000000000000000000000000000000000007B7B7B00FFFFFF00F7FF
      FF00F7FFFF00F7FFFF00949494009C9C9C00A5A5A500B5E7FF00B5E7FF00B5FF
      FF00B5FFFF00B5FFFF00B5FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00D6D6D6007B7B7B006B6B6B000094DE000094DE000094DE0000AD
      F70000ADF70021B5FF007B7B7B00000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00DEDEDE00DEDEDE00C6C6
      C600C6C6C600A5A5A500A5A5A5009C9C9C009C9C9C007373730021212100DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00737373009C9C9C0021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      0000FFB52100F7AD0000FFB52100F7AD0000F7AD0000F7AD0000DE940000F7AD
      0000000000000000000000000000000000000000000000000000BD7B0000BD7B
      00009C6B0000BD7B00009C6B00009C6B00009C6B00007B520000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000CEFFFF0000000000CEFFFF00FFFFFF00CEFFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF009C9C9C00D6E7E700CECECE009C9C9C00525252000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF00FFFF
      FF007B7B7B007B7B7B007B7B7B00B5E7FF00B5E7FF00B5FFFF00B5FFFF00B5FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00A5A5
      A5006B6B6B006B6B6B000094DE000094DE000094DE0000ADF70000ADF70021B5
      FF0021B5FF007B7B7B0000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00F7FFFF00DEDEDE00DEDE
      DE00C6C6C600C6C6C600A5A5A500A5A5A5009C9C9C009C9C9C0021212100DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00525252007373730021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      000000000000FFB52100F7AD0000FFB52100F7AD0000F7AD0000F7AD0000DE94
      0000F7AD0000DE940000DE940000DE940000BD7B0000DE940000BD7B0000BD7B
      0000BD7B00009C6B0000BD7B00009C6B00009C6B000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEFF
      FF000000000000000000CEFFFF00FFFFFF00F7FFFF00CEFFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF009C9C9C00CECECE009C9C9C0052525200000000000000
      00000000000000000000000000000000000000000000A5A5A5007B7B7B007B7B
      7B0000000000000000007B7B7B00B5FFFF00B5FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF007B7B7B006B6B6B000094
      DE000094DE000094DE0000ADF70000ADF70000ADF70000ADF70021B5FF0021B5
      FF00848484007B7B7B0000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00F7FFFF00F7FFFF00DEDE
      DE00DEDEDE00C6C6C600C6C6C600A5A5A500A5A5A5009C9C9C0021212100DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00424242005252520021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      00000000000000000000FFB52100F7AD0000FFB52100F7AD0000F7AD0000F7AD
      0000DE940000F7AD0000DE940000DE940000DE940000BD7B0000DE940000BD7B
      0000BD7B0000BD7B00009C6B0000BD7B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEFFFF00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF009C9C9C009C9C9C005252520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00C6C6C6007B7B7B006B6B6B000094DE000094DE000094
      DE007B7B7B007B7B7B0000ADF70000ADF70021B5FF0021B5FF0021B5FF007B7B
      7B007B7B7B000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00F7FFFF00F7FFFF00F7FF
      FF00DEDEDE00DEDEDE00C6C6C600C6C6C600A5A5A500A5A5A50021212100DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00212121004242420021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7AD0000FFB52100F7AD0000F7AD
      0000F7AD0000DE940000F7AD0000DE940000DE940000DE940000BD7B0000DE94
      0000BD7B0000BD7B0000F7AD0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C9C9C00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00A5A5A5007B7B7B000094DE000094DE000094DE0000ADF7007B7B7B007B7B
      7B0000000000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7FF
      FF00F7FFFF0052525200DEDEDE00DEDEDE00FFFFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00DEDEDE00DEDEDE00C6C6C600C6C6C600A5A5A500A5A5A5002121
      2100212121002121210010101000101010002121210021212100C6C6C600F7FF
      FF00F7FFFF005252520000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7AD0000FFB52100F7AD
      0000F7AD0000F7AD0000DE940000F7AD0000DE940000DE940000DE940000BD7B
      0000DE9400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00F7FFFF00F7FFFF007B7B7B007B7B7B007B7B
      7B000094DE000094DE0000ADF70000ADF7007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A50000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFB5
      2100FFB52100F7AD0000F7AD0000DE940000F7AD0000FFB52100F7AD00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B009C9C9C009C9C9C00000000008484
      84007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF00FFFFDFFFFFFFFF0F0000000000000000
      FFFFDFFFFFFFFC030000000000000000FFFF9FFFFFFFF8010000000000000000
      FFFF1FFFFFFFF8210000000000000000FFFE1FFF87C00F210000000000000000
      FFFC1FFF87C00C010000000000000000FFF81FFF87C008010000000000000000
      FFE00FFF87C108210000000000000000FF0003FF87C008610000000000000000
      FC0000FF87F808610000000000000000F800007F87C108010000000000000000
      F000003F87C008010000000000000000E000001F87E01C010000000000000000
      C000000F87F83E1F000000000000000080000007007FFFFF0000000000000000
      80000007007FFFFF000000000000000000000003007FFFFF0000000000000000
      0000000387007C07000000000000000000000003870038030000000000000000
      0000000387001801000000000000000000000003870C10610000000000000000
      00000003870E0FE1000000000000000000000003870E0FC10000000000000000
      80000007870E0F03000000000000000080000007870E0F070000000000000000
      C000000F870E0F030000000000000000E000001F870C18430000000000000000
      F000003F870018030000000000000000F800007F870038030000000000000000
      FC0000FF87007C070000000000000000FF0003FFFFFFFFFF0000000000000000
      FFE01FFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF83FFFE00007F03FFC0FF000000FFFC0000F
      FFE00007E01FF807F000000FFF800007FF000007C00FF003F000000FFF000003
      FF0000078007E001F000000FFE000003FF0000070003C000F000000FFC000001
      E000000700038000F000000FF8000001E000000700038000F000000FF8000001
      E000000700038000F000000FF0000001E000000700038000F000000FF0000001
      E000000700038000F000000FE0000003E000000700038000F000000FE0000003
      E000000780038000F000000FC0000007E000000780038001F000000FC000000F
      E0000007C0038001F000000F8000001FE0000007C0038003F000000F8000003F
      E0000007E0000003F000000F8000007FE0000007E0000007F000000F8000007F
      E0000007F0000007F000000F800000FFE0000007F003800FF000000FC00000FF
      E0000007F803800FF000000FE00001FFE0000007F803801FF000000FE00001FF
      E0000007FC03801FF000000FF00003FFE0000007FC00003FF000001FF80003FF
      E000003FFE00003FF000003FFC1C07FFE000003FFE00007FF000007FF80F07FF
      E00007FFFF0380FFF00000FFF007CFFFE00007FFFF8381FFF00001FFF007FFFF
      E00007FFFFC7C3FFF00003FFF007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1FFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000003FE03FFFFFFF00FFFFFF00FFF
      C0000003FE00FFFFFFC003FFFFC003FFC0000003F0003FFFFF0000FFFF0000FF
      C0000003E0000FFFFE00007FFE00007FC0000003E00003FFFC00003FFC00003F
      C0000003E00000FFF800001FF800001FC0000003E000003FF000000FF000000F
      C0000003E000000FF000000FF000000FC0000003E0000007E0000007E0000007
      C0000003E0000003E0000007E0000007C0000003E0000003C0000003C0000003
      C0000003E0000003C0000003C0000003C0000003E0000003C0000003C0000003
      C0000003E0000003C0018003C0018003C0000003E0000003C0018003C0018003
      C0000003E0000003C0000003C0000003C0000003E0000003C0000003C0000003
      C0000003E0000003C0000003C0000003C0000003E0000003E0000007E0000007
      C0000003E0000003E0000007E0000007C0000003E0000003F000000FF0000007
      C0000003E0000003F0000003F0000007FC0003FFE0000003F8000003F8000007
      FC0003FFE0000003FC000003FC000007FC0003FFF8000003FE000003FE000007
      FF000FFFFC00000FFF00001FFF000007FF000FFFFF00000FFFC0021FFFC00007
      FF000FFFFFFFFFFFFFF00E1FFFF00807FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF03FFFFFFFFFFFFFFFFFFC000007FFFFC03FC0000003FFFFFFFF
      FC000007FFFF003FC0000003FFF00FFFFC000007FFFC003FC0000003FFC003FF
      FC000007FFF0001FC0000003FF0001FFFC000007FFC0001FC0000003FE00007F
      FC000007FF00001FC0000003FC00003FFC000007FC00000FC0000003D807E01F
      FC000007F800000FC0000003C01FF80FFC000007F800000FC0000003C03FFC0F
      FC000007F800000FC0000003C07FFE07FC000007F0000007C0000003C0FFFF07
      FC000007F0000007C0000003C0FFFF87FC000007F0000007C0000003C07FFFFF
      FC000007E0000003C0000003C03FFFFFFC000007E0000003C0000003FFFFFFFF
      FC000007E0000003C0000003FFFFF807FC000007E0000003C0000003FFFFFC07
      FC000007C0000001C0000003C3FFFE07EC000007C0000001C0000003C1FFFE07
      F4000007C0000001C0000003C0FFFC07F0000007C0000001C0000003E07FF807
      C000000780000001C0000003E03FF007F800000F80000001C0000003F00FC037
      F400001F80000003C0000003F800007FEC00003F8C000003C0000003FC0000FF
      FC00007FFC000007C0000003FF0001FFFC0000FFFC000C1FC0000003FF8007FF
      FC0001FFFC003FFFC0000003FFE01FFFFFFFFFFFFC20FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object pmnSearch: TPopupMenu
    MenuAnimation = [maLeftToRight, maTopToBottom]
    OnPopup = pmnSearchPopup
    Left = 480
    Top = 80
    object MenuItem1: TMenuItem
      Caption = '_Play'
      ImageIndex = 21
      ShortCut = 116
      OnClick = Play1Click
    end
    object MenuItem2: TMenuItem
      Caption = '_Enqueue'
      ImageIndex = 22
      ShortCut = 117
      OnClick = Enqueue1Click
    end
    object MenuItem3: TMenuItem
      Caption = '_Playlist'
      Visible = False
      OnClick = Playlist1Click
    end
    object MenuItem4: TMenuItem
      Caption = '_OpenDir'
      OnClick = OpenDirClick
    end
    object MenuItem7: TMenuItem
      Caption = '_Save'
      OnClick = MenuItem7Click
    end
    object MenuItem5: TMenuItem
      Caption = '-'
      Visible = False
    end
    object MenuItem6: TMenuItem
      Caption = '_Information'
      ShortCut = 118
      Visible = False
      OnClick = Information1Click
    end
  end
  object ILSearchResults: TImageList
    Left = 328
    Top = 248
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000094DE0000527B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000527B00006B9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F700000000000000BD0000009C0000007B00
      000000000000000000000000000000000000006B9C006BCEFF006BCEFF004AC6
      FF006BCEFF004AC6FF004AC6FF0021B5FF004AC6FF0021B5FF0021B5FF0000AD
      F70021B5FF0000ADF70000527B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF21210000000000DE000000BD0000009C00
      00007B000000000000000000000000000000006B9C0094DEFF006BCEFF006BCE
      FF004AC6FF006BCEFF004AC6FF004AC6FF009C0000007B00000021B5FF0021B5
      FF0000ADF70021B5FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF212100F7000000DE0000000000
      0000000000000000000000000000FF4A4A000000000000000000000000000000
      00009C000000000000000000000000000000006B9C006BCEFF0094DEFF006BCE
      FF006BCEFF004AC6FF006BCEFF004AC6FF00BD0000009C0000007B00000021B5
      FF0021B5FF0000ADF70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00000000000000000000000000FF4A4A00FF212100F7000000DE00
      0000000000000000000000000000FF6B6B00FF4A4A0000000000000000000000
      0000BD000000000000000000000000000000006B9C0094DEFF006BCEFF0094DE
      FF006BCEFF00FF4A4A00FF2121006BCEFF004AC6FF00BD0000009C0000004AC6
      FF0021B5FF0021B5FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECECE0084848400000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF000000000000000000000000000000000000000000F700
      000000000000BD0000009C000000FF949400FF6B6B00FF4A4A00FF2121000000
      0000DE000000000000000000000000000000006B9C0094DEFF0094DEFF006BCE
      FF0094DEFF00FF6B6B00FF4A4A00FF2121006BCEFF004AC6FF00BD00000021B5
      FF004AC6FF0021B5FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF000000000000000000000000000000000000000000FF21
      210000000000DE000000BD0000009C000000FF949400FF6B6B00FF4A4A00FF21
      2100F7000000000000000000000000000000006B9C00B5E7FF0094DEFF0094DE
      FF006BCEFF0094DEFF00FF4A4A00FF4A4A004AC6FF006BCEFF00DE0000004AC6
      FF0021B5FF004AC6FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000000000FFFFFF00FFFFFF0000000000000000000000000000000000FF4A
      4A00000000000000000000000000000000009C00000000000000FF6B6B00FF4A
      4A00FF212100000000000000000000000000006B9C0094DEFF00B5E7FF0094DE
      FF0094DEFF006BCEFF0094DEFF00FF4A4A004AC6FF00FF212100F70000004AC6
      FF004AC6FF0021B5FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FF6B
      6B00FF4A4A00000000000000000000000000BD00000000000000000000000000
      000000000000000000000000000000000000006B9C00B5E7FF0094DEFF00B5E7
      FF0094DEFF0094DEFF006BCEFF00FF949400FF4A4A00FF4A4A00FF9494006BCE
      FF004AC6FF004AC6FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      00000000000000000000FFFFFF00FFFFFF00000000000000000000000000FF94
      9400FF6B6B00FF4A4A00FF21210000000000DE00000000000000000000000000
      000000000000000000000000000000000000006B9C00B5E7FF00B5E7FF0094DE
      FF00B5E7FF0094DEFF0094DEFF006BCEFF0094DEFF006BCEFF006BCEFF004AC6
      FF006BCEFF004AC6FF0000527B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000FF949400FF6B6B00FF4A4A00FF212100F700000000000000000000000000
      000000000000000000000000000000000000007BBD0000ADF70000ADF70000AD
      F70000ADF70000ADF70000ADF70000ADF700006B9C00006B9C00006B9C00006B
      9C00006B9C00006B9C000094DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF6B6B00FF4A4A00FF21210000000000000000000000
      00000000000000000000000000000000000000000000006B9C00B5E7FF0094DE
      FF006BCEFF004AC6FF0021B5FF00006B9C00007BBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006B9C00006B
      9C00006B9C00006B9C00006B9C00007BBD000000000000000000000000000000
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF1FFFFFFFFFFFFFF
      F0FF0001FFFFFFFFFE8F0001FFFFFFFFFE870001FF00FFFF1EF70001FF3CFFE7
      0E770001FF3DFFC3E8170001FF99FFDBE8070001FFDBFF99EF470001FFC3FFBD
      E77F0001FFE7FF3CE17F0001FFFFFF00F07F0001FFFFFFFFFC7F807FFFFFFFFF
      FFFFC0FFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
end
