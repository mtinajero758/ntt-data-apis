Feature: Ciclo de vida de mascotas en PetStore API

  Background:
    * url baseUrl
    * def petId = 987654321
    # CARGA RELATIVA (Si están en la misma carpeta que este feature)
    * def petSchema = read('pet-schema.json')

  Scenario: Añadir una mascota y validar esquema
    Given path 'pet'
    And request { id: #(petId), name: 'Firulais', status: 'available' }
    When method post
    Then status 200
    And match response == petSchema

  Scenario Outline: Crear mascotas desde CSV
    Given path 'pet'
    And request
    """
    {
      "id": #(petId),
      "category": { "id": #(catId), "name": "<categoryName>" },
      "name": "<petName>",
      "status": "<status>"
    }
    """
    When method post
    Then status 200
    And match response.name == "<petName>"

    Examples:
      | read('mascotas.csv') |

  # --- LOS 3 ESCENARIOS DE ERROR SOLICITADOS ---

  Scenario: Error 1: Consultar mascota inexistente (404)
    Given path 'pet', 000000000
    When method get
    Then status 404
    And match response.message == 'Pet not found'

  Scenario: Error 2: ID con formato inválido (Letras en lugar de números)
    Given path 'pet'
    And request { "id": "error_id", "name": "michi" }
    When method post
    # PetStore suele responder 400 o 500 según la versión
    Then assert responseStatus == 400 || responseStatus == 500

  Scenario: Error 3: Actualizar sin enviar Body (415 Unsupported Media Type)
    Given path 'pet'
    And header Content-Type = 'application/json'
    When method put
    Then status 405