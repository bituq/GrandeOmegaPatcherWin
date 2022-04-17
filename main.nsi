!include "lib\pages.nsh"
!include "lib\checkForSpaces.nsh"

!define TempDir "$TEMP\go-installer"

Var GoVersion
Var GoSectionName
Var GoDir

Function .onInit
    CreateDirectory ${TempDir}
    
    ; Initialize variables
    StrCpy $GoSectionName "Grande Omega"
    StrCpy $GoDir "$LOCALAPPDATA\GrandeOmega"

	; Get the latest Grande Omega version
    NScurl::http GET "https://www.grandeomega.com/api/v1/CustomAssignmentLogic/version" "${TempDir}\version.txt" /END
    Pop $R1
    StrCmp $R1 "OK" 0 notOk
        ClearErrors
        FileOpen $R0 "${TempDir}\version.txt" r
        IfErrors notOk
        FileRead $R0 $GoVersion
        FileClose $R0
        StrCpy $GoSectionName "$GoSectionName $GoVersion"
    notOk:

    ; Check whether there are spaces in the default directory path
    Push $GoDir
    Call CheckForSpaces
    Pop $R0
    StrCmp $R0 0 noSpaces
        StrCpy $GoDir ""
    noSpaces:
FunctionEnd

Function .onGUIEnd
    RMDir /r ${TempDir}
FunctionEnd

Section !$GoSectionName
    
SectionEnd