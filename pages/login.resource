*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN URL}                    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}                      Chrome

*** Keywords ***
Login to the system
    Input Text      xpath=//*[@id='login']   user10@getnada.com
    Input Text      xpath=//*[@id='password']     Test-1234
    Click Button        xpath=//button[@type="submit"]
