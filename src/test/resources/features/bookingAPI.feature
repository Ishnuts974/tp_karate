Feature: Test sur l'API de booking

  @getAllBooks
  Scenario: Récupérer toutes les réservations
    Given url urlServeur
    And path book
    When method GET
    Then status 200
    And match response != {}

  @getUser1
  Scenario: Récupérer une réservation par Id
    Given url urlServeur
    And path book,index
    When method GET
    Then status 200
    And match response.id == 1

  @CreationReservation
  Scenario: Création d'une nouvelle réservation
    Given url urlServeur
    And path book
    And def jsonPostFolder = read('post_request_booking.json')
    And request jsonPostFolder
    When method POST
    Then status 200
    And match response == jsonPostFolder

  @MajReservation
  Scenario: Mise a jour d'une réservation
    Given url urlServeur
