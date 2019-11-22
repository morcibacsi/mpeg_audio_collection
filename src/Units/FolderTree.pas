unit FolderTree;

{$R-}

{$IFNDEF VER90}{$IFNDEF VER91}{$IFNDEF VER92}
   {$DEFINE DELPHI3UP}
{$ENDIF}{$ENDIF}{$ENDIF}

//  Change log
//     12/14/1999 -- Moved allocation of TStringList in FindPath routine
//                   to fix a memory leak.
//     03/15/2000 -- Exposed OnDblClick.
//     10/27/2000 -- Added explicit setting of Desktop.HasChildren, to
//                   accommodate desktops that don't contain folders.
//                   Added code to intercept end-session request and
//                   deregister SHChangeNotify when it occurs, lest
//                   the component inhibit system shutdown.
//                   Set self.Parent with blind TForm typecast rather than
//                   (AOwner as TForm), which can lead to invalid class
//                   error if the owner is, e.g., a TTabSheet.
//     11/30/2000 enhancements by Dennis Turov
//                -- Removed all unused local variables.
//                -- Removed Application.OnException:=nil from "ShowDesktop" procedure.
//                -- "GetFirstDriveLetter" moved to public section to prevent
//                   compiler's hint.
//                -- Changed self.parent casting from TForm to TWinControl.
//                -- Fixed "FindPath" problem when "GetDesktopNode" returns nil.
//                -- Added "Active" property for using with TNotebook and other
//                   components that have not a window handle.
//                -- foVirtualFirst added to FolderOptions.
//                -- String comparison in "FindPath" changed for case insensitivity.
//                -- Parent parameter in "CreateFolderNode" renamed to aParent
//                   to resolve a conflict with self.Parent  
//     12/07/2000 enhancements by Elliott Shevin
//                -- WndProc override used instead of WindowProc assignment,
//                   to provide necessary interception of WM_ENDSESSIONQUERY
//                   usable in Delphi 2.
//                -- Rearrangement of SHCHANGENOTIFYREGISTER and -DEREGISTER
//                   into procedures callable from Activate and Deactivate.
//                -- Avoidance of calling SHCHANGENOTIFYREGISTER in design mode.

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ShlObj, ShellAPI,
  {$IFDEF DELPHI3UP}
     ActiveX, ComObj;
  {$ELSE}
  OLE2;
  {$ENDIF}

const
  WM_CHANGENOTIFY = WM_USER + 2;

  {* constants used by SHChangeNotifyRegister  *}
  SHCNF_ACCEPT_INTERRUPTS      = $0001;
  SHCNF_ACCEPT_NON_INTERRUPTS  = $0002;
  SHCNF_NO_PROXY               = $8000;

type NOTIFYREGISTER = record
    pidlPath      : PItemIDList;
    bWatchSubtree : boolean;
end;
type PNOTIFYREGISTER = ^NOTIFYREGISTER;

type
  TPathInfo = record
     Path      : string;
     Text      : string;
     IconIndex : uInt;
     SelectedIndex : uInt;
     Pid           : PItemIdList;
  end;

type
  TDisplayMode = (dmAsis,dmUppercase,dmLowercase);
  TFilePathList = record
     Normal     : string;
     ForParsing : string;
     InFolder   : string;
  end;

  TFolderType  = (ftFolder,ftNetworkNeighborhood,ftRecycleBin,ftMyComputer,ftDesktop,
                  ftNetNode,ftNone);
  SFolderTypes  = set of TFolderType;
  TFolderOption = (foNetworkNeighborhood,foRecycleBin,foVirtualFirst);
  SFolderOption = set of TFolderOption;
  TEndSessionQueryEvent = procedure(Sender: TObject; var CanEndSession: Boolean)
                of object;

  function SHChangeNotifyRegister(
       hWnd        : HWND;
       dwFlags     : integer;
       wEventMask  : cardinal;
       uMsg        : UINT;
       cItems      : integer;
       lpItems     : PNOTIFYREGISTER) : HWND; stdcall;
  function SHChangeNotifyDeregister(
       hWnd        : HWND) : boolean; stdcall;
  function  CustomSortProc(Node1, Node2: TTreeNode; ParamSort: integer)
             : integer; stdcall;

type
  TFolderNode = record
     FN_Path         : string;
     FN_Text         : string;
     FN_Has_Parent   : boolean;
     FN_ShellFolder   : IShellFolder;
     FN_Type          : TFolderType;
     FN_PidLen        : word;
     FN_PidList       : PItemIdList;
end;

