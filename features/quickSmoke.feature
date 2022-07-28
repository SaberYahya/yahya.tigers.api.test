@smoke
Feature: Authntication Smoke Test

Scenario: Generate token with Valid Username and Password
		Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
Scenario: Generate token with Invalid Username and Password
		Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "Wrong-User","password": "tek_supervisor"}
    When method post
    Then status 404
    * def errorMessage = response.errorMessage
    And print errorMessage
    And assert errorMessage =="USER_NOT_FOUND"
