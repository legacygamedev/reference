Attribute VB_Name = "modNPCSpawn"
Sub BltAttributeNPCName(ByVal Index As Long, ByVal X As Long, ByVal Y As Long)
Dim TextX As Long
Dim TextY As Long

If Index > Map(GetPlayerMap(MyIndex)).Tile(X, Y).Data2 Then Exit Sub
If MapAttributeNpc(Index, X, Y).Num <= 0 Then Exit Sub

If Npc(MapAttributeNpc(Index, X, Y).Num).Big = 0 Then
    With Npc(MapAttributeNpc(Index, X, Y).Num)
    'Draw name
        TextX = MapAttributeNpc(Index, X, Y).X * PIC_X + sx + MapAttributeNpc(Index, X, Y).XOffset + CLng(PIC_X / 2) - ((Len(Trim$(.Name)) / 2) * 8)
        TextY = MapAttributeNpc(Index, X, Y).Y * PIC_Y + sx + MapAttributeNpc(Index, X, Y).YOffset - CLng(PIC_Y / 2) - 4
        DrawPlayerNameText TexthDC, TextX - (NewPlayerX * PIC_X) - NewXOffset, TextY - (NewPlayerY * PIC_Y) - NewYOffset, Trim$(.Name), vbWhite
    End With
Else
    With Npc(MapAttributeNpc(Index, X, Y).Num)
    'Draw name
        TextX = MapAttributeNpc(Index, X, Y).X * PIC_X + sx + MapAttributeNpc(Index, X, Y).XOffset + CLng(PIC_X / 2) - ((Len(Trim$(.Name)) / 2) * 8)
        TextY = MapAttributeNpc(Index, X, Y).Y * PIC_Y + sx + MapAttributeNpc(Index, X, Y).YOffset - CLng(PIC_Y / 2) - 32
        DrawPlayerNameText TexthDC, TextX - (NewPlayerX * PIC_X) - NewXOffset, TextY - (NewPlayerY * PIC_Y) - NewYOffset, Trim$(.Name), vbWhite
    End With
End If
End Sub

