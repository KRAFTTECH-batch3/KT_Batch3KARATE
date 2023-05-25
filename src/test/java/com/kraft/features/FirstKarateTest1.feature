Feature: Welcome to Karate

  #how to print text to console
  Scenario: how to print
    Given print "Hello World"
    When print 'an other print'
    Then print 'only print'

  # * --> represent given when and then
  # ',' --> concatenating two strings with adding a space
  Scenario: more printing
    Given print "some words to print"
    * print "my name is" + ' karate kid'
    * print "my name is","karate kid"
    * print 2+2

  #how to define a variable
  #def is common keyword for variables (String, number, boolean, etc...)
  Scenario: variables
    * def name = 'Mike'
    * print "my name is", name
    * def age = 20
    * print name, 'is', age, 'years old'


  Scenario: difficult parameters (json object)
    * def student = {'name': "Ferid", "owes_tuition": false}
    * print student
    * print student.name
    * print student.owes_tuition


  #how to create json object easily
  Scenario:  json object - 2
    * def student =
    """
    {
      "firstName": "Cengiz",
      "lastName": "Yavaş",
      "salary": 45000
    }
    """
    * print student.firstName
    * print student.lastName
    * print student.salary



   Scenario: json object - 3
     * def gorestUser =
     """
     {
        "id": 2139749,
        "name": "Swapnil Chopra DVM",
        "email": "swapnil_dvm_chopra@mann-cummerata.test",
        "gender": "male",
        "status": "inactive"
    }
     """
     * print gorestUser.id
     * print gorestUser.name
     * print gorestUser.email
     * print gorestUser.gender
     * print gorestUser.status

    @variable
    Scenario: json array objects
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

      * print students
      #how to reach firstname
      * print students[0].name
      #how to reach second salary
      * print students[1].salary


