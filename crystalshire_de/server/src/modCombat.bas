Attribute VB_Name = "modCombat"
Option Explicit

' ################################
' ##      Basic Calculations    ##
' ################################

Function GetPlayerMaxVital(ByVal index As Long, ByVal Vital As Vitals) As Long
    If index > MAX_PLAYERS Then Exit Function
    Select Case Vital
        Case HP
            Select Case GetPlayerClass(index)
                Case 1 ' Warrior
                    GetPlayerMaxVital = ((GetPlayerLevel(index) / 2) + (GetPlayerStat(index, Endurance) / 2)) * 15 + 150
                Case 2 ' Wizard
                    GetPlayerMaxVital = ((GetPlayerLevel(index) / 2) + (GetPlayerStat(index, Endurance) / 2)) * 5 + 65
                Case 3 ' Whisperer
                    GetPlayerMaxVital = ((GetPlayerLevel(index) / 2) + (GetPlayerStat(index, Endurance) / 2)) * 5 + 65
                Case Else ' Anything else - Warrior by default
                    GetPlayerMaxVital = ((GetPlayerLevel(index) / 2) + (GetPlayerStat(index, Endurance) / 2)) * 15 + 150
            End Select
        Case MP
            Select Case GetPlayerClass(index)
                Case 1 ' Warrior
                    GetPlayerMaxVital = ((GetPlayerLevel(index) / 2) + (GetPlayerStat(index, Intelligence) / 2)) * 5 + 25
                Case 2 ' Wizard
                    GetPlayerMaxVital = ((GetPlayerLevel(index) / 2) + (GetPlayerStat(index, Intelligence) / 2)) * 30 + 85
                Case 3 ' Whisperer
                    GetPlayerMaxVital = ((GetPlayerLevel(index) / 2) + (GetPlayerStat(index, Intelligence) / 2)) * 30 + 85
                Case Else ' Anything else - Warrior by default
                    GetPlayerMaxVital = ((GetPlayerLevel(index) / 2) + (GetPlayerStat(index, Intelligence) / 2)) * 5 + 25
            End Select
    End Select
End Function

Function GetPlayerVitalRegen(ByVal index As Long, ByVal Vital As Vitals) As Long
    Dim i As Long

    ' Prevent subscript out of range
    If IsPlaying(index) = False Or index <= 0 Or index > MAX_PLAYERS Then
        GetPlayerVitalRegen = 0
        Exit Function
    End If

    Select Case Vital
        Case HP
            i = (GetPlayerStat(index, Stats.Willpower) * 0.8) + 6
        Case MP
            i = (GetPlayerStat(index, Stats.Willpower) / 4) + 12.5
    End Select

    If i < 2 Then i = 2
    GetPlayerVitalRegen = i
End Function

Function GetPlayerDamage(ByVal index As Long) As Long
Dim weaponNum As Long
    
    GetPlayerDamage = 0

    ' Check for subscript out of range
    If IsPlaying(index) = False Or index <= 0 Or index > MAX_PLAYERS Then
        Exit Function
    End If
    If GetPlayerEquipment(index, Weapon) > 0 Then
        weaponNum = GetPlayerEquipment(index, Weapon)
        GetPlayerDamage = Item(weaponNum).data2 + (((Item(weaponNum).data2 / 100) * 5) * GetPlayerStat(index, Strength))
    Else
        GetPlayerDamage = 1 + (((0.01) * 5) * GetPlayerStat(index, Strength))
    End If

End Function

Function GetPlayerDefence(ByVal index As Long) As Long
Dim Defence As Long, i As Long, itemNum As Long

    ' Check for subscript out of range
    If IsPlaying(index) = False Or index <= 0 Or index > MAX_PLAYERS Then
        Exit Function
    End If
    
    ' base defence
    For i = 1 To Equipment.Equipment_Count - 1
        If i <> Equipment.Weapon Then
            itemNum = GetPlayerEquipment(index, i)
            If itemNum > 0 Then
                If Item(itemNum).data2 > 0 Then
                    Defence = Defence + Item(itemNum).data2
                End If
            End If
        End If
    Next
    
    ' divide by 3
    Defence = Defence / 3
    
    ' floor it at 1
    If Defence < 1 Then Defence = 1
    
    ' add in a player's agility
    GetPlayerDefence = Defence + (((Defence / 100) * 2.5) * (GetPlayerStat(index, Agility) / 2))
End Function

Function GetPlayerSpellDamage(ByVal index As Long, ByVal spellNum As Long) As Long
Dim damage As Long

    ' Check for subscript out of range
    If IsPlaying(index) = False Or index <= 0 Or index > MAX_PLAYERS Then
        Exit Function
    End If
    
    ' return damage
    damage = Spell(spellNum).Vital
    ' 10% modifier
    If damage <= 0 Then damage = 1
    GetPlayerSpellDamage = RAND(damage - ((damage / 100) * 10), damage + ((damage / 100) * 10))
End Function

Function GetNpcSpellDamage(ByVal npcNum As Long, ByVal spellNum As Long) As Long
Dim damage As Long

    ' Check for subscript out of range
    If npcNum <= 0 Or npcNum > MAX_NPCS Then Exit Function
    
    ' return damage
    damage = Spell(spellNum).Vital
    ' 10% modifier
    If damage <= 0 Then damage = 1
    GetNpcSpellDamage = RAND(damage - ((damage / 100) * 10), damage + ((damage / 100) * 10))
End Function

Function GetNpcMaxVital(ByVal npcNum As Long, ByVal Vital As Vitals) As Long
    Dim x As Long

    ' Prevent subscript out of range
    If npcNum <= 0 Or npcNum > MAX_NPCS Then
        GetNpcMaxVital = 0
        Exit Function
    End If

    Select Case Vital
        Case HP
            GetNpcMaxVital = Npc(npcNum).HP
        Case MP
            GetNpcMaxVital = 30 + (Npc(npcNum).Stat(Intelligence) * 10) + 2
    End Select

End Function

Function GetNpcVitalRegen(ByVal npcNum As Long, ByVal Vital As Vitals) As Long
    Dim i As Long

    'Prevent subscript out of range
    If npcNum <= 0 Or npcNum > MAX_NPCS Then
        GetNpcVitalRegen = 0
        Exit Function
    End If

    Select Case Vital
        Case HP
            i = (Npc(npcNum).Stat(Stats.Willpower) * 0.8) + 6
        Case MP
            i = (Npc(npcNum).Stat(Stats.Willpower) / 4) + 12.5
    End Select
    
    GetNpcVitalRegen = i

End Function

Function GetNpcDamage(ByVal npcNum As Long) As Long
    ' return the calculation
    GetNpcDamage = Npc(npcNum).damage + (((Npc(npcNum).damage / 100) * 5) * Npc(npcNum).Stat(Stats.Strength))
End Function

Function GetNpcDefence(ByVal npcNum As Long) As Long
Dim Defence As Long
    
    ' base defence
    Defence = 2
    
    ' add in a player's agility
    GetNpcDefence = Defence + (((Defence / 100) * 2.5) * (Npc(npcNum).Stat(Stats.Agility) / 2))
End Function

' ###############################
' ##      Luck-based rates     ##
' ###############################
Public Function CanPlayerBlock(ByVal index As Long) As Boolean
Dim rate As Long
Dim rndNum As Long

    CanPlayerBlock = False

    rate = 0
    ' TODO : make it based on shield lulz
End Function

Public Function CanPlayerCrit(ByVal index As Long) As Boolean
Dim rate As Long
Dim rndNum As Long

    CanPlayerCrit = False

    rate = GetPlayerStat(index, Agility) / 52.08
    rndNum = RAND(1, 100)
    If rndNum <= rate Then
        CanPlayerCrit = True
    End If
End Function

Public Function CanPlayerDodge(ByVal index As Long) As Boolean
Dim rate As Long
Dim rndNum As Long

    CanPlayerDodge = False

    rate = GetPlayerStat(index, Agility) / 83.3
    rndNum = RAND(1, 100)
    If rndNum <= rate Then
        CanPlayerDodge = True
    End If
End Function

Public Function CanPlayerParry(ByVal index As Long) As Boolean
Dim rate As Long
Dim rndNum As Long

    CanPlayerParry = False

    rate = GetPlayerStat(index, Strength) * 0.25
    rndNum = RAND(1, 100)
    If rndNum <= rate Then
        CanPlayerParry = True
    End If
End Function

Public Function CanNpcBlock(ByVal npcNum As Long) As Boolean
Dim rate As Long
Dim rndNum As Long

    CanNpcBlock = False

    rate = 0
    ' TODO : make it based on shield lol
End Function

Public Function CanNpcCrit(ByVal npcNum As Long) As Boolean
Dim rate As Long
Dim rndNum As Long

    CanNpcCrit = False

    rate = Npc(npcNum).Stat(Stats.Agility) / 52.08
    rndNum = RAND(1, 100)
    If rndNum <= rate Then
        CanNpcCrit = True
    End If
End Function

Public Function CanNpcDodge(ByVal npcNum As Long) As Boolean
Dim rate As Long
Dim rndNum As Long

    CanNpcDodge = False

    rate = Npc(npcNum).Stat(Stats.Agility) / 83.3
    rndNum = RAND(1, 100)
    If rndNum <= rate Then
        CanNpcDodge = True
    End If
End Function

Public Function CanNpcParry(ByVal npcNum As Long) As Boolean
Dim rate As Long
Dim rndNum As Long

    CanNpcParry = False

    rate = Npc(npcNum).Stat(Stats.Strength) * 0.25
    rndNum = RAND(1, 100)
    If rndNum <= rate Then
        CanNpcParry = True
    End If
End Function

