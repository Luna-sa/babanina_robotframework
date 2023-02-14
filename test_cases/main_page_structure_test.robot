*** Settings ***
Library         SeleniumLibrary
Documentation   Importing Login to the system from another file
Library         OperatingSystem
Test Setup      Open Browser    ${LOGIN_URL}    ${BROWSER}
Test Teardown   Close Browser
Resource        ../pages/login.resource

*** Variables ***
${DASHBOARD LOGO SCOUTS PANEL}  xpath=//div[@title='Logo Scouts Panel']
${NEW PLAYER}                   xpath=//a[contains(@href, 'en/players/add')]/button
#${DASHBOARD TITLE}              //*[@id="__next"]//h6
#${PLAYERS COUNT}                //div[contains(@style, 'rgb(244, 67, 54)')]


*** Test Cases ***
Validate Add Player button on the Dashboard page
    Login To The System
    Wait Until Element Is Visible    ${DASHBOARD LOGO SCOUTS PANEL}
    Page Should Contain Element      ${DASHBOARD LOGO SCOUTS PANEL}


