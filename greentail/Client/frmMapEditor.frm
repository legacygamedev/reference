VERSION 5.00
Begin VB.Form frmMapEditor 
   Caption         =   "Map Editor"
   ClientHeight    =   5355
   ClientLeft      =   2910
   ClientTop       =   3840
   ClientWidth     =   6975
   ControlBox      =   0   'False
   Icon            =   "frmMapEditor.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   357
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   465
   Begin VB.VScrollBar scrlPicture 
      Height          =   5385
      LargeChange     =   10
      Left            =   0
      Max             =   512
      TabIndex        =   2
      Top             =   0
      Width           =   255
   End
   Begin VB.PictureBox picBack 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   5400
      Left            =   255
      ScaleHeight     =   360
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   448
      TabIndex        =   0
      Top             =   0
      Width           =   6720
      Begin VB.PictureBox picBackSelect 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   5400
         Left            =   0
         ScaleHeight     =   360
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   448
         TabIndex        =   1
         Top             =   0
         Width           =   6720
         Begin VB.Shape shpSelected 
            BorderColor     =   &H000000FF&
            Height          =   480
            Left            =   0
            Top             =   0
            Width           =   480
         End
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuSave 
         Caption         =   "Save"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
      Begin VB.Menu mnuBreak2 
         Caption         =   "----------"
      End
      Begin VB.Menu mnuMinimize 
         Caption         =   "Minimze"
      End
   End
   Begin VB.Menu mnuMap 
      Caption         =   "Map"
      Begin VB.Menu mnuProperties 
         Caption         =   "Properties"
      End
      Begin VB.Menu mnuFill 
         Caption         =   "Fill"
      End
      Begin VB.Menu mnuEyeDropper 
         Caption         =   "Eye Dropper"
      End
   End
   Begin VB.Menu mnuDisplay 
      Caption         =   "Display"
      Begin VB.Menu mnuScreenshot 
         Caption         =   "Screenshot Mode"
      End
      Begin VB.Menu mnuNPCs 
         Caption         =   "NPCs"
      End
      Begin VB.Menu mnuPlayers 
         Caption         =   "Players"
      End
      Begin VB.Menu mnuAttributeNpcs 
         Caption         =   "Attribute NPCs"
      End
      Begin VB.Menu mnuBreak 
         Caption         =   "---------------------"
      End
      Begin VB.Menu mnuMapGrid 
         Caption         =   "Map Grid"
      End
      Begin VB.Menu mnuDayNight 
         Caption         =   "Day/Night"
      End
   End
   Begin VB.Menu mnuTileSheet 
      Caption         =   "Tile Sheet"
      Begin VB.Menu mnuSet 
         Caption         =   "Tile Set 0"
         Checked         =   -1  'True
         Index           =   0
      End
      Begin VB.Menu mnuSet 
         Caption         =   "Tile Set 1"
         Index           =   1
      End
      Begin VB.Menu mnuSet 
         Caption         =   "Tile Set 2"
         Index           =   2
      End
      Begin VB.Menu mnuSet 
         Caption         =   "Tile Set 3"
         Index           =   3
      End
      Begin VB.Menu mnuSet 
         Caption         =   "Tile Set 4"
         Index           =   4
      End
      Begin VB.Menu mnuSet 
         Caption         =   "Tile Set 5"
         Index           =   5
      End
      Begin VB.Menu mnuSet 
         Caption         =   "Tile Set 6"
         Index           =   6
      End
      Begin VB.Menu mnuSet 
         Caption         =   "Tile Set 7"
         Index           =   7
      End
   End
   Begin VB.Menu mnuTypes 
      Caption         =   "Select Type"
      Begin VB.Menu mnuType 
         Caption         =   "Layers"
         Checked         =   -1  'True
         Index           =   1
      End
      Begin VB.Menu mnuType 
         Caption         =   "Attributes"
         Index           =   2
      End
      Begin VB.Menu mnuType 
         Caption         =   "Light"
         Index           =   3
      End
   End
End
Attribute VB_Name = "frmMapEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' // MAP EDITOR STUFF //
Dim KeyShift As Boolean

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyShift Then
        KeyShift = True
    End If
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    KeyShift = False
End Sub