' ###################################
' ##      Player Attacking NPC     ##
' ###################################
Public Sub TryPlayerAttackNpc(ByVal index As Long, ByVal mapNpcNum As Long)
Dim blockAmount As Long
Dim npcNum As Long
Dim mapNum As Long
Dim damage As Long

    damage = 0

    ' Can we attack the npc?
    If CanPlayerAttackNpc(index, mapNpcNum) Then
    
        mapNum = GetPlayerMap(index)
        npcNum = MapNpc(mapNum).Npc(mapNpcNum).Num
    
        ' check if NPC can avoid the attack
        If CanNpcDodge(npcNum) Then
            SendActionMsg mapNum, "Dodge!", Pink, 1, (MapNpc(mapNum).Npc(mapNpcNum).x * 32), (MapNpc(mapNum).Npc(mapNpcNum).y * 32)
            Exit Sub
        End If
        If CanNpcParry(npcNum) Then
            SendActionMsg mapNum, "Parry!", Pink, 1, (MapNpc(mapNum).Npc(mapNpcNum).x * 32), (MapNpc(mapNum).Npc(mapNpcNum).y * 32)
            Exit Sub
        End If

        ' Get the damage we can do
        damage = GetPlayerDamage(index)
        
        ' if the npc blocks, take away the block amount
        blockAmount = CanNpcBlock(mapNpcNum)
        damage = damage - blockAmount
        
        ' take away armour
        'damage = damage - RAND(1, (Npc(NpcNum).Stat(Stats.Agility) * 2))
        damage = damage - RAND((GetNpcDefence(npcNum) / 100) * 10, (GetNpcDefence(npcNum) / 100) * 10)
        ' randomise from 1 to max hit
        damage = RAND(damage - ((damage / 100) * 10), damage + ((damage / 100) * 10))
        
        ' * 1.5 if it's a crit!
        If CanPlayerCrit(index) Then
            damage = damage * 1.5
            SendActionMsg mapNum, "Critical!", BrightCyan, 1, (GetPlayerX(index) * 32), (GetPlayerY(index) * 32)
        End If
            
        If damage > 0 Then
            Call PlayerAttackNpc(index, mapNpcNum, damage)
        Else
            Call PlayerMsg(index, "Your attack does nothing.", BrightRed)
        End If
    End If
End Sub

Public Function CanPlayerAttackNpc(ByVal attacker As Long, ByVal mapNpcNum As Long, Optional ByVal isSpell As Boolean = False) As Boolean
    Dim mapNum As Long
    Dim npcNum As Long
    Dim NpcX As Long
    Dim NpcY As Long
    Dim attackspeed As Long

    ' Check for subscript out of range
    If IsPlaying(attacker) = False Or mapNpcNum <= 0 Or mapNpcNum > MAX_MAP_NPCS Then
        Exit Function
    End If

    ' Check for subscript out of range
    If MapNpc(GetPlayerMap(attacker)).Npc(mapNpcNum).Num <= 0 Then
        Exit Function
    End If

    mapNum = GetPlayerMap(attacker)
    npcNum = MapNpc(mapNum).Npc(mapNpcNum).Num
    
    ' Make sure the npc isn't already dead
    If MapNpc(mapNum).Npc(mapNpcNum).Vital(Vitals.HP) <= 0 Then
        Exit Function
    End If

    ' Make sure they are on the same map
    If IsPlaying(attacker) Then
    
        ' exit out early
        If isSpell Then
             If npcNum > 0 Then
                If Npc(npcNum).Behaviour <> NPC_BEHAVIOUR_FRIENDLY And Npc(npcNum).Behaviour <> NPC_BEHAVIOUR_SHOPKEEPER Then
                    CanPlayerAttackNpc = True
                    Exit Function
                End If
            End If
        End If

        ' attack speed from weapon
        If GetPlayerEquipment(attacker, Weapon) > 0 Then
            attackspeed = Item(GetPlayerEquipment(attacker, Weapon)).Speed
        Else
            attackspeed = 1000
        End If

        If npcNum > 0 And GetTickCount > TempPlayer(attacker).AttackTimer + attackspeed Then
            ' Check if at same coordinates
            Select Case GetPlayerDir(attacker)
                Case DIR_UP
                    NpcX = MapNpc(mapNum).Npc(mapNpcNum).x
                    NpcY = MapNpc(mapNum).Npc(mapNpcNum).y + 1
                Case DIR_DOWN
                    NpcX = MapNpc(mapNum).Npc(mapNpcNum).x
                    NpcY = MapNpc(mapNum).Npc(mapNpcNum).y - 1
                Case DIR_LEFT
                    NpcX = MapNpc(mapNum).Npc(mapNpcNum).x + 1
                    NpcY = MapNpc(mapNum).Npc(mapNpcNum).y
                Case DIR_RIGHT
                    NpcX = MapNpc(mapNum).Npc(mapNpcNum).x - 1
                    NpcY = MapNpc(mapNum).Npc(mapNpcNum).y
            End Select

            If NpcX = GetPlayerX(attacker) Then
                If NpcY = GetPlayerY(attacker) Then
                    If Npc(npcNum).Behaviour <> NPC_BEHAVIOUR_FRIENDLY And Npc(npcNum).Behaviour <> NPC_BEHAVIOUR_SHOPKEEPER Then
                        CanPlayerAttackNpc = True
                    ElseIf Npc(npcNum).Behaviour = NPC_BEHAVIOUR_FRIENDLY Then
                        ' init conversation if it's friendly
                        InitChat attacker, mapNum, mapNpcNum
                    End If
                End If
            End If
        End If
    End If

End Function

Public Sub PlayerAttackNpc(ByVal attacker As Long, ByVal mapNpcNum As Long, ByVal damage As Long, Optional ByVal spellNum As Long, Optional ByVal overTime As Boolean = False)
    Dim Name As String
    Dim exp As Long
    Dim n As Long
    Dim i As Long
    Dim STR As Long
    Dim DEF As Long
    Dim mapNum As Long
    Dim npcNum As Long
    Dim Buffer As clsBuffer

    ' Check for subscript out of range
    If IsPlaying(attacker) = False Or mapNpcNum <= 0 Or mapNpcNum > MAX_MAP_NPCS Or damage < 0 Then
        Exit Sub
    End If

    mapNum = GetPlayerMap(attacker)
    npcNum = MapNpc(mapNum).Npc(mapNpcNum).Num
    Name = Trim$(Npc(npcNum).Name)
    
    ' Check for weapon
    n = 0

    If GetPlayerEquipment(attacker, Weapon) > 0 Then
        n = GetPlayerEquipment(attacker, Weapon)
    End If
    
    ' set the regen timer
    TempPlayer(attacker).stopRegen = True
    TempPlayer(attacker).stopRegenTimer = GetTickCount

    If damage >= MapNpc(mapNum).Npc(mapNpcNum).Vital(Vitals.HP) Then
    
        SendActionMsg GetPlayerMap(attacker), "-" & MapNpc(mapNum).Npc(mapNpcNum).Vital(Vitals.HP), BrightRed, 1, (MapNpc(mapNum).Npc(mapNpcNum).x * 32), (MapNpc(mapNum).Npc(mapNpcNum).y * 32)
        SendBlood GetPlayerMap(attacker), MapNpc(mapNum).Npc(mapNpcNum).x, MapNpc(mapNum).Npc(mapNpcNum).y
        
        ' send the sound
        If spellNum > 0 Then SendMapSound attacker, MapNpc(mapNum).Npc(mapNpcNum).x, MapNpc(mapNum).Npc(mapNpcNum).y, SoundEntity.seSpell, spellNum
        
        ' send animation
        If n > 0 Then
            If Not overTime Then
                If spellNum = 0 Then Call SendAnimation(mapNum, Item(GetPlayerEquipment(attacker, Weapon)).Animation, MapNpc(mapNum).Npc(mapNpcNum).x, MapNpc(mapNum).Npc(mapNpcNum).y)
            End If
        End If

        ' Calculate exp to give attacker
        exp = Npc(npcNum).exp

        ' Make sure we dont get less then 0
        If exp < 0 Then
            exp = 1
        End If

        ' in party?
        If TempPlayer(attacker).inParty > 0 Then
            ' pass through party sharing function
            Party_ShareExp TempPlayer(attacker).inParty, exp, attacker, Npc(npcNum).Level
        Else
            ' no party - keep exp for self
            GivePlayerEXP attacker, exp, Npc(npcNum).Level
        End If
        
        'Drop the goods if they get it
        For n = 1 To MAX_NPC_DROPS
            If Npc(npcNum).DropItem(n) = 0 Then Exit For
            If Rnd <= Npc(npcNum).DropChance(n) Then
                Call SpawnItem(Npc(npcNum).DropItem(n), Npc(npcNum).DropItemValue(n), mapNum, MapNpc(mapNum).Npc(mapNpcNum).x, MapNpc(mapNum).Npc(mapNpcNum).y, GetPlayerName(attacker))
            End If
        Next
        
        ' destroy map npcs
        If Map(mapNum).Moral = MAP_MORAL_BOSS Then
            If mapNpcNum = Map(mapNum).BossNpc Then
                ' kill all the other npcs
                For i = 1 To MAX_MAP_NPCS
                    If Map(mapNum).Npc(i) > 0 Then
                        ' only kill dangerous npcs
                        If Npc(Map(mapNum).Npc(i)).Behaviour <> NPC_BEHAVIOUR_FRIENDLY And Npc(Map(mapNum).Npc(i)).Behaviour <> NPC_BEHAVIOUR_SHOPKEEPER Then
                            ' kill!
                            MapNpc(mapNum).Npc(i).Num = 0
                            MapNpc(mapNum).Npc(i).SpawnWait = GetTickCount
                            MapNpc(mapNum).Npc(i).Vital(Vitals.HP) = 0
                            ' send kill command
                            SendNpcDeath mapNum, i
                        End If
                    End If
                Next
            End If
        End If

        ' Now set HP to 0 so we know to actually kill them in the server loop (this prevents subscript out of range)
        MapNpc(mapNum).Npc(mapNpcNum).Num = 0
        MapNpc(mapNum).Npc(mapNpcNum).SpawnWait = GetTickCount
        MapNpc(mapNum).Npc(mapNpcNum).Vital(Vitals.HP) = 0
        
        ' clear DoTs and HoTs
        For i = 1 To MAX_DOTS
            With MapNpc(mapNum).Npc(mapNpcNum).DoT(i)
                .Spell = 0
                .Timer = 0
                .Caster = 0
                .StartTime = 0
                .Used = False
            End With
            
            With MapNpc(mapNum).Npc(mapNpcNum).HoT(i)
                .Spell = 0
                .Timer = 0
                .Caster = 0
                .StartTime = 0
                .Used = False
            End With
        Next
        
        ' send death to the map
        SendNpcDeath mapNum, mapNpcNum
        
        'Loop through entire map and purge NPC from targets
        For i = 1 To Player_HighIndex
            If IsPlaying(i) And IsConnected(i) Then
                If Player(i).Map = mapNum Then
                    If TempPlayer(i).targetType = TARGET_TYPE_NPC Then
                        If TempPlayer(i).target = mapNpcNum Then
                            TempPlayer(i).target = 0
                            TempPlayer(i).targetType = TARGET_TYPE_NONE
                            SendTarget i
                        End If
                    End If
                End If
            End If
        Next
    Else
        ' NPC not dead, just do the damage
        MapNpc(mapNum).Npc(mapNpcNum).Vital(Vitals.HP) = MapNpc(mapNum).Npc(mapNpcNum).Vital(Vitals.HP) - damage

        ' Check for a weapon and say damage
        SendActionMsg mapNum, "-" & damage, BrightRed, 1, (MapNpc(mapNum).Npc(mapNpcNum).x * 32), (MapNpc(mapNum).Npc(mapNpcNum).y * 32)
        SendBlood GetPlayerMap(attacker), MapNpc(mapNum).Npc(mapNpcNum).x, MapNpc(mapNum).Npc(mapNpcNum).y
        
        ' send the sound
        If spellNum > 0 Then SendMapSound attacker, MapNpc(mapNum).Npc(mapNpcNum).x, MapNpc(mapNum).Npc(mapNpcNum).y, SoundEntity.seSpell, spellNum
        
        ' send animation
        If n > 0 Then
            If Not overTime Then
                If spellNum = 0 Then Call SendAnimation(mapNum, Item(GetPlayerEquipment(attacker, Weapon)).Animation, 0, 0, TARGET_TYPE_NPC, mapNpcNum)
            End If
        End If

        ' Set the NPC target to the player
        MapNpc(mapNum).Npc(mapNpcNum).targetType = 1 ' player
        MapNpc(mapNum).Npc(mapNpcNum).target = attacker

        ' Now check for guard ai and if so have all onmap guards come after'm
        If Npc(MapNpc(mapNum).Npc(mapNpcNum).Num).Behaviour = NPC_BEHAVIOUR_GUARD Then
            For i = 1 To MAX_MAP_NPCS
                If MapNpc(mapNum).Npc(i).Num = MapNpc(mapNum).Npc(mapNpcNum).Num Then
                    MapNpc(mapNum).Npc(i).target = attacker
                    MapNpc(mapNum).Npc(i).targetType = 1 ' player
                End If
            Next
        End If
        
        ' set the regen timer
        MapNpc(mapNum).Npc(mapNpcNum).stopRegen = True
        MapNpc(mapNum).Npc(mapNpcNum).stopRegenTimer = GetTickCount
        
        ' if stunning spell, stun the npc
        If spellNum > 0 Then
            If Spell(spellNum).StunDuration > 0 Then StunNPC mapNpcNum, mapNum, spellNum
            ' DoT
            If Spell(spellNum).Duration > 0 Then
                AddDoT_Npc mapNum, mapNpcNum, spellNum, attacker
            End If
        End If
        
        SendMapNpcVitals mapNum, mapNpcNum
        
        ' set the player's target if they don't have one
        If TempPlayer(attacker).target = 0 Then
            TempPlayer(attacker).targetType = TARGET_TYPE_NPC
            TempPlayer(attacker).target = mapNpcNum
            SendTarget attacker
        End If
    End If

    If spellNum = 0 Then
        ' Reset attack timer
        TempPlayer(attacker).AttackTimer = GetTickCount
    End If
