*** Settings ***
Resource    ../resources/Login.resource
Resource    ../resources/Produit.resource
Suite Setup    Open Login Page
Suite Teardown    Close The Browser

*** Test Cases ***
Ajout Produit Au Panier
    Enter Credentials    ${STANDARD_USER}    ${MDP_VALIDE}
    Login Should Succeed
    Add First Product To Cart
    Verify Cart Has 1 Item
    Sleep    3s

