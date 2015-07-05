VERSION 5.00
Begin VB.Form frmNpcEditor 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Npc Editor"
   ClientHeight    =   5790
   ClientLeft      =   150
   ClientTop       =   420
   ClientWidth     =   10080
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
   Icon            =   "frmNpcEditor.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   386
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   672
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame3 
      Caption         =   "Settings"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4335
      Left            =   5160
      TabIndex        =   34
      Top             =   240
      Width           =   4695
      Begin VB.HScrollBar scrlElement 
         Height          =   255
         Left            =   960
         Max             =   1000
         TabIndex        =   58
         Top             =   3360
         Value           =   1
         Width           =   2775
      End
      Begin VB.HScrollBar scrlScript 
         Height          =   255
         Left            =   960
         Max             =   10000
         TabIndex        =   55
         Top             =   3840
         Value           =   1
         Width           =   3255
      End
      Begin VB.TextBox txtSpawnSecs 
         Alignment       =   1  'Right Justify
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2760
         TabIndex        =   53
         Text            =   "0"
         Top             =   2880
         Width           =   1815
      End
      Begin VB.ComboBox cmbBehavior 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         ItemData        =   "frmNpcEditor.frx":0FC2
         Left            =   960
         List            =   "frmNpcEditor.frx":0FD8
         Style           =   2  'Dropdown List
         TabIndex        =   51
         Top             =   2520
         Width           =   3615
      End
      Begin VB.CheckBox chkDay 
         Caption         =   "Day"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   3840
         TabIndex        =   48
         Top             =   2160
         Value           =   1  'Checked
         Width           =   615
      End
      Begin VB.CheckBox chkNight 
         Caption         =   "Night"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   3120
         TabIndex        =   49
         Top             =   2160
         Value           =   1  'Checked
         Width           =   735
      End
      Begin VB.TextBox txtChance 
         Alignment       =   1  'Right Justify
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2640
         TabIndex        =   38
         Text            =   "0"
         Top             =   1800
         Width           =   1815
      End
      Begin VB.HScrollBar scrlValue 
         Height          =   255
         Left            =   960
         Max             =   10000
         TabIndex        =   37
         Top             =   1440
         Value           =   1
         Width           =   3255
      End
      Begin VB.HScrollBar scrlNum 
         Height          =   255
         Left            =   960
         Max             =   500
         TabIndex        =   36
         Top             =   1080
         Value           =   1
         Width           =   3255
      End
      Begin VB.HScrollBar scrlDropItem 
         Height          =   255
         Left            =   960
         Max             =   5
         Min             =   1
         TabIndex        =   35
         Top             =   360
         Value           =   1
         Width           =   3255
      End
      Begin VB.Label lblElement 
         AutoSize        =   -1  'True
         Caption         =   "None"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   3840
         TabIndex        =   60
         Top             =   3360
         Width           =   690
      End
      Begin VB.Label Label20 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "Element:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Left            =   360
         TabIndex        =   59
         Top             =   3360
         Width           =   555
      End
      Begin VB.Label lblScript 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4320
         TabIndex        =   57
         Top             =   3840
         Width           =   255
      End
      Begin VB.Label Label19 
         Alignment       =   1  'Right Justify
         Caption         =   "Script:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   56
         Top             =   3840
         Width           =   735
      End
      Begin VB.Label Label18 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "Spawn Time :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Left            =   2160
         TabIndex        =   54
         Top             =   2200
         Width           =   885
      End
      Begin VB.Label Label16 
         Alignment       =   1  'Right Justify
         Caption         =   "Spawn Rate (in seconds) :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   840
         TabIndex        =   52
         Top             =   2880
         Width           =   1815
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "Behavior :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   50
         Top             =   2520
         Width           =   735
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         Caption         =   "Drop Item Chance 1 out of :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   720
         TabIndex        =   47
         Top             =   1800
         Width           =   1815
      End
      Begin VB.Label lblValue 
         AutoSize        =   -1  'True
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Left            =   4320
         TabIndex        =   46
         Top             =   1440
         Width           =   75
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         Caption         =   "Value :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   45
         Top             =   1440
         Width           =   735
      End
      Begin VB.Label lblNum 
         AutoSize        =   -1  'True
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Left            =   4320
         TabIndex        =   44
         Top             =   1080
         Width           =   75
      End
      Begin VB.Label Label9 
         Alignment       =   1  'Right Justify
         Caption         =   "Number :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   43
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label lblItemName 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   960
         TabIndex        =   42
         Top             =   720
         Width           =   3495
      End
      Begin VB.Label Label11 
         Alignment       =   1  'Right Justify
         Caption         =   "Item :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   41
         Top             =   720
         Width           =   735
      End
      Begin VB.Label lblDropItem 
         AutoSize        =   -1  'True
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Left            =   4320
         TabIndex        =   40
         Top             =   360
         Width           =   75
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         Caption         =   "Dropping :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   39
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "General Information"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4695
      Left            =   240
      TabIndex        =   6
      Top             =   960
      Width           =   4695
      Begin VB.OptionButton Opt64 
         Caption         =   "64*32"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   3120
         TabIndex        =   63
         Top             =   1200
         Width           =   1095
      End
      Begin VB.OptionButton Opt32 
         Caption         =   "32*32"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   3120
         TabIndex        =   62
         Top             =   960
         Value           =   -1  'True
         Width           =   1095
      End
      Begin VB.HScrollBar ExpGive 
         Height          =   255
         Left            =   1080
         TabIndex        =   33
         Top             =   4200
         Width           =   2895
      End
      Begin VB.HScrollBar StartHP 
         Height          =   255
         Left            =   1080
         TabIndex        =   29
         Top             =   3840
         Width           =   2895
      End
      Begin VB.CheckBox BigNpc 
         Caption         =   "Big NPC"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   3120
         TabIndex        =   27
         Top             =   720
         Width           =   855
      End
      Begin VB.PictureBox picSprite 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   480
         Left            =   1440
         ScaleHeight     =   32
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   32
         TabIndex        =   13
         Top             =   1080
         Width           =   480
         Begin VB.PictureBox picSprites 
            AutoRedraw      =   -1  'True
            AutoSize        =   -1  'True
            BackColor       =   &H00000000&
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   12000
            Left            =   120
            ScaleHeight     =   800
            ScaleMode       =   3  'Pixel
            ScaleWidth      =   456
            TabIndex        =   61
            Top             =   120
            Width           =   6840
         End
      End
      Begin VB.HScrollBar scrlSprite 
         Height          =   255
         Left            =   1080
         Max             =   500
         TabIndex        =   12
         Top             =   360
         Width           =   2895
      End
      Begin VB.HScrollBar scrlRange 
         Height          =   255
         Left            =   1080
         Max             =   30
         TabIndex        =   11
         Top             =   2040
         Value           =   1
         Width           =   2895
      End
      Begin VB.HScrollBar scrlSTR 
         Height          =   255
         Left            =   1080
         Max             =   1000
         TabIndex        =   10
         Top             =   2400
         Width           =   2895
      End
      Begin VB.HScrollBar scrlDEF 
         Height          =   255
         Left            =   1080
         Max             =   1000
         TabIndex        =   9
         Top             =   2760
         Width           =   2895
      End
      Begin VB.HScrollBar scrlSPEED 
         Enabled         =   0   'False
         Height          =   255
         Left            =   1080
         Max             =   1000
         TabIndex        =   8
         Top             =   3120
         Width           =   2895
      End
      Begin VB.HScrollBar scrlMAGI 
         Enabled         =   0   'False
         Height          =   255
         Left            =   1080
         Max             =   1000
         TabIndex        =   7
         Top             =   3480
         Width           =   2895
      End
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1155
         Left            =   1080
         ScaleHeight     =   75
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   75
         TabIndex        =   26
         Top             =   720
         Width           =   1155
      End
      Begin VB.Label lblExpGiven 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4080
         TabIndex        =   32
         Top             =   4200
         Width           =   495
      End
      Begin VB.Label Label15 
         Alignment       =   1  'Right Justify
         Caption         =   "Exp Given :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   31
         Top             =   4200
         Width           =   855
      End
      Begin VB.Label lblStartHP 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4080
         TabIndex        =   30
         Top             =   3840
         Width           =   495
      End
      Begin VB.Label Label17 
         Alignment       =   1  'Right Justify
         Caption         =   "Starting Hp :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   3840
         Width           =   855
      End
      Begin VB.Label lblSprite 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   4080
         TabIndex        =   25
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         Caption         =   "Sprite :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   360
         TabIndex        =   24
         Top             =   360
         Width           =   615
      End
      Begin VB.Label lblRange 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4080
         TabIndex        =   23
         Top             =   2040
         Width           =   495
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Sight (By Tile):"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   0
         TabIndex        =   22
         Top             =   2040
         Width           =   975
      End
      Begin VB.Label lblSTR 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4080
         TabIndex        =   21
         Top             =   2400
         Width           =   495
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         Caption         =   "Strength :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   360
         TabIndex        =   20
         Top             =   2400
         Width           =   615
      End
      Begin VB.Label lblDEF 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4080
         TabIndex        =   19
         Top             =   2760
         Width           =   495
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         Caption         =   "Defence :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   360
         TabIndex        =   18
         Top             =   2760
         Width           =   615
      End
      Begin VB.Label lblSPEED 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4080
         TabIndex        =   17
         Top             =   3120
         Width           =   495
      End
      Begin VB.Label Label10 
         Alignment       =   1  'Right Justify
         Caption         =   "Speed :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   360
         TabIndex        =   16
         Top             =   3120
         Width           =   615
      End
      Begin VB.Label lblMAGI 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4080
         TabIndex        =   15
         Top             =   3480
         Width           =   495
      End
      Begin VB.Label Label12 
         Alignment       =   1  'Right Justify
         Caption         =   "Magic :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   360
         TabIndex        =   14
         Top             =   3480
         Width           =   615
      End
   End
   Begin VB.TextBox txtAttackSay 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   960
      TabIndex        =   5
      Top             =   600
      Width           =   3975
   End
   Begin VB.Timer tmrSprite 
      Interval        =   50
      Left            =   7200
      Top             =   5160
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5160
      TabIndex        =   3
      Top             =   5400
      Width           =   1695
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8160
      TabIndex        =   2
      Top             =   5400
      Width           =   1695
   End
   Begin VB.TextBox txtName 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   3975
   End
   Begin VB.Label Label14 
      Alignment       =   2  'Center
      Caption         =   "Speak :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   600
      Width           =   735
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Name :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   495
   End
