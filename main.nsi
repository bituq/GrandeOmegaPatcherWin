!include LogicLib.nsh
!include "lib\checkForSpaces.nsh"
!include "lib\pages.nsh"

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
    ${endif}

    ; Check whether there are spaces in the default directory path
    StrCpy $INSTDIR "$LOCALAPPDATA\GrandeOmega"
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
    
SectionEnd