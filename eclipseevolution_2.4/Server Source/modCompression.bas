Attribute VB_Name = "modCompression"
Option Explicit

Private CompressArray() As Byte
Private OutStream() As Byte
Private OutPos As Long
Private CntPos As Long

Private Type STARTUPINFO
    cb As Long
    lpReserved As String
    lpDesktop As String
    lpTitle As String
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Long
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long
End Type

Private Type PROCESS_INFORMATION
    hProcess As Long
    hThread As Long
    dwProcessID As Long
    dwThreadID As Long
End Type

Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpApplicationname As Long, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Private Function Compression_ReadFromArray_Char(FromArray() As Byte, FromPos As Long) As Byte

    Compression_ReadFromArray_Char = FromArray(FromPos)
    FromPos = FromPos + 1

End Function

Private Sub Compression_Add_CharToArray(ToArray() As Byte, ToPos As Long, ByVal Char As Byte)

    If ToPos > UBound(ToArray) Then
        ReDim Preserve ToArray(ToPos + 500)
    End If
    ToArray(ToPos) = Char
    ToPos = ToPos + 1

End Sub

Public Sub Compression_Compress_RLE(ByteArray() As Byte, IsCompressed As Boolean)
Dim X As Long
Dim Y As Long
Dim ByteCount As Long
Dim LastAsc As Integer
Dim TelSame As Long
Dim IsRun As Boolean
Dim ZeroCount As Integer
Dim LengthPos As Long
Dim NoLength As Boolean
Dim ContStream() As Byte
Dim LengthStream() As Byte

    If UBound(ByteArray) = 0 Then Exit Sub

    ReDim ContStream(200)
    ReDim LengthStream(200)
    ReDim OutStream(500)
    IsCompressed = False
    CntPos = 1
    OutPos = 0

    For X = 0 To UBound(ByteArray)
        IsRun = LastAsc = ByteArray(X) And X <> 0
        If Not IsRun Then
            If TelSame = 1 Then
                TelSame = 0
                Compression_Add_CharToArray OutStream, OutPos, CByte(LastAsc)
                ByteCount = ByteCount + 1
            ElseIf TelSame > 1 Then
                For Y = 1 To Int(ByteCount / 255)
                    Compression_Add_CharToArray ContStream, CntPos, 255
                Next Y
                ByteCount = ByteCount Mod 255
                If ByteCount = 0 Then ZeroCount = ZeroCount + 1
                Compression_Add_CharToArray ContStream, CntPos, CByte(ByteCount)
                ByteCount = 0
                For Y = 1 To Int(TelSame / 255)
                    Compression_Add_CharToArray LengthStream, LengthPos, 255
                Next Y
                TelSame = TelSame Mod 255
                Compression_Add_CharToArray LengthStream, LengthPos, CByte(TelSame)
                TelSame = 0
            End If
            Compression_Add_CharToArray OutStream, OutPos, ByteArray(X)
            ByteCount = ByteCount + 1
        Else
            TelSame = TelSame + 1
        End If
        LastAsc = ByteArray(X)
    Next X
    
    If IsRun Then
        If TelSame < 2 Then
            Compression_Add_CharToArray OutStream, OutPos, CByte(LastAsc)
        Else
            For Y = 1 To Int(ByteCount / 255)
                Compression_Add_CharToArray ContStream, CntPos, 255
            Next Y
            ByteCount = ByteCount Mod 255
            Compression_Add_CharToArray ContStream, CntPos, CByte(ByteCount)
            For Y = 1 To Int(TelSame / 255)
                Compression_Add_CharToArray LengthStream, LengthPos, 255
            Next Y
            TelSame = TelSame Mod 255
            Compression_Add_CharToArray LengthStream, LengthPos, CByte(TelSame)
        End If
    End If
    
    ContStream(0) = CByte(ZeroCount)
    If CntPos > 1 Then IsCompressed = True
    Call Compression_Add_CharToArray(ContStream, CntPos, 0)  'No Run Till EOF
    ReDim Preserve ContStream(CntPos - 1) As Byte
    
    If LengthPos > 0 Then
        ReDim Preserve LengthStream(LengthPos - 1)
    Else
        NoLength = True
    End If
    
    ReDim Preserve OutStream(OutPos - 1) As Byte
    CntPos = UBound(ContStream) + 1
    LengthPos = 0
    If Not NoLength Then LengthPos = UBound(LengthStream) + 1
    OutPos = UBound(OutStream) + 1
    ReDim ByteArray(CntPos + LengthPos + OutPos - 1)
    CopyMem ByteArray(0), ContStream(0), CntPos
    If LengthPos > 0 Then CopyMem ByteArray(CntPos), LengthStream(0), LengthPos
    CopyMem ByteArray(CntPos + LengthPos), OutStream(0), OutPos

End Sub

Public Sub Compression_Compress_RLELoop(ByteArray() As Byte)
Dim TimesRLE As Integer
Dim IsCompressed As Boolean

    Do
        Compression_Compress_RLE ByteArray, IsCompressed
        TimesRLE = TimesRLE + 1
    Loop While IsCompressed
    ReDim Preserve ByteArray(UBound(ByteArray) + 1)
    ByteArray(UBound(ByteArray)) = TimesRLE

End Sub

Public Sub Compression_DeCompress_RLE(ByteArray() As Byte)