End
Attribute VB_Name = "frmNpcEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub BigNpc_Click()

  Dim BMU As BitmapUtils
  Dim strfilename As String

    frmNpcEditor.ScaleMode = 3
    If BigNpc.Value = Checked Then

        picSprite.Width = 960
        picSprite.Height = 960
        picSprite.Top = 800
        picSprite.Left = 1170

        If ENCRYPT_TYPE = "BMP" Then
            frmNpcEditor.picSprites.Picture = LoadPicture(App.Path & "\GFX\bigsprites.bmp")
         Else
            Set BMU = New BitmapUtils
            strfilename = App.Path & "/gfx/" & "bigsprites" & "." & Trim$(ENCRYPT_TYPE)
            BMU.LoadByteData (strfilename)
            BMU.DecryptByteData (Trim$(ENCRYPT_PASS))
            BMU.DecompressByteData_ZLib
            frmNpcEditor.picSprites.Cls
            frmNpcEditor.picSprites.Width = BMU.ImageWidth
            frmNpcEditor.picSprites.Height = BMU.ImageHeight
            Call BMU.Blt(frmNpcEditor.picSprites.hDC)

        End If

     Else

        If ENCRYPT_TYPE = "BMP" Then
            frmNpcEditor.picSprites.Picture = LoadPicture(App.Path & "\GFX\sprites.bmp")
         Else
            Set BMU = New BitmapUtils
            strfilename = App.Path & "/gfx/" & "sprites" & "." & Trim$(ENCRYPT_TYPE)
            BMU.LoadByteData (strfilename)
            BMU.DecryptByteData (Trim$(ENCRYPT_PASS))
            BMU.DecompressByteData_ZLib
            frmNpcEditor.picSprites.Cls
            frmNpcEditor.picSprites.Width = BMU.ImageWidth
            frmNpcEditor.picSprites.Height = BMU.ImageHeight
            Call BMU.Blt(frmNpcEditor.picSprites.hDC)
        End If

        picSprite.Width = 480
        picSprite.Left = 1400

        If Opt64.Value = Checked Then
            picSprite.Height = 960
            picSprite.Top = 800
         Else
            picSprite.Height = 480
            picSprite.Top = 1040
        End If

    End If

