Feature: Ciclo de vida de mascotas en PetStore API

  Background:
    # La variable baseUrl viene definida en karate-config.js
    * url baseUrl
    * def petId = 987654321
    * def initialName = 'Firulais'
    * def updatedName = 'Firulais Sold'

  Scenario: Añadir una mascota a la tienda
    Given path 'pet'
    And request
    """
    {
      "id": #(petId),
      "category": { "id": 1, "name": "perros" },
      "name": #(initialName),
      "photoUrls": ["string"],
      "tags": [{ "id": 1, "name": "mascota-prueba" }],
      "status": "available"
    }
    """
    When method post
    Then status 200
    And match response.name == initialName
    And match response.id == petId

  Scenario: Consultar la mascota ingresada previamente (Búsqueda por ID)
    Given path 'pet', petId
    When method get
    Then status 200
    And match response.id == petId
    And match response.name == initialName

  Scenario: Actualizar el nombre de la mascota y el estatus a 'sold'
    Given path 'pet'
    And request
    """
    {
      "id": #(petId),
      "category": { "id": 1, "name": "perros" },
      "name": #(updatedName),
      "photoUrls": ["string"],
      "tags": [{ "id": 1, "name": "mascota-prueba" }],
      "status": "sold"
    }
    """
    When method put
    Then status 200
    And match response.status == 'sold'
    And match response.name == updatedName

  Scenario: Consultar la mascota modificada por estatus (Búsqueda por estatus)
    Given path 'pet', 'findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    # Verificamos que en el arreglo de respuesta exista nuestra mascota con el ID correcto
    And match response[*].id contains petId
    # Validación extra: Verificar que todos los elementos de la lista tengan estatus 'sold'
    And match each response[*].status == 'sold'

  Scenario: Eliminar la mascota creada (Limpieza de datos)
    Given path 'pet', petId
    When method delete
    Then status 200
    And match response.message == "" + petId

  Scenario Outline: Crear mascotas de diferentes categorias y estados
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
    And match response.status == "<status>"

    Examples:
      | catId | categoryName | petName   | status    |
      | 1     | perros       | Firulais  | available |
      | 2     | gatos        | Michi     | pending   |
      | 3     | aves         | Piolin    | sold      |