Feature: Administrar Usuario
  Background:
    * def urlBase = 'https://petstore.swagger.io/v2'
    * def path = '/user'
    * def array = '/createWithArray'
    * def user = '/jorgerq'

  Scenario: Crear usuarios con lista/arreglo
    Given url urlBase + path + array
    And request [  {    "id": 1175592,    "username": "jorgerq",    "firstName": "jorge",    "lastName": "ramos",    "email": "ramosq@gmail.com",    "password": "123456",    "phone": "123456789",    "userStatus": 0  },  {    "id": 1175593,    "username": "jeffarrq",    "firstName": "jeffar",    "lastName": "lopez",    "email": "jeffarlo@gmail.com",    "password": "123456",    "phone": "123456789",    "userStatus": 0  }]
    When method POST
    Then status 200

    * print response
    * def message = response.message
    * print 'variable message es ' + message
    * assert message == '1175592'

  Scenario: Actualizar un usuario
    Given url urlBase + path + user
    And request {  "id": 1175592,  "username": "jorgerq",  "firstName": "carlos",  "lastName": "ramos",  "email": "jorge.ramos.q940@gmail.com",  "password": "123456",  "phone": "125468459",  "userStatus": 0}
    When method PUT
    Then status 200

    * print response
    * def message = response.message
    * print 'variable message es ' + message
    * assert message == '1175592'

  Scenario: Consultar usuario actualizado
    Given url urlBase + path + user
    When method GET
    Then status 200

    * print response
    * def message = response.message
    * print 'variable message es ' + message
    * assert message == '1175592'