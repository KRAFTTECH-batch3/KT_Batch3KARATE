Feature: Parameter Examples

  Background:
    * def demoQABaseUrl = "https://bookstore.toolsqa.com"
    * def kraftBaseUrl = "https://www.krafttechexlab.com/sw/api/v1"

  #get the person information whose id is 1
  @pathParameter
  Scenario: path parameters with kraft exlab
    Given url kraftBaseUrl
    When path 'allusers/getbyid'
    When path 1
    When method get
    Then status 200


  #get the person information whose id is 5
  @pathParameter
  Scenario: path parameters with kraft exlab-2
    Given url kraftBaseUrl
    When path 'allusers/getbyid'
    When path 5
    When method get
    Then status 200



  #verify all user info of user 5
  #how to verify all response body in one shot
  @pathParameter
  Scenario: path parameters with kraft exlab-3

    Given def expectedUser =
    """
    [
    {
        "id": 5,
        "name": "isa akyuz",
        "email": "isaakyuz0811@gmail.com",
        "password": "$2y$10$1l5GsACOln7MYqZLM.OyEuK.BQtI4iU8nBlkXTerzGrSYf8S.1oN6",
        "about": null,
        "terms": "1",
        "date": "2022-09-12 20:50:38",
        "job": null,
        "company": null,
        "website": null,
        "location": null,
        "skills": [],
        "github": null,
        "twitter": null,
        "facebook": null,
        "youtube": null,
        "linkedin": null,
        "instagram": null,
        "avatar": "1",
        "admin": "1",
        "education": [],
        "experience": []
    }
    ]
    """

    Given url kraftBaseUrl
    When path 'allusers/getbyid'
    When path 5
    When method get
    Then status 200
    Then match response == expectedUser

  #send a request for getting all users to kraftexlab and make verifications
  Scenario: query parameters (kraft exlab)
    Given url kraftBaseUrl
    Given path "/allusers/alluser/"
    Given param page = 1
    Given param pagesize = 5
    When method get
    Then status 200
    Then match header Content-Type == "application/json; charset=UTF-8"
    Then match response[0].id == 1

  #verify that given isbn number is matching that is inside the response body(payload)
  #isbnNumber = "9781449325862"
  Scenario: query parameters with bookstore
    Given def isbnNumber = "9781449325862"
    Given url demoQABaseUrl
    Given path "/BookStore/v1/Book"
    Given param ISBN =  isbnNumber
    When method get
    Then status 200
    Then match response.isbn == isbnNumber

  #how to make a verification with a loop
  Scenario: verification with loop
    Given url demoQABaseUrl
    Given path "/BookStore/v1/Books"
    Given method get
    Then status 200
    Then match each response.books[*].isbn == '#string'






