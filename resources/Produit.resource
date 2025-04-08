*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CART_BADGE}    css=.shopping_cart_badge
${ADD_TO_CART}   xpath=//button[contains(@name, 'add-to-cart')]

*** Keywords ***
Add First Product To Cart
    Click Button    ${ADD_TO_CART}

Go To Cart
    Click Link    css=.shopping_cart_link

Verify Cart Has 1 Item
    Element Should Contain    ${CART_BADGE}    1
