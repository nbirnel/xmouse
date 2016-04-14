CC="/cygdrive/c/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe"
#CC="/cygdrive/c/Program Files (x86)/AutoHotkey/Compiler/Ahk2Exe.exe"
PROG=xmouse

${PROG}.exe : ${PROG}.ahk ${PROG}.ico
	${CC} /in ${PROG}.ahk /icon ${PROG}.ico

test : ${PROG}.exe
	cygstart $?

dist :: ${PROG}.zip

${PROG}.zip :: ${PROG}.exe
	cd .. && \
		zip -r ${PROG}.zip ${PROG}/INSTALL.txt ${PROG}/${PROG}.exe 
	mv ../${PROG}.zip ./

push :: ${PROG}.zip
	scp ${PROG}.zip noah@www.birnel.org:~/birnel.org/birnel.org/~noah/software/${PROG}

clean ::
	rm -f ${PROG}.zip

