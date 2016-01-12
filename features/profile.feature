Feature: Profile

  @wip
  Scenario: A fan has a profile
    Given a fan is registered
      And the fan is signed in
      And artists exist
      And the fan has requested several artists
    When a fan visits their profile
    Then a fan should see their information
      And the fan should see a list of the artists they have requested

  Scenario: An artist has a profile
    Given an artist is registered
      And the artist is signed in
    When an artist visits their profile
    Then an artist should see their information
