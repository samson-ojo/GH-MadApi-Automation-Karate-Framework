
Feature: Articles

Background: Define URL
    Given url apiUrl
    
    

Scenario: Create a new Article
    Given path 'articles'
    And request {"article": {"title": "Sweet boy1", "description": "This is for testingJay", "body": "Now", "tagList": [ "My Man" ] }}
    When method Post
    Then status 201
    And match response.article.title == 'Sweet boy1'

Scenario: Create and Delete Article
    Given path 'articles'
    And request {"article": {"title": "Jadesola", "description": "testing", "body": "testing", "tagList": ["Over again"] }}
    When method Post
    Then status 201
    * def articleId = response.article.slug

    Given params {limit:10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title == 'Jadesola'

    
    Given path 'articles',articleId
    When method Delete
    Then status 204

    
    Given params {limit:10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != 'Jadesola'



