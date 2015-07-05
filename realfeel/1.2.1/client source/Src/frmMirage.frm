VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Begin VB.Form frmDualSolace 
   BackColor       =   &H00000000&
   Caption         =   "Dual Solace Engine"
   ClientHeight    =   10635
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11280
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMirage.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Picture         =   "frmMirage.frx":3332
   ScaleHeight     =   10980
   ScaleWidth      =   15120
   Visible         =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtChatEnter 
      BackColor       =   &H002F3336&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   0
      TabIndex        =   37
      Top             =   7680
      Width           =   5055
   End
   Begin VB.Timer tmrMP3 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   0
      Top             =   0
   End
   Begin VB.PictureBox picCancel 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   285
      Left            =   14115
      Picture         =   "frmMirage.frx":183376
      ScaleHeight     =   285
      ScaleWidth      =   765
      TabIndex        =   165
      Top             =   10350
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.PictureBox picDropItem 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   285
      Left            =   13140
      Picture         =   "frmMirage.frx":183F4C
      ScaleHeight     =   285
      ScaleWidth      =   765
      TabIndex        =   164
      Top             =   10350
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.PictureBox picUseItem 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   285
      Left            =   12120
      Picture         =   "frmMirage.frx":184B22
      ScaleHeight     =   285
      ScaleWidth      =   765
      TabIndex        =   163
      Top             =   10350
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.PictureBox picInv 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2955
      Left            =   12120
      Picture         =   "frmMirage.frx":1856F8
      ScaleHeight     =   197
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   192
      TabIndex        =   142
      Top             =   7680
      Visible         =   0   'False
      Width           =   2880
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   0
         Left            =   90
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   162
         Top             =   435
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   1
         Left            =   645
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   161
         Top             =   435
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   2
         Left            =   1200
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   160
         Top             =   435
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   3
         Left            =   1755
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   159
         Top             =   435
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   4
         Left            =   2310
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   158
         Top             =   435
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   5
         Left            =   90
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   157
         Top             =   1005
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   6
         Left            =   645
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   156
         Top             =   1005
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   7
         Left            =   1200
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   155
         Top             =   1005
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   8
         Left            =   1755
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   154
         Top             =   1005
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   9
         Left            =   2310
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   153
         Top             =   1005
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   10
         Left            =   90
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   152
         Top             =   1575
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   11
         Left            =   645
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   151
         Top             =   1575
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   12
         Left            =   1200
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   150
         Top             =   1575
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   13
         Left            =   1755
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   149
         Top             =   1575
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   14
         Left            =   2310
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   148
         Top             =   1575
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   15
         Left            =   90
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   147
         Top             =   2145
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   16
         Left            =   645
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   146
         Top             =   2145
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   17
         Left            =   1200
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   145
         Top             =   2145
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   18
         Left            =   1755
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   144
         Top             =   2145
         Width           =   480
      End
      Begin VB.PictureBox picItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   19
         Left            =   2310
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   143
         Top             =   2145
         Width           =   480
      End
      Begin VB.Shape shpInv 
         BorderColor     =   &H000000C0&
         Height          =   510
         Left            =   75
         Top             =   420
         Width           =   510
      End
   End
   Begin VB.PictureBox picBank 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3150
      Left            =   2145
      Picture         =   "frmMirage.frx":1A127C
      ScaleHeight     =   210
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   438
      TabIndex        =   93
      Top             =   4530
      Visible         =   0   'False
      Width           =   6570
      Begin VB.TextBox txtWithdraw 
         Appearance      =   0  'Flat
         BackColor       =   &H002F3336&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Left            =   4470
         TabIndex        =   96
         Text            =   "Withdraw amount"
         Top             =   300
         Width           =   1725
      End
      Begin VB.PictureBox picBankExit 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   6240
         Picture         =   "frmMirage.frx":1E4A48
         ScaleHeight     =   285
         ScaleWidth      =   315
         TabIndex        =   141
         Top             =   15
         Width           =   315
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   1
         Left            =   705
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   138
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   2
         Left            =   1305
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   137
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   3
         Left            =   1905
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   136
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   4
         Left            =   2505
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   135
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   5
         Left            =   105
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   134
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   6
         Left            =   705
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   133
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   7
         Left            =   1305
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   132
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   8
         Left            =   1905
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   131
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   9
         Left            =   2505
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   130
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   10
         Left            =   105
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   129
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   11
         Left            =   705
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   128
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   12
         Left            =   1305
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   127
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   13
         Left            =   1905
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   126
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   14
         Left            =   2505
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   125
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   15
         Left            =   105
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   124
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   16
         Left            =   705
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   123
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   17
         Left            =   1305
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   122
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   18
         Left            =   1905
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   121
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   19
         Left            =   2505
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   120
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   0
         Left            =   3585
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   119
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   1
         Left            =   4185
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   118
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   2
         Left            =   4785
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   117
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   3
         Left            =   5385
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   116
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   4
         Left            =   5985
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   115
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   5
         Left            =   3585
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   114
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   6
         Left            =   4185
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   113
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   7
         Left            =   4785
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   112
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   8
         Left            =   5385
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   111
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   9
         Left            =   5985
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   110
         Top             =   1320
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   10
         Left            =   3585
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   109
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   11
         Left            =   4185
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   108
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   12
         Left            =   4785
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   107
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   13
         Left            =   5385
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   106
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   14
         Left            =   5985
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   105
         Top             =   1920
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   15
         Left            =   3585
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   104
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   16
         Left            =   4185
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   103
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   17
         Left            =   4785
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   102
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   18
         Left            =   5385
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   101
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picBankInv 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   19
         Left            =   5985
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   100
         Top             =   2520
         Width           =   480
      End
      Begin VB.PictureBox picDeposit 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   3420
         Picture         =   "frmMirage.frx":1E4F4A
         ScaleHeight     =   285
         ScaleWidth      =   945
         TabIndex        =   99
         Top             =   0
         Width           =   945
      End
      Begin VB.PictureBox picWithdraw 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   3420
         Picture         =   "frmMirage.frx":1E5DCC
         ScaleHeight     =   285
         ScaleWidth      =   945
         TabIndex        =   98
         Top             =   285
         Width           =   945
      End
      Begin VB.TextBox txtDeposit 
         Appearance      =   0  'Flat
         BackColor       =   &H002F3336&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Left            =   4470
         TabIndex        =   97
         Text            =   "Deposit amount"
         Top             =   90
         Width           =   1725
      End
      Begin VB.VScrollBar scrlBank 
         Height          =   2490
         Left            =   3165
         Max             =   4
         TabIndex        =   95
         Top             =   600
         Width           =   255
      End
      Begin VB.PictureBox picBankItem 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   0
         Left            =   105
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   30
         TabIndex        =   94
         Top             =   720
         Width           =   480
      End
      Begin VB.Shape shpBank 
         BorderColor     =   &H000000C0&
         Height          =   510
         Left            =   90
         Top             =   705
         Width           =   510
      End
      Begin VB.Label lblItemName 
         Alignment       =   2  'Center
         BackColor       =   &H002F3336&
         Caption         =   "Item Name"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Left            =   1560
         TabIndex        =   140
         Top             =   120
         Width           =   1725
      End
      Begin VB.Label lblItemData 
         Alignment       =   2  'Center
         BackColor       =   &H002F3336&
         Caption         =   "Item Data"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Left            =   1560
         TabIndex        =   139
         Top             =   330
         Width           =   1725
      End
   End
   Begin VB.PictureBox picAdminPanel 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00FF0000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4470
      Left            =   13200
      Picture         =   "frmMirage.frx":1E6C4E
      ScaleHeight     =   4470
      ScaleWidth      =   2160
      TabIndex        =   70
      Top             =   0
      Visible         =   0   'False
      Width           =   2160
      Begin VB.CommandButton cmdEditor 
         Caption         =   "Full Data Editor"
         Height          =   255
         Left            =   240
         TabIndex        =   92
         Top             =   3360
         Width           =   1575
      End
      Begin VB.ComboBox cmbAccess 
         Appearance      =   0  'Flat
         Height          =   360
         Left            =   1560
         Style           =   2  'Dropdown List
         TabIndex        =   91
         Top             =   4080
         Width           =   495
      End
      Begin VB.TextBox txtAccessName 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   705
         TabIndex        =   89
         Top             =   4080
         Width           =   855
      End
      Begin VB.CommandButton cmdMapWarp 
         Caption         =   "Warp To Map"
         Enabled         =   0   'False
         Height          =   255
         Left            =   240
         TabIndex        =   82
         Top             =   2910
         Width           =   1575
      End
      Begin VB.ListBox lstMapSelection 
         BackColor       =   &H00000000&
         ForeColor       =   &H00FFFFFF&
         Height          =   555
         IntegralHeight  =   0   'False
         Left            =   120
         TabIndex        =   81
         Top             =   2385
         Width           =   1815
      End
      Begin VB.CommandButton cmdSetAccess 
         Caption         =   "Set Access"
         Enabled         =   0   'False
         Height          =   255
         Left            =   480
         TabIndex        =   79
         Top             =   3720
         Width           =   1215
      End
      Begin VB.CommandButton cmdWarpToMe 
         Caption         =   "WarpToMe"
         Enabled         =   0   'False
         Height          =   255
         Left            =   345
         TabIndex        =   78
         Top             =   2085
         Width           =   1455
      End
      Begin VB.CommandButton cmdWarpMeTo 
         Caption         =   "WarpMeTo"
         Enabled         =   0   'False
         Height          =   255
         Left            =   345
         TabIndex        =   77
         Top             =   1845
         Width           =   1455
      End
      Begin VB.CommandButton cmdWarpTo 
         Caption         =   "WarpTo"
         Enabled         =   0   'False
         Height          =   255
         Left            =   345
         TabIndex        =   76
         Top             =   1605
         Width           =   1455
      End
      Begin VB.CommandButton cmdMapEditor 
         Caption         =   "Map Editor"
         Enabled         =   0   'False
         Height          =   255
         Left            =   345
         TabIndex        =   75
         Top             =   1365
         Width           =   1455
      End
      Begin VB.CommandButton cmdTrack 
         Caption         =   "Track"
         Enabled         =   0   'False
         Height          =   255
         Left            =   1065
         TabIndex        =   74
         Top             =   1005
         Width           =   735
      End
      Begin VB.CommandButton cmdListen 
         Caption         =   "Listen"
         Enabled         =   0   'False
         Height          =   255
         Left            =   345
         TabIndex        =   73
         Top             =   1005
         Width           =   735
      End
      Begin VB.CommandButton cmdBan 
         Caption         =   "Ban"
         Enabled         =   0   'False
         Height          =   255
         Left            =   1065
         TabIndex        =   72
         Top             =   765
         Width           =   735
      End
      Begin VB.CommandButton cmdKick 
         Caption         =   "Kick"
         Enabled         =   0   'False
         Height          =   255
         Left            =   345
         TabIndex        =   71
         Top             =   765
         Width           =   735
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Name:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   75
         TabIndex        =   90
         Top             =   4080
         Width           =   615
      End
   End
   Begin VB.PictureBox picTrainMenu 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2535
      Left            =   7995
      Picture         =   "frmMirage.frx":206372
      ScaleHeight     =   2535
      ScaleWidth      =   3000
      TabIndex        =   65
      Top             =   7905
      Visible         =   0   'False
      Width           =   3000
      Begin VB.ComboBox cmbStat 
         BackColor       =   &H002F3336&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   11.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   390
         ItemData        =   "frmMirage.frx":21EFCE
         Left            =   180
         List            =   "frmMirage.frx":21EFDE
         Style           =   2  'Dropdown List
         TabIndex        =   69
         Top             =   1455
         Width           =   2625
      End
      Begin VB.PictureBox picTrainButton 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   345
         Left            =   0
         Picture         =   "frmMirage.frx":21F003
         ScaleHeight     =   345
         ScaleWidth      =   1425
         TabIndex        =   68
         Top             =   2190
         Width           =   1425
      End
      Begin VB.PictureBox picTrainCancel 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   345
         Left            =   1575
         Picture         =   "frmMirage.frx":220A25
         ScaleHeight     =   345
         ScaleWidth      =   1425
         TabIndex        =   67
         Top             =   2190
         Width           =   1425
      End
      Begin VB.PictureBox picHeaderTrain 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   795
         Left            =   0
         Picture         =   "frmMirage.frx":222447
         ScaleHeight     =   795
         ScaleWidth      =   3000
         TabIndex        =   66
         Top             =   0
         Width           =   3000
      End
   End
   Begin VB.PictureBox picPlayer 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1845
      Left            =   -15
      Picture         =   "frmMirage.frx":22A0C1
      ScaleHeight     =   123
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   146
      TabIndex        =   56
      Top             =   2925
      Width           =   2190
      Begin VB.Label lblStr 
         Alignment       =   2  'Center
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "STR_Num"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   375
         TabIndex        =   64
         Top             =   1245
         Width           =   1335
      End
      Begin VB.Label lblDef 
         Alignment       =   2  'Center
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "DEF_Num"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   375
         TabIndex        =   63
         Top             =   1095
         Width           =   1335
      End
      Begin VB.Label lblMagi 
         Alignment       =   2  'Center
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "MAGI_Num"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   375
         TabIndex        =   62
         Top             =   1380
         Width           =   1335
      End
      Begin VB.Label lblSpd 
         Alignment       =   2  'Center
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "SPD_Num"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   375
         TabIndex        =   61
         Top             =   1515
         Width           =   1335
      End
      Begin VB.Label lblPName 
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "Player's Name"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   630
         TabIndex        =   60
         Top             =   60
         Width           =   1575
      End
      Begin VB.Label lblLevel 
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "Level_Num"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   735
         TabIndex        =   59
         Top             =   270
         Width           =   1305
      End
      Begin VB.Label lblEXP 
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "EXP_Num"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   735
         TabIndex        =   58
         Top             =   480
         Width           =   1560
      End
      Begin VB.Label lblTNL 
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "TNL_Num"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   735
         TabIndex        =   57
         Top             =   690
         Width           =   1305
      End
   End
   Begin VB.PictureBox picEquipment 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2970
      Left            =   0
      Picture         =   "frmMirage.frx":23746D
      ScaleHeight     =   198
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   145
      TabIndex        =   46
      Top             =   4740
      Width           =   2175
      Begin VB.PictureBox picWeapon 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   360
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   50
         Top             =   2190
         Width           =   480
      End
      Begin VB.PictureBox picHelmet 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   360
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   49
         Top             =   1230
         Width           =   480
      End
      Begin VB.PictureBox picShield 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   1350
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   48
         Top             =   2190
         Width           =   480
      End
      Begin VB.PictureBox picArmor 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   1350
         ScaleHeight     =   450
         ScaleWidth      =   450
         TabIndex        =   47
         Top             =   1230
         Width           =   480
      End
      Begin VB.Label lblWeapon 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   " "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   240
         TabIndex        =   55
         Top             =   2655
         Width           =   675
      End
      Begin VB.Label lblShield 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   " "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1230
         TabIndex        =   54
         Top             =   2655
         Width           =   675
      End
      Begin VB.Label lblHelmet 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   " "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   270
         TabIndex        =   53
         Top             =   1695
         Width           =   675
      End
      Begin VB.Label lblArmor 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   " "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1230
         TabIndex        =   52
         Top             =   1710
         Width           =   675
      End
      Begin VB.Label lblFeet 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   720
         TabIndex        =   51
         Top             =   2520
         Width           =   735
      End
   End
   Begin VB.PictureBox picSidebar 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H0009E7F2&
      ForeColor       =   &H80000008&
      Height          =   915
      Left            =   0
      Picture         =   "frmMirage.frx":24C5E9
      ScaleHeight     =   885
      ScaleWidth      =   5025
      TabIndex        =   40
      Top             =   9720
      Width           =   5055
      Begin VB.PictureBox picRemove 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   435
         Left            =   0
         Picture         =   "frmMirage.frx":25AE7D
         ScaleHeight     =   435
         ScaleWidth      =   1275
         TabIndex        =   45
         Top             =   450
         Width           =   1275
      End
      Begin VB.PictureBox picAdd 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   435
         Left            =   0
         Picture         =   "frmMirage.frx":25CBBF
         ScaleHeight     =   435
         ScaleWidth      =   1275
         TabIndex        =   44
         Top             =   0
         Width           =   1275
      End
      Begin VB.Frame fraOptions 
         BackColor       =   &H002F3336&
         BorderStyle     =   0  'None
         Caption         =   "Options"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   510
         Left            =   3195
         TabIndex        =   41
         Top             =   210
         Width           =   1710
         Begin VB.OptionButton optPlayers 
            BackColor       =   &H002F3336&
            Caption         =   "Show Players"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   255
            Left            =   75
            TabIndex        =   43
            Top             =   15
            Value           =   -1  'True
            Width           =   1335
         End
         Begin VB.OptionButton optFriends 
            BackColor       =   &H002F3336&
            Caption         =   "Show Friends"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   255
            Left            =   75
            TabIndex        =   42
            Top             =   270
            Width           =   1305
         End
      End
      Begin VB.ListBox lstFriends 
         Appearance      =   0  'Flat
         BackColor       =   &H002F3336&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   555
         IntegralHeight  =   0   'False
         Left            =   1590
         TabIndex        =   191
         Top             =   195
         Visible         =   0   'False
         Width           =   1590
      End
      Begin VB.ListBox lstPlayers 
         Appearance      =   0  'Flat
         BackColor       =   &H002F3336&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   555
         IntegralHeight  =   0   'False
         Left            =   1590
         TabIndex        =   190
         Top             =   195
         Width           =   1590
      End
   End
   Begin VB.PictureBox picPlayerSpells 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00004080&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   2640
      Left            =   8880
      Picture         =   "frmMirage.frx":25E901
      ScaleHeight     =   2610
      ScaleWidth      =   1935
      TabIndex        =   25
      Top             =   4890
      Visible         =   0   'False
      Width           =   1965
      Begin VB.ListBox lstSpells 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   1080
         ItemData        =   "frmMirage.frx":26F0FD
         Left            =   0
         List            =   "frmMirage.frx":26F0FF
         TabIndex        =   26
         Top             =   480
         Width           =   1935
      End
      Begin VB.Label lblCast 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Use"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   480
         TabIndex        =   28
         Top             =   1800
         Width           =   990
      End
      Begin VB.Label lblSpellsCancel 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Cancel"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   480
         TabIndex        =   27
         Top             =   2160
         Width           =   990
      End
   End
   Begin VB.PictureBox picScreen 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   7680
      Left            =   2160
      ScaleHeight     =   510
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   734
      TabIndex        =   0
      Top             =   0
      Width           =   11040
   End
   Begin RichTextLib.RichTextBox txtChat 
      Height          =   1695
      Left            =   0
      TabIndex        =   1
      Top             =   8040
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   2990
      _Version        =   393217
      BackColor       =   3885905
      BorderStyle     =   0
      Enabled         =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"frmMirage.frx":26F101
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.PictureBox picItemTile 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   2280
      ScaleHeight     =   450
      ScaleWidth      =   450
      TabIndex        =   39
      Top             =   0
      Width           =   480
   End
   Begin MSWinsockLib.Winsock Socket 
      Left            =   3840
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.PictureBox picMapEditor 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   2895
      Left            =   7800
      ScaleHeight     =   191
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   495
      TabIndex        =   7
      Top             =   7680
      Visible         =   0   'False
      Width           =   7455
      Begin VB.PictureBox picMapExtras 
         Appearance      =   0  'Flat
         ForeColor       =   &H80000008&
         Height          =   2895
         Left            =   3960
         ScaleHeight     =   2865
         ScaleWidth      =   2985
         TabIndex        =   181
         Top             =   0
         Visible         =   0   'False
         Width           =   3015
         Begin VB.CheckBox chkDepictTiles 
            Caption         =   "Depict attribute-filled tiles"
            Height          =   255
            Left            =   120
            TabIndex        =   189
            Top             =   1200
            Value           =   1  'Checked
            Width           =   2655
         End
         Begin VB.CheckBox chkAttributeDisplay 
            Caption         =   "Run attribute displayer"
            Height          =   255
            Left            =   120
            TabIndex        =   185
            Top             =   960
            Value           =   1  'Checked
            Width           =   2655
         End
         Begin VB.CheckBox chkAllowPersonalMovement 
            Caption         =   "Allow personal movement"
            Height          =   255
            Left            =   120
            TabIndex        =   184
            Top             =   1440
            Width           =   2655
         End
         Begin VB.CommandButton cmdSaveExtras 
            Caption         =   "Save Settings"
            Height          =   255
            Left            =   120
            TabIndex        =   183
            Top             =   2520
            Width           =   2775
         End
         Begin VB.CheckBox chkAllowPlayerMovement 
            Caption         =   "Allow player movement"
            Height          =   255
            Left            =   120
            TabIndex        =   182
            Top             =   1920
            Width           =   2775
         End
         Begin VB.Label Label5 
            Caption         =   "These settings can offer better quality editing, but require more power."
            Height          =   855
            Left            =   120
            TabIndex        =   188
            Top             =   120
            Width           =   2775
         End
         Begin VB.Label Label6 
            Caption         =   "(Disabled for error protection)"
            Height          =   255
            Left            =   240
            TabIndex        =   187
            Top             =   1680
            Width           =   2655
         End
         Begin VB.Label Label7 
            Caption         =   "(Disabled for error protection)"
            Height          =   255
            Left            =   240
            TabIndex        =   186
            Top             =   2160
            Width           =   2655
         End
      End
      Begin VB.CommandButton cmdExtras 
         Caption         =   "Settings"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6000
         TabIndex        =   180
         Top             =   600
         Width           =   1335
      End
      Begin VB.CommandButton cmdProperties 
         Caption         =   "Properties"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   6000
         TabIndex        =   12
         Top             =   360
         Width           =   1335
      End
      Begin VB.Frame frmSideBlock 
         Caption         =   "Side Block"
         Height          =   855
         Left            =   5400
         TabIndex        =   32
         Top             =   960
         Visible         =   0   'False
         Width           =   1935
         Begin VB.CheckBox chkEast 
            Caption         =   "East"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   960
            TabIndex        =   175
            Top             =   480
            Width           =   855
         End
         Begin VB.CheckBox chkWest 
            Caption         =   "West"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   960
            TabIndex        =   174
            Top             =   240
            Width           =   855
         End
         Begin VB.CheckBox chkSouth 
            Caption         =   "South"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   173
            Top             =   480
            Width           =   855
         End
         Begin VB.CheckBox chkNorth 
            Caption         =   "North"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   172
            Top             =   240
            Width           =   855
         End
      End
      Begin VB.OptionButton optLayers 
         Caption         =   "Layers"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   5400
         TabIndex        =   16
         Top             =   120
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton optAttribs 
         Caption         =   "Attributes"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6240
         TabIndex        =   15
         Top             =   120
         Width           =   1215
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "Cancel"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   6360
         TabIndex        =   14
         Top             =   1920
         Width           =   975
      End
      Begin VB.CommandButton cmdSend 
         Caption         =   "Send"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   5400
         TabIndex        =   13
         Top             =   1920
         Width           =   975
      End
      Begin VB.VScrollBar scrlPicture 
         Height          =   2880
         Left            =   3360
         Max             =   255
         TabIndex        =   11
         Top             =   0
         Width           =   255
      End
      Begin VB.PictureBox picSelect 
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
         Left            =   5400
         ScaleHeight     =   32
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   32
         TabIndex        =   8
         Top             =   360
         Width           =   480
      End
      Begin VB.Frame fraAttribs 
         Caption         =   "Attributes"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2775
         Left            =   3720
         TabIndex        =   17
         Top             =   0
         Visible         =   0   'False
         Width           =   1575
         Begin VB.CommandButton cmdClear2 
            Caption         =   "Clear"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   270
            Left            =   120
            TabIndex        =   18
            Top             =   2400
            Width           =   1215
         End
         Begin TabDlg.SSTab ssAttributes 
            Height          =   2100
            Left            =   30
            TabIndex        =   80
            Top             =   240
            Width           =   1500
            _ExtentX        =   2646
            _ExtentY        =   3704
            _Version        =   393216
            Tabs            =   2
            TabsPerRow      =   2
            TabHeight       =   520
            TabCaption(0)   =   "Opt 1"
            TabPicture(0)   =   "frmMirage.frx":26F178
            Tab(0).ControlEnabled=   -1  'True
            Tab(0).Control(0)=   "chkBlocked"
            Tab(0).Control(0).Enabled=   0   'False
            Tab(0).Control(1)=   "chkWarp"
            Tab(0).Control(1).Enabled=   0   'False
            Tab(0).Control(2)=   "chkItem"
            Tab(0).Control(2).Enabled=   0   'False
            Tab(0).Control(3)=   "chkNpcAvoid"
            Tab(0).Control(3).Enabled=   0   'False
            Tab(0).Control(4)=   "chkKey"
            Tab(0).Control(4).Enabled=   0   'False
            Tab(0).Control(5)=   "chkKeyOpen"
            Tab(0).Control(5).Enabled=   0   'False
            Tab(0).ControlCount=   6
            TabCaption(1)   =   "Opt 2"
            TabPicture(1)   =   "frmMirage.frx":26F194
            Tab(1).ControlEnabled=   0   'False
            Tab(1).Control(0)=   "chkDamage"
            Tab(1).Control(1)=   "chkHeal"
            Tab(1).Control(2)=   "chkShop"
            Tab(1).Control(3)=   "chkBank"
            Tab(1).ControlCount=   4
            Begin VB.CheckBox chkDamage 
               Caption         =   "Damage"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   -74880
               TabIndex        =   179
               Top             =   1080
               Width           =   1215
            End
            Begin VB.CheckBox chkHeal 
               Caption         =   "Heal"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   -74880
               TabIndex        =   178
               Top             =   840
               Width           =   1215
            End
            Begin VB.CheckBox chkShop 
               Caption         =   "Shop"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   -74880
               TabIndex        =   177
               Top             =   600
               Width           =   1215
            End
            Begin VB.CheckBox chkBank 
               Caption         =   "Bank"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   -74880
               TabIndex        =   176
               Top             =   360
               Width           =   1215
            End
            Begin VB.CheckBox chkKeyOpen 
               Caption         =   "Key Open"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   171
               Top             =   1560
               Width           =   1215
            End
            Begin VB.CheckBox chkKey 
               Caption         =   "Key"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   170
               Top             =   1320
               Width           =   1215
            End
            Begin VB.CheckBox chkNpcAvoid 
               Caption         =   "Npc Avoid"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   169
               Top             =   1080
               Width           =   1215
            End
            Begin VB.CheckBox chkItem 
               Caption         =   "Item"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   168
               Top             =   840
               Width           =   1215
            End
            Begin VB.CheckBox chkWarp 
               Caption         =   "Warp"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   167
               Top             =   600
               Width           =   1215
            End
            Begin VB.CheckBox chkBlocked 
               Caption         =   "Blocked"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   9.75
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   120
               TabIndex        =   166
               Top             =   360
               Width           =   1215
            End
         End
      End
      Begin VB.Frame fraLayers 
         Caption         =   "Layers"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2775
         Left            =   3720
         TabIndex        =   19
         Top             =   0
         Width           =   1575
         Begin VB.CommandButton cmdClear 
            Caption         =   "Clear"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   270
            Left            =   120
            TabIndex        =   20
            Top             =   2400
            Width           =   1215
         End
         Begin VB.OptionButton optFringeAnim 
            Caption         =   "FringeAnim"
            Height          =   255
            Left            =   120
            TabIndex        =   33
            Top             =   1800
            Width           =   1335
         End
         Begin VB.OptionButton optFringe2 
            Caption         =   "Fringe2"
            Height          =   255
            Left            =   120
            TabIndex        =   31
            Top             =   2040
            Width           =   1215
         End
         Begin VB.OptionButton optAnim2 
            Caption         =   "Anim2"
            Height          =   255
            Left            =   120
            TabIndex        =   30
            Top             =   1320
            Width           =   1215
         End
         Begin VB.OptionButton optMask2 
            Caption         =   "Mask2"
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   840
            Width           =   1095
         End
         Begin VB.OptionButton optGround 
            Caption         =   "Ground"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   24
            Top             =   360
            Value           =   -1  'True
            Width           =   1215
         End
         Begin VB.OptionButton optMask 
            Caption         =   "Mask"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   23
            Top             =   600
            Width           =   1215
         End
         Begin VB.OptionButton optAnim 
            Caption         =   "Anim"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   22
            Top             =   1080
            Width           =   1215
         End
         Begin VB.OptionButton optFringe 
            Caption         =   "Fringe"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   21
            Top             =   1560
            Width           =   1215
         End
      End
      Begin VB.PictureBox picBack 
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
         Height          =   2880
         Left            =   15
         ScaleHeight     =   192
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   224
         TabIndex        =   9
         Top             =   0
         Width           =   3360
         Begin VB.PictureBox picBackSelect 
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
            Height          =   960
            Left            =   0
            ScaleHeight     =   64
            ScaleMode       =   3  'Pixel
            ScaleWidth      =   64
            TabIndex        =   10
            Top             =   0
            Width           =   960
            Begin VB.Shape shpSelected 
               BorderColor     =   &H00000080&
               Height          =   480
               Left            =   0
               Top             =   0
               Width           =   480
            End
         End
      End
      Begin VB.Label lblPosMap 
         Height          =   255
         Left            =   6000
         TabIndex        =   88
         Top             =   2280
         Width           =   1335
      End
      Begin VB.Label lblPosY 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   6720
         TabIndex        =   87
         Top             =   2520
         Width           =   495
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         Caption         =   "Y:"
         Height          =   255
         Left            =   6360
         TabIndex        =   86
         Top             =   2520
         Width           =   375
      End
      Begin VB.Label lblPosX 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   5880
         TabIndex        =   85
         Top             =   2520
         Width           =   375
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "X:"
         Height          =   255
         Left            =   5400
         TabIndex        =   84
         Top             =   2520
         Width           =   495
      End
      Begin VB.Label Label1 
         Caption         =   "Map:"
         Height          =   255
         Left            =   5400
         TabIndex        =   83
         Top             =   2280
         Width           =   615
      End
   End
   Begin VB.PictureBox picGUI 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H0009E7F2&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   2970
      Left            =   5040
      Picture         =   "frmMirage.frx":26F1B0
      ScaleHeight     =   2940
      ScaleWidth      =   10305
      TabIndex        =   2
      Top             =   7680
      Width           =   10335
      Begin VB.PictureBox picSettings 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         FillStyle       =   0  'Solid
         Height          =   300
         Left            =   1695
         Picture         =   "frmMirage.frx":2D1E34
         ScaleHeight     =   300
         ScaleWidth      =   825
         TabIndex        =   38
         Top             =   2640
         Width           =   825
      End
      Begin VB.PictureBox picInventory 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
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
         ForeColor       =   &H80000008&
         Height          =   630
         Left            =   135
         Picture         =   "frmMirage.frx":2D2B96
         ScaleHeight     =   630
         ScaleWidth      =   630
         TabIndex        =   6
         ToolTipText     =   "Inventory"
         Top             =   1470
         Width           =   630
      End
      Begin VB.PictureBox picTrain 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
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
         ForeColor       =   &H80000008&
         Height          =   630
         Left            =   135
         Picture         =   "frmMirage.frx":2D40D8
         ScaleHeight     =   630
         ScaleWidth      =   630
         TabIndex        =   4
         ToolTipText     =   "Train"
         Top             =   2175
         Width           =   630
      End
      Begin VB.PictureBox picQuit 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
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
         ForeColor       =   &H80000008&
         Height          =   630
         Left            =   840
         Picture         =   "frmMirage.frx":2D561A
         ScaleHeight     =   630
         ScaleWidth      =   630
         TabIndex        =   3
         ToolTipText     =   "Quit"
         Top             =   2175
         Width           =   630
      End
      Begin VB.PictureBox picSpells 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
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
         ForeColor       =   &H80000008&
         Height          =   630
         Left            =   840
         Picture         =   "frmMirage.frx":2D6B5C
         ScaleHeight     =   630
         ScaleWidth      =   630
         TabIndex        =   5
         ToolTipText     =   "Spells"
         Top             =   1470
         Width           =   630
      End
      Begin VB.Label lblPNumber 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "NUM"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   90
         TabIndex        =   193
         Top             =   1050
         Width           =   960
      End
      Begin VB.Label lblFNumber 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "NUM"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1215
         TabIndex        =   192
         Top             =   1050
         Width           =   1020
      End
      Begin VB.Label lblSPN 
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "SP_Number"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1695
         TabIndex        =   36
         Top             =   2385
         Width           =   825
      End
      Begin VB.Label lblMPN 
         BackColor       =   &H00004080&
         BackStyle       =   0  'Transparent
         Caption         =   "MP_Number"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1695
         TabIndex        =   35
         Top             =   2025
         Width           =   825
      End
      Begin VB.Label lblHPN 
         BackStyle       =   0  'Transparent
         Caption         =   "HP_Number"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1695
         TabIndex        =   34
         Top             =   1650
         Width           =   825
      End
   End
