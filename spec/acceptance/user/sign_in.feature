Feature: User sign in
  Background:
    Given A sample database
  @javascript
  Scenario: User sign in
    When I visit "/users/sign_in"
    Then I should be on "/users/sign_in"
    And I should see "ENTER YOUR DETAILS"
    And I fill form fields with:
      | Email    | foo@bar.com |
      | Password | password    |
    And I click "LOGIN" button
    Then I should be on "/dashboard/home"
    And I should see "Signed in successfully."
