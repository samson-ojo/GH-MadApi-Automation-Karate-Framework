@ignore

Feature: Test for the home page

Background: Define URL
    Given url apiUrl

Scenario: fetch all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['Coding','Bondar Academy','YouTube']
    And match response.tags !contains 'samson'
    And match response.tags == "#array"
    And match response.tags contains any ['baby', 'jesus', 'Coding']
    And match each response.tags == "#string" //loop over the result to ensure it is string
    #And match response == {"articles": "#array", "articlesCount": 10}
    
@debug
Scenario: Get 10 article from the page
    * def timeValidator = read('classpath:src/test/java/Helpers/timeValidator.js')

    Given params {limit:10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articlesCount == 10
    And match response.articles == '#[10]' //length of array has ten items
    And match each response.articles ==
    """
        {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": "#? timeValidator(_)",
            "updatedAt": "#? timeValidator(_)",
            "favorited": '#boolean',
            "favoritesCount": "#number",
            "author": {
                "username": "#string",
                "bio": "##string",
                "image": "#string",
                "following": '#boolean'
            }
        }
    """