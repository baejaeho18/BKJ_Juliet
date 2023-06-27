#!/bin/bash

# cmd.exe /C getJavaList.bat
# dir /s /b "src\testcases\*.java" > javaList.txt

filename="javaList.txt"
lib="lib\servlet-api.jar;lib\commons-lang-2.5.jar;lib\commons-codec-1.5.jar;lib\javamail-1.4.4.jar"
supports="src\testcasesupport\IO.java src\testcasesupport\AbstractTestCaseBase.java src\testcasesupport\AbstractTestCase.java src\testcasesupport\AbstractTestCaseBadOnly.java src\testcasesupport\AbstractTestCaseServletBase.java src\testcasesupport\AbstractTestCaseServlet.java src\testcasesupport\AbstractTestCaseServletBadOnly.java src\testcasesupport\AbstractTestCaseClassIssue.java src\testcasesupport\AbstractTestCaseClassIssueBad.java src\testcasesupport\AbstractTestCaseClassIssueGood.java"

files=()
while read line;
do
    files+=("$line")
    # echo "$line"
done < "$filename"

for jfile in "${files[@]}"
do
    jfile=$(echo "$jfile" | sed 's/\r//g')
    echo "Running $jfile.."
    javac -cp ${lib} ${supports} -g ${jfile}
    # sleep 1
    cfile="${jfile/.java/.class}"
    tfile="${jfile/.java/.txt}"
    echo "$cfile"
    echo "$tfile"
    javap -c -p ${cfile} > ${tfile}
done

# sh translator.sh > log.txt