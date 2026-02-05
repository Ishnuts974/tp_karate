@demo
Feature: Tester réponse API
  Scenario: test réponse Get OK
    Given urlServeur
    When method get
    Then status 200
    And print 'la reponse est : ', response