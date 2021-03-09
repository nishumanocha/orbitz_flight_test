Feature: oakland Fruit search
#Background:
#  Given user is on fruit search page

  Scenario: verify the user can search for the fruits
    Given user is on fruit search page
    When user search for the fruit Rose
    Then user should see the results related for Rose
    And verify the search results count is not more than 10