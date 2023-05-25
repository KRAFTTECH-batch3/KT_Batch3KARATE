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
