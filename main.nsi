!include LogicLib.nsh
!include "lib\checkForSpaces.nsh"
!include "lib\pages.nsh"

!define ZipTarget "$TEMP\go_student_win.zip"
!define TempDir "$TEMP\go-installer"

Var GoVersion
Var GoSectionName

Function .onInit
    CreateDirectory ${TempDir}
    
    ; Initialize variables
    StrCpy $GoSectionName "Grande Omega"

	; Get the latest Grande Omega version
    NScurl::http GET "https://www.grandeomega.com/api/v1/CustomAssignmentLogic/version" "${TempDir}\version.txt" /END
    Pop $R1
    ${if} $R1 == "OK"
        ClearErrors
        FileOpen $R0 "${TempDir}\version.txt" r
        IfErrors notOk
        FileRead $R0 $GoVersion
        FileClose $R0
        StrCpy $GoSectionName "$GoSectionName $GoVersion"
        notOk:
    ${endif}

    ; Check whether there are spaces in the default directory path
    StrCpy $INSTDIR $LOCALAPPDATA
    Push $INSTDIR
    Call CheckForSpaces
    Pop $R0
    StrCmp $R0 0 noSpaces
        DetailPrint "$R0 Spaces were found."
        ; Set the recommended directory path to blank, so it can be changed by the user
        StrCpy $INSTDIR ""
    noSpaces:
FunctionEnd

Function .onGUIEnd
    RMDir /r ${TempDir}
FunctionEnd

Section !$GoSectionName
    NScurl::http GET "https://www.grandeomega.com/downloads/go_student_win.zip" ${ZipTarget} \
        /TIMEOUT "15s" \
        /BACKGROUND \
        /END
    pop $R0
    NScurl::query /ID $R0 "@ERROR@"
    pop $R1
    DetailPrint "Grande Omega download status: $R1"
    NScurl::query /ID $R0 "@OUT@"
    pop $R1
    DetailPrint $R1
    NScurl::wait /ID $R0 /CANCEL /END
    DetailPrint "Unzipping Grande Omega to $INSTDIR"
    nsisunz::Unzip ${ZipTarget} "$INSTDIR"
    DetailPrint "$INSTDIR\go_student_win"
    Delete ${ZipTarget}
    CreateShortcut "$DESKTOP\Grande Omega $GoVersion.lnk" "$INSTDIR\go_student_win\GrandeOmega.exe"
SectionEnd