Feature: basic api tests
  @book
  Scenario: basic status code validation with bookstore
    Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
    When method get
    Then status 200

  Scenario: basic status code validation with kraftexlab
    Given url "https://www.krafttechexlab.com/sw/api/v1/allusers/getbyid/1"
    When method get
    Then status 200

  Scenario: basic header verification with bookstore
    Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
    When method get
    Then status 200
    Then match header Content-Type == "application/json; charset=utf-8"
    Then match header Connection == "keep-alive"
    #verify if "Date" value exist in the response headers
    Then match header Date == "#present"

  @kraft
  Scenario: basic json body verification with bookstore
    Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
    When method get

    Then status 200
    Then match header Content-Type == "application/json; charset=utf-8"
    Then match header Connection == "keep-alive"
    #print response body
    Then print response
    #verify first isbn number
    Then match response.books[0].isbn == "9781449325862"
    #verify second title
    Then match response.books[1].title == "Learning JavaScript Design Patterns"
    #verify that third subtitle exist
    Then match response.books[2].subTitle == "#present"

