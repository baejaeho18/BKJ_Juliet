#!/bin/bash

# let os = 0  # 0:windows 1:linux

# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   echo "$os : Linux에서 동작하는 코드입니다."
#   os = 1
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#   echo "$os : macOS에서 동작하는 코드입니다."
#   os = 1
# elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
#   echo "$os : Windows에서 동작하는 코드입니다."
#   os = 0
# else
#   echo "지원되지 않는 운영 체제입니다."
#   exit 1
# fi

lib="lib\servlet-api.jar;lib\commons-lang-2.5.jar;lib\commons-codec-1.5.jar;lib\javamail-1.4.4.jar"
supports="src\testcasesupport\IO.java src\testcasesupport\AbstractTestCaseBase.java src\testcasesupport\AbstractTestCase.java src\testcasesupport\AbstractTestCaseBadOnly.java src\testcasesupport\AbstractTestCaseServletBase.java src\testcasesupport\AbstractTestCaseServlet.java src\testcasesupport\AbstractTestCaseServletBadOnly.java src\testcasesupport\AbstractTestCaseClassIssue.java src\testcasesupport\AbstractTestCaseClassIssueBad.java src\testcasesupport\AbstractTestCaseClassIssueGood.java"

while getopts cdj opt
do
    case $opt in
        d)
        # dirList를 만든 후
        # cmd.exe /C 'dir /s /b /ad "src/testcases" > dirList.txt'
        # dirList에 따라 compile하고
        dfiles=()
        while read line;
        do
            dfiles+=("$line")
            # dfile=$(echo "$dfile" | sed 's/\\/\\\\/g')
        done < "dirList.txt"

        for dfile in "${dfiles[@]}"; do
	echo "${dfile}"
            dfile=$(echo "$dfile" | sed 's/\r//g')
            jfile=$(echo "$dfile\*.java")
            javac -cp ${lib} ${supports} -g ${jfile}
        done
        # classList를 만든 후
        cmd.exe /C 'dir /s /b "src\testcases\*.class" > classList.txt'
        # classList에 따라 decompile한다.
        cfiles=()
        while read line;
        do
            cfiles+=("$line")
            cfile=$(echo "$cfile" | sed 's/\\/\\\\/g')
            # echo "$line"
        done < "classList.txt"

        for cfile in "${cfiles[@]}"; do
            cfile=$(echo "$cfile" | sed 's/\r//g')
            tfile="${cfile/.class/.txt}"
            javap -c -p ${cfile} > ${tfile} 
        done
        ;;
        
        c)
        # classList를 만든 후
        cmd.exe /C 'dir /s /b "src\testcases\*.class" > classList.txt'

        # classList에 따라 decompile한다.
        cfiles=()
        while read line;
        do
            cfiles+=("$line")
            cfile=$(echo "$cfile" | sed 's/\\/\\\\/g')
            # echo "$line"
        done < "classList.txt"

        for cfile in "${cfiles[@]}"; do
            cfile=$(echo "$cfile" | sed 's/\r//g')
            tfile="${cfile/.class/.txt}"
            javap -c -p ${cfile} > ${tfile} 
        done
        ;;
        
        j)
        # javaList를 만든 후
        cmd.exe /C 'dir /s /b "src\testcases\*.java" > javaList.txt'

        javaList에 따라 compile한다.
        jfiles=()
        while read line;
        do
            jfiles+=("$line")
            jfile=$(echo "$jfile" | sed 's/\\/\\\\/g')
            # echo "$line"
        done < "javaList.txt"

        for jfile in "${jfiles[@]}"; do
            jfile=$(echo "$jfile" | sed 's/\r//g')
            javac -cp ${lib} ${supports} -g ${jfile}
        done
        # javaList에 따라 decompile한다.
        for jfile in "${jfiles[@]}"; do
            cfile="${jfile/.java/.class}"
            tfile="${jfile/.java/.txt}"
            javap -c -p ${cfile} > ${tfile} 
        done
        ;;
        
        *) echo "$opt is not the option" ;;
    esac
done