Private Sub Form_Resize()
    If frmMapEditor.WindowState = 0 Then
        If frmMapEditor.Width > picBack.Width + scrlPicture.Width Then frmMapEditor.Width = (picBack.Width + scrlPicture.Width + 8) * Screen.TwipsPerPixelX
        picBack.Height = (frmMapEditor.Height - 800) / Screen.TwipsPerPixelX
        scrlPicture.Height = (frmMapEditor.Height - 800) / Screen.TwipsPerPixelX
        frmMapEditor.scrlPicture.max = ((frmMapEditor.picBackSelect.Height - frmMapEditor.picBack.Height) / PIC_Y)
        If frmMapEditor.Height > (picBackSelect.Height * Screen.TwipsPerPixelX) + 800 Then frmMapEditor.Height = (picBackSelect.Height * Screen.TwipsPerPixelX) + 800
        
        frmAttributes.WindowState = 0
    End If
End Sub

Private Sub mnuDayNight_Click()
    If mnuDayNight.Checked = True Then
        mnuDayNight.Checked = False
    Else
        mnuDayNight.Checked = True
    End If
End Sub

Private Sub mnuExit_Click()
Dim X As Long

    X = MsgBox("Are you sure you want to discard your changes?", vbYesNo)
    If X = vbNo Then
        Exit Sub
    End If
    
    mnuSet(0).Checked = True
    mnuSet(1).Checked = False
    mnuSet(2).Checked = False
    mnuSet(3).Checked = False
    mnuSet(4).Checked = False
    mnuSet(5).Checked = False
    mnuSet(6).Checked = False
    mnuSet(7).Checked = False
    ScreenMode = 0
    Call EditorCancel
End Sub

Private Sub mnuEyeDropper_Click()
    If frmMapEditor.MousePointer = 2 Or frmMirage.MousePointer = 2 Then
        frmMapEditor.MousePointer = 1
        frmMirage.MousePointer = 1
    Else
        frmMapEditor.MousePointer = 2
        frmMirage.MousePointer = 2
    End If
End Sub

Private Sub mnuFill_Click()
Dim Y As Long
Dim X As Long

X = MsgBox("Are you sure you want to fill the map?", vbYesNo)
If X = vbNo Then
    Exit Sub
End If

If frmMapEditor.mnuType(1).Checked = True Then
    For Y = 0 To MAX_MAPY
        For X = 0 To MAX_MAPX
            With Map(GetPlayerMap(MyIndex)).Tile(X, Y)
                If frmAttributes.optGround.value = True Then
                    .Ground = EditorTileY * TilesInSheets + EditorTileX
                    .GroundSet = EditorSet
                End If
                If frmAttributes.optMask.value = True Then
                    .Mask = EditorTileY * TilesInSheets + EditorTileX
                    .MaskSet = EditorSet
                End If
                If frmAttributes.optAnim.value = True Then
                    .Anim = EditorTileY * TilesInSheets + EditorTileX
                    .AnimSet = EditorSet
                End If
                If frmAttributes.optMask2.value = True Then
                    .Mask2 = EditorTileY * TilesInSheets + EditorTileX
                    .Mask2Set = EditorSet
                End If
                If frmAttributes.optM2Anim.value = True Then
                    .M2Anim = EditorTileY * TilesInSheets + EditorTileX
                    .M2AnimSet = EditorSet
                End If
                If frmAttributes.optFringe.value = True Then
                    .Fringe = EditorTileY * TilesInSheets + EditorTileX
                    .FringeSet = EditorSet
                End If
                If frmAttributes.optFAnim.value = True Then
                    .FAnim = EditorTileY * TilesInSheets + EditorTileX
                    .FAnimSet = EditorSet
                End If
                If frmAttributes.optFringe2.value = True Then
                    .Fringe2 = EditorTileY * TilesInSheets + EditorTileX
                    .Fringe2Set = EditorSet
                End If
                If frmAttributes.optF2Anim.value = True Then
                    .F2Anim = EditorTileY * TilesInSheets + EditorTileX
                    .F2AnimSet = EditorSet
                End If
            End With
        Next X
    Next Y
