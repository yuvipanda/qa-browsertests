Feature: Universal Language Selector Accept-Language

  Scenario: Accept-Language is German
    Given that my browser's accept language is de
    When I visit a random page
    Then link to the main page has text Hauptseite

  Scenario: Accept-Language is Serbian
    Given that my browser's accept language is sr
    When I visit a random page
    Then link to the main page has text Главна страна
