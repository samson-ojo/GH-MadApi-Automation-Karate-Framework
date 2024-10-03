Feature: Sign Up

Background: precondition
    * def dataGenerator = Java.type('Helpers.DataGenerator')
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUserName()
    Given url apiUrl

Scenario: Sign Up new User
    Given path 'users'
    And request 
    """
        {
            "user": {
                "email": #(randomEmail),
                "password": "Karatesamsonmail",
                "username": #(randomUsername)
            }
        }
    """
    When method Post
    Then status 201
    And match response ==
    """
        {
            "user": {
                "id": "#number",
                "email": #(randomEmail),
                "username": #(randomUsername),
                "bio": "##string",
                "image": "#string",
                "token": "#string"
            }
        }
        """

Scenario Outline: Validate Sign up error message
   
    Given path 'users'
    And request 
    """
        {
            "user": {
                "email": <email>,
                "password": <password>,
                "username": <username>
            }
        }
    """
    When method Post
    Then status 422
    And match response == <errorResponse>

    Examples:
        | email                     | password         | username          | errorResponse                                      |
        | samsonkarate1@mailman.com | Karatesamsonmail | #(randomUsername) | {"errors":{"email":["has already been taken"]}}    |
        | #(randomEmail)            | Karatesamsonmail |samomomano         | {"errors":{"username":["has already been taken"]}} |
        
        