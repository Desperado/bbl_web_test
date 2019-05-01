Feature: Sign-in

  As a person
  I want to sign-in as a client to check24

  Background:
    Given I navigate to check24 landing page

  Scenario: Successful sign-in

    When I select existing customer sign-in
    Then I enter email as "strazhyk@gmai.com" and password as "pas$word1"
    And I confirm sign-in
    Then I am redirected to user account page
    And I verify URL contains "https://kundenbereich.check24.de/user/account.html"