# High-Standard BDD Modeling Example

Feature: Rural Producer Registration
  In order to manage farm data and enable personalized diagnoses
  As a Technical Consultant
  I want to register new rural producers with secure authentication

  @happy-path
  Scenario: Successful registration with valid data
    Given no producer is registered with the email "producer@farm.com"
    When the consultant submits the registration form with email, farm name, and secure password
    Then the producer should be successfully registered in the system
    And a unique producer identifier should be generated
    And farm details should become available for new diagnoses

  @unhappy-path @validation
  Scenario: Attempted registration with duplicate email
    Given a producer is already registered with the email "producer@farm.com"
    When the consultant attempts to register another producer with the same email
    Then the system should reject the registration with a duplicate email error
    And no new farm record should be created in the repository
