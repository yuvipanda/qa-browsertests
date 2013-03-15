# TODO: at the moment only works locally, does not work at Sauce Labs
@firefox @firefox-bug
Feature: Universal Language Selector Accept-Language

  Scenario Outline: Accept-Language
    Given that my browser's accept language is <language>
    When I visit a random page
    Then link to the main page has text <text>

  Examples:
    | language | text          |
    | de       | Hauptseite    |
    | sr       | Главна страна |
    | sr-ec    | Главна страна |
    | sr-el    | Glavna strana |