Sub BltAttributeNpc(ByVal Index As Long, ByVal X As Long, ByVal Y As Long)
Dim Anim As Byte
Dim BX As Long, BY As Long

    If Index > Map(GetPlayerMap(MyIndex)).Tile(X, Y).Data2 Then Exit Sub
    If MapAttributeNpc(Index, X, Y).Num <= 0 Then Exit Sub

    ' Make sure that theres an npc there, and if not exit the sub
    If MapAttributeNpc(Index, X, Y).Num <= 0 Then
        Exit Sub
    End If
    
    ' Only used if ever want to switch to blt rather then bltfast
    With rec_pos
        .Top = MapAttributeNpc(Index, X, Y).Y * PIC_Y + MapAttributeNpc(Index, X, Y).YOffset
        .Bottom = .Top + PIC_Y
        .Left = MapAttributeNpc(Index, X, Y).X * PIC_X + MapAttributeNpc(Index, X, Y).XOffset
        .Right = .Left + PIC_X
    End With
    
    ' Check for animation
    Anim = 0
    If MapAttributeNpc(Index, X, Y).Attacking = 0 Then
        Select Case MapAttributeNpc(Index, X, Y).Dir
            Case DIR_UP
                If (MapAttributeNpc(Index, X, Y).YOffset < PIC_Y / 2) Then Anim = 1
            Case DIR_DOWN
                If (MapAttributeNpc(Index, X, Y).YOffset < PIC_Y / 2 * -1) Then Anim = 1
            Case DIR_LEFT
                If (MapAttributeNpc(Index, X, Y).XOffset < PIC_Y / 2) Then Anim = 1
            Case DIR_RIGHT
                If (MapAttributeNpc(Index, X, Y).XOffset < PIC_Y / 2 * -1) Then Anim = 1
        End Select
    Else
        If MapAttributeNpc(Index, X, Y).AttackTimer + 500 > GetTickCount Then
            Anim = 2
        End If
    End If
    
    ' Check to see if we want to stop making him attack
    If MapAttributeNpc(Index, X, Y).AttackTimer + 1000 < GetTickCount Then
        MapAttributeNpc(Index, X, Y).Attacking = 0
        MapAttributeNpc(Index, X, Y).AttackTimer = 0
    End If
    If Npc(MapAttributeNpc(Index, X, Y).Num).Big = 0 Then
        
        rec.Top = Npc(MapAttributeNpc(Index, X, Y).Num).Sprite * PIC_Y
        rec.Bottom = rec.Top + PIC_Y
        rec.Left = (MapAttributeNpc(Index, X, Y).Dir * 3 + Anim) * PIC_X
        rec.Right = rec.Left + PIC_X
        
        BX = MapAttributeNpc(Index, X, Y).X * PIC_X + sx + MapAttributeNpc(Index, X, Y).XOffset
        BY = MapAttributeNpc(Index, X, Y).Y * PIC_Y + sx + MapAttributeNpc(Index, X, Y).YOffset
        
        ' Check if its out of bounds because of the offset
        If BY < 0 Then
            BY = 0
            rec.Top = rec.Top + (BY * -1)
        End If
            
        'Call DD_BackBuffer.Blt(rec_pos, DD_SpriteSurf, rec, DDBLT_WAIT Or DDBLT_KEYSRC)
        Call DD_BackBuffer.BltFast(BX - (NewPlayerX * PIC_X) - NewXOffset, BY - (NewPlayerY * PIC_Y) - NewYOffset, DD_SpriteSurf, rec, DDBLTFAST_WAIT Or DDBLTFAST_SRCCOLORKEY)
    Else
        rec.Top = Npc(MapAttributeNpc(Index, X, Y).Num).Sprite * 64 + 32
        rec.Bottom = rec.Top + 32
        rec.Left = (MapAttributeNpc(Index, X, Y).Dir * 3 + Anim) * 64
        rec.Right = rec.Left + 64
    
        BX = MapAttributeNpc(Index, X, Y).X * 32 + sx - 16 + MapAttributeNpc(Index, X, Y).XOffset
        BY = MapAttributeNpc(Index, X, Y).Y * 32 + sx + MapAttributeNpc(Index, X, Y).YOffset
   
        If BY < 0 Then
            rec.Top = Npc(MapAttributeNpc(Index, X, Y).Num).Sprite * 64 + 32
            rec.Bottom = rec.Top + 32
            BY = MapAttributeNpc(Index, X, Y).YOffset + sx
        End If
        
        If BX < 0 Then
            rec.Left = (MapAttributeNpc(Index, X, Y).Dir * 3 + Anim) * 64 + 16
            rec.Right = rec.Left + 48
            BX = MapAttributeNpc(Index, X, Y).XOffset + sx
        End If
        
        If BX > MAX_MAPX * 32 Then
            rec.Left = (MapAttributeNpc(Index, X, Y).Dir * 3 + Anim) * 64
            rec.Right = rec.Left + 48
            BX = MAX_MAPX * 32 + sx - 16 + MapAttributeNpc(Index, X, Y).XOffset
        End If

        Call DD_BackBuffer.BltFast(BX - (NewPlayerX * PIC_X) - NewXOffset, BY - (NewPlayerY * PIC_Y) - NewYOffset, DD_BigSpriteSurf, rec, DDBLTFAST_WAIT Or DDBLTFAST_SRCCOLORKEY)
    End If
End Sub

