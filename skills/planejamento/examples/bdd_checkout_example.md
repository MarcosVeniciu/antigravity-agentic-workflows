# BDD Modeling Success Example

Feature: Express Checkout with BR-101 Standard
  In order to reduce purchasing friction
  As an authenticated client on the platform
  I want to complete my order using pre-loaded balance

  @performance @async
  Scenario: Checkout with sufficient balance under SLA
    Given the client has R$ 150.00 balance in internal wallet
    And the shopping cart totals R$ 90.00
    When the client triggers the "1-Click Checkout" button
    Then the initial checkout response must be returned in less than 2 seconds
    And the user interface must remain responsive without blocking user action
    And the system must deduct R$ 90.00 from client balance
    And the order must be forwarded to "Approved" status asynchronously
    And the Obsidian note [[2026-financial-rules]] must be respected