type
  TFolderTree = class(TCustomTreeView)
  private
     SysImageList     : TImageList;
     fDesktopPath     : string;
     fNetHoodPath     : string;
     fMessageHandle : hWnd;
     fDisplayMode         : TDisplayMode;
     fFolderOptions       : SFolderOption;
     AllocInterface            : IMalloc;
     NotifyRegister : PNotifyRegister;
     NotifyHandle   : hwnd;
     fEndSessionQuery  : TEndSessionQueryEvent;
     Folder_List    : TList;
     fActive: boolean;
     function  fGetNetHood         : TPathInfo;
     function  fGetSpecialFolder(nFolder : integer) : TPathInfo;
     function  CreateFolderNode(PidList   : PItemIdList;
                          aParent    : TTreeNode;
                          virtualok : boolean) : TTreeNode;
     procedure RetrieveSysImageList;
     procedure ShowDesktop;
     procedure ShowNetHood;
     procedure ShowRecycleBin;
     procedure SetDisplayMode (value : TDisplayMode);
     procedure SetFolderOptions (value : SFolderOption);

     function  GetLongFilePath(const Pid : PItemIdList;
                                     ShellFolder : IShellFolder)
                                          : TFilePathList;
     function  GetPathName(const Pid : PItemIdList; Flags : dword;
                                 ShellFolder : IShellFolder) : string;
     function  AttachFolders(var Node : TTreeNode) : boolean;
     function  FindPath(path : string; exact : boolean) : TTreeNode;
     procedure MessageProc(Var Message : TMessage);
     function  ParsePidl (Pidl : PITEMIDLIST) : string;
     procedure FreePidl(pidl : PItemIdList);
     procedure FreeChildren(Node : TTreeNode);
     procedure FreeNode(Sender : TObject; Node : TTreeNode);
     procedure DriveChanged(Sender: TObject; FirstDriveLetter: Char;
                  force : boolean);
     procedure TFolderTreeExpanding(Sender: TObject; Node: TTreeNode;
         var AllowExpansion: Boolean);
     procedure TFolderTreeDblClick(var Message: TMessage);
              message WM_LBUTTONDBLCLK;
     procedure CheckPath;
     function  GetDirectory : string;
     function  GetDesktopNode      : TTreeNode;
     function  GetMyComputerNode   : TTreeNode;
     function  GetNetHoodNode      : TTreeNode;
     function  GetBitBucketNode    : TTreeNode;
     function  GetSpecialNode(nodetype : TFolderType) : TTreeNode;
     procedure RegisterChangeNotify;
     procedure DeregisterChangeNotify;
     procedure WndProc(var msg: TMessage); override;
    { Private declarations }
    procedure SetActive(Value: boolean);
    procedure Activate;
    procedure Deactivate;
  protected
    procedure QueryEndSession(var msg: TMessage);
    { Protected declarations }
  public
    property Items;
    property Selected;
    property Directory : string read GetDirectory;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function  SetDirectory(path : string) : TTreeNode;
    function  GetPath (Node : TTreeNode) : string;
    function NodeShellFolder (Node : TTreeNode)  : IShellFolder;
    function NodeType (Node : TTreeNode)         : TFolderType;
    function NodeItemIdList (Node : TTreeNode)   : PItemIdList;
    function  GetFirstDriveLetter(unitmask:longint):char;
    { Public declarations }
  published
    property Active: boolean read fActive write SetActive;
    property FolderOptions : SFolderOption read fFolderOptions
                              write SetFolderOptions;
    property OnDblClick;
    property OnChange;
    property OnClick;
    property OnDragOver;
    property OnDragDrop;
    property DisplayMode : TDisplayMode read fDisplayMode write SetDisplayMode
                               default dmAsis;
    property ShowButtons;
    property ShowLines;
    property ShowRoot;
    property HideSelection;
    property Align;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Indent;
    property OnEnter;
    property OnExit;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnEndSessionQuery  : TEndSessionQueryEvent
                                         read fEndSessionQuery write fEndSessionQuery;
    { Published declarations }
  end;

procedure Register;

implementation

const
   VirtualFolders = [ftNetworkNeighborhood,ftNetNode,ftRecycleBin,ftMyComputer];
   Shell32DLL = 'shell32.dll';

function SHChangeNotifyRegister;
              external Shell32DLL index 2;
function SHChangeNotifyDeregister;
              external Shell32DLL index 4;


constructor TFolderTree.Create(AOwner : TComponent);
begin
   inherited Create(AOwner);

   items.clear;
   fFolderOptions := [];
   fDisplayMode   := dmAsis;
   self.ReadOnly    := true;
   Folder_List      := TList.create;
   self.OnDeletion  := FreeNode;
   fEndSessionQuery  := nil;

   {$IFDEF DELPHI3UP}
      CoGetMalloc(MEMCTX_TASK, AllocInterface);
   {$ELSE}
      SHGetMalloc(AllocInterface);
   {$ENDIF}
   self.parent      := (AOwner as TWinControl);
   fMessageHandle := AllocateHWnd(MessageProc);
   self.OnExpanding  := TFolderTreeExpanding;

   // Get the system image list.
   RetrieveSysImageList;
   with SysImageList do begin
      masked   := false;
      shareimages := true;
   end;
   self.Images := SysImageList;


   // If designing, activate the component.
   if csDesigning in ComponentState
     then begin
            Activate;
            if Items.Count > 0 then TopItem := Items[0];
   end;
end;

// ShowDesktop is performed when the component is created.
procedure TFolderTree.ShowDesktop;
var
   foldernode      : ^TFolderNode;
   FilePath        : TFilePathList;
   pathinfo        : TPathInfo;
   Desktop         : TTreeNode;
   MyComputer      : TTreeNode;
begin
   LockWindowUpdate(self.handle);
   try
     // Establish the node for the Desktop.
     pathinfo := fGetSpecialFolder(CSIDL_DESKTOP);
     fDesktopPath := pathinfo.path;
     Desktop := CreateFolderNode(pathinfo.pid,nil,true);  // Create a node for the Desktop
     foldernode  := Desktop.data;
     FilePath := GetLongFilePath(pathinfo.pid,foldernode^.FN_ShellFolder);
     with Desktop do begin
          text := FilePath.Normal;

          // Set FN_Path to the path name of the desktop, and indicate
          // it is the desktop.
          foldernode := data;
          with foldernode^ do begin
               FN_Path       := fDesktopPath;
               FN_Text       := text;
               FN_Type       := ftDesktop;
          end;
     end;

     // Attach the MyComputer node to the Desktop node.
     pathinfo := fGetSpecialFolder(CSIDL_DRIVES);
     MyComputer := CreateFolderNode(pathinfo.pid,GetDesktopNode,true);  // Create a node for the Desktop
     foldernode     := GetDesktopNode.data;
     FilePath := GetLongFilePath(pathinfo.pid, foldernode^.FN_ShellFolder);
     with MyComputer do begin
          text := FilePath.Normal;
          // Set FN_Path to a null string, and the type to ftMyComputer.
          foldernode := data;
          with foldernode^ do begin
               FN_Path       := '';
               FN_Text       := text;
               FN_Type       := ftMyComputer;
          end;
     end;
     // Add real folders on the desktop to the Desktop node, then
     // alphabetize. Don't do this if designing, because the expansion
     // below ignores the order not to recurse.
     if (csDesigning in ComponentState)
        then Desktop.HasChildren := true
        else begin
             AttachFolders(Desktop);
             Desktop.HasChildren := Assigned(pointer(Desktop.GetFirstChild));
        end;


     // Expand the Desktop node.
     GetDesktopNode.expand(false);

     // Expand the My Computer node.
     GetMyComputerNode.expand(false);
   finally
     LockWindowUpdate(0);
   end;
