Feature: Data tests

  Background:
    * def kraftBaseUrl = "https://www.krafttechexlab.com/sw/api/v1"

  Scenario: get all users with Kraft
    #request
    Given url kraftBaseUrl
    Given path "/allusers/alluser"
    Given param page = 1
    Given param pagesize = 10
    When method get
    #response
    Then status 200
    And def expectedUsers = read('classpath:src/test/java/com/kraft/data/users.json')
    Then match response == expectedUsers




