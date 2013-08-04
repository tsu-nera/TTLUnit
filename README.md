==========
 TTLUnit
==========

TTLUnit is xUnit framework for Tera Term Language(TTL).

### Usage
#### Set Folder path
Before start testing, Set your Folder path.Modify lib/config.ttl

- BASE_DIR  :  TTLUnit default directory path
- LIB_DIR   :  TTLUnit library path
- TEST_DIR  :  Your Test Directory
- LOG_DIR   :  Your Test Log Directory

You may also check these options.

- TEST_PREFIX : Your Test Case File Prefix
- LOG_MODE    : Test Log Enable(1)/Disable(0)

### Make Test Suite Folder
In TTLUnit, Test Suite is managed by folders.

Make Test Suite Folder in your ${TEST_DIR}

You alse need to make Test Suite List File.Create 'ts_list.ttl' in your ${TEST_DIR} and add your test suite like these

    ; Pleas Modify Test Suite Max 
    TEST_SUITE_MAX = 2
    strdim test_suite TEST_SUITE_MAX

    ; Add your test suite folder
    test_suite[0] = 'ts_mkdir'
    test_suite[1] = 'ts_pwd'
    test_suite[2] = ...

### Make Test Case Files
Make Test Case Files in your Test Suite Folders. Test Files Name follows Specified Name(TEST_PREFIX in lib/config.ttl)

So you also need the knowledge of TTL. Check TTL command reference.

- [TTL command reference](http://ttssh2.sourceforge.jp/manual/en/macro/command/index.html)

For Example: Test_mkdir_test_dir.ttl

    ;Test
    sendln 'mkdir testdir'
    
    ;Assert
    sendln 'ls'
    Wait 'testdir'
    
    ;tearDown
    sendln 'rmdir testdir'
    
    exit

Last line must be 'exit'. You can't use TTL command it use 'result' after 'Wait' command.(Because of TTLUnit's internal reason)

### Run Tests
There are three way to run tests.

##### Run All Tests
Asossiate .ttl files to ttpmacro.exe(it enables to open .ttl files by one click) and Open lib/RunAllTests.ttl. All Test Suite(registered in ts_list.ttl) will run one by one.

##### Run One Suite
You can also choose one Test suite.Open lib/RunTestSuite.ttl.MessageBox will popup,You can input Test suite directory.

##### By drug and drop
Just drug test suite folder to .bat files and Test will run.

see example/RunTestSuite.bat for example. you have to specify your ttpmacro.exe path and ${LIB_DIR}

    @echo off
    
    set file=%*
    
    rem Call TestSuite
    "C:\Program Files (x86)\teraterm\ttpmacro.exe" "C:\cygwin\home\TSUNEMICHI\src\ttlunit\lib\RunTestSuite.ttl" %file%

### Test Summary
When All test end, Test Summary  Popup.

### Tips

##### Setup and TaerDown
If test suite folder has 'setup.ttl' or 'teardown.ttl', SetUp or TearDown executed when before or after test case.

If TEST_DIR has 'setup.ttl' or 'teardown.ttl', SetUp executed when before first test case start or Teardown run when after last test case end.

##### Show expect value
Default Test summary doesn't show Wait expect value, if you want to check whick wait statemane failed, Write Wait statement like that

    expect_str = 'hogehoge'
    Wait expect_str

Test Summary shows failed expect value.

##### timeout
Default timeout value is 5 seconds, if you want to change value, write this line wherever you want to change.

    timeout = (your favorite value)

##### Log Mode
If Log Mode On, You can log your test result in your LOG_DIR per test case.Modify lib/config.ttl

    LOG_MODE = 1