Sub BltAttributeNpcTop(ByVal Index As Long, ByVal X As Long, ByVal Y As Long)
Dim Anim As Byte

    If Index > Map(GetPlayerMap(MyIndex)).Tile(X, Y).Data2 Then Exit Sub
    If MapAttributeNpc(Index, X, Y).Num <= 0 Then Exit Sub
    
    ' Make sure that theres an npc there, and if not exit the sub
    If MapAttributeNpc(Index, X, Y).Num <= 0 Then
        Exit Sub
    End If
    
    If Npc(MapAttributeNpc(Index, X, Y).Num).Big = 0 Then Exit Sub
    
    ' Only used if ever want to switch to blt rather then bltfast
    With rec_pos
        .Top = MapAttributeNpc(Index, X, Y).Y * PIC_Y + MapAttributeNpc(Index, X, Y).YOffset
        .Bottom = .Top + PIC_Y
        .Left = MapAttributeNpc(Index, X, Y).X * PIC_X + MapAttributeNpc(Index, X, Y).XOffset
        .Right = .Left + PIC_X
    End With
    
    ' Check for animation
    Anim = 0
    If MapAttributeNpc(Index, X, Y).Attacking = 0 Then
        Select Case MapAttributeNpc(Index, X, Y).Dir
            Case DIR_UP
                If (MapAttributeNpc(Index, X, Y).YOffset < PIC_Y / 2) Then Anim = 1
            Case DIR_DOWN
                If (MapAttributeNpc(Index, X, Y).YOffset < PIC_Y / 2 * -1) Then Anim = 1
            Case DIR_LEFT
                If (MapAttributeNpc(Index, X, Y).XOffset < PIC_Y / 2) Then Anim = 1
            Case DIR_RIGHT
                If (MapAttributeNpc(Index, X, Y).XOffset < PIC_Y / 2 * -1) Then Anim = 1
        End Select
    Else
        If MapAttributeNpc(Index, X, Y).AttackTimer + 500 > GetTickCount Then
            Anim = 2
        End If
    End If
    
    ' Check to see if we want to stop making him attack
    If MapAttributeNpc(Index, X, Y).AttackTimer + 1000 < GetTickCount Then
        MapAttributeNpc(Index, X, Y).Attacking = 0
        MapAttributeNpc(Index, X, Y).AttackTimer = 0
    End If
    
    rec.Top = Npc(MapAttributeNpc(Index, X, Y).Num).Sprite * PIC_Y
        
     rec.Top = Npc(MapAttributeNpc(Index, X, Y).Num).Sprite * 64
     rec.Bottom = rec.Top + 32
     rec.Left = (MapAttributeNpc(Index, X, Y).Dir * 3 + Anim) * 64
     rec.Right = rec.Left + 64
 
     X = MapAttributeNpc(Index, X, Y).X * 32 + sx - 16 + MapAttributeNpc(Index, X, Y).XOffset
     Y = MapAttributeNpc(Index, X, Y).Y * 32 + sx - 32 + MapAttributeNpc(Index, X, Y).YOffset

     If Y < 0 Then
         rec.Top = Npc(MapAttributeNpc(Index, X, Y).Num).Sprite * 64 + 32
         rec.Bottom = rec.Top
         Y = MapAttributeNpc(Index, X, Y).YOffset + sx
     End If
     
     If X < 0 Then
         rec.Left = (MapAttributeNpc(Index, X, Y).Dir * 3 + Anim) * 64 + 16
         rec.Right = rec.Left + 48
         X = MapAttributeNpc(Index, X, Y).XOffset + sx
     End If
     
     If X > MAX_MAPX * 32 Then
         rec.Left = (MapAttributeNpc(Index, X, Y).Dir * 3 + Anim) * 64
         rec.Right = rec.Left + 48
         X = MAX_MAPX * 32 + sx - 16 + MapAttributeNpc(Index, X, Y).XOffset
     End If

     Call DD_BackBuffer.BltFast(X - (NewPlayerX * PIC_X) - NewXOffset, Y - (NewPlayerY * PIC_Y) - NewYOffset, DD_BigSpriteSurf, rec, DDBLTFAST_WAIT Or DDBLTFAST_SRCCOLORKEY)
End Sub

Sub ProcessAttributeNpcMovement(ByVal Index As Long, ByVal X As Long, ByVal Y As Long)
    ' Check if npc is walking, and if so process moving them over
    If MapAttributeNpc(Index, X, Y).Moving = MOVING_WALKING Then
        Select Case MapAttributeNpc(Index, X, Y).Dir
            Case DIR_UP
                MapAttributeNpc(Index, X, Y).YOffset = MapAttributeNpc(Index, X, Y).YOffset - WALK_SPEED
            Case DIR_DOWN
                MapAttributeNpc(Index, X, Y).YOffset = MapAttributeNpc(Index, X, Y).YOffset + WALK_SPEED
            Case DIR_LEFT
                MapAttributeNpc(Index, X, Y).XOffset = MapAttributeNpc(Index, X, Y).XOffset - WALK_SPEED
            Case DIR_RIGHT
                MapAttributeNpc(Index, X, Y).XOffset = MapAttributeNpc(Index, X, Y).XOffset + WALK_SPEED
        End Select
        
        ' Check if completed walking over to the next tile
        If (MapAttributeNpc(Index, X, Y).XOffset = 0) And (MapAttributeNpc(Index, X, Y).YOffset = 0) Then
            MapAttributeNpc(Index, X, Y).Moving = 0
        End If
    End If
