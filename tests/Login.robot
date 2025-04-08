*** Settings ***
Resource    ../resources/Login.resource
Suite Setup    Open Login Page
Suite Teardown    Close The Browser

*** Test Cases ***
Connexion Valide
    [Tags]    POEI20252-728
    Enter Credentials    ${STANDARD_USER}    ${MDP_VALIDE}
    Login Should Succeed
    Sleep    3

Connexion Invalide
    Enter Credentials    ${STANDARD_USER}    ${MDP_INVALIDE}
    Login Should Fail
    Sleep    3
