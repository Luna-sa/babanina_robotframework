*** Settings ***
Library         SeleniumLibrary
Documentation   Importing Login to the system from another file
Library         OperatingSystem
Test Setup     Open Browser    ${LOGIN_URL}    ${BROWSER}
Test Teardown  Close Browser
Resource        ../pages/login.resource

*** Variables ***
${NEW PLAYER}                   xpath=//a[contains(@href, 'en/players/add')]/button
${PLAYER FORM NAME}             xpath=//input[@name="name"]
${PLAYER FORM SURNAME}          xpath=//input[@name="surname"]
${PLAYER FORM AGE}              xpath=//input[@name="age"]
${PLAYER PAGE TITLE}            xpath=//form//span[contains(@class, "MuiCardHeader-title")]
${EDIT PLAYER TITLE}            xpath=//form/div/div/span
${PLAYER FORM MAIN POSITION}    xpath=//input[@name="mainPosition"]
${SUBMIT BUTTON}                xpath=//button[@type='submit']
${VALIDATION ERROR}             xpath=//input[@name='surname']/../following-sibling::p


*** Test Cases ***
Add a new player page appears
    Reach Add a Player page
    ${Page title}=     Get Text         ${PLAYER PAGE TITLE}
    Should Be Equal    ${Page title}    Add player

Add a player to database
    Reach Add a Player page
    Add player's name, surname, age and position
    Submit A New Player
    Wait Until Location Contains       /edit
    ${Page title}=              Get Text         ${EDIT PLAYER TITLE}
    Should Be Equal     ${Page title}   Edit player Muse AI

Validate Add player page
    Reach Add a Player page
    Click Element      ${PLAYER FORM SURNAME}
    Submit A New Player
    ${Validation error}=        Get Text    ${VALIDATION ERROR}
    Should Be Equal    ${Validation error}  Required


*** Keywords ***
Click Add a Player button
    Wait Until Element Is Visible      ${NEW PLAYER}
    Click Button                       ${NEW PLAYER}
Add player's name, surname, age and position
    Input Text    ${PLAYER FORM NAME}           Muse
    Input Text    ${PLAYER FORM SURNAME}        AI
    Input Text    ${PLAYER FORM AGE}            01.01.1990
    Input Text    ${PLAYER FORM MAIN POSITION}  45
Submit a new player
    Click Button   ${SUBMIT BUTTON}
Check new player created
    Wait Until Element Is Visible   ${PLAYER PAGE TITLE}
Reach Add a Player page
    Login To The System
    Click Add a Player button
    Wait Until Element Is Visible    ${PLAYER PAGE TITLE}

