Feature: Registration

  As a new client
  I want to sign-up to check24

  Background:
    Given I navigate to check24 landing page

  Scenario: Successful registration

    When I select new customer sign-up
    Then I enter random email and password as "pas$word1"
    And I enter password as "pas$word1" again
    Then I validate password strength message "Stark"
    And I confirm registration
    Then I close the welcomebonus pop-up
    Then I am redirected to user account page
    And I verify URL contains "kundenbereich.check24.de/user/account.html"

  Scenario: Unsuccessful registration as email used

    When I select new customer sign-up
    Then I enter email as "sof@gm.com" and password as "pas$word1"
    And I enter password as "pas$word1" again
    Then I validate password strength message "Stark"
    And I confirm registration
    Then I verify that this email account "sof@gm.com" is used

  Scenario: Unsuccessful registration wrong email

    When I select new customer sign-up
    Then I enter email as "SSSS@gmaicom" and password as "password"
    Then I validate password strength message "Zu schwach"
    And I confirm registration
    Then I got an email error message "Bitte geben Sie eine gültige E-Mail-Adresse an."

  Scenario: Unsuccessful registration with too long password

    When I select new customer sign-up
    Then I enter email as "SSS@gmai.com" and password as "pas$word1pas$word1pas$word1pas$word1pas$word1pas$word1pas$word1pas$word1pas$word1"
    Then I validate password strength message "Sehr stark"
    And I confirm registration
    Then I got a password error message "Achtung! Die Grenze von 50 Zeichen wurde erreicht!"

  Scenario: Unsuccessful registration no email no password

    When I select new customer sign-up
    And I confirm registration
    Then I validate password strength message "Zu kurz"
    Then I got an email error message "Bitte E-Mail-Adresse angeben."
    And I got a password error message "Bitte geben Sie Ihr Passwort ein."
    And I got a password confirm error message "Bitte geben Sie Ihr Passwort ein."

  Scenario: Unsuccessful registration with different and short passwords

    When I select new customer sign-up
    Then I enter email as "SSSS@gmcom" and password as "pas"
    And I enter password as "paz" again
    And I confirm registration
    Then I validate password strength message "Zu kurz"
    Then I got an email error message "Bitte geben Sie eine gültige E-Mail-Adresse an."
    And I got a password error message "Das Passwort sollte zwischen 6 und 50 Zeichen lang sein."
    And I got a password confirm error message "Die Passwörter stimmen nicht überein."