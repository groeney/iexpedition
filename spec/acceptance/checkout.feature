Feature: Checkout order
  Background:
    Given A production database
  @javascript
  Scenario: Checkout order
    When I visit checkout cabin
    And I should see "Cabin & Extras"
    Then I choose cabin
    And I should see success message "Cabin quantity has been updated on your order"
    Then I choose travelling solo option
    Then I click "Continue" link
    And I should be on "/checkout/extras"
    And I should see "CHOOSE YOUR EXTRAS"
    Then I choose extras
    And I click "Continue" link
    And I should be on "/checkout/cart"
    And I should see "YOUR CART"
    Then I check cart
    And I remove order item form cart
    And I should see success message "Item removed"
    Then I add incorrect coupon code
    And I should see error message "Invalid coupon"
    Then I add correct coupon code
    And I should see following content:
      | Discount applied |
      | DISCOUNT         |
    Then I add correct coupon code
    And I should see error message "You already used the coupon"
    And I click "confirm" link
    And I should be on "/checkout/confirm"
    And I should see "PASSENGERS DETAILS"
    Then I fill and confirm information about passengers
    And I should be on "/dashboard/home"
    And I should see "Congratulations! Your booking is complete. We will be in touch shortly."
