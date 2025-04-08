*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/variablesCommunes.robot

*** Variables ***
${USERNAME_INPUT}    id=user-name
${PASSWORD_INPUT}    id=password
${LOGIN_BUTTON}      id=login-button
${ERROR_MESSAGE}     css=.error-message-container

*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Enter Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button  ${LOGIN_BUTTON}

Login Should Succeed
    Wait Until Page Contains Element    css=.inventory_list

Login Should Fail
    Element Should Be Visible    ${ERROR_MESSAGE}

Close The Browser
    Close Browser