End
Attribute VB_Name = "frmDualSolace"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim PicArray() As VB.PictureBox

Public Sub MakePic(ByVal n As Long)
    Set PicArray(n) = Controls.Add("VB.PictureBox", "PicArray" & CStr(n), Me)
    PicArray(n).Appearance = 0
    PicArray(n).BorderStyle = 0
    PicArray(n).AutoRedraw = True
    PicArray(n).AutoSize = True
    PicArray(n).Picture = LoadPicture(App.Path & GUI_PATH & GetVar(App.Path & GUI_PATH & "config.ini", "RealFeel Game Screen", "PicFrame" & n & "Target"))
    PicArray(n).Left = CLng(GetVar(App.Path & GUI_PATH & "config.ini", "RealFeel Game Screen", "PicFrame" & n & "X"))
    PicArray(n).top = CLng(GetVar(App.Path & GUI_PATH & "config.ini", "RealFeel Game Screen", "PicFrame" & n & "Y"))
    PicArray(n).Visible = True
End Sub

Public Sub SetArray(ByVal num As Long)
    ReDim PicArray(1 To num) As VB.PictureBox
End Sub

Private Sub cmdBan_Click()
Dim Name As String
Name = Trim$(InputBox("Ban which online player?", "Ban Player"))
Call SendBan(Name)
End Sub

