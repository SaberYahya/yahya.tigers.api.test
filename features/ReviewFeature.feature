@End2End
Feature: ReviewFeature
	
  Scenario: End 2 end Account Creation.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "yahya","password": "yahya@tek-insurance"}
    When method post
    Then status 200
    And print response
    * def token = response.token
    * def generator = Java.type('faker.data.generator.FakeDataGenerator')
    * def email = generator.getEmail()
    And print email
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dob = generator.getDob()
    Given path "/api/accounts/add-primary-account"
    And request
      """
      {
      "email": "#(email)",
      "title": "Mr.",
      "firstName": "#(firstName)",
      "lastName": "#(lastName)",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "student",
      "dateOfBirth": "#(dob)",
      "new": true
      }
      """
    And header Authorization = "Bearer "+token
    When method post
    Then status 201
    * def generatedId = response.id
    And print generatedId
    And print response
    And assert email == response.email
    And assert firstName == response.firstName
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = generatedId
    And header Authorization = "Bearer "+token
    And request
      """
      {
      "addressType": "Apartment",
      "addressLine1": "54322 NakojaAbad Ave",
      "city": "Gainsville",
      "state": "Virginia",
      "postalCode": "45678",
      "countryCode": "+1",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = generatedId
    And header Authorization = "Bearer "+token
    * def phone = generator.getPhoneNumber()
    And request
      """
        {
        "phoneNumber": "#(phone)",
        "phoneExtension": "N/A",
        "phoneTime": "Evening",
        "phoneType": "Mobile"
        }
      """
    When method post
    Then status 201
    And print response
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = generatedId
    And header Authorization = "Bearer "+token
    And request
      """
      {
      "make": "Volvo",
      "model": "XC90",
      "year": "2022",
      "licensePlate": "YFYM 2023"
      }
      """
    When method post
    Then status 201
    And print response
