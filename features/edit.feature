Feature: Edit

  Scenario: A fan edits it's profile
    Given a fan is registered
      And the fan is signed in
      And the fan is on it's edit page
    When the fan enters valid details into the edit form
      And they click update
    Then a fan should be updated

  Scenario: An artist edits it's profile
    Given an artist is registered
      And the artist is signed in
      And the artist is on it's edit page
    When the artist enters valid details into the edit form
      And they click update
    Then an artist should be updated
