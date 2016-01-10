Feature: Search Bucketlist
  Background:
    Given a fan is registered
      And the fan is signed in
      And artists exist

  @javascript
  Scenario: A fan searches for an artist
    When the fan starts searching for an artist
    Then the fan should see all partially matching searches
    When the fan finishes typing out their search
    Then the fan should see all matching searches

  @javascript
  Scenario: A fan searches for an artist that isn't there
    Given the fan starts searching for an artist item that isn't there
    Then the fan should see a caveat saying no results were found

  Scenario: A traveller searches for an existing ToDo via HTML
    When the fan starts searching for an artist
      And the fan finishes typing out their search
    Then the fan should see all matching searches
