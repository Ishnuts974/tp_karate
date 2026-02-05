@first
Feature: Test API

Scenario: test GET
  Given url urlServeur
  And method GET
  Then status 200
  And print response


  Scenario: test POST
    Given url urlServeur
    And path "/posts/1"
    And request { title:'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',userId:'1'}
    When method POST
    Then status 201

  Scenario: test get
    Given url urlServeur
    And method GET
    Then status 200
    And def firstUser = response[0]
    And userId = firstUser.id