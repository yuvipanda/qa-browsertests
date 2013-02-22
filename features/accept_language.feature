@firefox
Feature: Universal Language Selector Accept-Language

  Scenario Outline: Accept-Language
    Given that my browser's accept language is <language>
    When I visit a random page
    Then link to the main page has text <text>

  Examples:
    | language | text          |
    | de       | Hauptseite    |
    | sr       | Главна страна |
    | sr-cyrl  | Главна страна |
    | sr-latn  | Glavna strana |
