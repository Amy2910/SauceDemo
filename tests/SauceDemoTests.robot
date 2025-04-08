*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page

*** Variables ***
${URL}            https://www.saucedemo.com
${BROWSER}        chrome
${VALID USER}     standard_user
${VALID PASS}     secret_sauce

*** Test Cases ***
Connexion Valide
    [Documentation]    Vérifie qu'un utilisateur peut se connecter avec des identifiants valides
    Input Text    id=user-name     ${VALID USER}
    Input Text    id=password      ${VALID PASS}
    Click Button  id=login-button
    Wait Until Page Contains Element    css=.inventory_list
    Page Should Contain Element         css=.inventory_item

Connexion Invalide
    [Documentation]    Vérifie qu'un message d'erreur s'affiche pour un mot de passe invalide
    Input Text    id=user-name     ${VALID USER}
    Input Text    id=password      wrong_password
    Click Button  id=login-button
    Page Should Contain    Epic sadface: Username and password do not match any user

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Go To Login Page
    Go To    ${URL}
