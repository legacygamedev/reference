VERSION 5.00
Begin VB.Form frmNewAccount 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Mirage Source Engine (New Account)"
   ClientHeight    =   4515
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7515
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmNewAccount.frx":0000
   ScaleHeight     =   4515
   ScaleWidth      =   7515
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtRetype 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   4320
      MaxLength       =   20
      TabIndex        =   8
      Top             =   2880
      Width           =   2895
   End
   Begin VB.TextBox txtPassword 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   4320
      MaxLength       =   20
      TabIndex        =   4
      Top             =   2520
      Width           =   2895
   End
   Begin VB.TextBox txtName 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   4320
      MaxLength       =   20
      TabIndex        =   0
      Top             =   2160
      Width           =   2895
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Retype"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   3360
      TabIndex        =   9
      Top             =   2880
      Width           =   975
   End
   Begin VB.Label lblConnect 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Connect"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   5160
      TabIndex        =   7
      Top             =   3360
      Width           =   915
   End
   Begin VB.Label lblCancel 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   6480
      TabIndex        =   6
      Top             =   4200
      Width           =   915
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "New Account"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   5
      Top             =   120
      Width           =   2535
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Password"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      Top             =   2520
      Width           =   975
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Enter a account name and password.  You can name yourself whatever you want, we have no restrictions on names."
      ForeColor       =   &H00000000&
      Height          =   1095
      Left            =   3360
      TabIndex        =   2
      Top             =   1080
      Width           =   3855
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Name"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   3360
      TabIndex        =   1
      Top             =   2160
      Width           =   615
   End
End
Attribute VB_Name = "frmNewAccount"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub lblCancel_Click()
    frmMainMenu.Visible = True
    frmNewAccount.Visible = False
End Sub

Private Sub lblConnect_Click()
Dim Msg As String
Dim i As Long

    If Trim$(txtPassword.Text) <> Trim$(txtRetype.Text) Then
        Call MsgBox("Your password doesn't match!")
        Exit Sub
    End If

    If Trim$(txtName.Text) <> vbNullString And Trim$(txtPassword.Text) <> vbNullString And Trim$(txtRetype.Text) <> vbNullString Then
        Msg = Trim$(txtName.Text)
        
        ' Prevent high ascii chars
        For i = 1 To Len(Msg)
            If Asc(Mid$(Msg, i, 1)) < 32 Or Asc(Mid$(Msg, i, 1)) > 126 Then
                Call MsgBox("You cannot use high ascii chars in your name, please reenter.", vbOKOnly, GAME_NAME)
                txtName.Text = vbNullString
                Exit Sub
            End If
        Next i
    
        Call MenuState(MENU_STATE_NEWACCOUNT)
    End If
End Sub
