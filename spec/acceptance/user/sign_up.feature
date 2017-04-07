Feature: User sign up
  @javascript
  Scenario: User sign in
    When I visit "/users/sign_up"
    Then I should be on "/users/sign_up"
    And I should see "Register"
    And I fill form fields with:
      | First name    | Winston        |
      | Last name     | Smith          |
      | Email         | smith@test.com |
      | Password      | password       |
    And I click "Create Account" button
    Then I should be on "/"
    And I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
