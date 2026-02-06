@Global
Feature: Test API

  @first
  Scenario: test GET
    Given url urlServeur
    And method GET
    Then status 200
    And print response

  @exo1
    #Mettre l"URL en Given, le When avec le type de requete et les vérifications dans le Then
    #l'odre des attributs du json n'importe pas
  Scenario: test GET exo1
    Given url urlServeur
    And path posts
    When method GET
    Then status 200
    And match response ==
    """
  {
    id:1,
    title:'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
    body:'#string',
    userId:1}
  """
  #Peut aussi utiliser And match response.UserId == 1 And match.response.title == '...'

  @exo2
    #declaration de variable en karate avec def nomDeVariable
  Scenario: test réutilisation de réponse
    Given url urlServeur
    And path users
    When method GET
    Then status 200

    #on prend le 1er ID de la liste  et on le met dans une nouvelle variable (ici response[0].id =1)
    And def userId = response[0].id

    #Peut aussi etre fait en 2 lignes
   ## And def firstUser = response[0]
     # And def userId = firstUser.id

    # 2eme given pour faire une nouvelle requete
    Given url urlServeur
    And path "posts?userId={id}"
    Then status 200

    # le mot clé each nous permet de regarder toutes les réponses qui vérifie l'expression
    And match each response[*].userId == userId


  @exo3
  Scenario: Test POST et vérification des données

    Given url urlServeur
    And path 'posts'

    And def requestBody =
    """
    {
      userId: 3,
      title: 'Test de la requete POST',
      body: 'Ceci est le body (contenu) de ma requete POST'
    }
    """
 #Apres avoir defini notre variable(json) que l'on veut envoyé et l'utilse avec request
    And request requestBody
    When method POST
    Then status 201

    And match response.id == '#number'
    And match response.userId == requestBody.userId
    And match response.title == requestBody.title
    And match response.body == requestBody.body


    @exo4 @exoJson
    Scenario: POST a partir de chargement de données JSON
      Given url urlServeur

      #Charger le fichier JSON
      And def newPostJson = read('new-post.json')

      #Envoie la requete
      And request newPostJson
      And path posts
      #Vérifie les résultats
      When method POST
      Then status 201
      And match response.userId == newPostJson.userId
      And match response.title == newPostJson.title
      And match response.body == newPostJson.body

      @exo5 @exoJson
      Scenario: utiliser un fichier JSON pour valider une réponse GET
        Given url urlServeur
        And path user1
        And def userJson = read('expected-user.json')
        When method GET
        Then status 200
        And match response == userJson

