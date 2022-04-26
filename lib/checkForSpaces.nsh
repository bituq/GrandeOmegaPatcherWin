Function CheckForSpaces
	Exch $R0
	Push $R1
	Push $R2
	Push $R3
	StrCpy $R1 -1
	StrCpy $R3 $R0
	StrCpy $R0 0
	loop:
		StrCpy $R2 $R3 1 $R1
		IntOp $R1 $R1 - 1
		StrCmp $R2 "" done
		StrCmp $R2 " " 0 loop
		IntOp $R0 $R0 + 1
		Goto loop
	done:
	Pop $R3
	Pop $R2
	Pop $R1
	Exch $R0
FunctionEnd