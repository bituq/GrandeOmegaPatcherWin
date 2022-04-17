!include "lib\pages.nsh"

!define TempDir "$TEMP\go-installer"

Var GoVersion

Function .onInit
    InitPluginsDir
    CreateDirectory ${TempDir}

	; Get the latest Grande Omega version
    NScurl::http GET "https://www.grandeomega.com/api/v1/CustomAssignmentLogic/version" "${TempDir}\version.txt" /END
    pop $R1
    StrCmp $R1 "OK" 0 notOk
    ClearErrors
    FileOpen $0 "${TempDir}\version.txt" r
    IfErrors notOk
    FileRead $0 $GoVersion
    FileClose $0
    notOk:
FunctionEnd

Section "section_name" section_index_output
    
SectionEnd