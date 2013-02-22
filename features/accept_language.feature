Feature: Universal Language Selector Accept-Language

  Scenario Outline: Accept-Language is German
    Given that my browser's accept language is <language>
    When I visit a random page
    Then link to the main page has text <text>

  Examples:
    | language | text          |
    | de       | Hauptseite    |
    | sr       | Главна страна |
