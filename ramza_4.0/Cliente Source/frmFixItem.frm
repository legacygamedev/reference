VERSION 5.00
Begin VB.Form frmFixItem 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Fix Item"
   ClientHeight    =   5235
   ClientLeft      =   90
   ClientTop       =   -60
   ClientWidth     =   4260
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   12
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmFixItem.frx":0000
   ScaleHeight     =   349
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   284
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cmbItem 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   300
      Left            =   360
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   1560
      Width           =   3465
   End
   Begin VB.Label picCancel 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Volver al Juego"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   210
      Left            =   2880
      TabIndex        =   3
      Top             =   4920
      Width           =   1380
   End
   Begin VB.Label chkFix 
      BackStyle       =   0  'Transparent
      Caption         =   "Reparar el Item"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   1440
      TabIndex        =   2
      Top             =   2280
      Width           =   1095
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Selecciona el Item que deseas reparar"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   360
      TabIndex        =   1
      Top             =   1320
      Width           =   2820
   End
End
Attribute VB_Name = "frmFixItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chkFix_Click()
    Call SendData("fixitem" & SEP_CHAR & cmbItem.ListIndex + 1 & SEP_CHAR & END_CHAR)
End Sub

Private Sub Form_Load()
Dim i As Long
Dim Ending As String
    For i = 1 To 3
        If i = 1 Then Ending = ".gif"
        If i = 2 Then Ending = ".jpg"
        If i = 3 Then Ending = ".png"

        If FileExist("GUI\FixItems" & Ending) Then frmFixItem.Picture = LoadPicture(App.Path & "\GUI\FixItems" & Ending)
    Next i
End Sub

Private Sub picCancel_Click()
    Unload Me
End Sub

