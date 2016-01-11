Feature: Registration

  Background:
    Given a user is on the home page

  Scenario: A fan registers with the site
    When a user clicks to register as a fan
      And the user fills in the form with valid fan registration information
      And the user clicks sign up
    Then a fan should be created
      And I'm taken to the homepage

  Scenario: An artist registers with the site
    When a user clicks to register as an artist
      And the user fills in the form with valid artist registration information
      And the user clicks sign up
    Then an artist should be created
      And I'm taken to the homepage
