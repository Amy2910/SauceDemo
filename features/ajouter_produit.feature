Feature: Ajouter un produit au panier

  Background: L'utilisateur est connecté et sur la page d'accueil
    Given utilisateur est sur la page de connexion de url "https://www.saucedemo.com/"
    When il se connecte avec un identifiant valide "standard_user" "secret_sauce"
    Then il est connecté et redirigé vers la page Products

  Scenario: Ajouter un produit au panier
    When il ajoute le produit au panier
    Then le produit est bien ajouté au panier

