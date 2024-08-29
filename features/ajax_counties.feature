Feature: Ajax Counties
  As a user
  I want to retrieve counties for a given state
  So that I can select a county from the list

  Scenario: Retrieve counties for a valid state
    Given there is a state "California" with symbol "CA"
    And the state has counties "Los Angeles" and "San Francisco"
    When I make an AJAX request for counties with state symbol "ca"
    Then the response should be successful
    And the response should contain the counties "Los Angeles" and "San Francisco"

  Scenario: Attempt to retrieve counties for an invalid state
    When I make an AJAX request for counties with state symbol "XX"
    Then the response should be successful
    And the response should contain an empty list of counties

  Scenario: Attempt to retrieve counties without providing a state symbol
    When I make an AJAX request for counties without a state symbol
    Then the response should be a bad request