end;

// SetDisplayMode sets fDisplayMode, then changes the case of text
// in all nodes of the tree to the case specified.
procedure TFolderTree.SetDisplayMode (value : TDisplayMode);
   procedure SetCase(Node : TTreeNode);
   var
      foldernode : ^TFolderNode;
      child      : TTreeNode;
      i          : integer;
   begin
      foldernode := Node.data;
      case fDisplayMode of
        dmAsis        : Node.Text := foldernode^.FN_Text;
        dmUpperCase   : Node.Text := uppercase(foldernode^.FN_Text);
        dmLowerCase   : Node.Text := lowercase(foldernode^.FN_Text);
      end;
      for i := 0 to Node.count - 1 do begin
         child := Node.item[i];
         SetCase(child);
      end;
   end;

begin
   fDisplayMode := value;
   if Active then
     SetCase(GetDesktopNode);
end;

procedure TFolderTree.SetFolderOptions (value : SFolderOption);
begin
   fFolderOptions := value;
   if Active then begin
     ShowRecycleBin;
     ShowNetHood;
   end;
end;

// Establish the node for the Recycle Bin, if so desired.
procedure TFolderTree.ShowRecycleBin;
var
   pathinfo        : TPathInfo;
   foldernode      : ^TFolderNode;
   FilePath        : TFilePathList;
   BitBucket       : TTreeNode;
begin
   // If the Recycle Bin is desired, then add it to the tree.
   if foRecycleBin in fFolderOptions then begin
      BitBucket := GetBitBucketNode;
      if assigned(BitBucket)
         then exit;

      pathinfo := fGetSpecialFolder(CSIDL_BITBUCKET);
      BitBucket := CreateFolderNode(pathinfo.pid,GetDesktopNode,true);  // Create a node for the BitBucket
      foldernode := GetDesktopNode.data;
      FilePath := GetLongFilePath(pathinfo.pid,foldernode^.FN_ShellFolder);
      with BitBucket do begin
           text := FilePath.Normal;

           // Set FN_Path null, and indicate it is the BitBucket.
           foldernode := data;
           with foldernode^ do begin
                FN_Path       := '';
                FN_Text       := text;
                FN_Type       := ftRecycleBin;
           end;
      end;
   end

   // If the Recycle Bin is being cancelled, delete it.
   else begin
          BitBucket := GetBitBucketNode;
          if assigned(BitBucket) then BitBucket.Delete;
   end;
end;

// Establish the node for the NetHood if so desired.
procedure TFolderTree.ShowNetHood;
var
   pathinfo        : TPathInfo;
   foldernode      : ^TFolderNode;
   NetHood         : TTreeNode;
begin
   if foNetworkNeighborhood in fFolderOptions then begin
      NetHood := GetNetHoodNode;
      if assigned(NetHood)
         then exit;

      pathinfo := fGetNetHood;
      fNetHoodPath := pathinfo.path;
      NetHood := CreateFolderNode(pathinfo.pid,GetDesktopNode,true);  // Create a node for the NetHood
      with NetHood do begin
           text := pathinfo.text;

           // Set FN_Path to \\, which is the root of Network
           // Neighborhood, and set FN_Type to shows it is the NetHood.
           foldernode := data;
           with foldernode^ do begin
                FN_Path       := '\\';
                FN_Text       := text;
                FN_Type       := ftNetworkNeighborhood;
           end;
      end;
   end

   // If the NetHood is being cancelled, delete it.
   else begin
          NetHood := GetNetHoodNode;
          if assigned(NetHood) then NetHood.Delete;
   end;
end;

function  TFolderTree.fGetNetHood   : TPathInfo;
var
    FilePath : TFilePathList;
begin
    result := fGetSpecialFolder(CSIDL_NETWORK);
    FilePath := GetLongFilePath(result.pid,nil);
    result.text := FilePath.Normal;
end;

function TFolderTree.fGetSpecialFolder(nFolder : integer) : TPathInfo;
var
  aPidl: PItemIDList;
  fLinkDir : string;
  FileInfo  : TSHFileInfo;
begin
  // Get the folder location (as a PItemIDList)
  if SUCCEEDED(SHGetSpecialFolderLocation(self.parent.handle, nFolder, aPidl))
     then begin
       result.Pid := aPidl;

    // Get the actual path of the directory from the PItemIDList
       SetLength(fLinkDir, MAX_PATH); // SHGetPathFromIDList assumes MAX_PATH buffer
       SHGetPathFromIDList(aPidl, PChar(fLinkDir)); // Do it
       SetLength(fLinkDir, StrLen(PChar(fLinkDir)));
       Result.Path := fLinkDir;

       SHGetFileInfo(Pointer(aPidl),SFGAO_SHARE, FileInfo, sizeof(FileInfo),
              SHGFI_PIDL or SHGFI_SYSICONINDEX );
       Result.IconIndex:=FileInfo.iIcon;

       SHGetFileInfo(Pointer(aPidl),SFGAO_SHARE, FileInfo, sizeof(FileInfo),
              SHGFI_PIDL or SHGFI_SYSICONINDEX or SHGFI_OPENICON);
       Result.SelectedIndex:=FileInfo.iIcon;
  end;
end;

// CreateFolderNode creates a Folder_Node and inserts it under
// the "parent" node (if any), using the last of the path
// string as the Name, and setting the new node's text
// property to match.
function TFolderTree.CreateFolderNode(PidList   : PItemIdList;
                                aParent    : TTreeNode;
                                virtualok : boolean) : TTreeNode;
var
   filename  : string;
   path      : string;
   NewNodeData : ^TFolderNode;
   ParentNodeData   : ^TFolderNode;
   DesktopNodeData  : ^TFolderNode;
   FileInfo  : TSHFileInfo;
   ImageIndex: Uint;
   SelectedIndex : Uint;
   newnode   : TTreeNode;
   pidl      : PItemIdList;
   parentfolder    : IShellFolder;
   ShellFolder     : IShellFolder;
   Attributes      : uint;
   FilePath        : TFilePathList;
   virtualfolder   : boolean;
   pidlen          : word;
   parentpidlen    : word;
   parentpidbuf    : PItemIdList;
   pidbuf          : PItemIdList;
   itemid          : TSHItemID;