Private Sub cmdEditor_Click()
    'Request the basic editors to load in the Editor form
    Call SendRequestEditItem
    Call SendRequestEditSpell
    Call SendRequestEditShop
    Call SendRequestEditNpc
    Call SendRequestEditClass
    frmEditor.Show
End Sub

Private Sub cmdExtras_Click()
    picMapExtras.Visible = True
End Sub

Private Sub cmdKick_Click()
Dim Name As String
Name = Trim$(InputBox("Kick which online player?", "Kick Player"))
Call SendKick(Name)
End Sub

Private Sub cmdListen_Click()
frmTrack.Visible = True
End Sub

Private Sub cmdMapEditor_Click()
    Call SendRequestEditMap
End Sub

Private Sub cmdMapWarp_Click()
    If frmDualSolace.lstMapSelection.ListIndex = -1 Then frmDualSolace.lstMapSelection.ListIndex = 0
    Call WarpTo(frmDualSolace.lstMapSelection.ListIndex + 1)
End Sub

Private Sub cmdSaveExtras_Click()
If frmDualSolace.chkAttributeDisplay.Value = Checked Then
    AttributeDisplay = True
Else
    AttributeDisplay = False
End If
If frmDualSolace.chkDepictTiles.Value = Checked Then
    DepictAttributeTiles = True
