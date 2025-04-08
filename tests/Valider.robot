*** Settings ***
Resource    ../resources/Login.resource
Resource    ../resources/Valider.resource
Suite Setup    Open Login Page
Suite Teardown    Close The Browser

*** Test Cases ***
Finalisation De Commande
    Enter Credentials    ${STANDARD_USER}    ${MDP_VALIDE}
    Login Should Succeed
    Add First Product To Cart
    Go To Cart
    Proceed To Checkout
    Fill Checkout Information    Jean    Dupont    75000
    Complete Purchase
    Verify Confirmation Page
    Sleep    3

*** Keywords ***

Add First Product To Cart
    [Documentation]    Adds the first product to the cart.
    Click Element    id=add-to-cart-sauce-labs-backpack
Go To Cart
    [Documentation]    Navigates to the cart page.
    Click Element    id=shopping_cart_container
