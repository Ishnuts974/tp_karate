Feature: TestKarate

	@POEI2-855
	Scenario: TestKarate
		Given url urlXray
		    And header Content-Type = 'application/json'
		    * def credentials = { client_id: #(client_id), client_secret: #(client_secret)}
		
		    And request credentials
		    * print credentials
		    When method POST
		    Then status 200
		
