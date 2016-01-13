Feature: Profile

  @wip
  Scenario: A fan has a profile
    Given a fan is registered
      And the fan is signed in
      And fans exist
      And artists exist
      And the fan has requested several artists
      And fans have requested artists
    When a fan visits their profile
    Then a fan should see their information
      And the fan should see a list of artists they have requested
      And the fan should see a list of artsits they haven't requested but other have in their city

  Scenario: An artist has a profile
    Given an artist is registered
      And the artist is signed in
    When an artist visits their profile
    Then an artist should see their information
