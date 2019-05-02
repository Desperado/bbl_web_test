Feature: Search

  As anyone
  I want to make some travel search in check24

  Background:
    Given I navigate to check24 landing page

  Scenario: Successful search
    When I open travel section
    Then I search for hotels with search word "Mallorca"
    And I verify that search has returned some results
