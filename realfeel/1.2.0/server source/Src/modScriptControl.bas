Attribute VB_Name = "modScriptControl"
Option Explicit
 
Global MyScript As clsSadScript
Public Commands As clsCommands

Public Sub InitSADScript()
'On Error GoTo errorhandler:
Set MyScript = New clsSadScript
Set Commands = New clsCommands
MyScript.ReadInCode App.Path & "\scripts\main.txt", "main.txt", MyScript.SControl, False
MyScript.SControl.AddObject "Blitz", Commands, True
ErrorHandlerExit:
  Exit Sub
errorhandler:
  Call ReportError("modScriptControl.bas", "InitSADScript", Err.Number, Err.Description)
End Sub

Sub ResetSADScript()
'On Error GoTo errorhandler:
MyScript.SControl.Reset
MyScript.ReadInCode App.Path & "\scripts\main.txt", "main.txt", MyScript.SControl, False
MyScript.SControl.AddObject "Blitz", Commands, True
Call TextAdd(frmServer.txtText, "Reloaded the main.txt", True)
ErrorHandlerExit:
  Exit Sub
errorhandler:
  Call ReportError("modScriptControl.bas", "ResetSADScript", Err.Number, Err.Description)
End Sub

'-----------------------------------------------------------------

'Whatever you do, do NOT use the code below
'- smchronos

'-----------------------------------------------------------------
'Public Sub InitScript()
'Dim Commands As New clsCommands
'Dim FileName As String, Line As String, Script As String
'Dim F As Integer
'
'FileName = App.Path & "\scripts\main.txt"
'F = FreeFile
'ScriptControl1.Language = "VBScript"
'ScriptControl1.AddObject "Blitz", Commands, True
'
'Open FileName For Input As #F
'Input #F, Script
'Close #F
'
'ScriptControl1.AddCode Script
'End Sub
'-----------------------------------------------------------------
'Public Sub ResetScript()
'Dim Commands As New clsCommands
'Dim FileName As String, Line As String, Script As String
'Dim F As Integer
'
'FileName = App.Path & "\scripts\main.txt"
'F = FreeFile
'
'ScriptControl1.Reset
'ScriptControl1.AddObject "Blitz", Commands, True
'
'Open FileName For Input As #F
'Do Until EOF(F)
'Line Input #F, Line
'Script = Script & vbCrLf & Trim$(Line)
'Loop
'Close #F
'
'ScriptControl1.AddCode Script
'End Sub
'-----------------------------------------------------------------

