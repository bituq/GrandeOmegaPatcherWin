# Modern UI 2
!include "MUI2.nsh"

# Welcome Page
!define MUI_WELCOMEPAGE_TITLE "Grande Omega Patcher"
!define MUI_WELCOMEPAGE_TEXT "Welcome to Open Source Grande Omega Patcher. This patcher allows you to install Grande Omega with its dependencies automatically."

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

# Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH