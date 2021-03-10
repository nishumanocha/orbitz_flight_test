Feature: flight search oneway
#Background:
#  Given user is on fruit search page

  Scenario: verify the user can search for the flights for oneway
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And use type the <city_name> in the leaving from tab
    And user select the appropriate airport in the leaving from tab
    And user select the <city_name> in the going to tab
    And user select the appropriate airport in the going to tab
    And user click the search button
    Then use should see the available flights for the particular dates

  Scenario Outline: verify the user can search for the flights for oneway to test scenario outline
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And use type the <city_name> in the leaving from tab
    And user select the appropriate airport in the leaving from tab
    And user select the <city_name> in the going to tab
    And user select the appropriate airport in the going to tab
    And user click the search button
    Then use should see the available flights for the particular dates

Examples:

  Scenario: verify the user warned when searching for more then 6 travelers
      Given user is on orbitz home page
      When user click the flight icon
      And user click the oneway icon
      And use type the <city_name> in the leaving from tab
      And user select the appropriate airport in the leaving from tab
      And user select the <city_name> in the going to tab
      And user select the appropriate airport in the going to tab
      And user select 7 travelers
      Then user should see the warning message " we are only able to book between 1 and 6 travelers. Please adjust the number of travelers for your search"
