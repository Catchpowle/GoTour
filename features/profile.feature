Feature: Profile

  Scenario: A fan has a profile
    Given a fan is registered
      And the fan is signed in
    When a fan visits their profile
    Then a fan should see their information

  @wip
  Scenario: An artist has a profile
    Given an artist is registered
      And the artist is signed in
    When an artist visits their profile
    Then an artist should see their information