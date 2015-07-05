VERSION 5.00
Begin VB.Form frmSpellEditor 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Spell Editor"
   ClientHeight    =   6030
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5055
   ControlBox      =   0   'False
   DrawMode        =   14  'Copy Pen
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
   ScaleHeight     =   6030
   ScaleWidth      =   5055
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtMana 
      Height          =   390
      Left            =   1080
      TabIndex        =   25
      Text            =   "10"
      Top             =   1200
      Width           =   3015
   End
   Begin VB.CommandButton cmdTestSound 
      Caption         =   "Test"
      Height          =   375
      Left            =   240
      TabIndex        =   23
      Top             =   4920
      Width           =   1095
   End
   Begin VB.HScrollBar scrlMusic 
      Height          =   375
      Left            =   1080
      Max             =   255
      TabIndex        =   20
      Top             =   4440
      Value           =   1
      Width           =   2415
   End
   Begin VB.HScrollBar scrlLevelReq 
      Height          =   375
      Left            =   960
      Max             =   255
      Min             =   1
      TabIndex        =   18
      Top             =   1680
      Value           =   1
      Width           =   3495
   End
   Begin VB.ComboBox cmbClassReq 
      Height          =   390
      ItemData        =   "frmSpellEditor.frx":0000
      Left            =   120
      List            =   "frmSpellEditor.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   16
      Top             =   600
      Width           =   4815
   End
   Begin VB.Frame fraGiveItem 
      Caption         =   "Give Item"
      Height          =   1455
      Left            =   120
      TabIndex        =   9
      Top             =   2880
      Visible         =   0   'False
      Width           =   4815
      Begin VB.HScrollBar scrlItemValue 
         Height          =   375
         Left            =   1320
         TabIndex        =   14
         Top             =   840
         Width           =   2895
      End
      Begin VB.HScrollBar scrlItemNum 
         Height          =   375
         Left            =   1320
         Max             =   255
         Min             =   1
         TabIndex        =   10
         Top             =   360
         Value           =   1
         Width           =   2895
      End
      Begin VB.Label lblItemValue 
         Alignment       =   1  'Right Justify
         Caption         =   "0"
         Height          =   375
         Left            =   4200
         TabIndex        =   15
         Top             =   840
         Width           =   495
      End
      Begin VB.Label Label5 
         Caption         =   "Value"
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label lblItemNum 
         Alignment       =   1  'Right Justify
         Caption         =   "1"
         Height          =   375
         Left            =   4200
         TabIndex        =   12
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label2 
         Caption         =   "Item"
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   495
      Left            =   120
      TabIndex        =   8
      Top             =   5400
      Width           =   2295
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   2640
      TabIndex        =   7
      Top             =   5400
      Width           =   2295
   End
   Begin VB.ComboBox cmbType 
      Height          =   390
      ItemData        =   "frmSpellEditor.frx":0004
      Left            =   120
      List            =   "frmSpellEditor.frx":001D
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   2280
      Width           =   4815
   End
   Begin VB.Frame fraVitals 
      Caption         =   "Vitals Data"
      Height          =   1455
      Left            =   120
      TabIndex        =   2
      Top             =   2880
      Visible         =   0   'False
      Width           =   4815
      Begin VB.HScrollBar scrlVitalMod 
         Height          =   375
         Left            =   1320
         Max             =   255
         TabIndex        =   3
         Top             =   360
         Value           =   1
         Width           =   2895
      End
      Begin VB.Label Label4 
         Caption         =   "Vital Mod"
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label lblVitalMod 
         Alignment       =   1  'Right Justify
         Caption         =   "1"
         Height          =   375
         Left            =   4200
         TabIndex        =   4
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.TextBox txtName 
      Height          =   390
      Left            =   960
      TabIndex        =   0
      Top             =   120
      Width           =   3975
   End
   Begin VB.Label Label6 
      Caption         =   "Mana:"
      Height          =   255
      Left            =   120
      TabIndex        =   24
      Top             =   1200
      Width           =   855
   End
   Begin VB.Label Label10 
      Caption         =   "Sound"
      Height          =   375
      Left            =   240
      TabIndex        =   22
      Top             =   4440
      Width           =   735
   End
   Begin VB.Label lblMusic 
      Alignment       =   1  'Right Justify
      Caption         =   "0"
      Height          =   375
      Left            =   3600
      TabIndex        =   21
      Top             =   4440
      Width           =   495
   End
   Begin VB.Label lblLevelReq 
      Alignment       =   1  'Right Justify
      Caption         =   "1"
      Height          =   375
      Left            =   4440
      TabIndex        =   19
      Top             =   1680
      Width           =   495
   End
   Begin VB.Label Label3 
      Caption         =   "Level"
      Height          =   375
      Left            =   120
      TabIndex        =   17
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Name"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   735
   End
End
Attribute VB_Name = "frmSpellEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmbType_Click()
    If cmbType.ListIndex <> SPELL_TYPE_GIVEITEM Then
        fraVitals.Visible = True
        fraGiveItem.Visible = False
    Else
        fraVitals.Visible = False
        fraGiveItem.Visible = True
    End If
End Sub

Private Sub cmdTestSound_Click()
    Call PlaySound("magic" & scrlMusic.value)
End Sub


Private Sub scrlItemNum_Change()
    fraGiveItem.Caption = "Give Item " & Trim(Item(scrlItemNum.value).Name)
    lblItemNum.Caption = str(scrlItemNum.value)
End Sub

Private Sub scrlItemValue_Change()
    lblItemValue.Caption = str(scrlItemValue.value)
End Sub

Private Sub scrlLevelReq_Change()
    lblLevelReq.Caption = str(scrlLevelReq.value)
End Sub

Private Sub scrlMusic_Change()
    lblMusic.Caption = str(scrlMusic.value)
End Sub

Private Sub scrlVitalMod_Change()
    lblVitalMod.Caption = str(scrlVitalMod.value)
End Sub

Private Sub cmdOk_Click()
    Call SpellEditorOk
End Sub

Private Sub cmdCancel_Click()
    Call SpellEditorCancel
End Sub