End Sub

Private Sub chkDay_Click()

    If chkNight.Value = Unchecked Then
        If chkDay.Value = Unchecked Then
            chkDay.Value = Checked
        End If

    End If

End Sub

Private Sub chkNight_Click()

    If chkDay.Value = Unchecked Then
        If chkNight.Value = Unchecked Then
            chkNight.Value = Checked
        End If

    End If

End Sub

Private Sub cmbBehavior_Click()

    If cmbBehavior.ListIndex = NPC_BEHAVIOR_SCRIPTED Then
        Label19.Visible = True
        lblScript.Visible = True
        scrlScript.Visible = True
     Else
        Label19.Visible = False
        lblScript.Visible = False
        scrlScript.Visible = False
    End If

End Sub

Private Sub cmdCancel_Click()

    Call NpcEditorCancel

End Sub

Private Sub cmdOk_Click()

    Call NpcEditorOk

End Sub

Private Sub ExpGive_Change()

    lblExpGiven.Caption = ExpGive.Value

End Sub

Private Sub Form_Load()

  Dim BMU As BitmapUtils
  Dim strfilename As String

    scrlElement.Max = MAX_ELEMENTS
    scrlDropItem.Max = MAX_NPC_DROPS

    If Spritesize = 1 Then
        picSprite.Height = 960
    End If

    If ENCRYPT_TYPE = "BMP" Then
        frmNpcEditor.picSprites.Picture = LoadPicture(App.Path & "\GFX\sprites.bmp")
     Else
        Set BMU = New BitmapUtils
        strfilename = App.Path & "/gfx/" & "sprites" & "." & Trim$(ENCRYPT_TYPE)
        BMU.LoadByteData (strfilename)
        BMU.DecryptByteData (Trim$(ENCRYPT_PASS))
        BMU.DecompressByteData_ZLib
        frmNpcEditor.picSprites.Cls
        frmNpcEditor.picSprites.Width = BMU.ImageWidth
        frmNpcEditor.picSprites.Height = BMU.ImageHeight
        Call BMU.Blt(frmNpcEditor.picSprites.hDC)
    End If

    If Opt64.Value = Checked Then
        picSprite.Height = 960
        picSprite.Top = 800
     Else
        picSprite.Height = 480
        picSprite.Top = 1040
    End If

