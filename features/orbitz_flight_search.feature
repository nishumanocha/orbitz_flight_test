Feature: flight search oneway
#Background:
#  Given user is on fruit search page

  Scenario: verify the user can search the future flights for oneway
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And user type the <city_name> in the leaving from and user select the appropriate airport in the leaving from tab
    And user select the <city_name> in the going to tab and user select the appropriate airport in the going to tab
    And user click the search button
    Then use should see the available flights for the particular dates

  Scenario Outline: verify the user can search for the flights for oneway to test scenario outline
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And user type the <Leaving_city_name> in the leaving from and user select the <Leaving_airport_name> in the leaving from tab
    And user select the <Going_city_name> in the going to tab and user select the <Going_airport_name> in the going to tab
    And user click the search button
    Then use should see the available flights for the particular dates

    Examples:
      | Leaving_city_name | Leaving_airport_name                 | Going_city_name | Going_airport_name                     |
      | Seattle           | Seattle (SEA - Seattle-Tacoma Intl.) | Chicago         | Chicago (ORD - O'Hare Intl.)           |
      | Seattle           | Seattle (SEA - Seattle-Tacoma Intl.) | New York        | New York (JFK - John F. Kennedy Intl.) |

  Scenario: verify the user warned when searching for more then 6 travelers
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And user type the <city_name> in the leaving from and user select the appropriate airport in the leaving from tab
    And user select the <city_name> in the going to tab and user select the appropriate airport in the going to tab
    And user select 7 travelers
    Then user should see the warning message "we are only able to book between 1 and 6 travelers. Please adjust the number of travelers for your search"

    Scenario: verify the user search for Non Stop flight in search result
      Given user is on orbitz home page
      When user click the flight icon
      And user click the oneway icon
      And user type the <city_name> in the leaving from and user select the appropriate airport in the leaving from tab
      And user select the <city_name> in the going to tab and user select the appropriate airport in the going to tab
      And user click the search button
      Then use should see the available flights for the particular dates
      When user select the Non Stop box from left side panel
      Then user should see only Non Stop flight for the particular destination

  Scenario: verify the user search for Non Stop flight in search result using - Declarative style
    Given user is on orbitz home page
    When user search for non stop flight in search result
    Then user should see the available Non Stop flights only