End Sub

' ###################################
' ##      NPC Attacking Player     ##
' ###################################

Public Sub TryNpcAttackPlayer(ByVal mapNpcNum As Long, ByVal index As Long)
Dim mapNum As Long, npcNum As Long, blockAmount As Long, damage As Long, Defence As Long

    ' Can the npc attack the player?
    If CanNpcAttackPlayer(mapNpcNum, index) Then
        mapNum = GetPlayerMap(index)
        npcNum = MapNpc(mapNum).Npc(mapNpcNum).Num
    
        ' check if PLAYER can avoid the attack
        If CanPlayerDodge(index) Then
            SendActionMsg mapNum, "Dodge!", Pink, 1, (Player(index).x * 32), (Player(index).y * 32)
            Exit Sub
        End If
        If CanPlayerParry(index) Then
            SendActionMsg mapNum, "Parry!", Pink, 1, (Player(index).x * 32), (Player(index).y * 32)
            Exit Sub
        End If

        ' Get the damage we can do
        damage = GetNpcDamage(npcNum)
        
        ' if the player blocks, take away the block amount
        blockAmount = CanPlayerBlock(index)
        damage = damage - blockAmount
        
        ' take away armour
        Defence = GetPlayerDefence(index)
        If Defence > 0 Then
            damage = damage - RAND(Defence - ((Defence / 100) * 10), Defence + ((Defence / 100) * 10))
        End If
        
        ' randomise for up to 10% lower than max hit
        If damage <= 0 Then damage = 1
        damage = RAND(damage - ((damage / 100) * 10), damage + ((damage / 100) * 10))
        
        ' * 1.5 if crit hit
        If CanNpcCrit(index) Then
            damage = damage * 1.5
            SendActionMsg mapNum, "Critical!", BrightCyan, 1, (MapNpc(mapNum).Npc(mapNpcNum).x * 32), (MapNpc(mapNum).Npc(mapNpcNum).y * 32)
        End If

        If damage > 0 Then
            Call NpcAttackPlayer(mapNpcNum, index, damage)
        End If
    End If
End Sub

Function CanNpcAttackPlayer(ByVal mapNpcNum As Long, ByVal index As Long, Optional ByVal isSpell As Boolean = False) As Boolean
    Dim mapNum As Long
    Dim npcNum As Long

    ' Check for subscript out of range
    If mapNpcNum <= 0 Or mapNpcNum > MAX_MAP_NPCS Or Not IsPlaying(index) Then
        Exit Function
    End If

    ' Check for subscript out of range
    If MapNpc(GetPlayerMap(index)).Npc(mapNpcNum).Num <= 0 Then
        Exit Function
    End If

    mapNum = GetPlayerMap(index)
    npcNum = MapNpc(mapNum).Npc(mapNpcNum).Num

    ' Make sure the npc isn't already dead
    If MapNpc(mapNum).Npc(mapNpcNum).Vital(Vitals.HP) <= 0 Then
        Exit Function
    End If
    
    ' Make sure we dont attack the player if they are switching maps
    If TempPlayer(index).GettingMap = YES Then
        Exit Function
    End If
    
    ' exit out early if it's a spell
    If isSpell Then
        If IsPlaying(index) Then
            If npcNum > 0 Then
                CanNpcAttackPlayer = True
                Exit Function
            End If
        End If
    End If
    
    ' Make sure npcs dont attack more then once a second
    If GetTickCount < MapNpc(mapNum).Npc(mapNpcNum).AttackTimer + 1000 Then
        Exit Function
    End If
    MapNpc(mapNum).Npc(mapNpcNum).AttackTimer = GetTickCount

    ' Make sure they are on the same map
    If IsPlaying(index) Then
        If npcNum > 0 Then

            ' Check if at same coordinates
            If (GetPlayerY(index) + 1 = MapNpc(mapNum).Npc(mapNpcNum).y) And (GetPlayerX(index) = MapNpc(mapNum).Npc(mapNpcNum).x) Then
                CanNpcAttackPlayer = True
            Else
                If (GetPlayerY(index) - 1 = MapNpc(mapNum).Npc(mapNpcNum).y) And (GetPlayerX(index) = MapNpc(mapNum).Npc(mapNpcNum).x) Then
                    CanNpcAttackPlayer = True
                Else
                    If (GetPlayerY(index) = MapNpc(mapNum).Npc(mapNpcNum).y) And (GetPlayerX(index) + 1 = MapNpc(mapNum).Npc(mapNpcNum).x) Then
                        CanNpcAttackPlayer = True
                    Else
                        If (GetPlayerY(index) = MapNpc(mapNum).Npc(mapNpcNum).y) And (GetPlayerX(index) - 1 = MapNpc(mapNum).Npc(mapNpcNum).x) Then
                            CanNpcAttackPlayer = True
                        End If
                    End If
                End If
            End If
        End If
    End If
End Function

