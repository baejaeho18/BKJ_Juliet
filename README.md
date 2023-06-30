# BKJ-Juliet <br>

1) compile <br>
javac -cp {lib} {supports} -g {target path} <br>
javac -cp lib\servlet-api.jar;lib\commons-lang-2.5.jar;lib\commons-codec-1.5.jar;lib\javamail-1.4.4.jar src\testcasesupport\IO.java src\testcasesupport\AbstractTestCaseBase.java src\testcasesupport\AbstractTestCase.java src\testcasesupport\AbstractTestCaseBadOnly.java src\testcasesupport\AbstractTestCaseServletBase.java src\testcasesupport\AbstractTestCaseServlet.java src\testcasesupport\AbstractTestCaseServletBadOnly.java src\testcasesupport\AbstractTestCaseClassIssue.java src\testcasesupport\AbstractTestCaseClassIssueBad.java src\testcasesupport\AbstractTestCaseClassIssueGood.java -g C:\Users\USER\git\BKJ_Juliet\src\testcases\CWE23_Relative_Path_Traversal\*.java <br>
<br>
2) decompile <br>
javap -c -p {target file} > {ouput file} <br>
javap -c -p C:\Users\USER\git\BKJ_Juliet\src\testcases\CWE23_Relative_Path_Traversal\CWE23_Relative_Path_Traversal__listen_tcp_13.class > C:\Users\USER\git\BKJ_Juliet\src\testcases\CWE23_Relative_Path_Traversal\CWE23_Relative_Path_Traversal__listen_tcp_13.txt <br>
<br>
3) find file pathes <br>
dir /s /b {target} > {output file} <br>
dir /s /b "src\testcases\*.java" > javaList.txt <br>
<br>
4) find dir pathes <br>
dir /s /b /ad