Else
    DepictAttributeTiles = False
End If
If frmDualSolace.chkAllowPersonalMovement.Value = Checked Then
    AllowMovement = True
Else
    AllowMovement = False
End If
If frmDualSolace.chkAllowPlayerMovement.Value = Checked Then
    Call SendData("MAPEXTRA" & SEP_CHAR & "ALLOWMOVEMENT" & SEP_CHAR & END_CHAR)
Else
    Call SendData("MAPEXTRA" & SEP_CHAR & "DISALLOWMOVEMENT" & SEP_CHAR & END_CHAR)
End If
picMapExtras.Visible = False
End Sub

Private Sub cmdSetAccess_Click()
Dim PIndex As String, Access As Byte
PIndex = Trim$(txtAccessName.Text)
Access = CByte(cmbAccess.ListIndex)
Call SendData("SETACCESS" & SEP_CHAR & PIndex & SEP_CHAR & Access & SEP_CHAR & END_CHAR)
End Sub

Private Sub cmdTrack_Click()
Dim Player As String
Player = ""
Player = InputBox("Track which player?")
If Player <> "" Then
    Call SendRemoveTracker(TrackName)
    Call SendAddTracker(Player)
End If
End Sub

Private Sub cmdWarpMeTo_Click()
Dim Player As String
Player = ""
Player = InputBox("Warp to which player?")
If Player <> "" Then Call WarpMeTo(Player)
End Sub

