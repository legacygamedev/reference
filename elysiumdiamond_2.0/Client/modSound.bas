Attribute VB_Name = "modSound"

' Copyright (c) 2006 Elysium Source. All rights reserved.
' This code is licensed under the Elysium General License.

Public Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Public Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long

Public Const SND_SYNC = &H0
Public Const SND_ASYNC = &H1
Public Const SND_NODEFAULT = &H2
Public Const SND_MEMORY = &H4
Public Const SND_LOOP = &H8
Public Const SND_NOSTOP = &H10
Public CurrentSong As String

Public Sub PlayMidi(Song As String)
Dim I As Long

If Val(GetVar(App.Path & "\config.ini", "CONFIG", "Music")) = 1 Then
    If CurrentSong <> Song Then
        CurrentSong = Song
        I = mciSendString("close all", 0, 0, 0)
        I = mciSendString("open """ & App.Path & "\Music\" & Song & """ type sequencer alias background", 0, 0, 0)
        I = mciSendString("play background notify", 0, 0, frmMirage.hWnd)
    End If
Else
    Call StopMidi
End If
End Sub

Public Sub StopMidi()
Dim I As Long

    CurrentSong = ""
    I = mciSendString("close all", 0, 0, 0)
End Sub

Public Sub MakeMidiLoop()
Dim SBuffer As String * 256

Call mciSendString("STATUS background MODE", SBuffer, 256, 0)

If Left$(SBuffer, 7) = "stopped" Then
    Call mciSendString("PLAY background FROM 0", vbNullString, 0, 0)
End If
End Sub

Public Sub PlaySound(Sound As String)
    If Val(GetVar(App.Path & "\config.ini", "CONFIG", "Sound")) = 1 Then
        If FileExist("SFX\" & Sound) = False Then Exit Sub
        Call sndPlaySound(App.Path & "\SFX\" & Sound, SND_ASYNC Or SND_NODEFAULT)
    End If
End Sub

Public Sub StopSound()
    Dim x As Long
    Dim wFlags As Long

    wFlags = SND_ASYNC Or SND_NODEFAULT
    x = sndPlaySound("", wFlags)
End Sub



