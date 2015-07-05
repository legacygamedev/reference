VERSION 5.00
Begin VB.Form frmChars 
   BackColor       =   &H00004080&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   1890
   ClientLeft      =   15
   ClientTop       =   -90
   ClientWidth     =   3750
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmChars.frx":0000
   ScaleHeight     =   1890
   ScaleWidth      =   3750
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picHeading 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   765
      Left            =   360
      Picture         =   "frmChars.frx":1745A
      ScaleHeight     =   765
      ScaleWidth      =   3000
      TabIndex        =   5
      Top             =   0
      Width           =   3000
   End
   Begin VB.ListBox lstChars 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      IntegralHeight  =   0   'False
      ItemData        =   "frmChars.frx":1EC24
      Left            =   -15
      List            =   "frmChars.frx":1EC26
      TabIndex        =   4
      Top             =   1095
      Width           =   4020
   End
   Begin VB.PictureBox picCancel 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   360
      Left            =   0
      Picture         =   "frmChars.frx":1EC28
      ScaleHeight     =   360
      ScaleWidth      =   1500
      TabIndex        =   3
      Top             =   1455
      Width           =   1500
   End
   Begin VB.PictureBox picNewChar 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   360
      Left            =   2265
      Picture         =   "frmChars.frx":2088A
      ScaleHeight     =   360
      ScaleWidth      =   1500
      TabIndex        =   2
      Top             =   750
      Width           =   1500
   End
   Begin VB.PictureBox picUseChar 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   360
      Left            =   0
      Picture         =   "frmChars.frx":224EC
      ScaleHeight     =   360
      ScaleWidth      =   1500
      TabIndex        =   1
      Top             =   750
      Width           =   1500
   End
   Begin VB.PictureBox picDeleteChar 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   360
      Left            =   2265
      Picture         =   "frmChars.frx":2414E
      ScaleHeight     =   360
      ScaleWidth      =   1500
      TabIndex        =   0
      Top             =   1455
      Width           =   1500
   End
End
Attribute VB_Name = "frmChars"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim PicArray() As VB.PictureBox

Private Sub picCancel_Click()
    Call TcpDestroy
    frmMainMenu.Visible = True
    Me.Visible = False
End Sub

Private Sub picDeleteChar_Click()
Dim Value As Long

    Value = MsgBox("Are you sure you wish to delete this character?", vbYesNo, GAME_NAME)
    If Value = vbYes Then
        Call MenuState(MENU_STATE_DELCHAR)
    End If
End Sub

Private Sub picNewChar_Click()
    Call MenuState(MENU_STATE_NEWCHAR)
End Sub

Private Sub picUseChar_Click()
    Call MenuState(MENU_STATE_USECHAR)
End Sub

Public Sub MakePic(ByVal n As Long)
    Set PicArray(n) = Controls.Add("VB.PictureBox", "PicArray" & CStr(n), Me)
    PicArray(n).Appearance = 0
    PicArray(n).BorderStyle = 0
    PicArray(n).AutoRedraw = True
    PicArray(n).AutoSize = True
    PicArray(n).Picture = LoadPicture(App.Path & GUI_PATH & GetVar(App.Path & GUI_PATH & "config.ini", "Characters", "PicFrame" & n & "Target"))
    PicArray(n).Left = CLng(GetVar(App.Path & GUI_PATH & "config.ini", "Characters", "PicFrame" & n & "X"))
    PicArray(n).top = CLng(GetVar(App.Path & GUI_PATH & "config.ini", "Characters", "PicFrame" & n & "Y"))
    PicArray(n).Visible = True
End Sub

Public Sub SetArray(ByVal num As Long)
    ReDim PicArray(1 To num) As VB.PictureBox
End Sub