Private Sub cmdWarpTo_Click()
Dim Map As String
Map = InputBox("Warp to which map?")
If Not IsNumeric(Map) Then
    Call MsgBox("Please enter a number between 1 and " & MAX_MAPS & "!")
    Exit Sub
End If
If Map <> "" Then Call WarpTo(Map)
End Sub

Private Sub cmdWarpToMe_Click()
Dim Player As String
Player = ""
Player = InputBox("Warp which player?")
If Player <> "" Then Call WarpToMe(Player)
End Sub

Private Sub picBankButton_Click()
Dim n As Byte
If picBank.Visible = True Then
    picBank.Visible = False
Else
    txtDeposit.Text = "1"
    txtWithdraw.Text = "1"
    InvSelected = 1
    BankSelected = 1
    
    Call SendData("GETBANK" & SEP_CHAR & END_CHAR)
End If
End Sub

Private Sub picBankExit_Click()
    picBank.Visible = False
End Sub

Private Sub picDeposit_Click()
If Player(MyIndex).Inv(InvSelected).num > 0 Then
    Call SendData("BANKDEPOSIT" & SEP_CHAR & CStr(Player(MyIndex).Inv(InvSelected).num) & SEP_CHAR & Trim$(txtDeposit.Text) & SEP_CHAR & InvSelected & SEP_CHAR & END_CHAR)
    'Call SendData("BANKDEPOSIT" & SEP_CHAR & InvSelected & SEP_CHAR & Trim$(txtDeposit.Text) & SEP_CHAR & CStr(InvSelected) & SEP_CHAR & END_CHAR)