begin
   result := nil;
   try
      // Get the Long File Path for the PidList passed.
      if assigned(aParent)
         then begin
                ParentNodeData  := aParent.data;
                FilePath := GetLongFilePath(PidList,ParentNodeData^.FN_ShellFolder);
         end
         else
             FilePath := GetLongFilePath(PidList,nil);
      filename := FilePath.InFolder;
      path     := FilePath.ForParsing;

      // Get the attributes we're interested in for this folder.
      Attributes := SFGAO_SHARE or SFGAO_FILESYSTEM
                       or SFGAO_LINK or SFGAO_HASSUBFOLDER;
      if assigned(aParent)
         then begin
             ParentNodeData := aParent.data;
             ParentFolder   := ParentNodeData^.FN_ShellFolder;
             if (ParentFolder.GetAttributesOf(1,PidList,Attributes) <> NOERROR)
                then Attributes:=0;
             end
             else begin
                 ParentNodeData := nil;
                 Attributes := 0;
             end;

      virtualfolder := (Attributes and SFGAO_FILESYSTEM = 0);
      if assigned(ParentNodeData)
          then if ParentNodeData^.FN_Type in [ftNetworkNeighborhood,ftNetNode]
                  then virtualfolder := false;
      if (not virtualok) and (virtualfolder)
         then exit;

      // Create an absolute PidList for this node.
      if assigned(aParent)
         then begin
                parentpidlen := ParentNodeData^.FN_PidLen;
                parentpidbuf := ParentNodeData^.FN_PidList;
         end
         else begin
                parentpidlen := 0;
                parentpidbuf := nil;
         end;
      // Allocate a buffer large enough for the parent's Pid plus
      // the new one, plus the trailing nulls. Then concatenate the two.
      ItemId := PidList^.mkid;
      pidlen := ItemId.cb;
      getmem(pidbuf,pidlen + parentpidlen + 2);

      // Copy the parent's pidlist to the buffer, followed by
      // the new pidlist.
      if parentpidlen <> 0
         then begin
               system.move(parentpidbuf^,pidbuf^,parentpidlen);
               system.move(PidList^,pidbuf^.mkId.abID[parentpidlen-2],pidlen);
         end
         else  system.move(PidList^,pidbuf^,pidlen);

      pidbuf^.mkId.abID[parentpidlen + pidlen -2]:=0;
      pidbuf^.mkId.abID[parentpidlen + pidlen -1]:=0;

      // Establish a pidlist to use when acquiring the icons. If this is a
      // virtual folder, use the PidList passed to us. Otherwise, get one
      // by parsing the complete path name using the Desktop IShellFolder.
      if virtualfolder
         then pidl := PidList
         else pidl := PidBuf;

      SHGetFileInfo(Pointer(PidL),SFGAO_SHARE, FileInfo, sizeof(FileInfo),
                  SHGFI_PIDL or SHGFI_SYSICONINDEX);
      ImageIndex :=FileInfo.iIcon;
      if (FileInfo.dwAttributes or SFGAO_FOLDER) = FileInfo.dwAttributes
         then SHGetFileInfo(Pointer(PidL),SFGAO_SHARE, FileInfo, sizeof(FileInfo),
              SHGFI_PIDL or SHGFI_SYSICONINDEX or SHGFI_OPENICON);
      SelectedIndex:=FileInfo.iIcon;

      new(NewNodeData);

      with NewNodeData^ do begin
          FN_PidLen        := parentpidlen + pidlen;
          FN_PidList       := pidbuf;
          FN_Path          := path;
          FN_Text          := filename;
          FN_Has_Parent    := (aParent <> nil);
          FN_Type          := ftFolder;   // The calling routine may change this.

          // If this node has no parent, it must be the Desktop.
          if assigned(aParent) then begin
              ParentNodeData := aParent.data;
              parentfolder := ParentNodeData^.FN_ShellFolder;
              ParentFolder.BindToObject(PidList, nil, IID_ISHELLFOLDER,
                              pointer(FN_ShellFolder));
              if ParentNodeData^.FN_Type = ftNetworkNeighborhood
                   then begin
                          FN_Type := ftNetNode;
                          FN_Path := '\\' + filename;
                          FN_Text := filename;
              end;

              // Get the IShellFolder interface for the desktop,
              // so we can get folder attributes.
              DesktopNodeData := GetDesktopNode.data;
              ShellFolder := DesktopNodeData^.FN_ShellFolder;
          end
          else SHGetDesktopFolder(FN_ShellFolder);

          ShellFolder := FN_ShellFolder;
      end;

      if assigned(aParent)
            then if virtualfolder and (foVirtualFirst in FolderOptions)
                  then NewNode := self.Items.AddChildObjectFirst
                                                (aParent,FilePath.Normal,NewNodeData)
                  else NewNode := self.Items.AddChildObject
                                                (aParent,FilePath.Normal,NewNodeData)
            else NewNode := self.Items.AddObjectFirst
                          (self.selected,FilePath.Normal,NewNodeData);
      Folder_List.add(NewNode.data);
      result := NewNode;
      NewNode.ImageIndex := ImageIndex;
      NewNode.SelectedIndex := SelectedIndex;

      IF (Attributes or SFGAO_SHARE) = Attributes
         then NewNode.OverlayIndex := 0
         else if (Attributes or SFGAO_LINK) = Attributes
                 then NewNode.OverlayIndex := 1
                 else NewNode.OverlayIndex := -1;
         NewNode.HasChildren := ((Attributes or SFGAO_HASSUBFOLDER)
                                       = Attributes);

     case fDisplayMode of
           dmAsis           : NewNode.text := filename;
           dmLowercase      : NewNode.text := lowercase(filename);
           dmUppercase      : NewNode.text := uppercase(filename);
     end;
   finally
   end;
end;

procedure TFolderTree.RetrieveSysImageList;
Var
  FileInfo : TSHFileInfo;
  DesktopInfo       : TPathInfo;
