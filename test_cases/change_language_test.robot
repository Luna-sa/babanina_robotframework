*** Settings ***
Library  SeleniumLibrary
Documentation  Importing Login to the system from another file
Library  OperatingSystem
#Test Template    Login to the system
Suite Setup    Open Browser    ${LOGIN_URL}    ${BROWSER}
Suite Teardown    Close Browser


*** Variables ***
${LANGUAGE PICKER}              xpath=//button"//*[@id='__next']/div[1]/div/div/div/ul[2]/div[1]"
${LOGIN URL}                    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}                      Chrome
${PL DASHBOARD URL}             /pl

*** Test Cases ***
Changing language picker
    ${LOGIN} =  Get File            set_up_test_cases.robot
    Import Resource                 ${LOGIN}  Login to the system
    Click on the Language Picker
    Assert language changes to pl
    [Teardown]    Close Browser

*** Keywords ***

Click on the Language Picker
    Click Element                   ${LANGUAGE PICKER}
Assert language changes to pl
    Wait Until Location Contains    ${PL DASHBOARD URL}
    Capture Page Screenshot         alert.png