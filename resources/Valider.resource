*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_NAME}    id=first-name
${LAST_NAME}     id=last-name
${POSTAL_CODE}   id=postal-code
${CONTINUE_BTN}  id=continue
${FINISH_BTN}    id=finish
${CONFIRM_MSG}   css=.complete-header

*** Keywords ***
Proceed To Checkout
    Click Button    id=checkout

Fill Checkout Information
    [Arguments]    ${first}    ${last}    ${postal}
    Input Text    ${FIRST_NAME}    ${first}
    Input Text    ${LAST_NAME}     ${last}
    Input Text    ${POSTAL_CODE}   ${postal}
    Click Button  ${CONTINUE_BTN}

Complete Purchase
    Click Button    ${FINISH_BTN}

Verify Confirmation Page
    Element Should Contain    ${CONFIRM_MSG}    Thank you
