Feature: Kraft tests with token

  Background:
    * def kraftBaseUrl = "https://www.krafttechexlab.com/sw/api/v1"
    #point another feature file
    * def authFeature = call read('classpath:src/test/java/com/kraft/features/CreateKraftUserAndGetToken6.feature')
    #get the required variable from related feature file
    * def accessToken = authFeature.userToken

  @test
  Scenario: get user information (kraft)
    #request
    Given url kraftBaseUrl
    Given path 'user/me'
    Given header token = accessToken
    When method get
    #response
    Then status 200

    

