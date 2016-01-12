Feature: Request an artist
  Background:
    Given a fan is registered
      And the fan is signed in
      And an artist exists
      And the fan has requested several artists

  @javascript
  Scenario: A fan request an artist
    Given the fan is on the artists page
    When the fan requests the artist
    Then the fan should have an artist
      And the page should display a Cancel Request button

  @javascript
  Scenario: A fan cancels a request an artist
    Given the fan has requested the artist
      And the fan is on the artists page
    When the fan cancels the request for the artist
    Then the fan should no longer have an artist
      And the page should display a Request button

  @javascript
  Scenario: A fan request an artist, then cancels the request for an artist and then requests the artist a second time
    Given the fan is on the artists page
    When the fan requests the artist
    Then the fan should have an artist
      And the page should display a Cancel Request button
    When the fan cancels the request for the artist
    Then the fan should no longer have an artist
      And the page should display a Request button
    When the fan requests the artist
    Then the fan should have an artist
      And the page should display a Cancel Request button
