Attribute VB_Name = "modSysTray"

' Copyright (c) 2006 Elysium Source. All rights reserved.
' This code is licensed under the Elysium General License.
Option Explicit

Public Const KEYEVENTF_KEYUP = &H2
Public Const VK_LWIN = &H5B

'Declare a user-defined variable to pass to the Shell_NotifyIcon
'function.
Public Type NOTIFYICONDATA
    cbSize As Long
    hWnd As Long
    uId As Long
    uFlags As Long
    uCallBackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type

'Declare the constants for the API function. These constants can be
'found in the header file Shellapi.h.
'The following constants are the messages sent to the
'Shell_NotifyIcon function to add, modify, or delete an icon from the System Tray
Public Const NIM_ADD = &H0
Public Const NIM_MODIFY = &H1
Public Const NIM_DELETE = &H2

'The following constant is the message sent when a mouse event occurs
'within the rectangular boundaries of the icon in the System Tray
'area.
Public Const WM_MOUSEMOVE = &H200

'The following constants are the flags that indicate the valid
'members of the NOTIFYICONDATA data type.
Public Const NIF_MESSAGE = &H1
Public Const NIF_ICON = &H2
Public Const NIF_TIP = &H4

'The following constants are used to determine the mouse input on the
'the icon in the taskbar status area.
'Left-click constants.
Public Const WM_LBUTTONDBLCLK = &H203   'Double-click
Public Const WM_LBUTTONDOWN = &H201     'Button down
Public Const WM_LBUTTONUP = &H202       'Button up

'Right-click constants.
Public Const WM_RBUTTONDBLCLK = &H206   'Double-click
Public Const WM_RBUTTONDOWN = &H204     'Button down
Public Const WM_RBUTTONUP = &H205       'Button up

'Declare the API function call.
Declare Function Shell_NotifyIcon _
   Lib "shell32" _
   Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, _
   pnid As NOTIFYICONDATA) As Boolean
Global nid As NOTIFYICONDATA