Else
    Call AddText("There is nothing there!", Red)
End If
End Sub

Private Sub picTrainButton_Click()
    'Prevents invalid point use
    If cmbStat.ListIndex > 1 Then
        Call SendData("usestatpoint" & SEP_CHAR & cmbStat.ListIndex & SEP_CHAR & END_CHAR)
    End If
End Sub

Private Sub picTrainCancel_Click()
    picTrainMenu.Visible = False
End Sub

Private Sub picWithdraw_Click()
If Player(MyIndex).BankInv(BankSelected).num > 0 Then
    Call SendData("BANKWITHDRAW" & SEP_CHAR & CStr(Player(MyIndex).BankInv(BankSelected).num) & SEP_CHAR & Trim$(txtWithdraw.Text) & SEP_CHAR & CStr(BankSelected) & SEP_CHAR & END_CHAR)
Else
    Call AddText("There is nothing there!", Red)
End If
End Sub

Private Sub picBankInv_Click(Index As Integer)
picWithdraw.Enabled = False
txtWithdraw.Enabled = False
If shpBank.Visible = False Then shpBank.Visible = True
shpBank.Left = picBankInv(Index).Left - 1
shpBank.top = picBankInv(Index).top - 1
InvSelected = Index + 1
If Player(MyIndex).Inv(InvSelected).num = 0 Then
    picDeposit.Enabled = False
    txtDeposit.Enabled = False
    lblItemName.Caption = ""
    lblItemData.Caption = ""
    Exit Sub
Else
    picDeposit.Enabled = True
    lblItemName.Caption = "Name: " + Trim$(Item(GetPlayerInvItemNum(MyIndex, InvSelected)).Name)
    lblItemData.Caption = "1"
    If Item(Player(MyIndex).Inv(InvSelected).num).Type <> ITEM_TYPE_CURRENCY Then
        txtDeposit.Text = "1"
        txtDeposit.Enabled = False
    Else
        lblItemData.Caption = "Amount: " + GetPlayerInvItemValue(MyIndex, InvSelected)
        txtDeposit.Enabled = True
    End If
End If
End Sub

Private Sub picBankItem_Click(Index As Integer)
picDeposit.Enabled = False
txtDeposit.Enabled = False
If shpBank.Visible = False Then shpBank.Visible = True
shpBank.Left = picBankItem(Index).Left - 1
shpBank.top = picBankItem(Index).top - 1
BankSelected = Index + 1
If Player(MyIndex).BankInv(BankSelected + (5 * scrlBank.Value)).num = 0 Then
    picWithdraw.Enabled = False
    txtWithdraw.Enabled = False
    lblItemName.Caption = ""
    lblItemData.Caption = ""
    Exit Sub
Else
    picWithdraw.Enabled = True
    lblItemName.Caption = Trim$(Item(GetPlayerBankItemNum(MyIndex, BankSelected + (5 * scrlBank.Value))).Name)
    lblItemData.Caption = "1"
    If Item(Player(MyIndex).BankInv(BankSelected + (5 * scrlBank.Value)).num).Type <> ITEM_TYPE_CURRENCY Then
        txtWithdraw.Text = "1"
        txtWithdraw.Enabled = False
    Else
        lblItemData.Caption = GetPlayerBankItemValue(MyIndex, BankSelected + (5 * scrlBank.Value))
        txtWithdraw.Enabled = True
    End If