Sub NpcAttackPlayer(ByVal mapNpcNum As Long, ByVal victim As Long, ByVal damage As Long, Optional ByVal spellNum As Long, Optional ByVal overTime As Boolean = False)
    Dim Name As String
    Dim exp As Long
    Dim mapNum As Long
    Dim i As Long
    Dim Buffer As clsBuffer

    ' Check for subscript out of range
    If mapNpcNum <= 0 Or mapNpcNum > MAX_MAP_NPCS Or IsPlaying(victim) = False Then
        Exit Sub
    End If

    ' Check for subscript out of range
    If MapNpc(GetPlayerMap(victim)).Npc(mapNpcNum).Num <= 0 Then
        Exit Sub
    End If

    mapNum = GetPlayerMap(victim)
    Name = Trim$(Npc(MapNpc(mapNum).Npc(mapNpcNum).Num).Name)
    
    ' Send this packet so they can see the npc attacking
    Set Buffer = New clsBuffer
    Buffer.WriteLong SNpcAttack
    Buffer.WriteLong mapNpcNum
    SendDataToMap mapNum, Buffer.ToArray()
    Set Buffer = Nothing
    
    If damage <= 0 Then
        Exit Sub
    End If
    
    ' set the regen timer
    MapNpc(mapNum).Npc(mapNpcNum).stopRegen = True
    MapNpc(mapNum).Npc(mapNpcNum).stopRegenTimer = GetTickCount

    If damage >= GetPlayerVital(victim, Vitals.HP) Then
        ' Say damage
        SendActionMsg GetPlayerMap(victim), "-" & GetPlayerVital(victim, Vitals.HP), BrightRed, 1, (GetPlayerX(victim) * 32), (GetPlayerY(victim) * 32)
        
        ' send the sound
        If spellNum > 0 Then
            SendMapSound victim, MapNpc(mapNum).Npc(mapNpcNum).x, MapNpc(mapNum).Npc(mapNpcNum).y, SoundEntity.seSpell, spellNum
        Else
            SendMapSound victim, GetPlayerX(victim), GetPlayerY(victim), SoundEntity.seNpc, MapNpc(mapNum).Npc(mapNpcNum).Num
        End If
        
        ' send animation
        If Not overTime Then
            If spellNum = 0 Then Call SendAnimation(mapNum, Npc(MapNpc(mapNum).Npc(mapNpcNum).Num).Animation, GetPlayerX(victim), GetPlayerY(victim))
        End If
        
        ' kill player
        KillPlayer victim
        
        ' Player is dead
        Call GlobalMsg(GetPlayerName(victim) & " has been killed by " & Name, BrightRed)

        ' Set NPC target to 0
        MapNpc(mapNum).Npc(mapNpcNum).target = 0
        MapNpc(mapNum).Npc(mapNpcNum).targetType = 0
    Else
        ' Player not dead, just do the damage
        Call SetPlayerVital(victim, Vitals.HP, GetPlayerVital(victim, Vitals.HP) - damage)
        Call SendVital(victim, Vitals.HP)
        
        ' send the sound
        If spellNum > 0 Then
            SendMapSound victim, MapNpc(mapNum).Npc(mapNpcNum).x, MapNpc(mapNum).Npc(mapNpcNum).y, SoundEntity.seSpell, spellNum
        Else
            SendMapSound victim, GetPlayerX(victim), GetPlayerY(victim), SoundEntity.seNpc, MapNpc(mapNum).Npc(mapNpcNum).Num
        End If
        
        ' send animation
        If Not overTime Then
            If spellNum = 0 Then Call SendAnimation(mapNum, Npc(MapNpc(GetPlayerMap(victim)).Npc(mapNpcNum).Num).Animation, 0, 0, TARGET_TYPE_PLAYER, victim)
        End If
        
        ' if stunning spell, stun the npc
        If spellNum > 0 Then
            If Spell(spellNum).StunDuration > 0 Then StunPlayer victim, spellNum
            ' DoT
            If Spell(spellNum).Duration > 0 Then
                ' TODO: Add Npc vs Player DOTs
            End If
        End If
        
        ' send vitals to party if in one
        If TempPlayer(victim).inParty > 0 Then SendPartyVitals TempPlayer(victim).inParty, victim
        
        ' send the sound
        SendMapSound victim, GetPlayerX(victim), GetPlayerY(victim), SoundEntity.seNpc, MapNpc(mapNum).Npc(mapNpcNum).Num
        
        ' Say damage
        SendActionMsg GetPlayerMap(victim), "-" & damage, BrightRed, 1, (GetPlayerX(victim) * 32), (GetPlayerY(victim) * 32)
        SendBlood GetPlayerMap(victim), GetPlayerX(victim), GetPlayerY(victim)
        
        ' set the regen timer
        TempPlayer(victim).stopRegen = True
        TempPlayer(victim).stopRegenTimer = GetTickCount
    End If

End Sub

' ###################################
' ##    Player Attacking Player    ##
' ###################################

Public Sub TryPlayerAttackPlayer(ByVal attacker As Long, ByVal victim As Long)
Dim blockAmount As Long, npcNum As Long, mapNum As Long, damage As Long, Defence As Long

    damage = 0

    ' Can we attack the npc?
    If CanPlayerAttackPlayer(attacker, victim) Then
    
        mapNum = GetPlayerMap(attacker)
    
        ' check if NPC can avoid the attack
        If CanPlayerDodge(victim) Then
            SendActionMsg mapNum, "Dodge!", Pink, 1, (GetPlayerX(victim) * 32), (GetPlayerY(victim) * 32)
            Exit Sub
        End If
        If CanPlayerParry(victim) Then
            SendActionMsg mapNum, "Parry!", Pink, 1, (GetPlayerX(victim) * 32), (GetPlayerY(victim) * 32)
            Exit Sub
        End If

        ' Get the damage we can do
        damage = GetPlayerDamage(attacker)
        
        ' if the npc blocks, take away the block amount
        blockAmount = CanPlayerBlock(victim)
        damage = damage - blockAmount
        
        ' take away armour
        Defence = GetPlayerDefence(victim)
        If Defence > 0 Then
            damage = damage - RAND(Defence - ((Defence / 100) * 10), Defence + ((Defence / 100) * 10))
        End If
        
        ' randomise for up to 10% lower than max hit
        If damage <= 0 Then damage = 1
        damage = RAND(damage - ((damage / 100) * 10), damage + ((damage / 100) * 10))
        
        ' * 1.5 if can crit
        If CanPlayerCrit(attacker) Then
            damage = damage * 1.5
            SendActionMsg mapNum, "Critical!", BrightCyan, 1, (GetPlayerX(attacker) * 32), (GetPlayerY(attacker) * 32)
        End If

        If damage > 0 Then
            Call PlayerAttackPlayer(attacker, victim, damage)
        Else
            Call PlayerMsg(attacker, "Your attack does nothing.", BrightRed)
        End If
    End If
End Sub

Function CanPlayerAttackPlayer(ByVal attacker As Long, ByVal victim As Long, Optional ByVal isSpell As Boolean = False) As Boolean
Dim partynum As Long, i As Long

    If Not isSpell Then
        ' Check attack timer
        If GetPlayerEquipment(attacker, Weapon) > 0 Then
            If GetTickCount < TempPlayer(attacker).AttackTimer + Item(GetPlayerEquipment(attacker, Weapon)).Speed Then Exit Function
        Else
            If GetTickCount < TempPlayer(attacker).AttackTimer + 1000 Then Exit Function
        End If
    End If

    ' Check for subscript out of range
    If Not IsPlaying(victim) Then Exit Function

    ' Make sure they are on the same map
    If Not GetPlayerMap(attacker) = GetPlayerMap(victim) Then Exit Function

    ' Make sure we dont attack the player if they are switching maps
    If TempPlayer(victim).GettingMap = YES Then Exit Function
    
    ' make sure it's not you
    If victim = attacker Then
        PlayerMsg attacker, "Cannot attack yourself.", BrightRed
        Exit Function
    End If
    
    ' check co-ordinates if not spell
    If Not isSpell Then
        ' Check if at same coordinates
        Select Case GetPlayerDir(attacker)
            Case DIR_UP
    
                If Not ((GetPlayerY(victim) + 1 = GetPlayerY(attacker)) And (GetPlayerX(victim) = GetPlayerX(attacker))) Then Exit Function
            Case DIR_DOWN
    
                If Not ((GetPlayerY(victim) - 1 = GetPlayerY(attacker)) And (GetPlayerX(victim) = GetPlayerX(attacker))) Then Exit Function
            Case DIR_LEFT
    
                If Not ((GetPlayerY(victim) = GetPlayerY(attacker)) And (GetPlayerX(victim) + 1 = GetPlayerX(attacker))) Then Exit Function
            Case DIR_RIGHT
    
                If Not ((GetPlayerY(victim) = GetPlayerY(attacker)) And (GetPlayerX(victim) - 1 = GetPlayerX(attacker))) Then Exit Function
            Case Else
                Exit Function
        End Select
    End If

    ' Check if map is attackable
    If Not Map(GetPlayerMap(attacker)).Moral = MAP_MORAL_NONE Then
        If GetPlayerPK(victim) = NO Then
            Call PlayerMsg(attacker, "This is a safe zone!", BrightRed)
            Exit Function
        End If
    End If

    ' Make sure they have more then 0 hp
    If GetPlayerVital(victim, Vitals.HP) <= 0 Then Exit Function

    ' Check to make sure that they dont have access
    If GetPlayerAccess(attacker) > ADMIN_MONITOR Then
        Call PlayerMsg(attacker, "Admins cannot attack other players.", BrightBlue)
        Exit Function
    End If

    ' Check to make sure the victim isn't an admin
    If GetPlayerAccess(victim) > ADMIN_MONITOR Then
        Call PlayerMsg(attacker, "You cannot attack " & GetPlayerName(victim) & "!", BrightRed)
        Exit Function
    End If

    ' Make sure attacker is high enough level
    If GetPlayerLevel(attacker) < 5 Then
        Call PlayerMsg(attacker, "You are below level 5, you cannot attack another player yet!", BrightRed)
        Exit Function
    End If

    ' Make sure victim is high enough level
    If GetPlayerLevel(victim) < 5 Then
        Call PlayerMsg(attacker, GetPlayerName(victim) & " is below level 5, you cannot attack this player yet!", BrightRed)
        Exit Function
    End If
    
    ' make sure not in your party
    partynum = TempPlayer(attacker).inParty
    If partynum > 0 Then
        For i = 1 To MAX_PARTY_MEMBERS
            If Party(partynum).Member(i) > 0 Then
                If victim = Party(partynum).Member(i) Then
                    PlayerMsg attacker, "Cannot attack party members.", BrightRed
                    Exit Function
                End If
            End If
        Next
    End If

    CanPlayerAttackPlayer = True
End Function

