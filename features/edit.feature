Feature: Edit

  @wip
  Scenario: A fan registers with the site
    Given a fan is registered
      And the fan is signed in
      And the fan is on it's edit page
    When the fan enters valid details into the edit form
      And they click update
    Then a fan should be updated