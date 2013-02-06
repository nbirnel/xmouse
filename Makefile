CC="/cygdrive/c/Program Files (x86)/AutoHotkey/Compiler/Ahk2Exe.exe"
PROG=xmouse

${PROG}.exe : ${PROG}.ahk ${PROG}.ico
	${CC} /in ${PROG}.ahk /icon ${PROG}.ico

test : ${PROG}.exe
	cygstart $?

