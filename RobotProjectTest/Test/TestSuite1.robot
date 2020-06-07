*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    Pre-requisites of a testsuite
Suite Teardown    Log    at the end right ?
Test Setup    Log    PR of test case   
Test Teardown    clean            

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    [tags]    smoke
    Log    Hello world

MySecondtTest
    Log    Hello 2 world
    Set Tags    regression1
    
MyThirdTest
    Log    Hello 3 world
        
# MySecondTestWithSelenium
    # Open Browser    https://www.google.com    chrome
    # Set Browser Implicit Wait    5
    # Input Text    name=q    automation
    # Press Keys    name=q    ENTER   
    # #Click Element    name=btnK        
    # Sleep    2
    # Close Browser    
    # Log    test completed    
    
# # SampleLoginTest
    # # [Documentation]    This is a sample thingy
    # # Open Browser    ${URL}    chrome
    # # Maximize Browser Window
    # # Set Browser Implicit Wait    5
    # # Clear Element Text    id=txtUsername
    # # LoginTo
    # # Sleep    2
    # # Click Element    id=welcome
    # # Click Element    link=Logout               
    # # Log    the ${TEST_NAME} completed
    # # Log    This test was executed by %{username} on %{os}            
    
*** Variables ***
#SCALAR : A VARIABLE WITH ONE VALUE
${URL}    https://opensource-demo.orangehrmlive.com/
#LIST : CONTAINING MULTIPLES VALUES
@{CREDENTIALS}    Admin     admin123
#DICTIONARY : CONTAINS A LIST OF VALUES WITH THEIR KEY
&{LOGINDATA}    login=Admin    password=admin123

*** Keywords ***
LoginTo
    Input Text    id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]       
    Click Button    id=btnLogin
Clean
    Log    This is the end of the testcase    
    Close Browser    