End If
End Sub

Private Sub scrlBank_Change()
TopBank = scrlBank.Value
BottomBank = TopBank + 3
If Player(MyIndex).BankInv(BankSelected + (5 * scrlBank.Value)).num = 0 Then
    picWithdraw.Enabled = False
    txtWithdraw.Enabled = False
    lblItemName.Caption = ""
    lblItemData.Caption = ""
Else
    picWithdraw.Enabled = True
    lblItemName.Caption = Trim$(Item(GetPlayerBankItemNum(MyIndex, BankSelected + (5 * scrlBank.Value))).Name)
    lblItemData.Caption = "1"
    If Item(Player(MyIndex).BankInv(BankSelected + (5 * scrlBank.Value)).num).Type <> ITEM_TYPE_CURRENCY Then
        txtWithdraw.Text = "1"
        txtWithdraw.Enabled = False
    Else
        lblItemData.Caption = GetPlayerBankItemValue(MyIndex, BankSelected + (5 * scrlBank.Value))
        txtWithdraw.Enabled = True
    End If
End If
Call DrawInventory
'Call SendData("BANKSCROLL" & SEP_CHAR & TopBank & SEP_CHAR & BottomBank & SEP_CHAR & END_CHAR)
End Sub

Private Sub lstspells_GotFocus()
    picScreen.SetFocus
End Sub

Private Sub picCancel_Click()
    picInv.Visible = False
    picCancel.Visible = False
    picUseItem.Visible = False
    picDropItem.Visible = False
End Sub

Private Sub picDropItem_Click()
Dim Value As Long
Dim InvNum As Long

    InvNum = ItemSelected
    If InvNum = 0 Then
        InvNum = 1
        ItemSelected = 1
    End If
    
    If GetPlayerInvItemNum(MyIndex, InvNum) > 0 And GetPlayerInvItemNum(MyIndex, InvNum) <= MAX_ITEMS Then
        If Item(GetPlayerInvItemNum(MyIndex, InvNum)).Type = ITEM_TYPE_CURRENCY Then
            ' Show them the drop dialog
            frmDrop.Show vbModal
        Else
            Call SendDropItem(ItemSelected, 0)
        End If
    End If
End Sub

Private Sub picEquip_Click()
If picEquipment.Visible = True Then
    picEquipment.Visible = False
Else
    picEquipment.Visible = True
End If
End Sub

Private Sub picItem_Click(Index As Integer)
shpInv.Left = picItem(Index).Left - 1
shpInv.top = picItem(Index).top - 1

ItemSelected = Index + 1
End Sub

Private Sub picSettings_Click()
    frmGameSettings.Show 1
End Sub

Private Sub picAdd_Click()
If lstPlayers.ListIndex = -1 Then
    Exit Sub
End If

Call SendData("ADDFRIEND" & SEP_CHAR & lstPlayers.List(lstPlayers.ListIndex) & SEP_CHAR & END_CHAR)
End Sub

Private Sub picRemove_Click()
If lstFriends.ListIndex = -1 Then
    Exit Sub
End If

Call SendData("REMOVEFRIEND" & SEP_CHAR & lstFriends.List(lstFriends.ListIndex) & SEP_CHAR & END_CHAR)
End Sub

Private Sub Form_Load()
'make sure these are not visible
picRemove.Enabled = False
End Sub

Private Sub Form_Resize()
    'Call ResizeGUI
End Sub

Private Sub Form_Terminate()
    Call GameDestroy
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Call GameDestroy
End Sub

Private Sub optFriends_Click()
picAdd.Enabled = False
picRemove.Enabled = True
lstPlayers.Visible = False
lstFriends.Visible = True
End Sub

Private Sub optPlayers_Click()
picAdd.Enabled = True
picRemove.Enabled = False
lstPlayers.Visible = True
lstFriends.Visible = False
End Sub

Private Sub picScreen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call EditorMouseDown(Button, Shift, X, Y)
    If Button = 1 Then
        If InEditor = False Then Call PlayerSearch(Button, Shift, X, Y)
    End If
End Sub

Private Sub picScreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call EditorMouseDown(Button, Shift, X, Y)
    If InEditor = True Then
        lblPosMap.Caption = GetPlayerMap(MyIndex)
        lblPosX.Caption = Int(X \ PIC_X)
        lblPosY.Caption = Int(Y \ PIC_Y)
        Mouse_X = X
        Mouse_Y = Y
    End If
End Sub

Private Sub picUseItem_Click()
    If ItemSelected = 0 Then ItemSelected = 1
    Call SendUseItem(ItemSelected)
End Sub

Private Sub Socket_DataArrival(ByVal bytesTotal As Long)
    If IsConnected Then
        Call IncomingData(bytesTotal)
    End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    If InEditor = False Or AllowMovement = True Then
        If PauseMap = False Then
            Call HandleKeypresses(KeyAscii)
        End If
    End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If InEditor = False Or AllowMovement = True Then
        If PauseMap = False Then
            Call CheckInput(1, KeyCode, Shift)
        End If
    End If
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    If InEditor = False Or AllowMovement = True Then
        If PauseMap = False Then
            Call CheckInput(0, KeyCode, Shift)
        End If
    End If
End Sub

Private Sub tmrMP3_Timer()
If DirectShow.GetTimeDur - DirectShow.GetTimePos < 1 Then
    Call DirectShow.StopMP3
    Call DirectShow.SetPlayBackBalance(0)
    Call DirectShow.SetPlayBackVolume(0)
    If Not DirectShow.LoadMP3(App.Path & MUSIC_PATH & Map.Music) Then
      MsgBox "Error loading music!"
      frmDualSolace.tmrMP3.Enabled = False
      Exit Sub
    End If
    Call DirectShow.SetPlayBackSpeed(1)
    'Play the mp3
    Call DirectShow.PlayMP3
End If

' Check if for some reason, the map no longer has a song
If Map.Music = "" Then
    Call DirectShow.StopMP3
    Call DirectShow.SetPlayBackBalance(0)
    Call DirectShow.SetPlayBackVolume(0)
    frmDualSolace.tmrMP3.Enabled = False
    Exit Sub
End If
End Sub

Private Sub txtChat_GotFocus()
    frmDualSolace.picScreen.SetFocus
End Sub

Private Sub picInventory_Click()
    Call SendData("UPDATEALLINV" & SEP_CHAR & END_CHAR)
    picInv.Visible = True
    picCancel.Visible = True
    picUseItem.Visible = True
    picDropItem.Visible = True
End Sub

Private Sub lblCast_Click()
    If Player(MyIndex).Spell(lstSpells.ListIndex + 1) > 0 Then
        If GetTickCount > Player(MyIndex).AttackTimer + 1000 Then
            If Player(MyIndex).Moving = 0 Then
                Call SendData("cast" & SEP_CHAR & lstSpells.ListIndex + 1 & SEP_CHAR & END_CHAR)
                Player(MyIndex).Attacking = 1
                Player(MyIndex).AttackTimer = GetTickCount
                Player(MyIndex).CastedSpell = YES
            Else
                Call AddText("Cannot cast while walking!", BrightRed)
            End If
        End If
    Else
        Call AddText("No spell here.", BrightRed)
    End If
