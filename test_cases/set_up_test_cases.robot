*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}                    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}                      Chrome
${PASSWORD}                     xpath=//*[@id='password']
${EMAIL}                        xpath=//*[@id='login']
${SIGN IN BUTTON}               xpath=//button[@type="submit"]
${DASHBOARD LOGO SCOUTS PANEL}  xpath=//div[@title='Logo Scouts Panel']


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email
    Input Text      ${EMAIL}  user10@getnada.com
Type in password
    Input Text      ${PASSWORD}     Test-1234
Click on the Submit button
    Click Button    ${SIGN IN BUTTON}
Assert dashboard
    Wait Until Element Is Visible    ${DASHBOARD LOGO SCOUTS PANEL}
    Capture Page Screenshot    alert.png

