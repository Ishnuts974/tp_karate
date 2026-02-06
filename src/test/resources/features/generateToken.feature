Feature: Générer mon token Xray
  @generateToken
  Scenario: Création d'un token Xray à partir des Ids
    Given url urlXray
    And header Content-Type = 'application/json'
    * def credentials = { client_id: #(client_id), client_secret: #(client_secret)}

    And request credentials
    * print credentials
    When method POST
    Then status 200