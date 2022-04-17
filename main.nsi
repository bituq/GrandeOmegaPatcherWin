!include "lib\pages.nsh"

!define TempDir "$TEMP\go-installer"

Var GoVersion
Var GoSectionName

Function .onInit
    CreateDirectory ${TempDir}

    StrCpy $GoSectionName "Grande Omega"

	; Get the latest Grande Omega version
    NScurl::http GET "https://www.grandeomega.com/api/v1/CustomAssignmentLogic/version" "${TempDir}\version.txt" /END
    pop $R1
    StrCmp $R1 "OK" 0 notOk
        ClearErrors
        FileOpen $0 "${TempDir}\version.txt" r
        IfErrors notOk
        FileRead $0 $GoVersion
        FileClose $0
        StrCpy $GoSectionName "$GoSectionName $GoVersion"
    notOk:
FunctionEnd

Function .onGUIEnd
    RMDir /r ${TempDir}
FunctionEnd

Section !$GoSectionName
    
SectionEnd