Dim X As Long
Dim CntCount As Long
Dim bytLastChar As Byte
Dim ByteCount As Long
Dim InpPos As Long
Dim ZeroCount As Integer
Dim LengthPos As Long

    ZeroCount = 0
    For X = 1 To UBound(ByteArray)
        If ByteArray(X) = 0 Then
            If ZeroCount = ByteArray(0) Then Exit For
            ZeroCount = ZeroCount + 1
        End If
        If ByteArray(X) <> 255 Then
            CntCount = CntCount + 1
        End If
    Next X
    
    OutPos = 0
    CntPos = 1
    LengthPos = X + 1
    InpPos = LengthPos
    
    Do While CntCount > 0
        If ByteArray(InpPos) <> 255 Then
            CntCount = CntCount - 1
        End If
        InpPos = InpPos + 1
    Loop
    ReDim OutStream(UBound(ByteArray) - InpPos + 1)
    ByteCount = Compression_ReadFromArray_Char(ByteArray, CntPos)
    CntCount = Compression_ReadFromArray_Char(ByteArray, LengthPos)
    Do
        If ByteCount = 0 Then
            For X = 1 To UBound(ByteArray) - InpPos + 1
                bytLastChar = Compression_ReadFromArray_Char(ByteArray, InpPos)
                Compression_Add_CharToArray OutStream, OutPos, bytLastChar
            Next X
        Else
            For X = 1 To ByteCount
                bytLastChar = Compression_ReadFromArray_Char(ByteArray, InpPos)
                Compression_Add_CharToArray OutStream, OutPos, bytLastChar
            Next X
            If ByteCount = 255 Then
                Do
                    ByteCount = Compression_ReadFromArray_Char(ByteArray, CntPos)
                    For X = 1 To ByteCount
                        bytLastChar = Compression_ReadFromArray_Char(ByteArray, InpPos)
                        Compression_Add_CharToArray OutStream, OutPos, bytLastChar
                    Next X
                Loop While ByteCount = 255
                ByteCount = Compression_ReadFromArray_Char(ByteArray, CntPos)
            Else
                ByteCount = Compression_ReadFromArray_Char(ByteArray, CntPos)
            End If
            For X = 1 To CntCount
                Compression_Add_CharToArray OutStream, OutPos, bytLastChar
            Next X
            If CntCount = 255 Then
                Do
                    CntCount = Compression_ReadFromArray_Char(ByteArray, LengthPos)
                    For X = 1 To CntCount
                        Compression_Add_CharToArray OutStream, OutPos, bytLastChar
                    Next X
                Loop While CntCount = 255
                CntCount = Compression_ReadFromArray_Char(ByteArray, LengthPos)
            Else
                CntCount = Compression_ReadFromArray_Char(ByteArray, LengthPos)
            End If
        End If
    Loop While InpPos <= UBound(ByteArray)
    ReDim ByteArray(OutPos - 1) As Byte
    CopyMem ByteArray(0), OutStream(0), OutPos

End Sub

Public Sub Compression_DeCompress_RLELoop(ByteArray() As Byte)
Dim X As Integer
Dim TimesRLE As Integer

    TimesRLE = ByteArray(UBound(ByteArray))
    ReDim Preserve ByteArray(UBound(ByteArray) - 1)
    
    For X = 1 To TimesRLE
        Compression_DeCompress_RLE ByteArray
    Next X

End Sub

Private Sub CommandLine(ByVal CommandLineString As String)
Dim Start As STARTUPINFO
Dim Proc As PROCESS_INFORMATION

    Start.dwFlags = &H1
    Start.wShowWindow = 0
    CreateProcessA 0&, CommandLineString, 0&, 0&, 1&, &H20&, 0&, 0&, Start, Proc
    Do While WaitForSingleObject(Proc.hProcess, 0) = 258
        DoEvents
        Sleep 1
    Loop

End Sub

Private Sub SaveString(Data As String, File As String)
Dim FileNum As Byte
Dim b() As Byte

    b = StrConv(Data, vbFromUnicode)
    If Dir$(File, vbNormal) <> vbNullString Then Kill File
    FileNum = FreeFile
    Open File For Binary Access Write As #FileNum
        Put #FileNum, , b
    Close #FileNum

End Sub

Private Sub LoadString(Data As String, File As String)
Dim FileNum As Byte
Dim b() As Byte

    FileNum = FreeFile
    Open File For Binary Access Read As #FileNum
        ReDim b(0 To LOF(FileNum) - 1)
        Get #FileNum, , b
    Close #FileNum
    Data = StrConv(b, vbUnicode)
    
End Sub

Public Sub Compress_LZMA(Data As String)
Dim FileName As String

    FileName = "comptemp"
    SaveString Data, App.Path & "\" & FileName & ".bin"
    CommandLine App.Path & "\7za.exe a -t7z " & Quote & App.Path & "\" & FileName & ".bin.7z" & Quote & " -aoa " & Quote & App.Path & "\" & FileName & ".bin" & Quote & " -mx9 -m0=LZMA:d80m:fb273:lc5:pb1:mc10000"
    If Dir$(App.Path & "\" & FileName & ".bin.7z") <> vbNullString Then
        LoadString Data, App.Path & "\" & FileName & ".bin.7z"
        Kill App.Path & "\" & FileName & ".bin.7z"
    End If
    Kill App.Path & "\" & FileName & ".bin"

End Sub

Public Sub Decompress_LZMA(Data As String)
Dim FileName As String

    FileName = "comptemp"
    SaveString Data, App.Path & "\" & FileName & ".bin.7z"
    CommandLine App.Path & "\7za.exe e " & Quote & App.Path & "\" & FileName & ".bin.7z" & Quote
    If Dir$(App.Path & "\" & FileName & ".bin") <> vbNullString Then
        LoadString Data, App.Path & "\" & FileName & ".bin"
        Kill App.Path & "\" & FileName & ".bin"
    End If
    Kill App.Path & "\" & FileName & ".bin.7z"

End Sub

