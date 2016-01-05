Feature: Registration

  Background:
    Given a User is on the home page
    
  Scenario: A fan registers with the site
    When a user clicks to register as a fan
      And the user fills in the form with valid registration information
      And the user clicks sign up
    Then a fan should be created
      And I'm taken to the homepage