End Sub

Private Sub Opt32_Click()

    If Not BigNpc.Value = Checked Then
        frmNpcEditor.picSprites.Picture = LoadPicture(App.Path & "\GFX\sprites.bmp")
        picSprite.Height = 480
        picSprite.Top = 1040
    End If

End Sub

Private Sub Opt64_Click()

    If Not BigNpc.Value = Checked Then
        frmNpcEditor.picSprites.Picture = LoadPicture(App.Path & "\GFX\sprites.bmp")
        picSprite.Height = 960
        picSprite.Top = 800
    End If

End Sub

Private Sub scrlDEF_Change()

    lblDEF.Caption = STR(scrlDEF.Value)

End Sub

Private Sub scrlDropItem_Change()

    txtChance.Text = Npc(EditorIndex).ItemNPC(scrlDropItem.Value).chance
    scrlNum.Value = Npc(EditorIndex).ItemNPC(scrlDropItem.Value).ItemNum
    scrlValue.Value = Npc(EditorIndex).ItemNPC(scrlDropItem.Value).ItemValue
    lblDropItem.Caption = scrlDropItem.Value

End Sub

Private Sub scrlElement_Change()

    lblElement.Caption = STR(scrlElement.Value)

End Sub

Private Sub scrlMAGI_Change()

    lblMAGI.Caption = STR(scrlMAGI.Value)

End Sub

Private Sub scrlNum_Change()

    lblNum.Caption = STR(scrlNum.Value)
    lblItemName.Caption = vbNullString

    If scrlNum.Value > 0 Then
        lblItemName.Caption = Trim$(item(scrlNum.Value).Name)
    End If

    Npc(EditorIndex).ItemNPC(scrlDropItem.Value).ItemNum = scrlNum.Value

End Sub

Private Sub scrlRange_Change()

    lblRange.Caption = STR(scrlRange.Value)

End Sub

Private Sub scrlScript_Change()

    lblScript.Caption = STR(scrlScript.Value)

End Sub

Private Sub scrlSPEED_Change()

    lblSPEED.Caption = STR(scrlSPEED.Value)

End Sub

Private Sub scrlSprite_Change()

    lblSprite.Caption = STR(scrlSprite.Value)

End Sub

Private Sub scrlSTR_Change()

    lblSTR.Caption = STR(scrlSTR.Value)

End Sub

Private Sub scrlValue_Change()

    Npc(EditorIndex).ItemNPC(scrlDropItem.Value).ItemValue = scrlValue.Value
    lblValue.Caption = STR(scrlValue.Value)

End Sub

Private Sub StartHP_Change()

    lblStartHP.Caption = StartHP.Value

End Sub

Private Sub tmrSprite_Timer()

    Call NpcEditorBltSprite

End Sub

Private Sub txtChance_Change()

    Npc(EditorIndex).ItemNPC(scrlDropItem.Value).chance = val#(txtChance.Text)

End Sub

