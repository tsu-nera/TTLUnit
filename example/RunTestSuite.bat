@echo off

set file=%*

rem Call TestSuite
"C:\Program Files (x86)\teraterm\ttpmacro.exe" "C:\cygwin\home\TSUNEMICHI\src\ttlunit\lib\RunTestSuite.ttl" %file%