Sub PlayerAttackPlayer(ByVal attacker As Long, ByVal victim As Long, ByVal damage As Long, Optional ByVal spellNum As Long = 0)
    Dim exp As Long
    Dim n As Long
    Dim i As Long
    Dim Buffer As clsBuffer

    ' Check for subscript out of range
    If IsPlaying(attacker) = False Or IsPlaying(victim) = False Or damage < 0 Then
        Exit Sub
    End If

    ' Check for weapon
    n = 0

    If GetPlayerEquipment(attacker, Weapon) > 0 Then
        n = GetPlayerEquipment(attacker, Weapon)
    End If
    
    ' set the regen timer
    TempPlayer(attacker).stopRegen = True
    TempPlayer(attacker).stopRegenTimer = GetTickCount

    If damage >= GetPlayerVital(victim, Vitals.HP) Then
        SendActionMsg GetPlayerMap(victim), "-" & GetPlayerVital(victim, Vitals.HP), BrightRed, 1, (GetPlayerX(victim) * 32), (GetPlayerY(victim) * 32)
        
        ' send the sound
        If spellNum > 0 Then SendMapSound victim, GetPlayerX(victim), GetPlayerY(victim), SoundEntity.seSpell, spellNum
        
        ' Player is dead
        Call GlobalMsg(GetPlayerName(victim) & " has been killed by " & GetPlayerName(attacker), BrightRed)
        ' Calculate exp to give attacker
        exp = (GetPlayerExp(victim) \ 10)

        ' Make sure we dont get less then 0
        If exp < 0 Then
            exp = 0
        End If

        If exp = 0 Then
            Call PlayerMsg(victim, "You lost no exp.", BrightRed)
            Call PlayerMsg(attacker, "You received no exp.", BrightBlue)
        Else
            Call SetPlayerExp(victim, GetPlayerExp(victim) - exp)
            SendEXP victim
            Call PlayerMsg(victim, "You lost " & exp & " exp.", BrightRed)
            
            ' check if we're in a party
            If TempPlayer(attacker).inParty > 0 Then
                ' pass through party exp share function
                Party_ShareExp TempPlayer(attacker).inParty, exp, attacker, GetPlayerLevel(victim)
            Else
                ' not in party, get exp for self
                GivePlayerEXP attacker, exp, GetPlayerLevel(victim)
            End If
        End If
        
        ' purge target info of anyone who targetted dead guy
        For i = 1 To Player_HighIndex
            If IsPlaying(i) And IsConnected(i) Then
                If Player(i).Map = GetPlayerMap(attacker) Then
                    If TempPlayer(i).target = TARGET_TYPE_PLAYER Then
                        If TempPlayer(i).target = victim Then
                            TempPlayer(i).target = 0
                            TempPlayer(i).targetType = TARGET_TYPE_NONE
                            SendTarget i
                        End If
                    End If
                End If
            End If
        Next

        If GetPlayerPK(victim) = NO Then
            If GetPlayerPK(attacker) = NO Then
                Call SetPlayerPK(attacker, YES)
                Call SendPlayerData(attacker)
                Call GlobalMsg(GetPlayerName(attacker) & " has been deemed a Player Killer!!!", BrightRed)
            End If

        Else
            Call GlobalMsg(GetPlayerName(victim) & " has paid the price for being a Player Killer!!!", BrightRed)
        End If

        Call OnDeath(victim)
    Else
        ' Player not dead, just do the damage
        Call SetPlayerVital(victim, Vitals.HP, GetPlayerVital(victim, Vitals.HP) - damage)
        Call SendVital(victim, Vitals.HP)
        
        ' send vitals to party if in one
        If TempPlayer(victim).inParty > 0 Then SendPartyVitals TempPlayer(victim).inParty, victim
        
        ' send the sound
        If spellNum > 0 Then SendMapSound victim, GetPlayerX(victim), GetPlayerY(victim), SoundEntity.seSpell, spellNum
        
        SendActionMsg GetPlayerMap(victim), "-" & damage, BrightRed, 1, (GetPlayerX(victim) * 32), (GetPlayerY(victim) * 32)
        SendBlood GetPlayerMap(victim), GetPlayerX(victim), GetPlayerY(victim)
        
        ' set the regen timer
        TempPlayer(victim).stopRegen = True
        TempPlayer(victim).stopRegenTimer = GetTickCount
        
        'if a stunning spell, stun the player
        If spellNum > 0 Then
            If Spell(spellNum).StunDuration > 0 Then StunPlayer victim, spellNum
            ' DoT
            If Spell(spellNum).Duration > 0 Then
                AddDoT_Player victim, spellNum, attacker
            End If
        End If
        
        ' change target if need be
        If TempPlayer(attacker).target = 0 Then
            TempPlayer(attacker).targetType = TARGET_TYPE_PLAYER
            TempPlayer(attacker).target = victim
            SendTarget attacker
        End If
    End If

    ' Reset attack timer
    TempPlayer(attacker).AttackTimer = GetTickCount
End Sub

' ############
' ## Spells ##
' ############
Public Sub BufferSpell(ByVal index As Long, ByVal spellSlot As Long)
Dim spellNum As Long, mpCost As Long, LevelReq As Long, mapNum As Long, spellCastType As Long, ClassReq As Long
Dim AccessReq As Long, Range As Long, HasBuffered As Boolean, targetType As Byte, target As Long
    
    ' Prevent subscript out of range
    If spellSlot <= 0 Or spellSlot > MAX_PLAYER_SPELLS Then Exit Sub
    
    spellNum = Player(index).Spell(spellSlot).Spell
    mapNum = GetPlayerMap(index)
    
    If spellNum <= 0 Or spellNum > MAX_SPELLS Then Exit Sub
    
    ' Make sure player has the spell
    If Not HasSpell(index, spellNum) Then Exit Sub
    
    ' make sure we're not buffering already
    If TempPlayer(index).spellBuffer.Spell = spellSlot Then Exit Sub
    
    ' see if cooldown has finished
    If TempPlayer(index).SpellCD(spellSlot) > GetTickCount Then
        PlayerMsg index, "Spell hasn't cooled down yet!", BrightRed
        Exit Sub
    End If

    mpCost = Spell(spellNum).mpCost

    ' Check if they have enough MP
    If GetPlayerVital(index, Vitals.MP) < mpCost Then
        Call PlayerMsg(index, "Not enough mana!", BrightRed)
        Exit Sub
    End If
    
    LevelReq = Spell(spellNum).LevelReq

    ' Make sure they are the right level
    If LevelReq > GetPlayerLevel(index) Then
        Call PlayerMsg(index, "You must be level " & LevelReq & " to cast this spell.", BrightRed)
        Exit Sub
    End If
    
    AccessReq = Spell(spellNum).AccessReq
    
    ' make sure they have the right access
    If AccessReq > GetPlayerAccess(index) Then
        Call PlayerMsg(index, "You must be an administrator to cast this spell.", BrightRed)
        Exit Sub
    End If
    
    ClassReq = Spell(spellNum).ClassReq
    
    ' make sure the classreq > 0
    If ClassReq > 0 Then ' 0 = no req
        If ClassReq <> GetPlayerClass(index) Then
            Call PlayerMsg(index, "Only " & CheckGrammar(Trim$(Class(ClassReq).Name)) & " can use this spell.", BrightRed)
            Exit Sub
        End If
    End If
    
    ' find out what kind of spell it is! self cast, target or AOE
    If Spell(spellNum).Range > 0 Then
        ' ranged attack, single target or aoe?
        If Not Spell(spellNum).IsAoE Then
            spellCastType = 2 ' targetted
        Else
            spellCastType = 3 ' targetted aoe
        End If
    Else
        If Not Spell(spellNum).IsAoE Then
            spellCastType = 0 ' self-cast
        Else
            spellCastType = 1 ' self-cast AoE
        End If
    End If
    
    targetType = TempPlayer(index).targetType
    target = TempPlayer(index).target
    Range = Spell(spellNum).Range
    HasBuffered = False
    
    Select Case spellCastType
        Case 0, 1 ' self-cast & self-cast AOE
            HasBuffered = True
        Case 2, 3 ' targeted & targeted AOE
            ' check if have target
            If Not target > 0 Then
                PlayerMsg index, "You do not have a target.", BrightRed
            End If
            If targetType = TARGET_TYPE_PLAYER Then
                ' if have target, check in range
                If Not isInRange(Range, GetPlayerX(index), GetPlayerY(index), GetPlayerX(target), GetPlayerY(target)) Then
                    PlayerMsg index, "Target not in range.", BrightRed
                Else
                    ' go through spell types
                    If Spell(spellNum).Type <> SPELL_TYPE_DAMAGEHP And Spell(spellNum).Type <> SPELL_TYPE_DAMAGEMP Then
                        HasBuffered = True
                    Else
                        If CanPlayerAttackPlayer(index, target, True) Then
                            HasBuffered = True
                        End If
                    End If
                End If
            ElseIf targetType = TARGET_TYPE_NPC Then
                ' if beneficial magic then self-cast it instead
                If Spell(spellNum).Type = SPELL_TYPE_HEALHP Or Spell(spellNum).Type = SPELL_TYPE_HEALMP Then
                    target = index
                    targetType = TARGET_TYPE_PLAYER
                    HasBuffered = True
                Else
                    ' if have target, check in range
                    If Not isInRange(Range, GetPlayerX(index), GetPlayerY(index), MapNpc(mapNum).Npc(target).x, MapNpc(mapNum).Npc(target).y) Then
                        PlayerMsg index, "Target not in range.", BrightRed
                        HasBuffered = False
                    Else
                        ' go through spell types
                        If Spell(spellNum).Type <> SPELL_TYPE_DAMAGEHP And Spell(spellNum).Type <> SPELL_TYPE_DAMAGEMP Then
                            HasBuffered = True
                        Else
                            If CanPlayerAttackNpc(index, target, True) Then
                                HasBuffered = True
                            End If
                        End If
                    End If
                End If
            End If
    End Select
    
    If HasBuffered Then
        SendAnimation mapNum, Spell(spellNum).CastAnim, 0, 0, TARGET_TYPE_PLAYER, index
        TempPlayer(index).spellBuffer.Spell = spellSlot
        TempPlayer(index).spellBuffer.Timer = GetTickCount
        TempPlayer(index).spellBuffer.target = target
        TempPlayer(index).spellBuffer.tType = targetType
        Exit Sub
    Else
        SendClearSpellBuffer index
    End If
End Sub

