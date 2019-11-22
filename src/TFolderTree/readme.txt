//*******************************************************
//*       TFolderTree Component for Delphi 2.0 and up   *
//*       version 3.2       Dec 7, 2000                 *
//*       by Elliott Shevin, Oak Park, Mich. USA        *
//*       email: shevine@aol.com                        *
//*                                                     *
//*       This release includes improvements from       *
//*       Dennis Turov, detailed below.                 *
//*                                                     *
//*       NOTE: if you are using TFolderTree in an      *
//*       existing project, visit each occurrence       *
//*       and set its Active property to False and      *
//*       then to True again. If you allocate a         *
//*       TFolderTree dynamically, you must set         *
//*       its Active property to True in code before    *
//*       referencing anything that can only exist      *
//*       once the path is built, such as the Path      *
//*       property.                                     *
//*                                                     *
//*       A visual component that displays a folder     *
//*       tree similar to the left pane of Windows      *
//*       Explorer. There are many of these for later   *
//*       versions of Delphi, but for D2 I had to roll  *
//*       my own. However, it's also useful with later  *
//*       releases of Delphi.                           *
//*                                                     *
//*       This component is freeware. Use it in good    *
//*       health, no restrictions, but I will           *
//*       appreciate an acknowledgment.                 *
//*                                                     *
//*       Release 2.0 allows access to Network          *
//*       Neighborhood and the Recycle Bin, and shows   *
//*       appropriate overlays for shared folders and   *
//*       shortcuts. And, it works under Windows NT.    *
//*                                                     *
//*       Release 2.2 fixes some memory leaks in        *
//*       version 2.0, and exposes the OnDblClick       *
//*       event, which I found useful.                  *
//*                                                     *
//*       Release 3.0 uses the undocumented SHChange-   *
//*       NotifyRegister API call (courtesy of James    *
//*       Holderness) to determine when the file system *
//*       changes or a CD is inserted or removed; and   *
//*       it stops reading removeable drives when       *
//*       created.                                      *
//*                                                     *
//*       Release 3.1 fixes an error in the order of    *
//*       releasing memory, which surfaced only when    *
//*       the component was deleted from a form at      *
//*       design time or explicity freed during         *
//*       execution.                                    *
//*                                                     *
//*       Release 3.2 contains these improvements by    *
//*       Dennis Turov                                  *
//*        -- Added "Active" boolean property for use   *
//*           with TNotebook and other components with  *
//*           no window handle. The default is True.    *
//*        -- foVirtualFirst (set member) added to      *
//*           FolderOptions. When true, it brings       *
//*           Network Neighborhood and Recycle Bin      *
//*           to the top of the tree when displayed.    *
//*           Default is false.                         *
//*******************************************************

Just install the component as you usually do. As written,
it installs to the Customn tab of the component palette.

You'll find a sample project included.

TFolderTree shares most methods and properties with TTreeView.
Here are the more important differences.

Published properties:
    Active        : (boolean) controls whether the tree is displayed.
                    It's possible to toggle between true and false.
                    The default is True.
    Directory     : (string) the complete directory path (minus the
                    trailing backslash) corresponding to the currently 
                    selected node. If the user selects the Desktop,
                    this is the corresponding directory. If the user 
                    selects My Computer, it's null.
    DisplayMode   : (enumerated) controls whether nodes are displayed
                    in uppercase, lowercase, or as is.
    FolderOptions : (set) controls whether the Network Neighborhood
                    and/or Recycle Bin appear in the tree. Both
                    default to "false," for compatibility with earlier
                    versions of this component. Also controls whether
                    these folders appear at the top or the bottom of
                    the tree.

Methods:
    function SetDirectory(path : string) : TTreeNode;
                  Finds the deepest node in the structure corresponding 
                  to "path", selects that node, and returns it. The 
                  returned node can be passed to GetPath (below) to 
                  obtain the complete path corresponding to the node.

    GetPath (Node : TTreeNode) : string;
                  Returns the path corresponding to the node passed.
    NodeShellFolder (Node : TTreeNode) : IShellFolder;
                  Returns the IShellFolder interface for the node 
                  passed to it.
    NodeType (Node : TTreeNode) : TFolderType;
                  Returns the type of node passed, which
                  is one of the following of type TFolderType,
                  defined in the component:
                    ftFolder--an actual folder other than the Desktop
                    ftNetworkNeighborhood--the Network Neighborhood node
                    ftRecycleBin--the Recycle Bin
                    ftMyComputer--the My Computer node
                    ftDesktop--the Desktop node
                    ftNetNode--the node corresponding to a computer
                              under Network Neighborhood.
                  Of these, only ftFolder and fdDesktop represent actual
                  directories. The others are virtual folders, and 
                  GetPath returns a null string for them.
    property NodeItemIdList (Node : TTreeNode) : PItemIdList;
                  Returns a pointer to the absolute ITEMIDLIST at
                  the node passed.


Notes:
    The Network Neighborhood tree behaves just like any local
    directory, as far as the values returned by GetPath and
    Directory, and behavior with SetDirectory. Note that paths
    for network drives begin with a double backslash, as opposed
    to a letter-colon-backslash as on local drives, but I have
    found the differences transparent as far as locating a file
    or use with this component.

    If you do show the Recycle Bin, it's up to you how you use
    it. The NodeShellFolder, NodeItemIdList, and NodeType methods
    are furnished to help enumerate files in the Bin using 
    IShellFolder methods similar to those used in the component.
    I have no idea how to use the information.

    If you need Control Panel, Printers, Dial-Up Networking, or
    other virtual folders with this component, let me know and 
    I'll work on it. I couldn't easily get the correct icons 
    to appear with them, and since they're not true folders, 
    I let it go.

    If the component is placed on a form that isn't visible, it some-
    times behaves strangely when the form finally becomes visible; the
    "expand" boxes don't appear next to those nodes that should
    have them.
    I don't know why, nor whether it will also happen if the component 
    isn't initially visible on a form that is. My workaround has been 
    to create the TFolderTree as part of a FormShow event handler. But
    I've been having better luck, and suggest you not bother with this
    if you don't find it necessary.

    Another difficulty is that changes to the CD drive aren't 
    reflected accurately; the first time a CD is removed isn't 
    indicated. And, if (say) Explorer is also running, this 
    component's display shows the CD is present when it's absent,
    and vice versa. Advice, anyone?

    As for changes in directory structures: the node containing 
    the changed structure is collapsed and re-expanded.

I'll be happy to hear your comments and suggestions at: shevine@aol.com.