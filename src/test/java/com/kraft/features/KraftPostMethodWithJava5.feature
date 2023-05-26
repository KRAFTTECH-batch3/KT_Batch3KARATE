Feature: Post Method + Karate/Java Integration

  Background:
    * def kraftBaseUrl = "https://www.krafttechexlab.com/sw/api/v1"

  Scenario: Create a new user with Kraft
    Given url kraftBaseUrl
    Given path "/allusers/register"
    Given request
    """
    {
    "name": "test101",
    "email": "test101@test101.com",
    "password": "123467",
    "about": "About Me",
    "terms": "10"
    }
    """
    When method post
    Then status 200
    Then print response


  Scenario: Create a new user with the help of Java
    #point the class that we want to run
    #Java.type --> used to connect to java class
    Given def KDG = Java.type("utilities.KraftDataGenerator")
    Given def newUser = KDG.createUser()
    Given url kraftBaseUrl
    Given path "/allusers/register"
    Given request newUser
    When method post
    Then status 200
    #more verification
    Then match newUser.name == response.name
    Then match newUser.email == response.email
    Then match response.id == "#number"