Public Sub NpcBufferSpell(ByVal mapNum As Long, ByVal mapNpcNum As Long, ByVal npcSpellSlot As Long)
Dim spellNum As Long, mpCost As Long, Range As Long, HasBuffered As Boolean, targetType As Byte, target As Long, spellCastType As Long, i As Long

    ' prevent rte9
    If npcSpellSlot <= 0 Or npcSpellSlot > MAX_NPC_SPELLS Then Exit Sub
    
    With MapNpc(mapNum).Npc(mapNpcNum)
        ' set the spell number
        spellNum = Npc(.Num).Spell(npcSpellSlot)
        
        ' prevent rte9
        If spellNum <= 0 Or spellNum > MAX_SPELLS Then Exit Sub
        
        ' make sure we're not already buffering
        If .spellBuffer.Spell > 0 Then Exit Sub
        
        ' see if cooldown as finished
        If .SpellCD(npcSpellSlot) > GetTickCount Then Exit Sub
        
        ' Set the MP Cost
        mpCost = Spell(spellNum).mpCost
        
        ' have they got enough mp?
        If .Vital(Vitals.MP) < mpCost Then Exit Sub
        
        ' find out what kind of spell it is! self cast, target or AOE
        If Spell(spellNum).Range > 0 Then
            ' ranged attack, single target or aoe?
            If Not Spell(spellNum).IsAoE Then
                spellCastType = 2 ' targetted
            Else
                spellCastType = 3 ' targetted aoe
            End If
        Else
            If Not Spell(spellNum).IsAoE Then
                spellCastType = 0 ' self-cast
            Else
                spellCastType = 1 ' self-cast AoE
            End If
        End If
        
        targetType = .targetType
        target = .target
        Range = Spell(spellNum).Range
        HasBuffered = False
        
        ' make sure on the map
        If GetPlayerMap(target) <> mapNum Then Exit Sub
        
        Select Case spellCastType
            Case 0, 1 ' self-cast & self-cast AOE
                HasBuffered = True
            Case 2, 3 ' targeted & targeted AOE
                ' if it's a healing spell then heal a friend
                If Spell(spellNum).Type = SPELL_TYPE_HEALHP Then
                    ' find a friend who needs healing
                    For i = 1 To MAX_MAP_NPCS
                        If MapNpc(mapNum).Npc(i).Num > 0 Then
                            If MapNpc(mapNum).Npc(i).Vital(Vitals.HP) < Npc(MapNpc(mapNum).Npc(i).Num).HP Then
                                targetType = TARGET_TYPE_NPC
                                target = i
                                HasBuffered = True
                            End If
                        End If
                    Next
                Else
                    ' check if have target
                    If Not target > 0 Then Exit Sub
                    ' make sure it's a player
                    If targetType = TARGET_TYPE_PLAYER Then
                        ' if have target, check in range
                        If Not isInRange(Range, .x, .y, GetPlayerX(target), GetPlayerY(target)) Then
                            Exit Sub
                        Else
                            If CanNpcAttackPlayer(mapNpcNum, target, True) Then
                                HasBuffered = True
                            End If
                        End If
                    End If
                End If
        End Select
        
        If HasBuffered Then
            SendAnimation mapNum, Spell(spellNum).CastAnim, 0, 0, TARGET_TYPE_NPC, mapNpcNum
            .spellBuffer.Spell = npcSpellSlot
            .spellBuffer.Timer = GetTickCount
            .spellBuffer.target = target
            .spellBuffer.tType = targetType
        End If
    End With
End Sub

Public Sub NpcCastSpell(ByVal mapNum As Long, ByVal mapNpcNum As Long, ByVal spellSlot As Long, ByVal target As Long, ByVal targetType As Long)
Dim spellNum As Long, mpCost As Long, Vital As Long, DidCast As Boolean, i As Long, AoE As Long, Range As Long, VitalType As Byte, increment As Boolean, x As Long, y As Long, spellCastType As Long

    DidCast = False
    
    ' rte9
    If spellSlot <= 0 Or spellSlot > MAX_NPC_SPELLS Then Exit Sub
    
    With MapNpc(mapNum).Npc(mapNpcNum)
        ' cache spell num
        spellNum = Npc(.Num).Spell(spellSlot)
        
        ' cache mp cost
        mpCost = Spell(spellNum).mpCost
        
        ' make sure still got enough mp
        If .Vital(Vitals.MP) < mpCost Then Exit Sub
        
        ' find out what kind of spell it is! self cast, target or AOE
        If Spell(spellNum).Range > 0 Then
            ' ranged attack, single target or aoe?
            If Not Spell(spellNum).IsAoE Then
                spellCastType = 2 ' targetted
            Else
                spellCastType = 3 ' targetted aoe
            End If
        Else
            If Not Spell(spellNum).IsAoE Then
                spellCastType = 0 ' self-cast
            Else
                spellCastType = 1 ' self-cast AoE
            End If
        End If
        
        ' get damage
        Vital = GetNpcSpellDamage(.Num, spellNum) 'GetPlayerSpellDamage(index, spellNum)
        
        ' store data
        AoE = Spell(spellNum).AoE
        Range = Spell(spellNum).Range
        
        Select Case spellCastType
            Case 0 ' self-cast target
                Select Case Spell(spellNum).Type
                    Case SPELL_TYPE_HEALHP
                        SpellNpc_Effect Vitals.HP, True, mapNpcNum, Vital, spellNum, mapNum
                        DidCast = True
                    Case SPELL_TYPE_HEALMP
                        SpellNpc_Effect Vitals.MP, True, mapNpcNum, Vital, spellNum, mapNum
                        DidCast = True
                End Select
            Case 1, 3 ' self-cast AOE & targetted AOE
                If spellCastType = 1 Then
                    x = .x
                    y = .y
                ElseIf spellCastType = 3 Then
                    If targetType = 0 Then Exit Sub
                    If target = 0 Then Exit Sub
                    
                    If targetType = TARGET_TYPE_PLAYER Then
                        x = GetPlayerX(target)
                        y = GetPlayerY(target)
                    Else
                        x = MapNpc(mapNum).Npc(target).x
                        y = MapNpc(mapNum).Npc(target).y
                    End If
                    
                    If Not isInRange(Range, .x, .y, x, y) Then Exit Sub
                End If
                Select Case Spell(spellNum).Type
                    Case SPELL_TYPE_DAMAGEHP
                        For i = 1 To Player_HighIndex
                            If IsPlaying(i) Then
                                If GetPlayerMap(i) = mapNum Then
                                    If isInRange(AoE, .x, .y, GetPlayerX(i), GetPlayerY(i)) Then
                                        If CanNpcAttackPlayer(mapNpcNum, i, True) Then
                                            SendAnimation mapNum, Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_PLAYER, i
                                            NpcAttackPlayer mapNpcNum, i, Vital, spellNum
                                            DidCast = True
                                        End If
                                    End If
                                End If
                            End If
                        Next
                    Case SPELL_TYPE_HEALHP, SPELL_TYPE_HEALMP
                        If Spell(spellNum).Type = SPELL_TYPE_HEALHP Then
                            VitalType = Vitals.HP
                            increment = True
                        ElseIf Spell(spellNum).Type = SPELL_TYPE_HEALMP Then
                            VitalType = Vitals.MP
                            increment = True
                        End If
                        
                        If Spell(spellNum).Type = SPELL_TYPE_HEALHP Or Spell(spellNum).Type = SPELL_TYPE_HEALMP Then
                            For i = 1 To MAX_MAP_NPCS
                                If MapNpc(mapNum).Npc(i).Num > 0 Then
                                    If MapNpc(mapNum).Npc(i).Vital(HP) > 0 Then
                                        If isInRange(AoE, x, y, MapNpc(mapNum).Npc(i).x, MapNpc(mapNum).Npc(i).y) Then
                                            SpellNpc_Effect VitalType, increment, i, Vital, spellNum, mapNum
                                            DidCast = True
                                        End If
                                    End If
                                End If
                            Next
                        End If
                End Select
            Case 2 ' targetted
                If targetType = 0 Then Exit Sub
                If target = 0 Then Exit Sub
                
                If targetType = TARGET_TYPE_PLAYER Then
                    x = GetPlayerX(target)
                    y = GetPlayerY(target)
                Else
                    x = MapNpc(mapNum).Npc(target).x
                    y = MapNpc(mapNum).Npc(target).y
                End If
                    
                If Not isInRange(Range, .x, .y, x, y) Then Exit Sub
                
                Select Case Spell(spellNum).Type
                    Case SPELL_TYPE_DAMAGEHP
                        If targetType = TARGET_TYPE_PLAYER Then
                            If CanNpcAttackPlayer(mapNpcNum, target, True) Then
                                If Vital > 0 Then
                                    SendAnimation mapNum, Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_PLAYER, target
                                    NpcAttackPlayer mapNpcNum, target, Vital, spellNum
                                    DidCast = True
                                End If
                            End If
                        End If
                    Case SPELL_TYPE_HEALMP, SPELL_TYPE_HEALHP
                        If Spell(spellNum).Type = SPELL_TYPE_HEALMP Then
                            VitalType = Vitals.MP
                            increment = True
                        ElseIf Spell(spellNum).Type = SPELL_TYPE_HEALHP Then
                            VitalType = Vitals.HP
                            increment = True
                        End If
                        
                        If targetType = TARGET_TYPE_NPC Then
                            SpellNpc_Effect VitalType, increment, target, Vital, spellNum, mapNum
                            DidCast = True
                        End If
                End Select
        End Select
        
        If DidCast Then
            .Vital(Vitals.MP) = .Vital(Vitals.MP) - mpCost
            .SpellCD(spellSlot) = GetTickCount + (Spell(spellNum).CDTime * 1000)
        End If
    End With
End Sub

