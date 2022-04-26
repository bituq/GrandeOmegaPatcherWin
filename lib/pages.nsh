# Includes
!include "MUI2.nsh"

# Functions
Function DirectoryLeave
	Push $R0
	Push $R1

	; Count the amount of spaces in $INSTDIR
	Push $INSTDIR
	Call CheckForSpaces
	Pop $R0

	StrCmp $R0 0 noSpaces

		; Append 's' if there are multiple spaces
		StrCmp $R0 1 0 +3
			StrCpy $R1 ""
		GoTo +2
			StrCpy $R1 "s"

		MessageBox MB_OK|MB_ICONEXCLAMATION "The installation directory contains $R0 space$R1.$\n\
			Please set a target directory without any spaces."
		Abort 
	noSpaces:

	Pop $R1
	Pop $R0
FunctionEnd

# Welcome Page
!define MUI_WELCOMEPAGE_TITLE "Grande Omega Patcher"
!define MUI_WELCOMEPAGE_TEXT "Welcome to Open Source Grande Omega Patcher. \
	This patcher allows you to install Grande Omega with its dependencies automatically. \
	Please note that this is a community-made patcher. We are unaffiliated with Grande Omega."

# Components Page
!define MUI_COMPONENTSPAGE_TEXT_TOP "Dependencies"
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Choose Components"
!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_INFO "The selected dependencies will automatically be installed."
!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_TITLE "Description"

# Finish Page
!define MUI_FINISHPAGE_TITLE "Installation Finished"
!define MUI_FINISHPAGE_TEXT "You may now launch Grande Omega"
!define MUI_FINISHPAGE_RUN_TEXT "Run Grande Omega"
!define MUI_FINISHPAGE_RUN ""

# Directory Page
!define MUI_DIRECTORYPAGE_TEXT_TOP "Grande Omega will be installed in the following folder. \
	make sure that there aren't any spaces in the path. Click install to start the installation."

# Pages
!define MUI_WELCOMEFINISHPAGE_BITMAP "assets\banner.bmp"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_COMPONENTS
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE "DirectoryLeave"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH