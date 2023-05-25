Feature: using match keyword

  #how to make assertions with Karate
  Scenario: some matching example
    * def name = "Recep Acar"
    * match name ==  "Recep Acar"
    * match name != "Eren"

  @match
  Scenario: more matching example
    * def employee =
    """
    {
      "firstName": "Bülent",
      "salary": 50000,
      "active": true
    }
    """
    * match employee.firstName == "Bülent"
    * match employee.salary == 50000
    * match employee.active == true

  @fuzzy
  #you are not caring the value itself but care data types
  Scenario: fuzzy matching
    * def employee =
    """
    {
      "firstName": "Bülent",
      "salary": 50000,
      "active": true
    }
    """
    * match employee.firstName == "#string"
    * match employee.salary == "#number"
    * match employee.active == "#boolean"
    #verify that firstName is exist
    * match employee.firstName == "#present"
    #verify that last name is not exist
    * match employee.lastName == "#notpresent"

  @contains
  Scenario: contains matching
    * def students =
      """
      [
      {
      "name": 'Emre',
      "salary": 41500
      },
      {
      "name": "Büşra",
      "salary": 42000
      }
      ]
      """
    #how to get length of array
    * def lenghtOfArray = students.length
    * print lenghtOfArray
    * match lenghtOfArray == 2
    # how to check if array contains a specific element
    * match students contains {"name": "Emre", "salary": 41500}


