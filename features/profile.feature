Feature: Profile

  Scenario: A fan has a profile
    Given a fan is registered
      And the fan is signed in
    When a fan visits their profile
    Then a fan should see their information