End Sub

Private Sub lblSpellsCancel_Click()
    picPlayerSpells.Visible = False
End Sub

Private Sub picSpells_Click()
    Call SendData("spells" & SEP_CHAR & END_CHAR)
End Sub

Private Sub picStats_Click()
    If frmDualSolace.picPlayer.Visible = True Then
     frmDualSolace.picPlayer.Visible = False
    Else
    Call SendData("getstats" & SEP_CHAR & END_CHAR)
     frmDualSolace.picPlayer.Visible = True
    End If
End Sub

Private Sub picTrain_Click()
If picTrainMenu.Visible = True Then
    picTrainMenu.Visible = False
    cmbStat.ListIndex = 0
Else
    picTrainMenu.Visible = True
    cmbStat.Clear
    cmbStat.AddItem STRING_STRENGTH
    cmbStat.AddItem STRING_DEFENSE
    cmbStat.AddItem STRING_MAGIC
    cmbStat.AddItem STRING_SPEED
End If
End Sub

Private Sub picTrade_Click()
    Call SendData("trade" & SEP_CHAR & END_CHAR)
End Sub

Private Sub picQuit_Click()
    Call GameDestroy
End Sub

' // MAP EDITOR STUFF //

Private Sub optLayers_Click()
    If optLayers.Value = True Then
        fraLayers.Visible = True
        fraAttribs.Visible = False
        frmSideBlock.Visible = False
    End If
End Sub

Private Sub optAttribs_Click()
    If optAttribs.Value = True Then
        fraLayers.Visible = False
        fraAttribs.Visible = True
        frmSideBlock.Visible = True
    End If
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
              
              If Int(EditorTileY * PIC_Y) >= shpSelected.top + shpSelected.Height Then
                  EditorTileY = Int(EditorTileY * PIC_Y + PIC_Y) - (shpSelected.top + shpSelected.Height)
                  shpSelected.Height = shpSelected.Height + Int(EditorTileY)
              Else
                  If shpSelected.Height > PIC_Y Then
                      If Int(EditorTileY * PIC_Y) >= shpSelected.top Then
                            EditorTileY = (EditorTileY * PIC_Y + PIC_Y) - (shpSelected.top + shpSelected.Height)
                            shpSelected.Height = shpSelected.Height + Int(EditorTileY)
                      End If
                  End If
              End If
        End If
    End If
    
    If optAttribs.Value = True Then
        shpSelected.Width = 32
        shpSelected.Height = 32
    End If
    
    EditorTileX = Int((shpSelected.Left + PIC_X) / PIC_X)
    EditorTileY = Int((shpSelected.top + PIC_Y) / PIC_Y)
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
              
              If Int(EditorTileY * PIC_Y) >= shpSelected.top + shpSelected.Height Then
                  EditorTileY = Int(EditorTileY * PIC_Y + PIC_Y) - (shpSelected.top + shpSelected.Height)
                  shpSelected.Height = shpSelected.Height + Int(EditorTileY)
              Else
                  If shpSelected.Height > PIC_Y Then
                      If Int(EditorTileY * PIC_Y) >= shpSelected.top Then
                            EditorTileY = (EditorTileY * PIC_Y + PIC_Y) - (shpSelected.top + shpSelected.Height)
                            shpSelected.Height = shpSelected.Height + Int(EditorTileY)
                      End If
                  End If
              End If
        End If
    End If
    
    If optAttribs.Value = True Then
        shpSelected.Width = 32
        shpSelected.Height = 32
    End If
    
    EditorTileX = Int(shpSelected.Left / PIC_X)
    EditorTileY = Int(shpSelected.top / PIC_Y)
End Sub

Private Sub picBackSelect_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyShift Then
        KeyShift = True
    End If
End Sub

Private Sub picBackSelect_KeyUp(KeyCode As Integer, Shift As Integer)
    KeyShift = False
End Sub

Private Sub cmdSend_Click()
    Call EditorSend
End Sub

Private Sub cmdCancel_Click()
    Call EditorCancel
End Sub

Private Sub cmdProperties_Click()
    frmMapProperties.Show vbModal
End Sub

Private Sub chkWarp_Click()
    If chkWarp.Value = Unchecked Then Exit Sub
    frmMapWarp.Show vbModal
End Sub

Private Sub chkItem_Click()
    If chkItem.Value = Unchecked Then Exit Sub
    frmMapItem.Show vbModal
End Sub

Private Sub chkKey_Click()
    If chkKey.Value = Unchecked Then Exit Sub
    frmMapKey.Show vbModal
End Sub

Private Sub chkKeyOpen_Click()
    If chkKeyOpen.Value = Unchecked Then Exit Sub
    frmKeyOpen.Show vbModal
End Sub

Private Sub chkHeal_Click()
Dim healamount As String
If chkHeal.Value = Unchecked Then Exit Sub
healamount = ""
healamount = InputBox("Choose the amount of health to recover!")
If healamount <> "" Then EditorHealValue = CLng(healamount)
End Sub

Private Sub chkDamage_Click()
Dim dmgamount As String
If chkDamage.Value = Unchecked Then Exit Sub
dmgamount = ""
dmgamount = InputBox("Choose the amount of health to reduce!")
If dmgamount <> "" Then EditorDamageValue = CLng(dmgamount)
End Sub

Private Sub chkShop_Click()
Dim ShopNum As String
If chkShop.Value = Unchecked Then Exit Sub
ShopNum = ""
ShopNum = InputBox("Select a shop number from 1 to " & MAX_SHOPS & "!")
If ShopNum <> "" Then
    If CLng(ShopNum) >= 1 And CLng(ShopNum) <= MAX_SHOPS Then EditorShopNum = CLng(ShopNum)
End If
End Sub

Private Sub scrlPicture_Change()
    Call EditorTileScroll
End Sub

Private Sub cmdClear_Click()
    Call EditorClearLayer
End Sub

Private Sub cmdClear2_Click()
    Call EditorClearAttribs
End Sub

Private Sub picMapEditor_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SOffsetX = X
    SOffsetY = Y
End Sub

Private Sub picMapEditor_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call MovePicture(frmDualSolace.picMapEditor, Button, Shift, X, Y)
End Sub

Private Sub picPlayerSpells_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SOffsetX = X
    SOffsetY = Y
End Sub

Private Sub picPlayerSpells_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call MovePicture(frmDualSolace.picPlayerSpells, Button, Shift, X, Y)
End Sub

Private Sub picBank_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SOffsetX = X
    SOffsetY = Y
End Sub

Private Sub picBank_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call MovePicture(frmDualSolace.picBank, Button, Shift, X, Y)
End Sub

Private Sub picTrainMenu_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SOffsetX = X
    SOffsetY = Y
End Sub

Private Sub picTrainMenu_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call MovePicture(frmDualSolace.picTrainMenu, Button, Shift, X, Y)
End Sub
