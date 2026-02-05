@demo
Feature: Tester réponse API
  Scenario: test réponse Get OK
    Given url 'https://regres.in/apt/uers?page=1'
    When method get
    Then status 200
    And print 'la reponse est : ', response