Public Sub CastSpell(ByVal index As Long, ByVal spellSlot As Long, ByVal target As Long, ByVal targetType As Byte)
Dim spellNum As Long, mpCost As Long, LevelReq As Long, mapNum As Long, Vital As Long, DidCast As Boolean, ClassReq As Long
Dim AccessReq As Long, i As Long, AoE As Long, Range As Long, VitalType As Byte, increment As Boolean, x As Long, y As Long
Dim Buffer As clsBuffer, spellCastType As Long
    
    DidCast = False

    ' Prevent subscript out of range
    If spellSlot <= 0 Or spellSlot > MAX_PLAYER_SPELLS Then Exit Sub

    spellNum = Player(index).Spell(spellSlot).Spell
    mapNum = GetPlayerMap(index)

    ' Make sure player has the spell
    If Not HasSpell(index, spellNum) Then Exit Sub

    mpCost = Spell(spellNum).mpCost

    ' Check if they have enough MP
    If GetPlayerVital(index, Vitals.MP) < mpCost Then
        Call PlayerMsg(index, "Not enough mana!", BrightRed)
        Exit Sub
    End If
    
    LevelReq = Spell(spellNum).LevelReq

    ' Make sure they are the right level
    If LevelReq > GetPlayerLevel(index) Then
        Call PlayerMsg(index, "You must be level " & LevelReq & " to cast this spell.", BrightRed)
        Exit Sub
    End If
    
    AccessReq = Spell(spellNum).AccessReq
    
    ' make sure they have the right access
    If AccessReq > GetPlayerAccess(index) Then
        Call PlayerMsg(index, "You must be an administrator to cast this spell.", BrightRed)
        Exit Sub
    End If
    
    ClassReq = Spell(spellNum).ClassReq
    
    ' make sure the classreq > 0
    If ClassReq > 0 Then ' 0 = no req
        If ClassReq <> GetPlayerClass(index) Then
            Call PlayerMsg(index, "Only " & CheckGrammar(Trim$(Class(ClassReq).Name)) & " can use this spell.", BrightRed)
            Exit Sub
        End If
    End If
    
    ' find out what kind of spell it is! self cast, target or AOE
    If Spell(spellNum).Range > 0 Then
        ' ranged attack, single target or aoe?
        If Not Spell(spellNum).IsAoE Then
            spellCastType = 2 ' targetted
        Else
            spellCastType = 3 ' targetted aoe
        End If
    Else
        If Not Spell(spellNum).IsAoE Then
            spellCastType = 0 ' self-cast
        Else
            spellCastType = 1 ' self-cast AoE
        End If
    End If
    
    ' get damage
    Vital = GetPlayerSpellDamage(index, spellNum)
    
    ' store data
    AoE = Spell(spellNum).AoE
    Range = Spell(spellNum).Range
    
    Select Case spellCastType
        Case 0 ' self-cast target
            Select Case Spell(spellNum).Type
                Case SPELL_TYPE_HEALHP
                    SpellPlayer_Effect Vitals.HP, True, index, Vital, spellNum
                    DidCast = True
                Case SPELL_TYPE_HEALMP
                    SpellPlayer_Effect Vitals.MP, True, index, Vital, spellNum
                    DidCast = True
                Case SPELL_TYPE_WARP
                    SendAnimation mapNum, Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_PLAYER, index
                    PlayerWarp index, Spell(spellNum).Map, Spell(spellNum).x, Spell(spellNum).y
                    SendAnimation GetPlayerMap(index), Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_PLAYER, index
                    DidCast = True
            End Select
        Case 1, 3 ' self-cast AOE & targetted AOE
            If spellCastType = 1 Then
                x = GetPlayerX(index)
                y = GetPlayerY(index)
            ElseIf spellCastType = 3 Then
                If targetType = 0 Then Exit Sub
                If target = 0 Then Exit Sub
                
                If targetType = TARGET_TYPE_PLAYER Then
                    x = GetPlayerX(target)
                    y = GetPlayerY(target)
                Else
                    x = MapNpc(mapNum).Npc(target).x
                    y = MapNpc(mapNum).Npc(target).y
                End If
                
                If Not isInRange(Range, GetPlayerX(index), GetPlayerY(index), x, y) Then
                    PlayerMsg index, "Target not in range.", BrightRed
                    SendClearSpellBuffer index
                End If
            End If
            Select Case Spell(spellNum).Type
                Case SPELL_TYPE_DAMAGEHP
                    For i = 1 To Player_HighIndex
                        If IsPlaying(i) Then
                            If i <> index Then
                                If GetPlayerMap(i) = GetPlayerMap(index) Then
                                    If isInRange(AoE, x, y, GetPlayerX(i), GetPlayerY(i)) Then
                                        If CanPlayerAttackPlayer(index, i, True) Then
                                            SendAnimation mapNum, Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_PLAYER, i
                                            PlayerAttackPlayer index, i, Vital, spellNum
                                            DidCast = True
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    Next
                    For i = 1 To MAX_MAP_NPCS
                        If MapNpc(mapNum).Npc(i).Num > 0 Then
                            If MapNpc(mapNum).Npc(i).Vital(HP) > 0 Then
                                If isInRange(AoE, x, y, MapNpc(mapNum).Npc(i).x, MapNpc(mapNum).Npc(i).y) Then
                                    If CanPlayerAttackNpc(index, i, True) Then
                                        SendAnimation mapNum, Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_NPC, i
                                        PlayerAttackNpc index, i, Vital, spellNum
                                        DidCast = True
                                    End If
                                End If
                            End If
                        End If
                    Next
                Case SPELL_TYPE_HEALHP, SPELL_TYPE_HEALMP, SPELL_TYPE_DAMAGEMP
                    If Spell(spellNum).Type = SPELL_TYPE_HEALHP Then
                        VitalType = Vitals.HP
                        increment = True
                    ElseIf Spell(spellNum).Type = SPELL_TYPE_HEALMP Then
                        VitalType = Vitals.MP
                        increment = True
                    ElseIf Spell(spellNum).Type = SPELL_TYPE_DAMAGEMP Then
                        VitalType = Vitals.MP
                        increment = False
                    End If
                    
                    For i = 1 To Player_HighIndex
                        If IsPlaying(i) Then
                            If GetPlayerMap(i) = GetPlayerMap(index) Then
                                If isInRange(AoE, x, y, GetPlayerX(i), GetPlayerY(i)) Then
                                    SpellPlayer_Effect VitalType, increment, i, Vital, spellNum
                                    DidCast = True
                                End If
                            End If
                        End If
                    Next
                    
                    If Spell(spellNum).Type = SPELL_TYPE_DAMAGEMP Then
                        For i = 1 To MAX_MAP_NPCS
                            If MapNpc(mapNum).Npc(i).Num > 0 Then
                                If MapNpc(mapNum).Npc(i).Vital(HP) > 0 Then
                                    If isInRange(AoE, x, y, MapNpc(mapNum).Npc(i).x, MapNpc(mapNum).Npc(i).y) Then
                                        SpellNpc_Effect VitalType, increment, i, Vital, spellNum, mapNum
                                        DidCast = True
                                    End If
                                End If
                            End If
                        Next
                    End If
            End Select
        Case 2 ' targetted
            If targetType = 0 Then Exit Sub
            If target = 0 Then Exit Sub
            
            If targetType = TARGET_TYPE_PLAYER Then
                x = GetPlayerX(target)
                y = GetPlayerY(target)
            Else
                x = MapNpc(mapNum).Npc(target).x
                y = MapNpc(mapNum).Npc(target).y
            End If
                
            If Not isInRange(Range, GetPlayerX(index), GetPlayerY(index), x, y) Then
                PlayerMsg index, "Target not in range.", BrightRed
                SendClearSpellBuffer index
                Exit Sub
            End If
            
            Select Case Spell(spellNum).Type
                Case SPELL_TYPE_DAMAGEHP
                    If targetType = TARGET_TYPE_PLAYER Then
                        If CanPlayerAttackPlayer(index, target, True) Then
                            If Vital > 0 Then
                                SendAnimation mapNum, Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_PLAYER, target
                                PlayerAttackPlayer index, target, Vital, spellNum
                                DidCast = True
                            End If
                        End If
                    Else
                        If CanPlayerAttackNpc(index, target, True) Then
                            If Vital > 0 Then
                                SendAnimation mapNum, Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_NPC, target
                                PlayerAttackNpc index, target, Vital, spellNum
                                DidCast = True
                            End If
                        End If
                    End If
                    
                Case SPELL_TYPE_DAMAGEMP, SPELL_TYPE_HEALMP, SPELL_TYPE_HEALHP
                    If Spell(spellNum).Type = SPELL_TYPE_DAMAGEMP Then
                        VitalType = Vitals.MP
                        increment = False
                    ElseIf Spell(spellNum).Type = SPELL_TYPE_HEALMP Then
                        VitalType = Vitals.MP
                        increment = True
                    ElseIf Spell(spellNum).Type = SPELL_TYPE_HEALHP Then
                        VitalType = Vitals.HP
                        increment = True
                    End If
                    
                    If targetType = TARGET_TYPE_PLAYER Then
                        If Spell(spellNum).Type = SPELL_TYPE_DAMAGEMP Then
                            If CanPlayerAttackPlayer(index, target, True) Then
                                SpellPlayer_Effect VitalType, increment, target, Vital, spellNum
                                DidCast = True
                            End If
                        Else
                            SpellPlayer_Effect VitalType, increment, target, Vital, spellNum
                            DidCast = True
                        End If
                    Else
                        If Spell(spellNum).Type = SPELL_TYPE_DAMAGEMP Then
                            If CanPlayerAttackNpc(index, target, True) Then
                                SpellNpc_Effect VitalType, increment, target, Vital, spellNum, mapNum
                                DidCast = True
                            End If
                        Else
                            SpellNpc_Effect VitalType, increment, target, Vital, spellNum, mapNum
                            DidCast = True
                        End If
                    End If
            End Select
    End Select
    
    If DidCast Then
        Call SetPlayerVital(index, Vitals.MP, GetPlayerVital(index, Vitals.MP) - mpCost)
        Call SendVital(index, Vitals.MP)
        ' send vitals to party if in one
        If TempPlayer(index).inParty > 0 Then SendPartyVitals TempPlayer(index).inParty, index
        
        TempPlayer(index).SpellCD(spellSlot) = GetTickCount + (Spell(spellNum).CDTime * 1000)
        Call SendCooldown(index, spellSlot)
        
        ' if has a next rank then increment usage
        SetPlayerSpellUsage index, spellSlot
    End If
End Sub

Public Sub SetPlayerSpellUsage(ByVal index As Long, ByVal spellSlot As Long)
Dim spellNum As Long, i As Long
    spellNum = Player(index).Spell(spellSlot).Spell
    ' if has a next rank then increment usage
    If Spell(spellNum).NextRank > 0 Then
        If Player(index).Spell(spellSlot).Uses < Spell(spellNum).NextUses - 1 Then
            Player(index).Spell(spellSlot).Uses = Player(index).Spell(spellSlot).Uses + 1
        Else
            If GetPlayerLevel(index) >= Spell(Spell(spellNum).NextRank).LevelReq Then
                Player(index).Spell(spellSlot).Spell = Spell(spellNum).NextRank
                Player(index).Spell(spellSlot).Uses = 0
                PlayerMsg index, "Your spell has ranked up!", Blue
                ' update hotbar
                For i = 1 To MAX_HOTBAR
                    If Player(index).Hotbar(i).Slot > 0 Then
                        If Player(index).Hotbar(i).sType = 2 Then ' spell
                            If Spell(Player(index).Hotbar(i).Slot).UniqueIndex = Spell(Spell(spellNum).NextRank).UniqueIndex Then
                                Player(index).Hotbar(i).Slot = Spell(spellNum).NextRank
                                SendHotbar index
                            End If
                        End If
                    End If
                Next
            Else
                Player(index).Spell(spellSlot).Uses = Spell(spellNum).NextUses
            End If
        End If
        SendPlayerSpells index
    End If
End Sub

