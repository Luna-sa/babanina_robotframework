*** Settings ***
Library         SeleniumLibrary
Documentation   Importing Login to the system from another file
Library         OperatingSystem
Suite Setup     Open Browser    ${LOGIN_URL}    ${BROWSER}
Suite Teardown  Close Browser
Resource        ../pages/login.resource

*** Variables ***
${LANGUAGE PICKER}              xpath=(//div[@role="presentation"]//div[@role="button"])[3]
${LOGIN URL}                    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}                      Chrome
${PL DASHBOARD URL}             /pl

*** Test Cases ***
Changing language picker
    Login to the system
    Click on the Language Picker
    Assert language changes to pl
    [Teardown]    Close Browser

*** Keywords ***
Click on the Language Picker
    Wait Until Element Is Visible   ${LANGUAGE PICKER}
    Click Element                   ${LANGUAGE PICKER}
Assert language changes to pl
    Wait Until Location Contains    ${PL DASHBOARD URL}
    Capture Page Screenshot         alert.png