ElseIf frmMapEditor.mnuType(2).Checked = True Then
    For Y = 0 To MAX_MAPY
        For X = 0 To MAX_MAPX
            With Map(GetPlayerMap(MyIndex)).Tile(X, Y)
                If frmAttributes.optBlocked.value = True Then .Type = TILE_TYPE_BLOCKED
                If frmAttributes.optWarp.value = True Then
                    .Type = TILE_TYPE_WARP
                    .Data1 = EditorWarpMap
                    .Data2 = EditorWarpX
                    .Data3 = EditorWarpY
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If

                If frmAttributes.optHeal.value = True Then
                    .Type = TILE_TYPE_HEAL
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If

                If frmAttributes.optKill.value = True Then
                    .Type = TILE_TYPE_KILL
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If

                If frmAttributes.optItem.value = True Then
                    .Type = TILE_TYPE_ITEM
                    .Data1 = ItemEditorNum
                    .Data2 = ItemEditorValue
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optNpcAvoid.value = True Then
                    .Type = TILE_TYPE_NPCAVOID
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optKey.value = True Then
                    .Type = TILE_TYPE_KEY
                    .Data1 = KeyEditorNum
                    .Data2 = KeyEditorTake
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optKeyOpen.value = True Then
                    .Type = TILE_TYPE_KEYOPEN
                    .Data1 = KeyOpenEditorX
                    .Data2 = KeyOpenEditorY
                    .Data3 = 0
                    .String1 = KeyOpenEditorMsg
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optShop.value = True Then
                    .Type = TILE_TYPE_SHOP
                    .Data1 = EditorShopNum
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optCBlock.value = True Then
                    .Type = TILE_TYPE_CBLOCK
                    .Data1 = EditorItemNum1
                    .Data2 = EditorItemNum2
                    .Data3 = EditorItemNum3
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optArena.value = True Then
                    .Type = TILE_TYPE_ARENA
                    .Data1 = Arena1
                    .Data2 = Arena2
                    .Data3 = Arena3
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optSound.value = True Then
                    .Type = TILE_TYPE_SOUND
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = SoundFileName
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optSprite.value = True Then
                    .Type = TILE_TYPE_SPRITE_CHANGE
                    .Data1 = SpritePic
                    .Data2 = SpriteItem
                    .Data3 = SpritePrice
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optSign.value = True Then
                    .Type = TILE_TYPE_SIGN
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = SignLine1
                    .String2 = SignLine2
                    .String3 = SignLine3
                End If
                If frmAttributes.optDoor.value = True Then
                    .Type = TILE_TYPE_DOOR
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optNotice.value = True Then
                    .Type = TILE_TYPE_NOTICE
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = NoticeTitle
                    .String2 = NoticeText
                    .String3 = NoticeSound
                End If
                If frmAttributes.optChest.value = True Then
                    .Type = TILE_TYPE_CHEST
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optClassChange.value = True Then
                    .Type = TILE_TYPE_CLASS_CHANGE
                    .Data1 = ClassChange
                    .Data2 = ClassChangeReq
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optScripted.value = True Then
                    .Type = TILE_TYPE_SCRIPTED
                    .Data1 = ScriptNum
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optNPC.value = True Then
                    .Type = TILE_TYPE_NPC_SPAWN
                    .Data1 = NPCSpawnNum
                    .Data2 = NPCSpawnAmount
                    .Data3 = NPCSpawnRange
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optBank.value = True Then
                    .Type = TILE_TYPE_BANK
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
                If frmAttributes.optSell.value = True Then
                    .Type = TILE_TYPE_SELL
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                    .String1 = ""
                    .String2 = ""
                    .String3 = ""
                End If
            End With
        Next X
    Next Y
ElseIf frmMapEditor.mnuType(3).Checked = True Then
    For Y = 0 To MAX_MAPY
        For X = 0 To MAX_MAPX
            Map(GetPlayerMap(MyIndex)).Tile(X, Y).Light = EditorTileY * TilesInSheets + EditorTileX
        Next X
    Next Y
End If
End Sub

Private Sub mnuMapGrid_Click()
    If mnuMapGrid.Checked = True Then
        WriteINI "CONFIG", "MapGrid", 0, App.Path & "\config.ini"
        mnuMapGrid.Checked = False
    Else
        WriteINI "CONFIG", "MapGrid", 1, App.Path & "\config.ini"
        mnuMapGrid.Checked = True
    End If