Public Sub SpellPlayer_Effect(ByVal Vital As Byte, ByVal increment As Boolean, ByVal index As Long, ByVal damage As Long, ByVal spellNum As Long)
Dim sSymbol As String * 1
Dim Colour As Long

    If damage > 0 Then
        If increment Then
            sSymbol = "+"
            If Vital = Vitals.HP Then Colour = BrightGreen
            If Vital = Vitals.MP Then Colour = BrightBlue
        Else
            sSymbol = "-"
            Colour = Blue
        End If
    
        SendAnimation GetPlayerMap(index), Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_PLAYER, index
        SendActionMsg GetPlayerMap(index), sSymbol & damage, Colour, ACTIONMSG_SCROLL, GetPlayerX(index) * 32, GetPlayerY(index) * 32
        
        ' send the sound
        SendMapSound index, GetPlayerX(index), GetPlayerY(index), SoundEntity.seSpell, spellNum
        
        If increment Then
            SetPlayerVital index, Vital, GetPlayerVital(index, Vital) + damage
            If Spell(spellNum).Duration > 0 Then
                AddHoT_Player index, spellNum
            End If
        ElseIf Not increment Then
            SetPlayerVital index, Vital, GetPlayerVital(index, Vital) - damage
        End If
        
        ' send update
        SendVital index, Vital
    End If
End Sub

Public Sub SpellNpc_Effect(ByVal Vital As Byte, ByVal increment As Boolean, ByVal index As Long, ByVal damage As Long, ByVal spellNum As Long, ByVal mapNum As Long)
Dim sSymbol As String * 1
Dim Colour As Long

    If damage > 0 Then
        If increment Then
            sSymbol = "+"
            If Vital = Vitals.HP Then Colour = BrightGreen
            If Vital = Vitals.MP Then Colour = BrightBlue
        Else
            sSymbol = "-"
            Colour = Blue
        End If
    
        SendAnimation mapNum, Spell(spellNum).SpellAnim, 0, 0, TARGET_TYPE_NPC, index
        SendActionMsg mapNum, sSymbol & damage, Colour, ACTIONMSG_SCROLL, MapNpc(mapNum).Npc(index).x * 32, MapNpc(mapNum).Npc(index).y * 32
        
        ' send the sound
        SendMapSound index, MapNpc(mapNum).Npc(index).x, MapNpc(mapNum).Npc(index).y, SoundEntity.seSpell, spellNum
        
        If increment Then
            MapNpc(mapNum).Npc(index).Vital(Vital) = MapNpc(mapNum).Npc(index).Vital(Vital) + damage
            If Spell(spellNum).Duration > 0 Then
                AddHoT_Npc mapNum, index, spellNum
            End If
        ElseIf Not increment Then
            MapNpc(mapNum).Npc(index).Vital(Vital) = MapNpc(mapNum).Npc(index).Vital(Vital) - damage
        End If
    End If
End Sub

Public Sub AddDoT_Player(ByVal index As Long, ByVal spellNum As Long, ByVal Caster As Long)
Dim i As Long

    For i = 1 To MAX_DOTS
        With TempPlayer(index).DoT(i)
            If .Spell = spellNum Then
                .Timer = GetTickCount
                .Caster = Caster
                .StartTime = GetTickCount
                Exit Sub
            End If
            
            If .Used = False Then
                .Spell = spellNum
                .Timer = GetTickCount
                .Caster = Caster
                .Used = True
                .StartTime = GetTickCount
                Exit Sub
            End If
        End With
    Next
End Sub

Public Sub AddHoT_Player(ByVal index As Long, ByVal spellNum As Long)
Dim i As Long

    For i = 1 To MAX_DOTS
        With TempPlayer(index).HoT(i)
            If .Spell = spellNum Then
                .Timer = GetTickCount
                .StartTime = GetTickCount
                Exit Sub
            End If
            
            If .Used = False Then
                .Spell = spellNum
                .Timer = GetTickCount
                .Used = True
                .StartTime = GetTickCount
                Exit Sub
            End If
        End With
    Next
End Sub

Public Sub AddDoT_Npc(ByVal mapNum As Long, ByVal index As Long, ByVal spellNum As Long, ByVal Caster As Long)
Dim i As Long

    For i = 1 To MAX_DOTS
        With MapNpc(mapNum).Npc(index).DoT(i)
            If .Spell = spellNum Then
                .Timer = GetTickCount
                .Caster = Caster
                .StartTime = GetTickCount
                Exit Sub
            End If
            
            If .Used = False Then
                .Spell = spellNum
                .Timer = GetTickCount
                .Caster = Caster
                .Used = True
                .StartTime = GetTickCount
                Exit Sub
            End If
        End With
    Next
End Sub

Public Sub AddHoT_Npc(ByVal mapNum As Long, ByVal index As Long, ByVal spellNum As Long)
Dim i As Long

    For i = 1 To MAX_DOTS
        With MapNpc(mapNum).Npc(index).HoT(i)
            If .Spell = spellNum Then
                .Timer = GetTickCount
                .StartTime = GetTickCount
                Exit Sub
            End If
            
            If .Used = False Then
                .Spell = spellNum
                .Timer = GetTickCount
                .Used = True
                .StartTime = GetTickCount
                Exit Sub
            End If
        End With
    Next
End Sub

Public Sub HandleDoT_Player(ByVal index As Long, ByVal dotNum As Long)
    With TempPlayer(index).DoT(dotNum)
        If .Used And .Spell > 0 Then
            ' time to tick?
            If GetTickCount > .Timer + (Spell(.Spell).Interval * 1000) Then
                If CanPlayerAttackPlayer(.Caster, index, True) Then
                    PlayerAttackPlayer .Caster, index, GetPlayerSpellDamage(.Caster, .Spell)
                End If
                .Timer = GetTickCount
                ' check if DoT is still active - if player died it'll have been purged
                If .Used And .Spell > 0 Then
                    ' destroy DoT if finished
                    If GetTickCount - .StartTime >= (Spell(.Spell).Duration * 1000) Then
                        .Used = False
                        .Spell = 0
                        .Timer = 0
                        .Caster = 0
                        .StartTime = 0
                    End If
                End If
            End If
        End If
    End With
End Sub

Public Sub HandleHoT_Player(ByVal index As Long, ByVal hotNum As Long)
    With TempPlayer(index).HoT(hotNum)
        If .Used And .Spell > 0 Then
            ' time to tick?
            If GetTickCount > .Timer + (Spell(.Spell).Interval * 1000) Then
                SendActionMsg Player(index).Map, "+" & GetPlayerSpellDamage(.Caster, .Spell), BrightGreen, ACTIONMSG_SCROLL, Player(index).x * 32, Player(index).y * 32
                Player(index).Vital(Vitals.HP) = Player(index).Vital(Vitals.HP) + GetPlayerSpellDamage(.Caster, .Spell)
                .Timer = GetTickCount
                ' check if DoT is still active - if player died it'll have been purged
                If .Used And .Spell > 0 Then
                    ' destroy hoT if finished
                    If GetTickCount - .StartTime >= (Spell(.Spell).Duration * 1000) Then
                        .Used = False
                        .Spell = 0
                        .Timer = 0
                        .Caster = 0
                        .StartTime = 0
                    End If
                End If
            End If
        End If
    End With
End Sub

Public Sub HandleDoT_Npc(ByVal mapNum As Long, ByVal index As Long, ByVal dotNum As Long)
    With MapNpc(mapNum).Npc(index).DoT(dotNum)
        If .Used And .Spell > 0 Then
            ' time to tick?
            If GetTickCount > .Timer + (Spell(.Spell).Interval * 1000) Then
                If CanPlayerAttackNpc(.Caster, index, True) Then
                    PlayerAttackNpc .Caster, index, GetPlayerSpellDamage(.Caster, .Spell), , True
                End If
                .Timer = GetTickCount
                ' check if DoT is still active - if NPC died it'll have been purged
                If .Used And .Spell > 0 Then
                    ' destroy DoT if finished
                    If GetTickCount - .StartTime >= (Spell(.Spell).Duration * 1000) Then
                        .Used = False
                        .Spell = 0
                        .Timer = 0
                        .Caster = 0
                        .StartTime = 0
                    End If
                End If
            End If
        End If
    End With
End Sub

Public Sub HandleHoT_Npc(ByVal mapNum As Long, ByVal index As Long, ByVal hotNum As Long)
    With MapNpc(mapNum).Npc(index).HoT(hotNum)
        If .Used And .Spell > 0 Then
            ' time to tick?
            If GetTickCount > .Timer + (Spell(.Spell).Interval * 1000) Then
                SendActionMsg mapNum, "+" & GetPlayerSpellDamage(.Caster, .Spell), BrightGreen, ACTIONMSG_SCROLL, MapNpc(mapNum).Npc(index).x * 32, MapNpc(mapNum).Npc(index).y * 32
                MapNpc(mapNum).Npc(index).Vital(Vitals.HP) = MapNpc(mapNum).Npc(index).Vital(Vitals.HP) + GetPlayerSpellDamage(.Caster, .Spell)
                .Timer = GetTickCount
                ' check if DoT is still active - if NPC died it'll have been purged
                If .Used And .Spell > 0 Then
                    ' destroy hoT if finished
                    If GetTickCount - .StartTime >= (Spell(.Spell).Duration * 1000) Then
                        .Used = False
                        .Spell = 0
                        .Timer = 0
                        .Caster = 0
                        .StartTime = 0
                    End If
                End If
            End If
        End If
    End With
End Sub

Public Sub StunPlayer(ByVal index As Long, ByVal spellNum As Long)
    ' check if it's a stunning spell
    If Spell(spellNum).StunDuration > 0 Then
        ' set the values on index
        TempPlayer(index).StunDuration = Spell(spellNum).StunDuration
        TempPlayer(index).StunTimer = GetTickCount
        ' send it to the index
        SendStunned index
        ' tell him he's stunned
        PlayerMsg index, "You have been stunned.", BrightRed
    End If
End Sub

Public Sub StunNPC(ByVal index As Long, ByVal mapNum As Long, ByVal spellNum As Long)
    ' check if it's a stunning spell
    If Spell(spellNum).StunDuration > 0 Then
        ' set the values on index
        MapNpc(mapNum).Npc(index).StunDuration = Spell(spellNum).StunDuration
        MapNpc(mapNum).Npc(index).StunTimer = GetTickCount
    End If
End Sub
