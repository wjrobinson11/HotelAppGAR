Feature: Hotel
  Scenario: I visit the index page as unauthenticated user
    Given I have list of hotel with respective location
    When I visit the index page as unauthenticated user
    Then I can see the hotels with available room types

  Scenario: I visit the index page as authenticated user
    Given I have list of hotel with respective location
    When I visit the index page as authenticated user
    Then I can see the all hotels
