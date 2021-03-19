Feature: flight search oneway
#Background:

  Scenario: verify the user can search the future flights for oneway
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And user type the "Seattle" in the leaving from and user select the "Seattle (SEA - Seattle-Tacoma Intl.)" airport in the leaving from tab
    And user select the "Chicago"  in the going to tab and user select the "Chicago (ORD - O'Hare Intl.)"  airport in the going to tab
    And user search for the flights
    Then use should see the available flights for the particular dates

  Scenario Outline: verify the user can search for the flights for oneway for muiltiple destination
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And user type the <leaving_city_name> in the leaving from and user select the <leaving_airport_name> in the leaving from tab
    And user select the <going_city_name> in the going to tab and user select the <Going_airport_name> in the going to tab
    And user click the search button
    Then use should see the available flights for the particular dates

    Examples:
      | leaving_city_name | leaving_airport_name                 | going_city_name | Going_airport_name                     |
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

  Scenario: verify the user can filter for Non Stop flight in search result
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And user type the <city_name> in the leaving from and user select the appropriate airport in the leaving from tab
    And user select the <city_name> in the going to tab and user select the appropriate airport in the going to tab
    And user click the search button
    Then use should see the available flights for the particular dates
    And user select the Non Stop check box from the filter section
    Then user should see the search results should includes Non Stop.

  Scenario: verify the user search for Non Stop flight in search result using - Declarative style
    Given user is on orbitz home page
    When user searching for future flights
    And user filters for non stop flight in search result
    Then user should see the search results for Non Stop flights only

  Scenario: verify the user can filter for a specific Airlines
    Given user is on orbitz home page
    When user click the flight icon
    And user click the oneway icon
    And user type the <city_name> in the leaving from and user select the appropriate airport in the leaving from tab
    And user select the <city_name> in the going to tab and user select the appropriate airport in the going to tab
    And user click the search button
    Then user should see the available flights for the particular dates
    When user select only "Delta Airlines" from the Airlines options in the filter section
    Then user should see the search results only "Delta Airlines" result