End Sub

Private Sub mnuMinimize_Click()
    frmMapEditor.WindowState = 1
    frmAttributes.WindowState = 1
End Sub

Private Sub mnuProperties_Click()
    frmMapProperties.Show vbModal
End Sub

Private Sub mnuSave_Click()
Dim X As Long

    X = MsgBox("Are you sure you want to make these changes?", vbYesNo)
    If X = vbNo Then
        Exit Sub
    End If
    
    mnuSet(1).Checked = True
    mnuSet(2).Checked = False
    mnuSet(3).Checked = False
    mnuSet(4).Checked = False
    mnuSet(5).Checked = False
    mnuSet(6).Checked = False
    mnuSet(7).Checked = False
    ScreenMode = 0
    Call EditorSend
End Sub

Private Sub mnuScreenshot_Click()
    If mnuScreenshot.Checked = True Then
        ScreenMode = 0
        mnuScreenshot.Checked = False
    Else
        ScreenMode = 1
        mnuScreenshot.Checked = True
    End If
End Sub

Private Sub mnuSet_Click(index As Integer)

    If mnuSet(index).Checked = False Then
        mnuSet(index).Checked = True
        picBackSelect.Picture = LoadPNG(App.Path & "\GFX\Tiles" & index & ".png")
        EditorSet = index
        
        scrlPicture.max = ((picBackSelect.Height - picBack.Height) / PIC_Y)
        frmMapEditor.picBack.Width = frmMapEditor.picBackSelect.Width
        If frmMapEditor.Width > picBack.Width + scrlPicture.Width Then frmMapEditor.Width = (picBack.Width + scrlPicture.Width + 8) * Screen.TwipsPerPixelX
        If frmMapEditor.Height > (picBackSelect.Height * Screen.TwipsPerPixelX) + 800 Then frmMapEditor.Height = (picBackSelect.Height * Screen.TwipsPerPixelX) + 800
    End If
    
    Dim i As Byte
    For i = 0 To ExtraSheets
        If i <> index Then mnuSet(i).Checked = False
    Next i
End Sub

Private Sub mnuType_Click(index As Integer)
Dim i As Byte

    mnuType(index).Checked = True
    If index = 1 Then
        If mnuType(1).Checked = True Then
            frmAttributes.fraLayers.Visible = True
            frmAttributes.fraAttribs.Visible = False
            mnuTileSheet.Enabled = True
            frmAttributes.Visible = True
        End If
    ElseIf index = 2 Then
        If mnuType(2).Checked = True Then
            frmAttributes.fraLayers.Visible = False
            frmAttributes.fraAttribs.Visible = True
            shpSelected.Width = 32
            shpSelected.Height = 32
            mnuTileSheet.Enabled = True
            frmAttributes.Visible = True
        End If
    Else
        If mnuType(3).Checked = True Then
            frmAttributes.fraLayers.Visible = False
            frmAttributes.fraAttribs.Visible = False
            mnuSet(6).Checked = True
            
            For i = 0 To ExtraSheets
                If i <> 6 Then frmMapEditor.mnuSet(i).Checked = False
            Next i
            frmMapEditor.picBackSelect.Picture = LoadPNG(App.Path & "\GFX\Tiles" & 6 & ".png")
            EditorSet = 6
            
            scrlPicture.max = ((picBackSelect.Height - picBack.Height) / PIC_Y)
            picBack.Width = picBackSelect.Width
            If frmMapEditor.Width > picBack.Width + scrlPicture.Width Then frmMapEditor.Width = (picBack.Width + scrlPicture.Width + 8) * Screen.TwipsPerPixelX
            If frmMapEditor.Height > (picBackSelect.Height * Screen.TwipsPerPixelX) + 800 Then frmMapEditor.Height = (picBackSelect.Height * Screen.TwipsPerPixelX) + 800
            mnuTileSheet.Enabled = False
            frmAttributes.Visible = False
        End If
    End If
    
    For i = 1 To 3
        If i <> index Then mnuType(i).Checked = False
    Next i
End Sub

Private Sub picBackSelect_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyShift Then
        KeyShift = True
    End If
End Sub