begin
  DesktopInfo := fGetSpecialFolder(CSIDL_DESKTOPDIRECTORY);
  SysImageList := TImageList.create(self);
  SysImageList.shareimages := true;
  SysImageList.handle := SHGetFileInfo(pointer(DesktopInfo.Pid), 0, FileInfo, sizeof(FileInfo),
                       SHGFI_PIDL or SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
end;

Function TFolderTree.GetLongFilePath(const Pid : PItemIdList;
                                     ShellFolder : IShellFolder)
                                          : TFilePathList;
var
  sf  : IShellfolder;
begin
  sf := ShellFolder;
  if not(assigned(ShellFolder))
     then SHGetDesktopFolder(sf);

  result.Normal     := GetPathName(Pid,SHGDN_NORMAL, sf);
  result.ForParsing := GetPathName(Pid,SHGDN_FORPARSING, sf);
  result.InFolder   := GetPathName(Pid,SHGDN_INFOLDER, sf);
  {$IFNDEF DELPHI3UP}
    if not(assigned(ShellFolder))
       then sf.release;
  {$ENDIF}
end;


Function TFolderTree.GetPathName(const Pid : PItemIdList; Flags : dword;
                                 ShellFolder : IShellFolder) : string;
var
    StrReturn   : TStrRet;
Label Again;
begin
  Result:='';

Again:
  FillChar(StrReturn,SizeOf(StrReturn),#0);
  ShellFolder.GetDisplayNameOf(Pid,Flags, StrReturn);
  case StrReturn.uType of
    STRRET_WSTR   : begin
                      IF Assigned(StrReturn.pOleStr) Then Result:=WideCharToString(StrReturn.pOleStr)
                        else IF Flags=SHGDN_NORMAL Then begin
                          Flags:=SHGDN_FORPARSING;
                          GOTO Again;
                        end;
                    end;
    STRRET_OFFSET : Result:=StrPas(PChar(Pid)+StrReturn.uOffset);
    STRRET_CSTR   : Result:=Strpas(StrReturn.cStr);
  end;
end;

// GetDirectory is the read method for the Directory property.
// It calls GetPath using the currently selected node to build
// the current path.
function TFolderTree.GetDirectory : string;
var
    Node       :  TTreeNode;
begin
    if csDesigning in ComponentState then exit;
    Node := self.selected;
    result := GetPath(node);
end;

// NodeShellFolder returns the IShellFolder interface at the indicated node.
function  TFolderTree.NodeShellFolder  (Node : TTreeNode) : IShellFolder;
var
    foldernode : ^TFolderNode;
begin
    result := nil;
    if csDesigning in ComponentState then exit; 
    if assigned(Node)
       then begin
              foldernode := Node.data;
              result := foldernode^.FN_ShellFolder;
       end;
end;

// NodeType returns the folder type of the desired node.
function  TFolderTree.NodeType (Node : TTreeNode) : TFolderType;
var
    foldernode : ^TFolderNode;
begin
    result := ftNone;
    if csDesigning in ComponentState then exit; 
    if assigned(Node)
       then begin
              foldernode := Node.data;
              result := foldernode^.FN_Type;
    end;
end;

// NodeItemIdList returns the absolute PidList of the selected node.
function  TFolderTree.NodeItemIdList  (Node : TTreeNode)  : PItemIdList;
var
    foldernode : ^TFolderNode;
begin
    result := nil;
    if csDesigning in ComponentState then exit; 
    if assigned(Node)
       then begin
              foldernode := Node.data;
              result := foldernode^.FN_PidList;
    end;
end;

// SetDirectory calls FindPath to get the node closest to the path
// passed to it, then selects the Node in the tree and returns it.
function TFolderTree.SetDirectory(path : string) : TTreeNode;
var
   Node       : TTreeNode;
   foldernode : ^TFolderNode;
   inpath     : string;
begin
   if path <> ''
       then Node := FindPath(path, false)
       else Node := nil;
   self.selected := Node;
   result        := Node;

   // Verify the path still exists. If not, perform the DblClick
   // routine to collapse the node, and return nil.
   if assigned(Node)
     then begin
            foldernode := Node.data;
            inpath := foldernode^.FN_Path;
     end
     else inpath := '';
   if length(inpath) > 3
      then if FileGetAttr(inpath) = -1
           then begin
                  CheckPath;
                  result := nil;
                end;
end;

// When the user tries to expand a node with no children, add its
// subfolders as children.
procedure TFolderTree.TFolderTreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
   if (csDesigning in ComponentState)
      then if Node.level > 1
              then begin
                     AllowExpansion := false;
                     exit;
           end;

  // If Node already has children, we don't have to find them.
  try
     if Node.count > 0
        then begin
             AllowExpansion := true;
             exit;
             end;
//     foldernode := Node.data;
     LockWindowUpdate(self.handle);
     AllowExpansion := AttachFolders(Node);
     LockWindowUpdate(0);
  except
     AllowExpansion := false;
  end;
end;

// AttachFolders unconditionally attaches child folders to the
// node passed in Node.
function TFolderTree.AttachFolders(var Node : TTreeNode) : boolean;
var
  ParentNodeData : ^TFolderNode;
  newnode    : TTreeNode;
  path       : string;
  EnumList   : IEnumIDList;
  ParentFolder : IShellFolder;
  ItemIdList   : PItemIdList;
  DummyResult: ULONG;
  children   : boolean;
begin;
  screen.cursor := crHourGlass;
  children      := true;
  LockWindowUpdate(self.handle);
  result := false;
  path  := GetPath(Node);    // Get the complete path for this node.
  ParentNodeData := Node.data;
  ParentFolder := ParentNodeData^.FN_ShellFolder;

  // If the node being expanded is a root, lop off the backslash.
  if length(path) <= 3
      then system.delete(path,length(path),1);

  // Enumerate the folder's contents.
  if ParentFolder.EnumObjects(self.parent.handle,
                   SHCONTF_FOLDERS + SHCONTF_INCLUDEHIDDEN,EnumList) = NOERROR
     then begin
            children := false;
            EnumList.Reset;
            DummyResult := 1;
            while (EnumList.Next(1, ItemIdList, DummyResult)=NOERROR) do begin
                  newnode := CreateFolderNode(ItemIdList,Node,false);
                  FreePidl(ItemIdList);
                  if assigned(newnode)
                     then begin
                            children := true;
                            result := true;
                     end;
            end;
            {$IFNDEF DELPHI3UP}
            EnumList.Release;
            {$ENDIF}
     end;
     Node.HasChildren := children;

  // Alphabetize the nodes, unless the parent is MyComputer or
  // Network Neighborhood.
  if not (ParentNodeData^.FN_Type in [ftMyComputer,ftNetworkNeighborhood])
     then if children
              then Node.CustomSort(@CustomSortProc, 0);

  LockWindowUpdate(0);
  screen.cursor := crDefault;
end;

function CustomSortProc(Node1, Node2: TTreeNode; ParamSort: integer): integer; stdcall;
var
  foldernode : ^TFolderNode;
begin
  // If the first node is a special folder type, put it before the other
  // node in sort order. Otherwise, go by the node text, case insensitive.
  foldernode := Node1.data;
  if foldernode^.FN_Type in [ftNetworkNeighborhood,ftRecycleBin,ftMyComputer]
     then result := -1
     else result := StrIComp(PChar(Node1.Text),  PChar(Node2.Text));
end;

// GetPath returns the path name for true folders, and a null string
// for virtual folders.
function TFolderTree.GetPath (Node : TTreeNode) : string;
var
  path       : string;
  foldernode : ^TFolderNode;
  worknode   : TTreeNode;
begin
  path := '';
  if not assigned(Node)
     then exit;

  worknode := Node;
  foldernode := worknode.data;
  if foldernode^.FN_Type in VirtualFolders
     then exit;

  path := foldernode^.FN_Path;

  if length(path) > 0                   // If path is null, it's a virtual folder.
     then if length(path) < 3           // If the result is less than 3
             then path := path + '\';   // bytes, its the root--add a "\".
  result := path;
end;

// FindPath tries to find the path passed in "path" in the tree,
// and returns the node closest to it. If "exact" is true, we're
// interested only in an exact match among nodes already showing,
// and return nil if we don't get it; this is used by the routine
// that handles changes in the file system.
function TFolderTree.FindPath(path : string; exact : boolean) : TTreeNode;
var
   folder       : TStringList;
   workpath     : string;
   tail         : string;
   nodepath     : string;
   Node         : TTreeNode;
   LastNode     : TTreeNode;
   FolderNode   : ^TFolderNode;
   depth        : integer;
begin
   result := nil;
   // Break "path" up into individual levels, which are stored in
   // the folder list in LIFO order. If the path starts with the
   // desktop folder, we'll pile the whole desktop folder path
   // onto the stack at once.
   workpath := lowercase(path);
   if length(workpath) < 3
      then begin
           self.selected := nil;
           exit;
           end;
   if copy(workpath,length(workpath),1) = '\'    // Lop off any trailing
      then system.delete(workpath,length(workpath),1);  // backslash.

   folder := TStringList.create;  // Moved here 12/14/1999
   try
     while length(workpath) > 0 do begin
        if workpath = lowercase(fDesktopPath)
           then tail   := workpath
           else begin
                tail   := ExtractFileName(workpath);
                if tail = '' then tail := workpath;
                end;
        folder.insert(0,tail);
        workpath := copy(workpath,1,(length(workpath) - length(tail) - 1));
     end;

     // Locate each successive element of the path, one level
     // at a time, except: the first element must be found
     // at DesktopNode, in a child of MyComputerNode, or
     // at Network Neighborhood.
     workpath := folder[0];            // Set workpath to the first path node.
     Node := GetDesktopNode;
     if Assigned(Node) then begin
        FolderNode := Node.data;
        if lowercase(FolderNode^.FN_Path) = workpath
                                       // If the first path node is the desktop
           then                        // then continue processing...
           else begin
                if workpath = '\'
                   then Node := GetNetHoodNode
                   else begin
                          if GetMyComputerNode.count < 1
                              then GetMyComputerNode.expand(false);
                          Node := GetMyComputerNode.GetFirstChild;
                   end;
                while Node <> nil do begin
                    FolderNode := Node.data;                      // Search children of
                    nodepath   := FolderNode^.FN_Path;            // MyComputerNode for a match.
                    if copy(nodepath,length(nodepath),1) = '\'
                        then system.delete(nodepath,length(nodepath),1);
                    if AnsiCompareText(nodepath,workpath)=0 //lowercase(nodepath) = workpath
                       then break
                       else Node := GetMyComputerNode.GetNextChild(Node);
                end;
           end;
     end;
     // If no match is found, give up.
     if Node = nil
        then self.selected := nil

     // Starting with the children of the current Node, look for the
     // next level. Repeat until there is no match, or the list of
     // nodes is exhausted.
        else begin
             LastNode := Node;
             depth    := 1;
             while depth < Folder.count do begin
                if Node.count <= 0
                   then if (not exact)                   // Unless exact match is required,
                          then AttachFolders(LastNode);  // ensure children are found.
                Node := LastNode.GetFirstChild;
                workpath := workpath + '\' + Folder[depth];
                while Node <> nil do begin
                   FolderNode := Node.data;          // Search children of
                   if lowercase(FolderNode^.FN_Path)
                                         = workpath  // MyComputerNode for a match.
                      then break
                      else Node := GetMyComputerNode.GetNextChild(Node);
                end;

                // If a matching node was found, set LastNode to that node,
                // then try the next level down, if any.
                // If an exact match is required, return nil if we didn't
                // match at this level.
                if Node <> nil
                   then begin
                        LastNode := Node;
                        inc(depth);
                   end
                   else begin
                          if exact
                               then LastNode := nil;
                          break;
                   end;
             end;

             // Return the last matching nod.
             result := LastNode;
        end;
   finally
     folder.free;
   end;
end;

// MessageProc is the message handling routine.
procedure TFolderTree.MessageProc(var Message: TMessage);
type
   TPIDLLIST = record
      pidlist : array[1..2] of PITEMIDLIST;
   end;
   PIDARRAY = ^TPIDLLIST;
var
   Path1    : string;
   ptr      : PIDARRAY;
   p1,p2    : PITEMIDLIST;
   p        : integer;
   change   : integer;

   Node           : TTreeNode;
   NodeExpanded   : boolean;
   AllowExpansion : boolean;
   handled        : boolean;
   cursorpos      : TPoint;
begin
  handled := false;

  if Message.msg = WM_CHANGENOTIFY
    then begin
       // Assign a pointer to the array of PIDLs sent with the message.
       ptr := PIDARRAY(Message.wParam);

       // Parse the two PIDLs in the message.
       p1 := ptr^.pidlist[1];
       try
          SetLength(Path1,MAX_PATH);
          Path1 := ParsePidl(p1);
          p := pos(#00,Path1);
          if p > 0
            then SetLength(Path1,p - 1);
      except
         Path1 := '';
      end;

      // Free the PIDLs passed to this routine.
      FreePidl(p1);
      p2 := ptr^.pidlist[2];
      FreePidl(p2);

     // Handle file system changes here.
     change := Message.Lparam and (not SHCNE_INTERRUPT);

     case change of
        // If a new directory is made, locate the node for its parent
        // directory.
        SHCNE_MKDIR :       Node := FindPath(Path1,false); 

        // If an existing directory was deleted or renamed, locate the
        // node by exact match.
        SHCNE_RENAMEFOLDER,
        SHCNE_RMDIR:        begin
                               Node := FindPath(Path1,true);
                               if Node <> nil
                                    then Node := Node.parent;
                            end;
     end;
     case change of
        SHCNE_MKDIR,
        SHCNE_RENAMEFOLDER,
        SHCNE_RMDIR:
           begin
             if Node <> nil then begin
                NodeExpanded := Node.expanded;

                // If the node is expanded, collapse it.
                if NodeExpanded
                  then begin
                      LockWindowUpdate(self.handle);
                      Node.collapse(true);
                      LockWindowUpdate(0);
                end;

               // Free all the child nodes of the current node.
               FreeChildren(Node);

               // If this is the Desktop node, we've just freed all the nodes
               // for folders. TFolderTreeExpanding won't reallocate them
               // because the node has other child nodes (My Computer, etc.).
               // So allocate nodes for the folders now.

               if Node = GetDesktopNode
                 then AttachFolders(Node);

               // If the node was expanded before, expand it now. Otherwise,
               // just call the OnExpanding routine to attach child nodes
               // without showing.
               TFolderTreeExpanding(self, Node, AllowExpansion);
               if NodeExpanded
                  then Node.expand(false);
             end;
             handled := true;
           end;
     end;

     case change of
        SHCNE_MEDIAINSERTED,
        SHCNE_MEDIAREMOVED: begin
                              DriveChanged(self, path1[1], false);
                              handled := true;
                            end
     end;
  end;

  if (Message.Msg = WM_PAINT) then
     if csDesigning in ComponentState
        then begin
               GetCursorPos(cursorpos);
               cursorpos.x := cursorpos.x - parent.left;
               cursorpos.y := cursorpos.y - parent.top;
               top :=  cursorpos.y;
               left := cursorpos.x;
     end;

  if not handled
     then Message.Result :=
          DefWindowProc(fMessageHandle, Message.Msg,
                     Message.wParam, Message.lParam);
end;

// The function ParsePidl returns the string corresponding
// to a PIDL.
function TFolderTree.ParsePidl (Pidl : PITEMIDLIST) : string;
begin
      SetLength(result,MAX_PATH);
      if not SHGetPathFromIDList(Pidl,pchar(result))
          then result := '';
end;


function TFolderTree.GetFirstDriveLetter(unitmask : longint):char;
var DriveLetter : shortint;
begin
 DriveLetter := Ord('A');
 while (unitmask and 1)=0  do begin
  unitmask := unitmask shr 1;
  inc(DriveLetter);
 end;
 Result := Char(DriveLetter);
end;


destructor TFolderTree.Destroy;
begin
   Deactivate;
   DeAllocateHWnd(fMessageHandle);
   SysImageList.free;
  {$IFNDEF DELPHI3UP}
   IUnknown(AllocInterface).Release;
   {$ENDIF}

   Folder_List.free;

   inherited;
end;

// FreeChildren frees the descendants of the Node passed to it, and
// sets HasChildren to true to permit reexpansion.
procedure TFolderTree.FreeChildren(Node : TTreeNode);
var
  foldernode : ^TFolderNode;
  child      : TTreeNode;
  i          : integer;
begin
  for i := Node.count - 1 downto 0 do begin
     child := Node.item[i];
     foldernode := child.data;
     if not (foldernode^.FN_Type in [ftNetworkNeighborhood,ftMyComputer])
        then child.delete;
  end;
  Node.HasChildren := true;             // Attach the plus sign button
end;

procedure TFolderTree.FreeNode(Sender : TObject; Node : TTreeNode);
var
    foldernode : ^TFolderNode;
    path       : string;
    text       : string;
    pidbuf     : pointer;
begin
    foldernode := Node.data;

    pidbuf     := foldernode^.FN_PidList;
    freemem(pidbuf);

    path       := foldernode^.FN_Path;   // Make sure these strings
    text       := foldernode^.FN_Text;   // are freed.

    dispose(foldernode);
    Node.data := nil;
end;

procedure TFolderTree.DriveChanged(Sender: TObject; FirstDriveLetter: Char;
                                      force : boolean);
var
    Node       : TTreeNode;
    MyComputer : TTreeNode;
    path       : string;
    foldernode : ^TFolderNode;
    ShellFolder : IShellFolder;
    WCA : ARRAY[0..MAX_PATH] of WideChar;
    eaten      : ULong;
    attrib     : ULong;
    FilePathList : TFilePathList;
    Pidl         : PItemIdList;
begin
    try
       MyComputer := GetMyComputerNode;
       if not assigned(MyComputer)
          then exit;

       foldernode := GetMyComputerNode.Data;
       ShellFolder := foldernode^.FN_ShellFolder;

       // Find the node corresponding to the drive that has changed.
       if GetMyComputerNode.count > 0
          then Node := GetMyComputerNode.item[0]
          else Node := nil;
       while Node <> nil do begin
           foldernode := Node.data;
           if lowercase(foldernode^.FN_Path[1]) = lowercase(FirstDriveLetter)
               then break;
           Node := Node.GetNextSibling;
       end;
       if Node <> nil then begin
           path := FirstDriveLetter + ':\';      // Set "path"
           StringToWideChar(path,WCA,SizeOf(WCA));
           ShellFolder.ParseDisplayName(self.parent.handle,nil,@WCA,
                           eaten,Pidl,attrib);
           FilePathList := GetLongFilePath(Pidl,ShellFolder);
           FreePidl(Pidl);
           if (Node.text <> FilePathList.Normal) or (force) then begin
              LockWindowUpdate(self.handle);
              FreeChildren(Node);                   // Free its children
              Node.collapse(true);                  // Collapse the node.
              LockWindowUpdate(0);
              Node.text := FilePathList.Normal;
           end;
       end;
    except
    end;
end;

procedure TFolderTree.FreePidl(pidl : PItemIdList);
begin
  if (Assigned(Pidl)) AND (AllocInterface.DidAlloc(Pidl)>0) then
    AllocInterface.Free(Pidl);
end;

// When the user double-clicks on a node, and the path no longer
// exists, perform DriveChanged with force = true to collapse
// the tree at the drive level.
procedure TFolderTree.TFolderTreeDblClick(var Message: TMessage);
begin
     CheckPath;
     inherited;
end;

procedure TFolderTree.CheckPath;
var
     Node       : TTreeNode;
     foldernode : ^TFolderNode;
     path       : string;
begin
     if assigned(self.selected) then begin;
        Node := self.selected;
        foldernode := Node.data;
        path := foldernode^.FN_Path;
        if (length(path) > 3) and (path[1] <> '\')
           then if FileGetAttr(path) = -1
              then DriveChanged(self, path[1], true)
              else
           else Node.HasChildren := true;
     end;
end;

function  TFolderTree.GetDesktopNode      : TTreeNode;
begin
   if items.count > 0
      then result := items[0]
      else result := nil;
end;

function  TFolderTree.GetMyComputerNode   : TTreeNode;
begin
   result := GetSpecialNode(ftMyComputer);
end;

function  TFolderTree.GetNetHoodNode      : TTreeNode;
begin
   result := GetSpecialNode(ftNetworkNeighborhood);
end;

function  TFolderTree.GetBitBucketNode    : TTreeNode;
begin
   result := GetSpecialNode(ftRecycleBin);
end;

function TFolderTree.GetSpecialNode(nodetype : TFolderType) : TTreeNode;
var
   foldernode : ^TFolderNode;
   i          : integer;
begin
   result := nil;
   for i := 0 to items.count - 1 do begin
      foldernode := items[i].data;
      if foldernode^.FN_Type = nodetype
         then begin
                result := items[i];
                break;
      end;
   end;
end;

// This is our substitute window proc. Its function is to intercept
// the WM_QUERYENDSESSION message and act upon it.
procedure TFolderTree.WndProc(var msg: TMessage);
begin
  if Msg.Msg = WM_QUERYENDSESSION
     then QueryEndSession(Msg);

  // Call the original message handler.
  inherited;
end;

procedure TFolderTree.QueryEndSession(var msg: TMessage);
var
   CanEndSession : boolean;
begin
   CanEndSession := true;
   if Assigned(fEndSessionQuery)
      then fEndSessionQuery(Self, CanEndSession);
   if CanEndSession
      then begin
             DeregisterChangeNotify;
             Msg.Result := 1;
      end
      else Msg.Result := 0;
end;

procedure TFolderTree.RegisterChangeNotify;
begin
   // Don't trap change notifications while in design mode.
   if csDesigning in ComponentState
      then exit;

   new(NotifyRegister);
   with NotifyRegister^ do begin
      pidlPath      := nil;
      bWatchSubtree := true;
   end;

   // Register a change notification handle.
   NotifyHandle :=
       SHChangeNotifyRegister(
           fMessageHandle,
           SHCNF_ACCEPT_INTERRUPTS+SHCNF_ACCEPT_NON_INTERRUPTS,
           // We're watching for the following events.
           SHCNE_MEDIAINSERTED +
           SHCNE_MEDIAREMOVED +
           SHCNE_MKDIR +
           SHCNE_RENAMEFOLDER +
           SHCNE_RMDIR,
           WM_CHANGENOTIFY, // WM_CHANGENOTIFY is the message number used for notifications
           1,               // There is one subtree being watched: Desktop (i.e., everything)
           NotifyRegister); // This parm indicates what's being watched.

   if NotifyHandle = 0
      then raise Exception.Create('Could not register SHChangeNotify');
end;

// This procedure unhooks the SHChangeNotifyRegister hook. It's needed
// both when the component is destroyed and if system shutdown is detected.
procedure TFolderTree.DeregisterChangeNotify;
begin
   try
      if assigned(NotifyRegister)
         then dispose (NotifyRegister);
   finally
      NotifyRegister := nil;
   end;

   try
      if NotifyHandle <> 0
         then begin
            SHChangeNotifyDeregister(NotifyHandle);
         end
   finally
      NotifyHandle := 0;
   end;
end;

procedure TFolderTree.SetActive(Value: boolean);
begin
  if Value then Activate else Deactivate;
end;

procedure TFolderTree.Activate;
begin
  if fActive then Exit;
  fActive:=true;
  ShowDesktop;
  FolderOptions:=FolderOptions;
  DisplayMode:=DisplayMode;
  RegisterChangeNotify;  // Register the change notification.
end;

procedure TFolderTree.Deactivate;
begin
  DeRegisterChangeNotify;  // Unregister the change notification.

  // Delete the top node. That will take care of deleting
  // all the others.
  if self.items.count>0
      then self.items[0].delete;
  fActive:=false;
end;

procedure Register;
begin
  RegisterComponents('Custom', [TFolderTree]);
end;

end.
