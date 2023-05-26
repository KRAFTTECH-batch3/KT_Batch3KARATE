Feature: Data Driven Tests

  Background:
    * def kraftBaseUrl = "https://www.krafttechexlab.com/sw/api/v1"

  Scenario Outline: Check first 5 user
    #request
    Given url kraftBaseUrl
    Given path "/allusers/getbyid/"
    Given path '<id>'
    When method get
    #response
    Then status 200
    Then match response[0].name == '<expectedName>'
    Then match response[0].email == '<expectedEmail>'
    Examples:
      | id | expectedName    | expectedEmail           |
      | 1  | MercanS         | afmercan@gmail.com      |
      | 5  | isa akyuz       | isaakyuz0811@gmail.com  |
      | 24 | mike            | mike@gmail.com          |
      | 29 | wilini3845@once | wilini3845@oncebar.com  |
      | 33 | Sebastian       | ghan@krafttechexlab.com |



  Scenario Outline: Check first 5 user with csv file
    #request
    Given url kraftBaseUrl
    Given path "/allusers/getbyid/"
    Given path '<id>'
    When method get
    #response
    Then status 200
    Then match response[0].name == '<expectedName>'
    Then match response[0].email == '<expectedEmail>'
    Examples:
    |read('data/users.csv')|