Private Sub picBackSelect_KeyUp(KeyCode As Integer, Shift As Integer)
    KeyShift = False
End Sub

Private Sub picBackSelect_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        If KeyShift = False Then
            Call EditorChooseTile(Button, Shift, X, Y)
            shpSelected.Width = 32
            shpSelected.Height = 32
        Else
            EditorTileX = Int(X / PIC_X)
            EditorTileY = Int(Y / PIC_Y)
            
            If Int(EditorTileX * PIC_X) >= shpSelected.Left + shpSelected.Width Then
                EditorTileX = Int(EditorTileX * PIC_X + PIC_X) - (shpSelected.Left + shpSelected.Width)
                shpSelected.Width = shpSelected.Width + Int(EditorTileX)
            Else
                If shpSelected.Width > PIC_X Then
                    If Int(EditorTileX * PIC_X) >= shpSelected.Left Then
                        EditorTileX = (EditorTileX * PIC_X + PIC_X) - (shpSelected.Left + shpSelected.Width)
                        shpSelected.Width = shpSelected.Width + Int(EditorTileX)
                    End If
                End If
            End If
            
            If Int(EditorTileY * PIC_Y) >= shpSelected.Top + shpSelected.Height Then
                EditorTileY = Int(EditorTileY * PIC_Y + PIC_Y) - (shpSelected.Top + shpSelected.Height)
                shpSelected.Height = shpSelected.Height + Int(EditorTileY)
            Else
                If shpSelected.Height > PIC_Y Then
                    If Int(EditorTileY * PIC_Y) >= shpSelected.Top Then
                        EditorTileY = (EditorTileY * PIC_Y + PIC_Y) - (shpSelected.Top + shpSelected.Height)
                        shpSelected.Height = shpSelected.Height + Int(EditorTileY)
                    End If
                End If
            End If
        End If
    End If
    
    If mnuType(2).Checked = True Then
        shpSelected.Width = 32
        shpSelected.Height = 32
    End If
    
    EditorTileX = Int((shpSelected.Left + PIC_X) / PIC_X)
    EditorTileY = Int((shpSelected.Top + PIC_Y) / PIC_Y)
End Sub

Private Sub picBackSelect_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        If KeyShift = False Then
            Call EditorChooseTile(Button, Shift, X, Y)
            shpSelected.Width = 32
            shpSelected.Height = 32
        Else
            EditorTileX = Int(X / PIC_X)
            EditorTileY = Int(Y / PIC_Y)
            
            If Int(EditorTileX * PIC_X) >= shpSelected.Left + shpSelected.Width Then
                EditorTileX = Int(EditorTileX * PIC_X + PIC_X) - (shpSelected.Left + shpSelected.Width)
                shpSelected.Width = shpSelected.Width + Int(EditorTileX)
            Else
                If shpSelected.Width > PIC_X Then
                    If Int(EditorTileX * PIC_X) >= shpSelected.Left Then
                        EditorTileX = (EditorTileX * PIC_X + PIC_X) - (shpSelected.Left + shpSelected.Width)
                        shpSelected.Width = shpSelected.Width + Int(EditorTileX)
                    End If
                End If
            End If
            
            If Int(EditorTileY * PIC_Y) >= shpSelected.Top + shpSelected.Height Then
                EditorTileY = Int(EditorTileY * PIC_Y + PIC_Y) - (shpSelected.Top + shpSelected.Height)
                shpSelected.Height = shpSelected.Height + Int(EditorTileY)
            Else
                If shpSelected.Height > PIC_Y Then
                    If Int(EditorTileY * PIC_Y) >= shpSelected.Top Then
                        EditorTileY = (EditorTileY * PIC_Y + PIC_Y) - (shpSelected.Top + shpSelected.Height)
                        shpSelected.Height = shpSelected.Height + Int(EditorTileY)
                    End If
                End If
            End If
        End If
    End If
    
    If mnuType(2).Checked = True Then
        shpSelected.Width = 32
        shpSelected.Height = 32
    End If
    
    EditorTileX = Int(shpSelected.Left / PIC_X)
    EditorTileY = Int(shpSelected.Top / PIC_Y)
End Sub

Private Sub scrlPicture_Change()
    Call EditorTileScroll
End Sub


