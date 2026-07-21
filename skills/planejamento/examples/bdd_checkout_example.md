# BDD Modeling Success Example

Feature: Express Checkout with BR-101 Standard
  In order to reduce purchasing friction
  As an authenticated client on the platform
  I want to complete my order using pre-loaded balance

  Scenario: Checkout with sufficient balance
    Given the client has R$ 150.00 balance in internal wallet
    And the shopping cart totals R$ 90.00
    When the client triggers the "1-Click Checkout" button
    Then the system must deduct R$ 90.00 from client balance
    And the order must be forwarded to "Approved" status
    And the Obsidian note [[2026-financial-rules]] must be respected