End Sub

Sub BltAttributeNpcBars(ByVal Index As Long, ByVal X As Long, ByVal Y As Long)
Dim BX As Long, BY As Long
    If MapAttributeNpc(Index, X, Y).HP <= 0 Then Exit Sub
    If MapAttributeNpc(Index, X, Y).Num < 1 Then Exit Sub

    If Npc(MapAttributeNpc(Index, X, Y).Num).Big = 1 Then
        BX = (MapAttributeNpc(Index, X, Y).X * PIC_X + sx - 9 + MapAttributeNpc(Index, X, Y).XOffset) - (NewPlayerX * PIC_X) - NewXOffset
        BY = (MapAttributeNpc(Index, X, Y).Y * PIC_Y + sx + MapAttributeNpc(Index, X, Y).YOffset) - (NewPlayerY * PIC_Y) - NewYOffset
        
        Call DD_BackBuffer.SetFillColor(RGB(255, 0, 0))
        Call DD_BackBuffer.DrawBox(BX, BY + 32, BX + 50, BY + 36)
        Call DD_BackBuffer.SetFillColor(RGB(0, 255, 0))
        Call DD_BackBuffer.DrawBox(BX, BY + 32, BX + ((MapAttributeNpc(Index, X, Y).HP / 100) / (MapAttributeNpc(Index, X, Y).MaxHp / 100) * 50), BY + 36)
    Else
        BX = (MapAttributeNpc(Index, X, Y).X * PIC_X + sx + MapAttributeNpc(Index, X, Y).XOffset) - (NewPlayerX * PIC_X) - NewXOffset
        BY = (MapAttributeNpc(Index, X, Y).Y * PIC_Y + sx + MapAttributeNpc(Index, X, Y).YOffset) - (NewPlayerY * PIC_Y) - NewYOffset
        
        Call DD_BackBuffer.SetFillColor(RGB(255, 0, 0))
        Call DD_BackBuffer.DrawBox(BX, BY + 32, BX + 32, BY + 36)
        Call DD_BackBuffer.SetFillColor(RGB(0, 255, 0))
        Call DD_BackBuffer.DrawBox(BX, BY + 32, BX + ((MapAttributeNpc(Index, X, Y).HP / 100) / (MapAttributeNpc(Index, X, Y).MaxHp / 100) * 32), BY + 36)
    End If
End Sub

Function CanAttributeNPCMove(ByVal Dir As Long) As Boolean
Dim X As Long, Y As Long, Index As Long

    CanAttributeNPCMove = True

    For X = 0 To MAX_MAPX
        For Y = 0 To MAX_MAPY
            If Map(GetPlayerMap(MyIndex)).Tile(X, Y).Type = TILE_TYPE_NPC_SPAWN Then
                For i = 1 To MAX_ATTRIBUTE_NPCS
                    If i <= Map(GetPlayerMap(MyIndex)).Tile(X, Y).Data2 Then
                        Select Case Dir
                            Case DIR_UP
                                If (MapAttributeNpc(i, X, Y).X = GetPlayerX(MyIndex)) And (MapAttributeNpc(i, X, Y).Y = GetPlayerY(MyIndex) - 1) Then
                                    CanAttributeNPCMove = False
                                End If
                            Case DIR_DOWN
                                If (MapAttributeNpc(i, X, Y).X = GetPlayerX(MyIndex)) And (MapAttributeNpc(i, X, Y).Y = GetPlayerY(MyIndex) + 1) Then
                                    CanAttributeNPCMove = False
                                End If
                            Case DIR_LEFT
                                If (MapAttributeNpc(i, X, Y).X = GetPlayerX(MyIndex) - 1) And (MapAttributeNpc(i, X, Y).Y = GetPlayerY(MyIndex)) Then
                                    CanAttributeNPCMove = False
                                End If
                            Case DIR_RIGHT
                                If (MapAttributeNpc(i, X, Y).X = GetPlayerX(MyIndex) + 1) And (MapAttributeNpc(i, X, Y).Y = GetPlayerY(MyIndex)) Then
                                    CanAttributeNPCMove = False
                                End If
                        End Select
                    End If
                Next i
            End If
        Next Y
    Next X
End Function

